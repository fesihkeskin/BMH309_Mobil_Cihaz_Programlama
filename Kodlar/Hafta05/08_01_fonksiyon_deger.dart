// Dosya: 08_01_fonksiyon_deger.dart
double kdvEkle(double fiyat) => fiyat * 1.20;
double indirimUygula(double fiyat) => fiyat * 0.90;

void main() {
  double Function(double) islem = kdvEkle;
  print(islem(100).toStringAsFixed(2));

  islem = indirimUygula;
  print(islem(100).toStringAsFixed(2));

  List<double Function(double)> adimlar = [indirimUygula, kdvEkle];
  double fiyat = 250;
  for (var adim in adimlar) {
    fiyat = adim(fiyat);
  }
  print('Önce %10 indirim, sonra KDV: ${fiyat.toStringAsFixed(2)} TL');
}
