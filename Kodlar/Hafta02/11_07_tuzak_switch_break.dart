// Dosya: 11_07_tuzak_switch_break.dart
// ❌ MANTIK HATASI: "Çıkış" seçildiği halde döngü bitmez.
void main() {
  int adim = 0;

  while (true) {
    adim++;
    // Simülasyon: Kullanıcının menüde sırasıyla yaptığı seçimler
    String secim = adim == 1 ? '1' : adim == 2 ? '2' : '0';

    switch (secim) {
      case '1':
        print('Profil gösteriliyor');
      case '2':
        print('Ayarlar gösteriliyor');
      case '0':
        print('Çıkış seçildi');
        break; // DİKKAT: Bu break yalnızca switch'ten çıkar, döngüden DEĞİL!
    }

    if (adim >= 5) {
      print('(Güvenlik sınırı: döngü zorla durduruldu)');
      break;
    }
  }
}
