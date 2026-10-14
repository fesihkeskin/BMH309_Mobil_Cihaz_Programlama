// Dosya: 11_09_bayrak_menu.dart
void main() {
  int adim = 0;
  bool devam = true;

  while (devam) {
    adim++;
    String secim = adim == 1 ? '1' : adim == 2 ? '2' : '0';

    switch (secim) {
      case '1':
        print('Profil gösteriliyor');
      case '2':
        print('Ayarlar gösteriliyor');
      case '0':
        print('Çıkış seçildi. Güle güle!');
        devam = false; // Döngü bir sonraki kontrolde biter
      default:
        print('Geçersiz seçim');
    }
  }

  print('Program sonlandı.');
}
