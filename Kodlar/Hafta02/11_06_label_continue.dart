// Dosya: 11_06_label_continue.dart
void main() {
  gunler:
  for (int gun = 1; gun <= 3; gun++) {
    for (int saat = 9; saat <= 12; saat++) {
      if (gun == 2 && saat == 10) {
        print('Gün $gun: Hatırlatmalar bugün için kapatıldı.');
        continue gunler; // Bir sonraki güne geç
      }
      print('Gün $gun, $saat:00 → hatırlatma');
    }
  }
}
