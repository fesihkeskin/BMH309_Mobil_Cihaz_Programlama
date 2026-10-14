// Dosya: 08_01_neden_dongu.dart
void main() {
  // Döngü olmadan:
  print('Bildirim 1 gönderildi');
  print('Bildirim 2 gönderildi');
  print('Bildirim 3 gönderildi');

  print('---');

  // Döngü ile:
  for (int i = 1; i <= 3; i++) {
    print('Bildirim $i gönderildi');
  }
}
