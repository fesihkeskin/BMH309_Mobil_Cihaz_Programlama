// Dosya: 16_06_kahve_siparisi.dart
void main() {
  const double kucukFiyat = 65.0;
  const double ortaFiyat = 80.0;
  const double buyukFiyat = 95.0;
  const double surupFiyati = 12.5;
  const double ogrenciIndirimi = 0.10;

  double boyFiyati = ortaFiyat; // Seçilen boy
  int adet = 2;

  double araToplam = (boyFiyati + surupFiyati) * adet;
  double indirim = araToplam * ogrenciIndirimi;
  double odenecek = araToplam - indirim;

  print('Boy fiyatı     : ${boyFiyati.toStringAsFixed(2)} TL');
  print('Şurup          : ${surupFiyati.toStringAsFixed(2)} TL');
  print('Adet           : $adet');
  print('Ara toplam     : ${araToplam.toStringAsFixed(2)} TL');
  print('Öğrenci ind.   : -${indirim.toStringAsFixed(2)} TL');
  print('Ödenecek tutar : ${odenecek.toStringAsFixed(2)} TL');
  print('Diğer boylar   : küçük ${kucukFiyat.toStringAsFixed(2)} TL · '
      'büyük ${buyukFiyat.toStringAsFixed(2)} TL');
}
