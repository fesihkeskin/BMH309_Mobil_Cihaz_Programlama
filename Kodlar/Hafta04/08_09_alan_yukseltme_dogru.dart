// Dosya: 08_09_alan_yukseltme_dogru.dart
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);
}

class SepetKalemi {
  Urun urun;
  int adet;

  SepetKalemi(this.urun, this.adet);
}

void main() {
  SepetKalemi kalem = SepetKalemi(Elektronik('Kulaklık', 24), 1);
  Urun u = kalem.urun;
  if (u is Elektronik) {
    print('${u.ad}: ${u.garantiAy} ay garanti');
  }
}
