// Dosya: 03_04_comparable.dart
class Urun implements Comparable<Urun> {
  final String ad;
  final double fiyat;

  Urun(this.ad, this.fiyat);

  @override
  int compareTo(Urun diger) => fiyat.compareTo(diger.fiyat);

  @override
  String toString() => '$ad (${fiyat.toStringAsFixed(2)})';
}

void main() {
  List<Urun> urunler = [
    Urun('Kulaklık', 749.9),
    Urun('Kablo', 129.9),
    Urun('Saat', 2400),
    Urun('Kılıf', 199),
  ];
  urunler.sort();
  print(urunler);
}
