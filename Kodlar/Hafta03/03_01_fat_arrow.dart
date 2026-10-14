// Dosya: 03_01_fat_arrow.dart
double kdvEkle(double fiyat) => fiyat * 1.20;

String tlFormatla(double tutar) => '${tutar.toStringAsFixed(2)} TL';

bool ciftMi(int sayi) => sayi % 2 == 0;

String tamAd(String ad, String soyad) => '$ad $soyad';

void cizgiCiz() => print('-' * 20);

void main() {
  cizgiCiz();
  print(tlFormatla(kdvEkle(250)));
  print(ciftMi(7));
  print(tamAd('Ayşe', 'Yılmaz'));
  cizgiCiz();
}
