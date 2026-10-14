// Dosya: 04_01_isimli_kurucu.dart
class Konum {
  final double enlem;
  final double boylam;
  final String ad;

  Konum(this.enlem, this.boylam, this.ad);

  Konum.merkez()
      : enlem = 37.93,
        boylam = 41.94,
        ad = 'Siirt Merkez';

  Konum.koordinat(this.enlem, this.boylam) : ad = 'İsimsiz konum';

  @override
  String toString() => '$ad ($enlem, $boylam)';
}

void main() {
  Konum ev = Konum(37.925, 41.932, 'Ev');
  Konum merkez = Konum.merkez();
  Konum nokta = Konum.koordinat(37.95, 41.96);

  print(ev);
  print(merkez);
  print(nokta);
}
