// Dosya: 12_04_int_tryparse.dart
import 'dart:io';

void main() {
  stdout.write('Kaç adet almak istiyorsunuz? ');
  String girdi = (stdin.readLineSync() ?? '').trim();
  int? adet = int.tryParse(girdi);

  if (adet == null) {
    print('"$girdi" geçerli bir sayı değil.');
  } else if (adet <= 0) {
    print('Adet en az 1 olmalı.');
  } else if (adet > 10) {
    print('Tek seferde en fazla 10 adet alınabilir.');
  } else {
    print('Sepete $adet adet eklendi.');
  }
}
