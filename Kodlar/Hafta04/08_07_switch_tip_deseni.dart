// Dosya: 08_07_switch_tip_deseni.dart
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);
}

class Gida extends Urun {
  String sonKullanma;

  Gida(super.ad, this.sonKullanma);
}

String ekBilgi(Urun u) => switch (u) {
      Elektronik e => '${e.garantiAy} ay garanti',
      Gida g => 'SKT: ${g.sonKullanma}',
      _ => 'Ek bilgi yok',
    };

void main() {
  List<Urun> sepet = [
    Elektronik('Kulaklık', 24),
    Gida('Süt', '15.10.2026'),
    Urun('Defter'),
  ];

  for (Urun u in sepet) {
    print('${u.ad.padRight(9)}→ ${ekBilgi(u)}');
  }
}
