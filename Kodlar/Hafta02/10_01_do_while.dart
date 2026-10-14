// Dosya: 10_01_do_while.dart
void main() {
  int ekran = 1;
  int toplamEkran = 3;

  do {
    print('Tanıtım ekranı $ekran/$toplamEkran');
    ekran++;
  } while (ekran <= toplamEkran);

  print('Ana sayfaya geçiliyor...');
}
