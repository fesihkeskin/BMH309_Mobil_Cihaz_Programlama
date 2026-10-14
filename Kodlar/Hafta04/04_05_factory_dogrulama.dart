// Dosya: 04_05_factory_dogrulama.dart
class Urun {
  final String ad;
  final double fiyat;

  Urun._(this.ad, this.fiyat); // Private kurucu: yalnızca bu dosyadan çağrılabilir

  factory Urun(String ad, double fiyat) {
    String temizAd = ad.trim();
    if (temizAd.isEmpty) {
      temizAd = 'İsimsiz ürün';
    }
    double guvenliFiyat = fiyat < 0 ? 0.0 : fiyat;
    return Urun._(temizAd, guvenliFiyat);
  }

  @override
  String toString() => '$ad: ${fiyat.toStringAsFixed(2)} TL';
}

void main() {
  print(Urun('  Kulaklık ', 749.9));
  print(Urun('', 50));
  print(Urun('Kablo', -20));
}
