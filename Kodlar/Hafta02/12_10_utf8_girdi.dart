// Dosya: 12_10_utf8_girdi.dart
import 'dart:convert';
import 'dart:io';

void main() {
  stdout.write('Şehriniz: ');
  String sehir = (stdin.readLineSync(encoding: utf8) ?? '').trim();
  print('Seçilen şehir: $sehir');
}
