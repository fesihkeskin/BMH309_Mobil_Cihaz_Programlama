// Dosya: 12_02_null_ve_trim.dart
import 'dart:io';

void main() {
  stdout.write('Kullanıcı adınız: ');
  String girdi = stdin.readLineSync() ?? '';
  String kullaniciAdi = girdi.trim();

  if (kullaniciAdi.isEmpty) {
    print('Kullanıcı adı boş bırakılamaz.');
  } else {
    print('Hoş geldin, $kullaniciAdi! (${kullaniciAdi.length} karakter)');
  }
}
