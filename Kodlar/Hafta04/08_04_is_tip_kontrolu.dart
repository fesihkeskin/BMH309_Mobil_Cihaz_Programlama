// Dosya: 08_04_is_tip_kontrolu.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, super.fiyat, this.garantiAy);
}

class Gida extends Urun {
  String sonKullanma;

  Gida(super.ad, super.fiyat, this.sonKullanma);
}

void main() {
  List<Urun> sepet = [
    Elektronik('Kulaklık', 749.9, 24),
    Gida('Süt', 32.5, '15.10.2026'),
    Urun('Defter', 45),
    Gida('Yoğurt', 55, '12.10.2026'),
  ];

  int gidaSayisi = 0;
  for (Urun u in sepet) {
    if (u is Elektronik) {
      print('${u.ad}: ${u.garantiAy} ay garanti');
    } else if (u is Gida) {
      gidaSayisi++;
      print('${u.ad}: SKT ${u.sonKullanma}');
    } else {
      print('${u.ad}: ek bilgi yok');
    }
  }
  print('Sepette $gidaSayisi gıda ürünü var.');
}
