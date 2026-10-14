// Dosya: 03_10_ayri_if_zincir.dart
void main() {
  int puan = 95;

  print('--- Ayrı if blokları ---');
  if (puan >= 90) print('Harika!');
  if (puan >= 70) print('İyi!');
  if (puan >= 50) print('Geçti.');

  print('--- else if zinciri ---');
  if (puan >= 90) {
    print('Harika!');
  } else if (puan >= 70) {
    print('İyi!');
  } else if (puan >= 50) {
    print('Geçti.');
  }
}
