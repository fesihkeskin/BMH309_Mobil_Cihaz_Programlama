// Dosya: 02_01_soyut_sorun.dart
// ❌ TASARIM SORUNU: Odeme hem kalıp hem de gerçek bir ödeme gibi kullanılabiliyor.
class Odeme {
  final double tutar;

  Odeme(this.tutar);

  String get ad => 'Ödeme';
  double ucret() => 0;
}

class Havale extends Odeme {
  Havale(super.tutar);

  @override
  String get ad => 'Havale/EFT';

  @override
  double ucret() => 5;
}

class KapidaOdeme extends Odeme {
  KapidaOdeme(super.tutar);

  @override
  String get ad => 'Kapıda Ödeme';

  // ucret() metodunu override etmek UNUTULDU! (25 TL olmalıydı)
}

void main() {
  List<Odeme> odemeler = [Havale(800), KapidaOdeme(320), Odeme(150)];
  for (Odeme o in odemeler) {
    print('${o.ad}: ${o.ucret()} TL ücret');
  }
}
