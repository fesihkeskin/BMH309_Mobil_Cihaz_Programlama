// Dosya: 06_01_kod_tekrari.dart
class Elektronik {
  String ad;
  double fiyat;
  int garantiAy;

  Elektronik(this.ad, this.fiyat, this.garantiAy);

  String etiket() => '$ad - ${fiyat.toStringAsFixed(2)} TL';
}

class Gida {
  String ad;
  double fiyat;
  String sonKullanma;

  Gida(this.ad, this.fiyat, this.sonKullanma);

  String etiket() => '$ad - ${fiyat.toStringAsFixed(2)} TL';
}

void main() {
  print(Elektronik('Kulaklık', 749.9, 24).etiket());
  print(Gida('Süt', 32.5, '15.10.2026').etiket());
}
