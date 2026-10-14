// Dosya: 07_04_super_metot.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);

  String etiket() => '$ad - ${fiyat.toStringAsFixed(2)} TL';
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, super.fiyat, this.garantiAy);

  @override
  String etiket() => '${super.etiket()} | $garantiAy ay garanti';
}

class IndirimliUrun extends Urun {
  int indirimYuzdesi;

  IndirimliUrun(super.ad, super.fiyat, this.indirimYuzdesi);

  @override
  String etiket() {
    double yeniFiyat = fiyat * (100 - indirimYuzdesi) / 100;
    return '${super.etiket()} → ${yeniFiyat.toStringAsFixed(2)} TL (%$indirimYuzdesi)';
  }
}

void main() {
  print(Urun('Defter', 45).etiket());
  print(Elektronik('Kulaklık', 749.9, 24).etiket());
  print(IndirimliUrun('Mont', 1800, 30).etiket());
}
