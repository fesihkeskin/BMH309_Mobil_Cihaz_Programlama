// Dosya: 09_06_siralama.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  bool get stoktaVar => stok > 0;

  @override
  String toString() => ad;
}

final List<Urun> katalog = [
  Urun('Kulaklık', 'Elektronik', 749.90, 5, 4.6),
  Urun('Şarj Kablosu', 'Elektronik', 129.90, 0, 4.1),
  Urun('Akıllı Saat', 'Elektronik', 2400.00, 2, 4.8),
  Urun('Süt', 'Gıda', 32.50, 20, 4.3),
  Urun('Peynir', 'Gıda', 145.00, 0, 4.7),
  Urun('Defter', 'Kırtasiye', 45.00, 30, 3.9),
  Urun('Kalem', 'Kırtasiye', 12.00, 100, 4.0),
];

const String trAlfabe = 'abcçdefgğhıijklmnoöprsştuüvyz';

String trKucuk(String metin) => metin.replaceAll('I', 'ı').replaceAll('İ', 'i').toLowerCase();

int trKarsilastir(String a, String b) {
  String x = trKucuk(a);
  String y = trKucuk(b);
  int kisaUzunluk = x.length < y.length ? x.length : y.length;
  for (int i = 0; i < kisaUzunluk; i++) {
    int sx = trAlfabe.indexOf(x[i]);
    int sy = trAlfabe.indexOf(y[i]);
    if (sx != sy) {
      return sx.compareTo(sy);
    }
  }
  return x.length.compareTo(y.length);
}

void main() {
  List<Urun> liste = List.of(katalog);

  liste.sort((a, b) => a.fiyat.compareTo(b.fiyat));
  print('Fiyat artan : $liste');

  liste.sort((a, b) => b.fiyat.compareTo(a.fiyat));
  print('Fiyat azalan: $liste');

  liste.sort((a, b) => b.puan.compareTo(a.puan));
  print('Puan        : $liste');

  List<String> meyveler = ['Üzüm', 'elma', 'Çilek', 'Ayva', 'incir', 'Ihlamur', 'Ceviz', 'şeftali', 'Dut'];
  meyveler.sort();
  print('sort()      : $meyveler');
  meyveler.sort(trKarsilastir);
  print('Türkçe      : $meyveler');
}
