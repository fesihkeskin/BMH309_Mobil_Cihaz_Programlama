// Dosya: 02_02_ilk_sinif.dart
class Urun {
  String ad = '';
  double fiyat = 0;
  int stok = 0;

  void bilgiYazdir() {
    print('$ad: ${fiyat.toStringAsFixed(2)} TL (stok: $stok)');
  }
}

void main() {
  Urun sut = Urun();
  sut.ad = 'Süt';
  sut.fiyat = 32.50;
  sut.stok = 12;

  Urun ekmek = Urun();
  ekmek.ad = 'Ekmek';
  ekmek.fiyat = 15;

  sut.bilgiYazdir();
  ekmek.bilgiYazdir();
}
