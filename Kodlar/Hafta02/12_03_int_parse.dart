// Dosya: 12_03_int_parse.dart
// ❌ ÇALIŞMA ZAMANI HATASI riski: Sayı dışında bir şey girilirse program çöker.
import 'dart:io';

void main() {
  stdout.write('Kaç adet almak istiyorsunuz? ');
  String girdi = (stdin.readLineSync() ?? '').trim();
  int adet = int.parse(girdi);
  print('Sepete $adet adet eklendi.');
}
