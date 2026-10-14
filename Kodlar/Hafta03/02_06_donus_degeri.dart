// Dosya: 02_06_donus_degeri.dart
double kdvEkle(double fiyat) {
  double sonuc = fiyat * 1.20;
  return sonuc;
}

void main() {
  double etiketFiyati = kdvEkle(100);
  print('KDV dahil: ${etiketFiyati.toStringAsFixed(2)} TL');

  double toplam = kdvEkle(50) + kdvEkle(25);
  print('İki ürün KDV dahil: ${toplam.toStringAsFixed(2)} TL');

  print('Doğrudan kullanım: ${kdvEkle(10).toStringAsFixed(2)} TL');
}
