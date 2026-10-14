// Dosya: 09_01_while_temel.dart
void main() {
  double birikim = 0;
  double aylikTasarruf = 750;
  double hedef = 5000;
  int ay = 0;

  while (birikim < hedef) {
    ay++;
    birikim += aylikTasarruf;
    print('$ay. ay sonunda birikim: ${birikim.toStringAsFixed(2)} TL');
  }

  print('Hedefe $ay ayda ulaşıldı.');
}
