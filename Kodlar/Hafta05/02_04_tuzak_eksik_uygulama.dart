// Dosya: 02_04_tuzak_eksik_uygulama.dart
// ❌ DERLEME HATASI
abstract class Odeme {
  final double tutar;

  Odeme(this.tutar);

  String get ad;
  double ucret();
}

class KapidaOdeme extends Odeme {
  KapidaOdeme(super.tutar);

  @override
  String get ad => 'Kapıda Ödeme';
}

void main() {
  print(KapidaOdeme(320).ad);
}
