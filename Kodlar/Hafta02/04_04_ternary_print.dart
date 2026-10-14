// Dosya: 04_04_ternary_print.dart
void main() {
  int a = 100;
  int b = 15;

  a > b ? print('A') : print('B'); // Çalışır ama önerilmez

  print(a > b ? 'A' : 'B');        // Önerilen yazım
}
