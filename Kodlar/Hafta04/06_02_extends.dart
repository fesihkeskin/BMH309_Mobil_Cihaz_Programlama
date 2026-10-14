// Dosya: 06_02_extends.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);

  String etiket() => '$ad - ${fiyat.toStringAsFixed(2)} TL';
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, super.fiyat, this.garantiAy);

  String garantiBilgisi() => '$garantiAy ay garanti';
}

class Gida extends Urun {
  String sonKullanma;

  Gida(super.ad, super.fiyat, this.sonKullanma);
}

void main() {
  Elektronik kulaklik = Elektronik('Kulaklık', 749.9, 24);
  Gida sut = Gida('Süt', 32.5, '15.10.2026');

  print(kulaklik.etiket());
  print(kulaklik.garantiBilgisi());
  print(sut.etiket());
  print('Son kullanma: ${sut.sonKullanma}');
}
