// Dosya: 01_s3_ulasim.dart
class Yolculuk {
  final double km;

  Yolculuk(this.km);

  String get tur => 'Yolculuk';
  double ucret() => 0;

  String ozet() => '${tur.padRight(8)} ${km.toStringAsFixed(1)} km → ${ucret().toStringAsFixed(2)} TL';
}

class Taksi extends Yolculuk {
  final bool gece;

  Taksi(super.km, {this.gece = false});

  @override
  String get tur => 'Taksi';

  @override
  double ucret() {
    double tutar = 45 + km * 25;
    return gece ? tutar * 1.5 : tutar;
  }

  @override
  String ozet() => gece ? '${super.ozet()} (gece)' : super.ozet();
}

class Scooter extends Yolculuk {
  final int dakika;

  Scooter(super.km, this.dakika);

  @override
  String get tur => 'Scooter';

  @override
  double ucret() => 10 + dakika * 4.5;

  @override
  String ozet() => '${super.ozet()} ($dakika dk)';
}

class Otobus extends Yolculuk {
  final bool ogrenci;

  Otobus(super.km, {this.ogrenci = false});

  @override
  String get tur => 'Otobüs';

  @override
  double ucret() => ogrenci ? 10.0 : 20.0;
}

Yolculuk enPahali(List<Yolculuk> liste) {
  Yolculuk secilen = liste[0];
  for (Yolculuk y in liste) {
    if (y.ucret() > secilen.ucret()) {
      secilen = y;
    }
  }
  return secilen;
}

void main() {
  List<Yolculuk> gunluk = [
    Otobus(12.5, ogrenci: true),
    Scooter(2.3, 11),
    Taksi(8.4),
    Taksi(6.0, gece: true),
    Otobus(12.5),
  ];

  double toplam = 0;
  for (Yolculuk y in gunluk) {
    print(y.ozet());
    toplam += y.ucret();
  }
  print('Günlük toplam: ${toplam.toStringAsFixed(2)} TL');

  Yolculuk enPahaliYolculuk = enPahali(gunluk);
  print('En pahalı yolculuk: ${enPahaliYolculuk.tur} ${enPahaliYolculuk.km.toStringAsFixed(1)} km '
      '(${enPahaliYolculuk.ucret().toStringAsFixed(2)} TL)');
}
