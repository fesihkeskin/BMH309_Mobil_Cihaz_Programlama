// Dosya: 13_04_etiket_arti.dart
void main() {
  String urunAdi = '  kablosuz kulaklık ';
  double fiyat = 749.90;
  double indirimOrani = 0.20;

  double indirimTutari = fiyat * indirimOrani;

  print('Ürün       : ' + urunAdi.trim().toUpperCase());
  print('Eski fiyat : ' + fiyat.toStringAsFixed(2) + ' TL');
  print('İndirim    : %' + (indirimOrani * 100).round().toString());
  print('Yeni fiyat : ' + (fiyat - indirimTutari).toStringAsFixed(2) + ' TL');
  print('Kazancınız : ' + indirimTutari.toStringAsFixed(2) + ' TL');
}
