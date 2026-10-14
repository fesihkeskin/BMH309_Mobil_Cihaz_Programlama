// Dosya: 10_03_odeme_tip_deseni.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

class Odeme {
  final double tutar;

  Odeme(this.tutar);
}

class KrediKarti extends Odeme {
  final int taksit;

  KrediKarti(super.tutar, {this.taksit = 1});
}

class Havale extends Odeme {
  Havale(super.tutar);
}

class KapidaOdeme extends Odeme {
  KapidaOdeme(super.tutar);
}

String odemeAdi(Odeme o) => switch (o) {
      KrediKarti k => k.taksit > 1 ? 'Kredi Kartı (${k.taksit} taksit)' : 'Kredi Kartı (tek çekim)',
      Havale _ => 'Havale/EFT',
      KapidaOdeme _ => 'Kapıda Ödeme',
      _ => 'Cep Cüzdan',
    };

double ucretHesapla(Odeme o) => switch (o) {
      KrediKarti k => k.tutar * 0.02 + (k.taksit > 1 ? k.tutar * 0.03 : 0.0),
      Havale _ => 5.0,
      KapidaOdeme _ => 25.0,
      _ => 0.0,
    };

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
    double ucret = ucretHesapla(o);
    toplamUcret += ucret;
    print('${odemeAdi(o).padRight(23)}: ${tl(o.tutar)} + ${tl(ucret)} = ${tl(o.tutar + ucret)}');
  }
  print('Toplam işlem ücreti: ${tl(toplamUcret)}');
}
