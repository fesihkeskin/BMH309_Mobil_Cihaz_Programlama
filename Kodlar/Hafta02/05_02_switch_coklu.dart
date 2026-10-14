// Dosya: 05_02_switch_coklu.dart
void main() {
  int gun = 6;

  switch (gun) {
    case 1 || 2 || 3 || 4 || 5:
      print('Hafta içi: Bildirimler mesai saatlerinde gönderilir.');
    case 6 || 7:
      print('Hafta sonu: Bildirimler sessize alındı.');
    default:
      print('Geçersiz gün numarası');
  }
}
