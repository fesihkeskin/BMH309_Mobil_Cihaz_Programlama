// Dosya: 14_02_not_switch.dart
import 'dart:io';

void main() {
  stdout.write('Vize notu (0-100): ');
  int? vize = int.tryParse((stdin.readLineSync() ?? '').trim());

  stdout.write('Final notu (0-100): ');
  int? finalNotu = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (vize == null || finalNotu == null ||
      vize < 0 || vize > 100 || finalNotu < 0 || finalNotu > 100) {
    print('Notlar 0 ile 100 arasında tam sayı olmalı.');
    return;
  }

  double ortalama = (vize * 40 + finalNotu * 60) / 100;

  String harf = switch (ortalama) {
    >= 90 => 'AA',
    >= 85 => 'BA',
    >= 80 => 'BB',
    >= 75 => 'CB',
    >= 70 => 'CC',
    >= 60 => 'DC',
    >= 50 => 'DD',
    _ => 'FF',
  };

  if (finalNotu < 50) {
    harf = 'FF';
  }

  String sonuc = harf == 'FF' ? 'KALDI' : 'GEÇTİ';
  String ek = finalNotu < 50 ? ' (final barajı)' : '';

  print('Ortalama: ${ortalama.toStringAsFixed(2)}');
  print('Harf notu: $harf → $sonuc$ek');
}
