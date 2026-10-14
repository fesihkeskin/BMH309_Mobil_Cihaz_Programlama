// Dosya: 08_05_typedef.dart
typedef FiyatKurali = double Function(double fiyat);

class Kampanya {
  final String ad;
  final FiyatKurali kural;

  Kampanya(this.ad, this.kural);
}

void main() {
  List<Kampanya> kampanyalar = [
    Kampanya('%20 indirim', (f) => f * 0.80),
    Kampanya('100 TL üzeri 30 TL indirim', (f) => f >= 100 ? f - 30 : f),
    Kampanya('Kampanya yok', (f) => f),
  ];

  double sepet = 180;
  for (Kampanya k in kampanyalar) {
    print('${k.ad.padRight(27)}: ${k.kural(sepet).toStringAsFixed(2)} TL');
  }
}
