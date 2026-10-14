// Dosya: 13_01_etiket_adim_adim.dart
void main() {
  String urunAdi = '  kablosuz kulaklık ';
  double fiyat = 749.90;
  double indirimOrani = 0.20;

  String temizAd = urunAdi.trim();
  String buyukAd = temizAd.toUpperCase();
  int indirimYuzdesi = (indirimOrani * 100).round();
  double indirimTutari = fiyat * indirimOrani;
  double yeniFiyat = fiyat - indirimTutari;

  print('Ürün       : $buyukAd');
  print('Eski fiyat : ${fiyat.toStringAsFixed(2)} TL');
  print('İndirim    : %$indirimYuzdesi');
  print('Yeni fiyat : ${yeniFiyat.toStringAsFixed(2)} TL');
  print('Kazancınız : ${indirimTutari.toStringAsFixed(2)} TL');
}
