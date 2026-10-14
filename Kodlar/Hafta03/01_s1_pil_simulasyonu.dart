// Dosya: 01_s1_pil_simulasyonu.dart
import 'dart:io';

void main() {
  stdout.write('Başlangıç pil seviyesi (1-100): ');
  int? girilen = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (girilen == null || girilen < 1 || girilen > 100) {
    print('Lütfen 1 ile 100 arasında bir sayı girin.');
    return;
  }

  int pil = girilen;
  int dakika = 0;
  bool tasarrufModu = pil <= 20;

  if (tasarrufModu) {
    print('Güç tasarrufu modu açıldı.');
  }

  while (pil > 0) {
    dakika++;
    pil -= pil > 20 ? 4 : 2;
    if (pil < 0) {
      pil = 0;
    }
    print('$dakika. dk: %$pil');

    if (!tasarrufModu && pil <= 20) {
      tasarrufModu = true;
      print('Güç tasarrufu modu açıldı.');
    }
  }

  print('Cihaz kapandı. Toplam süre: $dakika dakika.');
}
