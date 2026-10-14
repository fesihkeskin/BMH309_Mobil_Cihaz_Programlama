// Dosya: 10_01_odeme_tek_sinif.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

class Odeme {
  final String tur; // 'kart', 'havale', 'kapida', 'cuzdan'
  final double tutar;
  final int taksit;

  Odeme(this.tur, this.tutar, {this.taksit = 1});

  String get ad => switch (tur) {
        'kart' => taksit > 1 ? 'Kredi Kartı ($taksit taksit)' : 'Kredi Kartı (tek çekim)',
        'havale' => 'Havale/EFT',
        'kapida' => 'Kapıda Ödeme',
        'cuzdan' => 'Cep Cüzdan',
        _ => 'Bilinmeyen yöntem',
      };

  double ucret() => switch (tur) {
        'kart' => tutar * 0.02 + (taksit > 1 ? tutar * 0.03 : 0.0),
        'havale' => 5.0,
        'kapida' => 25.0,
        _ => 0.0,
      };
}

void main() {
  List<Odeme> odemeler = [
    Odeme('kart', 1200, taksit: 3),
    Odeme('kart', 450),
    Odeme('havale', 800),
    Odeme('kapida', 320),
    Odeme('cuzdan', 150),
  ];

  double toplamUcret = 0;
  for (Odeme o in odemeler) {
    double ucret = o.ucret();
    toplamUcret += ucret;
    print('${o.ad.padRight(23)}: ${tl(o.tutar)} + ${tl(ucret)} = ${tl(o.tutar + ucret)}');
  }
  print('Toplam işlem ücreti: ${tl(toplamUcret)}');
}
