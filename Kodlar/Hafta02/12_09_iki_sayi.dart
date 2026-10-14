// Dosya: 12_09_iki_sayi.dart
import 'dart:io';

void main() {
  stdout.write('Birinci sayı: ');
  double? a = double.tryParse((stdin.readLineSync() ?? '').trim().replaceAll(',', '.'));

  stdout.write('İkinci sayı: ');
  double? b = double.tryParse((stdin.readLineSync() ?? '').trim().replaceAll(',', '.'));

  if (a == null || b == null) {
    print('Geçerli iki sayı girmelisiniz.');
    return;
  }

  print('Toplam : ${a + b}');
  print('Fark   : ${a - b}');
  print('Çarpım : ${a * b}');
  print(b == 0 ? 'Bölüm  : Tanımsız (sıfıra bölme)' : 'Bölüm  : ${(a / b).toStringAsFixed(2)}');
}
