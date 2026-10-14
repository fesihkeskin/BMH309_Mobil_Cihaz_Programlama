// Dosya: 09_03_basamaklar.dart
void main() {
  int kod = 482915;
  int sayi = kod;
  int basamakSayisi = 0;
  int basamakToplami = 0;

  while (sayi > 0) {
    int sonBasamak = sayi % 10;
    basamakToplami += sonBasamak;
    basamakSayisi++;
    sayi ~/= 10;
  }

  print('Kod: $kod');
  print('Basamak sayısı: $basamakSayisi');
  print('Basamak toplamı: $basamakToplami');
}
