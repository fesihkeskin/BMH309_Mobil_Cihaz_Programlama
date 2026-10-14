// Dosya: 03_02_kurucu_kisa.dart
class Urun {
  String ad;
  double fiyat;
  int stok;

  Urun(this.ad, this.fiyat, this.stok);

  void bilgiYazdir() {
    print('$ad: ${fiyat.toStringAsFixed(2)} TL (stok: $stok)');
  }
}

void main() {
  Urun sut = Urun('Süt', 32.50, 12);
  Urun ekmek = Urun('Ekmek', 15, 0);
  sut.bilgiYazdir();
  ekmek.bilgiYazdir();
}
