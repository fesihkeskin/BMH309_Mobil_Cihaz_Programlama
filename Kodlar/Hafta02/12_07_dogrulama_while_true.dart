// Dosya: 12_07_dogrulama_while_true.dart
import 'dart:io';

void main() {
  int adet;

  while (true) {
    stdout.write('Adet (1-10): ');
    int? girilen = int.tryParse((stdin.readLineSync() ?? '').trim());

    if (girilen != null && girilen >= 1 && girilen <= 10) {
      adet = girilen;
      break;
    }

    print('Geçersiz giriş, tekrar deneyin.');
  }

  print('Sepete $adet adet eklendi.');
}
