// Dosya: 16_04_dijital_saat.dart
void main() {
  int saat = 7;
  int dakika = 5;
  int saniye = 9;

  String ss = saat.toString().padLeft(2, '0');
  String dd = dakika.toString().padLeft(2, '0');
  String sn = saniye.toString().padLeft(2, '0');

  print('$ss:$dd:$sn');
}
