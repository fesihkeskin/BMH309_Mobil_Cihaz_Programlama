// Dosya: 11_08_label_menu.dart
void main() {
  int adim = 0;

  menu:
  while (true) {
    adim++;
    String secim = adim == 1 ? '1' : adim == 2 ? '2' : '0';

    switch (secim) {
      case '1':
        print('Profil gösteriliyor');
      case '2':
        print('Ayarlar gösteriliyor');
      case '0':
        print('Çıkış seçildi. Güle güle!');
        break menu; // Etiketli break: while döngüsünden çıkar
      default:
        print('Geçersiz seçim');
    }
  }

  print('Program sonlandı.');
}
