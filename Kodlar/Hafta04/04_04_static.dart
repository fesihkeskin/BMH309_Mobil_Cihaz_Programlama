// Dosya: 04_04_static.dart
class Siparis {
  static int toplamSiparis = 0;
  static const double kargoUcreti = 39.90;

  final int no;
  final double tutar;

  Siparis(this.tutar) : no = ++toplamSiparis;

  static double kargoHesapla(double tutar) => tutar >= 300 ? 0.0 : kargoUcreti;
}

void main() {
  Siparis a = Siparis(120);
  Siparis b = Siparis(450);

  print('Sipariş ${a.no}: kargo ${Siparis.kargoHesapla(a.tutar).toStringAsFixed(2)} TL');
  print('Sipariş ${b.no}: kargo ${Siparis.kargoHesapla(b.tutar).toStringAsFixed(2)} TL');
  print('Toplam sipariş: ${Siparis.toplamSiparis}');
}
