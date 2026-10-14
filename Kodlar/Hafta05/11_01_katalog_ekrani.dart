// Dosya: 11_01_katalog_ekrani.dart
extension ParaBicimi on double {
  String get tl => '${toStringAsFixed(2)} TL';
}

enum Kategori {
  elektronik('Elektronik', 0.20),
  gida('Gıda', 0.01),
  kirtasiye('Kırtasiye', 0.20);

  const Kategori(this.ad, this.kdvOrani);

  final String ad;
  final double kdvOrani;
}

enum Siralama { onerilen, fiyatArtan, fiyatAzalan, puan }

mixin Begenilebilir {
  int _begeni = 0;

  int get begeni => _begeni;

  void begen() {
    _begeni++;
  }
}

class Urun with Begenilebilir {
  final String ad;
  final Kategori kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  double get kdvliFiyat => fiyat * (1 + kategori.kdvOrani);
  bool get stoktaVar => stok > 0;
}

sealed class EkranDurumu {}

class Yukleniyor extends EkranDurumu {}

class Bos extends EkranDurumu {
  final String mesaj;

  Bos(this.mesaj);
}

class Liste extends EkranDurumu {
  final List<Urun> urunler;

  Liste(this.urunler);
}

class Hata extends EkranDurumu {
  final String mesaj;

  Hata(this.mesaj);
}

typedef Karsilastirici = int Function(Urun a, Urun b);

Karsilastirici siralamaKurali(Siralama siralama) => switch (siralama) {
      Siralama.onerilen => (Urun a, Urun b) => b.begeni.compareTo(a.begeni),
      Siralama.fiyatArtan => (Urun a, Urun b) => a.fiyat.compareTo(b.fiyat),
      Siralama.fiyatAzalan => (Urun a, Urun b) => b.fiyat.compareTo(a.fiyat),
      Siralama.puan => (Urun a, Urun b) => b.puan.compareTo(a.puan),
    };

EkranDurumu katalogGetir(
  List<Urun> katalog, {
  bool baglantiVar = true,
  Kategori? kategori,
  String arama = '',
  bool yalnizcaStokta = false,
  Siralama siralama = Siralama.onerilen,
}) {
  if (!baglantiVar) {
    return Hata('İnternet bağlantısı yok.');
  }

  Iterable<Urun> sonuc = katalog;
  if (kategori != null) {
    sonuc = sonuc.where((u) => u.kategori == kategori);
  }
  if (arama.isNotEmpty) {
    sonuc = sonuc.where((u) => u.ad.toLowerCase().contains(arama.toLowerCase()));
  }
  if (yalnizcaStokta) {
    sonuc = sonuc.where((u) => u.stoktaVar);
  }

  List<Urun> liste = sonuc.toList();
  if (liste.isEmpty) {
    return Bos(arama.isNotEmpty ? '"$arama" için sonuç bulunamadı.' : 'Bu kategoride ürün yok.');
  }
  liste.sort(siralamaKurali(siralama));
  return Liste(liste);
}

String urunKarti(Urun u) {
  String durum = u.stoktaVar ? '' : '  (tükendi)';
  return '${u.ad.padRight(13)}${u.kdvliFiyat.tl.padLeft(11)}  puan ${u.puan}$durum';
}

String ekraniCiz(EkranDurumu durum) => switch (durum) {
      Yukleniyor _ => 'Yükleniyor...',
      Bos b => b.mesaj,
      Liste l => l.urunler.map(urunKarti).join('\n'),
      Hata h => '${h.mesaj} [Tekrar dene]',
    };

void main() {
  List<Urun> katalog = [
    Urun('Kulaklık', Kategori.elektronik, 749.90, 5, 4.6),
    Urun('Şarj Kablosu', Kategori.elektronik, 129.90, 0, 4.1),
    Urun('Akıllı Saat', Kategori.elektronik, 2400.00, 2, 4.8),
    Urun('Süt', Kategori.gida, 32.50, 20, 4.3),
    Urun('Peynir', Kategori.gida, 145.00, 0, 4.7),
    Urun('Defter', Kategori.kirtasiye, 45.00, 30, 3.9),
    Urun('Kalem', Kategori.kirtasiye, 12.00, 100, 4.0),
  ];

  // Kullanıcıların ürünlere verdiği beğeniler
  List<int> begeniler = [5, 4, 3, 8, 6, 2, 1];
  for (int i = 0; i < katalog.length; i++) {
    for (int j = 0; j < begeniler[i]; j++) {
      katalog[i].begen();
    }
  }

  print('--- Açılış ---');
  print(ekraniCiz(Yukleniyor()));

  print('--- Elektronik, fiyata göre artan ---');
  print(ekraniCiz(katalogGetir(katalog, kategori: Kategori.elektronik, siralama: Siralama.fiyatArtan)));

  print('--- Stoktakiler, önerilen sıra ---');
  print(ekraniCiz(katalogGetir(katalog, yalnizcaStokta: true)));

  print('--- "tablet" araması ---');
  print(ekraniCiz(katalogGetir(katalog, arama: 'tablet')));

  print('--- Bağlantı yokken ---');
  print(ekraniCiz(katalogGetir(katalog, baglantiVar: false)));

  print('--- Özet ---');
  double stokDegeri = katalog.fold(0.0, (toplam, u) => toplam + u.fiyat * u.stok);
  Map<String, int> kategoriSayilari = {};
  for (Urun u in katalog) {
    kategoriSayilari.update(u.kategori.ad, (n) => n + 1, ifAbsent: () => 1);
  }
  Urun enBegenilen = katalog.reduce((a, b) => a.begeni >= b.begeni ? a : b);

  print('Stok değeri    : ${stokDegeri.tl}');
  print('Tükenen var mı : ${katalog.any((u) => !u.stoktaVar) ? 'Evet' : 'Hayır'}');
  print('Kategoriler    : $kategoriSayilari');
  print('En beğenilen   : ${enBegenilen.ad} (${enBegenilen.begeni} beğeni)');
}
