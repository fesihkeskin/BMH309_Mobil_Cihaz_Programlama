// Dosya: 01_s8_sifre_gucu.dart
import 'dart:io';

void main() {
  stdout.write('Şifreniz: ');
  String sifre = stdin.readLineSync() ?? '';

  const String rakamlar = '0123456789';
  const String buyukHarfler = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String kucukHarfler = 'abcdefghijklmnopqrstuvwxyz';
  const String ozelKarakterler = r'!@#$%^&*.-_';

  bool uzunlukYeterli = sifre.length >= 8;
  bool rakamVar = false;
  bool buyukVar = false;
  bool kucukVar = false;
  bool ozelVar = false;

  for (var k in sifre.split('')) {
    if (rakamlar.contains(k)) {
      rakamVar = true;
    } else if (buyukHarfler.contains(k)) {
      buyukVar = true;
    } else if (kucukHarfler.contains(k)) {
      kucukVar = true;
    } else if (ozelKarakterler.contains(k)) {
      ozelVar = true;
    }
  }

  int puan = 0;
  if (uzunlukYeterli) puan++;
  if (rakamVar) puan++;
  if (buyukVar) puan++;
  if (kucukVar) puan++;
  if (ozelVar) puan++;

  String seviye = switch (puan) {
    0 || 1 => 'Çok zayıf',
    2 => 'Zayıf',
    3 => 'Orta',
    4 => 'Güçlü',
    _ => 'Çok güçlü',
  };

  print('Puan: $puan/5 → $seviye');

  if (puan < 5) {
    print('Eksikler:');
    if (!uzunlukYeterli) print('- En az 8 karakter');
    if (!rakamVar) print('- En az bir rakam');
    if (!buyukVar) print('- En az bir büyük harf (A-Z)');
    if (!kucukVar) print('- En az bir küçük harf (a-z)');
    if (!ozelVar) print('- En az bir özel karakter');
  }
}
