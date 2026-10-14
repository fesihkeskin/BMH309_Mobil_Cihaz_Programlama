// Dosya: 07_09_fonksiyon_ve_liste.dart
void sepeteEkle(List<String> sepet, String urun) {
  sepet.add(urun);
}

void ikiyeKatla(int sayi) {
  sayi = sayi * 2;
}

void main() {
  List<String> sepet = ['Süt'];
  sepeteEkle(sepet, 'Ekmek');
  print(sepet);

  int puan = 10;
  ikiyeKatla(puan);
  print(puan);
}
