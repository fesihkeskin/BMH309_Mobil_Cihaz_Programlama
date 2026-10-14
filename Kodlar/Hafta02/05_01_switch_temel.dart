// Dosya: 05_01_switch_temel.dart
void main() {
  int gun = 3;

  switch (gun) {
    case 1:
      print('Pazartesi');
    case 2:
      print('Salı');
    case 3:
      print('Çarşamba');
    case 4:
      print('Perşembe');
    case 5:
      print('Cuma');
    case 6:
      print('Cumartesi');
    case 7:
      print('Pazar');
    default:
      print('Geçersiz gün numarası');
  }
}
