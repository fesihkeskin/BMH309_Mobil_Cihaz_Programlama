// Dosya: 07_03_int_double.dart
void main() {
  double fiyat = 150;      // Doğrudan yazılan tam sayı double'a uyar: 150.0
  print(fiyat);

  int adet = 3;
  double adetDouble = adet.toDouble();
  print(adetDouble);

  double puan = 87.6;
  int puanTam = puan.toInt();
  int puanYuvarlak = puan.round();
  print(puanTam);
  print(puanYuvarlak);
}
