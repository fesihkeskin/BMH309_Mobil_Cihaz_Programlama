// Dosya: 11_01_break.dart
void main() {
  for (int siparisNo = 1; siparisNo <= 1000; siparisNo++) {
    if (siparisNo % 7 == 0 && siparisNo % 11 == 0) {
      print('İkisini birden kazanan ilk sipariş: $siparisNo');
      break;
    }
  }
  print('Arama bitti.');
}
