// Dosya: 08_12_metin_degismezligi.dart
void main() {
  String sehir = 'bursa';

  sehir.toUpperCase();   // Sonuç hiçbir yere atanmadı!
  print(sehir);

  sehir = sehir.toUpperCase();
  print(sehir);
}
