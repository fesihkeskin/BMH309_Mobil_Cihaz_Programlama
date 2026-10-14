// Dosya: 08_10_metin_bicimlendirme.dart
void main() {
  String saat = '9';
  String dakika = '5';
  print('${saat.padLeft(2, '0')}:${dakika.padLeft(2, '0')}');

  print('Ürün'.padRight(12, '.') + '49.90 TL');
  print('Kargo'.padRight(12, '.') + '29.90 TL');

  print('=' * 20);

  String telefon = '0532 123 45 67';
  print(telefon.replaceAll(' ', ''));
}
