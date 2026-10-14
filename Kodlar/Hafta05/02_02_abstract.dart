// Dosya: 02_02_abstract.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

abstract class Odeme {
  final double tutar;

  Odeme(this.tutar);

  String get ad;      // soyut getter: her alt sınıf kendi adını vermek ZORUNDA
  double ucret();     // soyut metot: her alt sınıf kendi ücretini hesaplamak ZORUNDA

  // Somut metot: Soyut üyeleri kullanabilir; çalıştığında alt sınıfın sürümleri devreye girer
  String ozet() => '${ad.padRight(13)}: ${tl(tutar)} + ${tl(ucret())} = ${tl(tutar + ucret())}';
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

  @override
  double ucret() => 25;
}

class CepCuzdan extends Odeme {
  CepCuzdan(super.tutar);

  @override
  String get ad => 'Cep Cüzdan';

  @override
  double ucret() => 0;
}

void main() {
  List<Odeme> odemeler = [Havale(800), KapidaOdeme(320), CepCuzdan(150)];
  for (Odeme o in odemeler) {
    print(o.ozet());
  }
}
