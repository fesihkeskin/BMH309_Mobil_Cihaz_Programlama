// Dosya: 10_02_odeme_polimorfizm.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

class Odeme {
  final double tutar;

  Odeme(this.tutar);

  String get ad => 'Cep Cüzdan';
  double ucret() => 0.0;
}

class KrediKarti extends Odeme {
  final int taksit;

  KrediKarti(super.tutar, {this.taksit = 1});

  @override
  String get ad => taksit > 1 ? 'Kredi Kartı ($taksit taksit)' : 'Kredi Kartı (tek çekim)';

  @override
  double ucret() => tutar * 0.02 + (taksit > 1 ? tutar * 0.03 : 0.0);
}

class Havale extends Odeme {
  Havale(super.tutar);

  @override
  String get ad => 'Havale/EFT';

  @override
  double ucret() => 5.0;
}

class KapidaOdeme extends Odeme {
  KapidaOdeme(super.tutar);

  @override
  String get ad => 'Kapıda Ödeme';

  @override
  double ucret() => 25.0;
}

void main() {
  List<Odeme> odemeler = [
    KrediKarti(1200, taksit: 3),
    KrediKarti(450),
    Havale(800),
    KapidaOdeme(320),
    Odeme(150),
  ];

  double toplamUcret = 0;
  for (Odeme o in odemeler) {
    double ucret = o.ucret();
    toplamUcret += ucret;
    print('${o.ad.padRight(23)}: ${tl(o.tutar)} + ${tl(ucret)} = ${tl(o.tutar + ucret)}');
  }
  print('Toplam işlem ücreti: ${tl(toplamUcret)}');
}
