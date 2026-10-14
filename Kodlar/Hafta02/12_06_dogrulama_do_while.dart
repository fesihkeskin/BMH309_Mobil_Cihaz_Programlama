// Dosya: 12_06_dogrulama_do_while.dart
import 'dart:io';

void main() {
  int? yas;

  do {
    stdout.write('Yaşınız (13-120): ');
    String girdi = (stdin.readLineSync() ?? '').trim();
    yas = int.tryParse(girdi);

    if (yas == null) {
      print('Lütfen yalnızca rakam girin.');
    } else if (yas < 13 || yas > 120) {
      print('Yaş 13 ile 120 arasında olmalı.');
      yas = null; // Geçersiz kabul et, döngü devam etsin
    }
  } while (yas == null);

  print('Kayıt tamamlandı. Yaşınız: $yas');
}
