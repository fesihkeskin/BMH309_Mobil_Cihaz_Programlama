// Dosya: 14_01_not_if.dart
import 'dart:io';

void main() {
  stdout.write('Vize notu (0-100): ');
  int? vize = int.tryParse((stdin.readLineSync() ?? '').trim());

  stdout.write('Final notu (0-100): ');
  int? finalNotu = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (vize == null || finalNotu == null) {
    print('Notlar 0 ile 100 arasında tam sayı olmalı.');
    return;
  }

  if (vize < 0 || vize > 100 || finalNotu < 0 || finalNotu > 100) {
    print('Notlar 0 ile 100 arasında tam sayı olmalı.');
    return;
  }

  double ortalama = (vize * 40 + finalNotu * 60) / 100;
  String harf;

  if (finalNotu < 50) {
    harf = 'FF';
  } else if (ortalama >= 90) {
    harf = 'AA';
  } else if (ortalama >= 85) {
    harf = 'BA';
  } else if (ortalama >= 80) {
    harf = 'BB';
  } else if (ortalama >= 75) {
    harf = 'CB';
  } else if (ortalama >= 70) {
    harf = 'CC';
  } else if (ortalama >= 60) {
    harf = 'DC';
  } else if (ortalama >= 50) {
    harf = 'DD';
  } else {
    harf = 'FF';
  }

  print('Ortalama: ${ortalama.toStringAsFixed(2)}');

  if (harf == 'FF') {
    if (finalNotu < 50) {
      print('Harf notu: $harf → KALDI (final barajı)');
    } else {
      print('Harf notu: $harf → KALDI');
    }
  } else {
    print('Harf notu: $harf → GEÇTİ');
  }
}
