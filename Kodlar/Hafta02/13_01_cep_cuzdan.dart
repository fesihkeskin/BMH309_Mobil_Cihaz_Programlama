// Dosya: 13_01_cep_cuzdan.dart
import 'dart:io';

void main() {
  const String dogruPin = '2580';
  const int maksimumDeneme = 3;
  double bakiye = 1250.0;
  int islemSayisi = 0;

  print('==============================');
  print('   CEP CÜZDAN · Hoş geldiniz');
  print('==============================');

  // 1) PIN doğrulama: en fazla 3 deneme
  int deneme = 0;
  bool girisBasarili = false;

  while (deneme < maksimumDeneme) {
    deneme++;
    stdout.write('PIN kodunuz ($deneme/$maksimumDeneme): ');
    String pin = (stdin.readLineSync() ?? '').trim();

    if (pin == dogruPin) {
      girisBasarili = true;
      break;
    }

    int kalanHak = maksimumDeneme - deneme;
    print(kalanHak > 0 ? 'Hatalı PIN. Kalan hak: $kalanHak' : 'Hatalı PIN.');
  }

  if (!girisBasarili) {
    print('Çok fazla hatalı deneme. Hesabınız geçici olarak kilitlendi.');
    return;
  }

  print('Giriş başarılı.');

  // 2) Ana menü döngüsü
  menu:
  while (true) {
    print('');
    print('--- ANA MENÜ ---');
    print('1) Bakiye görüntüle');
    print('2) Para yatır');
    print('3) Para çek');
    print('0) Çıkış');
    stdout.write('Seçiminiz: ');
    String secim = (stdin.readLineSync() ?? '').trim();

    switch (secim) {
      case '1':
        print('Bakiyeniz: ${bakiye.toStringAsFixed(2)} TL');

      case '2':
        stdout.write('Yatırılacak tutar: ');
        String yatirmaGirdisi = (stdin.readLineSync() ?? '').trim().replaceAll(',', '.');
        double? yatirilan = double.tryParse(yatirmaGirdisi);

        if (yatirilan == null || yatirilan <= 0) {
          print('Geçersiz tutar.');
        } else {
          bakiye += yatirilan;
          islemSayisi++;
          print('${yatirilan.toStringAsFixed(2)} TL yatırıldı. '
              'Yeni bakiye: ${bakiye.toStringAsFixed(2)} TL');
        }

      case '3':
        stdout.write('Çekilecek tutar: ');
        String cekmeGirdisi = (stdin.readLineSync() ?? '').trim().replaceAll(',', '.');
        double? cekilen = double.tryParse(cekmeGirdisi);

        if (cekilen == null || cekilen <= 0) {
          print('Geçersiz tutar.');
        } else if (cekilen > bakiye) {
          print('Yetersiz bakiye. Mevcut: ${bakiye.toStringAsFixed(2)} TL');
        } else {
          bakiye -= cekilen;
          islemSayisi++;
          print('${cekilen.toStringAsFixed(2)} TL çekildi. '
              'Yeni bakiye: ${bakiye.toStringAsFixed(2)} TL');
        }

      case '0':
        print('Bu oturumda $islemSayisi işlem yaptınız. Güle güle!');
        break menu;

      default:
        print('Geçersiz seçim: "$secim"');
    }
  }
}
