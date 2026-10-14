// Dosya: 12_01_ilk_girdi.dart
import 'dart:io';

void main() {
  stdout.write('Adınız: ');
  String? ad = stdin.readLineSync();

  print('Merhaba, $ad!');
}
