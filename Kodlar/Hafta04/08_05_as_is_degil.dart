// Dosya: 08_05_as_is_degil.dart
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
  Urun u = Elektronik('Tablet', 24);

  if (u is! Gida) {
    print('${u.ad} bir gıda ürünü değil.');
  }

  Elektronik e = u as Elektronik;
  print('Garanti: ${e.garantiAy} ay');
}
