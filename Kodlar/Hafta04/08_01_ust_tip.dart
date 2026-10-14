// Dosya: 08_01_ust_tip.dart
class Urun {
  String ad;

  Urun(this.ad);

  String tanit() => '$ad bir üründür.';
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);

  @override
  String tanit() => '$ad bir elektronik üründür ($garantiAy ay garanti).';
}

void main() {
  Urun u = Elektronik('Kulaklık', 24);
  print(u.tanit());
  print(u.runtimeType);
}
