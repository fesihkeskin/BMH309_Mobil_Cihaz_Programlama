// Dosya: 07_01_override.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);

  double kargoUcreti() => 29.90;

  @override
  String toString() => '$ad (${fiyat.toStringAsFixed(2)} TL)';
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, super.fiyat, this.garantiAy);

  @override
  double kargoUcreti() => fiyat >= 1000 ? 0.0 : 49.90;
}

class Gida extends Urun {
  bool soguk;

  Gida(super.ad, super.fiyat, {this.soguk = false});

  @override
  double kargoUcreti() => soguk ? 59.90 : 19.90;
}

void main() {
  Urun kitap = Urun('Kitap', 120);
  Elektronik tablet = Elektronik('Tablet', 8999, 24);
  Elektronik kablo = Elektronik('Kablo', 129.9, 6);
  Gida dondurma = Gida('Dondurma', 85, soguk: true);
  Gida makarna = Gida('Makarna', 25);

  print('$kitap → kargo: ${kitap.kargoUcreti().toStringAsFixed(2)} TL');
  print('$tablet → kargo: ${tablet.kargoUcreti().toStringAsFixed(2)} TL');
  print('$kablo → kargo: ${kablo.kargoUcreti().toStringAsFixed(2)} TL');
  print('$dondurma → kargo: ${dondurma.kargoUcreti().toStringAsFixed(2)} TL');
  print('$makarna → kargo: ${makarna.kargoUcreti().toStringAsFixed(2)} TL');
}
