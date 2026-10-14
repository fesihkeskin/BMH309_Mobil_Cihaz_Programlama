// Dosya: 01_s7_degerlendirme.dart
import 'dart:io';

void main() {
  stdout.write('Uygulamamızı 1-5 arası puanlayın: ');
  int? puan = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (puan == null || puan < 1 || puan > 5) {
    print('Lütfen 1 ile 5 arasında bir puan girin.');
    return;
  }

  for (int seviye = 1; seviye <= 5; seviye++) {
    String cubuk = '*' * seviye + '-' * (5 - seviye);
    String etiket = switch (seviye) {
      1 => 'Çok kötü',
      2 => 'Kötü',
      3 => 'Orta',
      4 => 'İyi',
      _ => 'Mükemmel',
    };
    String isaret = seviye == puan ? '  ← sizin puanınız' : '';
    print('$seviye [$cubuk] $etiket$isaret');
  }

  print('Teşekkürler!');
}
