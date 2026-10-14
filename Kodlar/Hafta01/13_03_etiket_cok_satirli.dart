// Dosya: 13_03_etiket_cok_satirli.dart
void main() {
  String urunAdi = '  kablosuz kulaklık ';
  double fiyat = 749.90;
  double indirimOrani = 0.20;

  double indirimTutari = fiyat * indirimOrani;

  String etiket = '''
Ürün       : ${urunAdi.trim().toUpperCase()}
Eski fiyat : ${fiyat.toStringAsFixed(2)} TL
İndirim    : %${(indirimOrani * 100).round()}
Yeni fiyat : ${(fiyat - indirimTutari).toStringAsFixed(2)} TL
Kazancınız : ${indirimTutari.toStringAsFixed(2)} TL''';

  print(etiket);
}
