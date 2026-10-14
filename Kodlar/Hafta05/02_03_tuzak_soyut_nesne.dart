// Dosya: 02_03_tuzak_soyut_nesne.dart
// ❌ DERLEME HATASI
abstract class Odeme {
  final double tutar;

  Odeme(this.tutar);

  double ucret();
}

void main() {
  Odeme o = Odeme(150);
  print(o.ucret());
}
