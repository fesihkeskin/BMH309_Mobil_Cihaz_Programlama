// Dosya: 01_s3_asal_sayi.dart
import 'dart:io';

void main() {
  stdout.write('Bir sayı girin: ');
  int? girilen = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (girilen == null || girilen < 2) {
    print('Lütfen 2 veya daha büyük bir tam sayı girin.');
    return;
  }

  int sayi = girilen;
  int enKucukBolen = 0; // 0: bölen bulunamadı

  for (int bolen = 2; bolen * bolen <= sayi; bolen++) {
    if (sayi % bolen == 0) {
      enKucukBolen = bolen;
      break;
    }
  }

  if (enKucukBolen == 0) {
    print('$sayi asal bir sayıdır.');
  } else {
    print('$sayi asal değildir; en küçük böleni $enKucukBolen.');
  }
}
