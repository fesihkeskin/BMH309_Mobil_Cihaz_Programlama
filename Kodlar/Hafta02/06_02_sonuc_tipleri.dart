// Dosya: 06_02_sonuc_tipleri.dart
void main() {
  int adet = 3;
  double birimFiyat = 49.5;

  var toplam = adet * birimFiyat;
  var ortalama = 10 / 4;
  var tamBolum = 10 ~/ 4;

  print(toplam);
  print(ortalama);
  print(tamBolum);
  print(toplam.runtimeType);
  print(tamBolum.runtimeType);
}
