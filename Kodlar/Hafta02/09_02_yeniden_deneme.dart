// Dosya: 09_02_yeniden_deneme.dart
void main() {
  int deneme = 0;
  int maksimumDeneme = 5;
  bool baglandi = false;

  while (!baglandi && deneme < maksimumDeneme) {
    deneme++;
    print('Sunucuya bağlanılıyor... (deneme $deneme/$maksimumDeneme)');

    // Simülasyon: 3. denemede bağlantı kuruluyor
    if (deneme == 3) {
      baglandi = true;
    }
  }

  if (baglandi) {
    print('Bağlantı kuruldu.');
  } else {
    print('Bağlantı kurulamadı. İnternet bağlantınızı kontrol edin.');
  }
}
