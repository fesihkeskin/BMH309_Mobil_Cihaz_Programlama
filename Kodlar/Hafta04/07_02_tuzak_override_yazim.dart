// Dosya: 07_02_tuzak_override_yazim.dart
// ❌ UYARI ve MANTIK HATASI: Metot adı yanlış yazılmış.
class Urun {
  String ad;

  Urun(this.ad);

  double kargoUcreti() => 29.90;
}

class Elektronik extends Urun {
  Elektronik(super.ad);

  @override
  double kargoUcret() => 0; // "kargoUcreti" olmalıydı
}

void main() {
  Elektronik e = Elektronik('Tablet');
  print(e.kargoUcreti());
}
