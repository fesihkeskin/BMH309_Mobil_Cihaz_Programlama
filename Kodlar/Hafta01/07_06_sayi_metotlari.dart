// Dosya: 07_06_sayi_metotlari.dart
void main() {
  double fiyat = 149.957;
  int sicaklik = -7;
  int sayi = 14;

  print(fiyat.toStringAsFixed(2));
  print(fiyat.round());
  print(fiyat.floor());
  print(fiyat.ceil());
  print(sicaklik.abs());
  print(sayi.isEven);
  print(sayi.isOdd);
  print(sicaklik.isNegative);
  print(105.clamp(0, 100));
}
