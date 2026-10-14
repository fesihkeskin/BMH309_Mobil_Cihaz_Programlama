// Dosya: 05_05_ayni_dosya.dart
class Kasa {
  int _sifre = 1234;
}

void main() {
  Kasa k = Kasa();
  k._sifre = 0; // Aynı dosyada olduğumuz için hata YOK
  print(k._sifre);
}
