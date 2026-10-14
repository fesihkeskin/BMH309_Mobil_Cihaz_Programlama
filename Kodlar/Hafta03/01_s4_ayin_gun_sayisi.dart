// Dosya: 01_s4_ayin_gun_sayisi.dart
import 'dart:io';

void main() {
  stdout.write('Yıl: ');
  int? yil = int.tryParse((stdin.readLineSync() ?? '').trim());

  stdout.write('Ay (1-12): ');
  int? ay = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (yil == null || yil <= 0) {
    print('Geçerli bir yıl girin.');
    return;
  }

  if (ay == null || ay < 1 || ay > 12) {
    print('Ay 1 ile 12 arasında olmalı.');
    return;
  }

  bool artikYil = (yil % 4 == 0 && yil % 100 != 0) || yil % 400 == 0;

  int gunSayisi = switch (ay) {
    1 || 3 || 5 || 7 || 8 || 10 || 12 => 31,
    4 || 6 || 9 || 11 => 30,
    2 => artikYil ? 29 : 28,
    _ => 0, // Bu kola ulaşılmaz; ay yukarıda doğrulandı.
  };

  print('$yil yılının $ay. ayı $gunSayisi gündür.');
}
