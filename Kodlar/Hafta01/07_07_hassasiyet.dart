// Dosya: 07_07_hassasiyet.dart
void main() {
  print(0.1 + 0.2);
  print((0.1 + 0.2).toStringAsFixed(2));

  // Para hesaplarında önerilen yol: tutarı kuruş cinsinden tam sayı olarak tutmak
  int fiyatKurus = 14990; // 149,90 TL
  int adet = 3;
  int toplamKurus = fiyatKurus * adet;
  print('Toplam: ${(toplamKurus / 100).toStringAsFixed(2)} TL');
}
