// Dosya: 08_06_tuzak_as.dart
// ❌ ÇALIŞMA ZAMANI HATASI
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);
}

class Gida extends Urun {
  Gida(super.ad);
}

void main() {
  Urun s = Gida('Süt');
  Elektronik e = s as Elektronik;
  print(e.garantiAy);
}
