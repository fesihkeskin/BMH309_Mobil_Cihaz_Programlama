// Dosya: 03_05_kurucu_isimli_parametre.dart
class Urun {
  String ad;
  double fiyat;
  int stok;
  String kategori;

  Urun({
    required this.ad,
    required this.fiyat,
    this.stok = 0,
    this.kategori = 'Genel',
  });

  @override
  String toString() => '$ad ($kategori): ${fiyat.toStringAsFixed(2)} TL, stok $stok';
}

void main() {
  Urun sut = Urun(ad: 'Süt', fiyat: 32.5, stok: 12, kategori: 'Süt Ürünleri');
  Urun kalem = Urun(ad: 'Kalem', fiyat: 12);
  Urun defter = Urun(fiyat: 45, ad: 'Defter', stok: 30);

  print(sut);
  print(kalem);
  print(defter);
}
