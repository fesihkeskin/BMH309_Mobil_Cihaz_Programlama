// Dosya: 04_02_yonlendiren_kurucu.dart
class Urun {
  final String ad;
  final double fiyat;
  final int stok;

  Urun(this.ad, this.fiyat, this.stok);

  Urun.ucretsiz(String ad) : this(ad, 0, 999);

  Urun.tukenmis(String ad, double fiyat) : this(ad, fiyat, 0);

  @override
  String toString() {
    String fiyatMetni = fiyat == 0 ? 'Ücretsiz' : '${fiyat.toStringAsFixed(2)} TL';
    return '$ad: $fiyatMetni (stok: $stok)';
  }
}

void main() {
  print(Urun('Kulaklık', 749.9, 8));
  print(Urun.ucretsiz('Hediye Çanta'));
  print(Urun.tukenmis('Akıllı Saat', 2400));
}
