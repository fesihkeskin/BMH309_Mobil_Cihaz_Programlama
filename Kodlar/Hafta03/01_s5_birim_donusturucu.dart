// Dosya: 01_s5_birim_donusturucu.dart
import 'dart:io';

void main() {
  const double kmMil = 0.621371;
  const double milKm = 1.609344;
  int donusumSayisi = 0;

  menu:
  while (true) {
    print('');
    print('--- BİRİM DÖNÜŞTÜRÜCÜ ---');
    print('1) km → mil');
    print('2) mil → km');
    print('3) °C → °F');
    print('4) °F → °C');
    print('0) Çıkış');
    stdout.write('Seçiminiz: ');
    String secim = (stdin.readLineSync() ?? '').trim();

    switch (secim) {
      case '0':
        print('Toplam $donusumSayisi dönüşüm yapıldı. Güle güle!');
        break menu;

      case '1' || '2' || '3' || '4':
        stdout.write('Değer: ');
        String girdi = (stdin.readLineSync() ?? '').trim().replaceAll(',', '.');
        double? deger = double.tryParse(girdi);

        if (deger == null) {
          print('Geçersiz değer.');
        } else {
          String sonuc = switch (secim) {
            '1' => '${deger.toStringAsFixed(2)} km = ${(deger * kmMil).toStringAsFixed(2)} mil',
            '2' => '${deger.toStringAsFixed(2)} mil = ${(deger * milKm).toStringAsFixed(2)} km',
            '3' => '${deger.toStringAsFixed(2)} °C = ${(deger * 9 / 5 + 32).toStringAsFixed(2)} °F',
            _ => '${deger.toStringAsFixed(2)} °F = ${((deger - 32) * 5 / 9).toStringAsFixed(2)} °C',
          };
          print(sonuc);
          donusumSayisi++;
        }

      default:
        print('Geçersiz seçim.');
    }
  }
}
