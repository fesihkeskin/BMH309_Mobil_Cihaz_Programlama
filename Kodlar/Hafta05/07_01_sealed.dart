// Dosya: 07_01_sealed.dart
sealed class EkranDurumu {}

class Yukleniyor extends EkranDurumu {}

class Basarili extends EkranDurumu {
  final List<String> urunler;

  Basarili(this.urunler);
}

class Hata extends EkranDurumu {
  final String mesaj;

  Hata(this.mesaj);
}

String ekraniCiz(EkranDurumu durum) => switch (durum) {
      Yukleniyor _ => 'Yükleniyor...',
      Basarili b when b.urunler.isEmpty => 'Henüz ürün yok.',
      Basarili b => 'Ürünler: ${b.urunler.join(', ')}',
      Hata h => 'Hata: ${h.mesaj} (Tekrar dene)',
    };

void main() {
  List<EkranDurumu> durumlar = [
    Yukleniyor(),
    Basarili([]),
    Basarili(['Süt', 'Ekmek', 'Peynir']),
    Hata('İnternet bağlantısı yok'),
  ];

  for (EkranDurumu d in durumlar) {
    print(ekraniCiz(d));
  }
}
