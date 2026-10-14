// Dosya: 01_s6_sayi_tahmin.dart
import 'dart:io';
import 'dart:math';

void main() {
  const int maksimumHak = 7;
  int gizliSayi = Random().nextInt(100) + 1;
  int deneme = 0;
  bool bildi = false;

  print('1 ile 100 arasında bir sayı tuttum. $maksimumHak hakkınız var.');

  do {
    stdout.write('Tahmin ${deneme + 1}/$maksimumHak: ');
    int? tahmin = int.tryParse((stdin.readLineSync() ?? '').trim());

    if (tahmin == null || tahmin < 1 || tahmin > 100) {
      print('Geçersiz girdi, hakkınız azalmadı.');
      continue;
    }

    deneme++;

    if (tahmin == gizliSayi) {
      bildi = true;
      break;
    } else if (tahmin < gizliSayi) {
      print('Daha büyük bir sayı söyleyin.');
    } else {
      print('Daha küçük bir sayı söyleyin.');
    }
  } while (deneme < maksimumHak);

  if (bildi) {
    print('Tebrikler! $deneme. denemede bildiniz.');
  } else {
    print('Hakkınız bitti. Tuttuğum sayı $gizliSayi idi.');
  }
}
