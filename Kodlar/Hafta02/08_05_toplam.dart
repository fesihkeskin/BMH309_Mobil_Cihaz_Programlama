// Dosya: 08_05_toplam.dart
void main() {
  int toplamAdim = 0;

  for (int gun = 1; gun <= 7; gun++) {
    int gunlukAdim = 5000 + gun * 500; // Örnek veri
    toplamAdim += gunlukAdim;
    print('Gün $gun: $gunlukAdim adım');
  }

  print('Haftalık toplam: $toplamAdim adım');
  print('Günlük ortalama: ${toplamAdim ~/ 7} adım');
}
