// Dosya: 06_07_atama.dart
void main() {
  int puan = 100;
  print('Başlangıç : $puan');

  puan += 20;
  print('+= 20     : $puan');

  puan -= 30;
  print('-= 30     : $puan');

  puan *= 2;
  print('*= 2      : $puan');

  puan ~/= 3;
  print('~/= 3     : $puan');

  puan %= 7;
  print('%= 7      : $puan');

  double bakiye = 100;
  bakiye /= 4;
  print('bakiye /= 4 → $bakiye');
}
