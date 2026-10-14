// Dosya: 06_08_artirma_azaltma.dart
void main() {
  int sayac = 5;
  sayac++;
  print(sayac);
  sayac--;
  print(sayac);

  int a = 5;
  int b = a++; // Önce b'ye 5 atanır, sonra a 6 olur
  print('a = $a, b = $b');

  int c = 5;
  int d = ++c; // Önce c 6 olur, sonra d'ye 6 atanır
  print('c = $c, d = $d');
}
