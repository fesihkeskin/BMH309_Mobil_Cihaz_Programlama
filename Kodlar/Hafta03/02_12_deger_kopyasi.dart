// Dosya: 02_12_deger_kopyasi.dart
void ikiyeKatla(int sayi) {
  sayi = sayi * 2;
  print('Fonksiyonun içinde: $sayi');
}

void main() {
  int puan = 10;
  ikiyeKatla(puan);
  print('main içinde: $puan');
}
