// Dosya: 12_02_istatistik_fonksiyonlar.dart
int toplamHesapla(List<int> sayilar) {
  int toplam = 0;
  for (int sayi in sayilar) {
    toplam += sayi;
  }
  return toplam;
}

double ortalamaHesapla(List<int> sayilar) =>
    sayilar.isEmpty ? 0.0 : toplamHesapla(sayilar) / sayilar.length;

int enYuksekBul(List<int> sayilar) {
  int enYuksek = sayilar[0];
  for (int sayi in sayilar) {
    if (sayi > enYuksek) enYuksek = sayi;
  }
  return enYuksek;
}

int enDusukBul(List<int> sayilar) {
  int enDusuk = sayilar[0];
  for (int sayi in sayilar) {
    if (sayi < enDusuk) enDusuk = sayi;
  }
  return enDusuk;
}

int gecenSayisi(List<int> notlar, {int gecmeNotu = 50}) {
  int sayac = 0;
  for (int not in notlar) {
    if (not >= gecmeNotu) sayac++;
  }
  return sayac;
}

void main() {
  List<int> notlar = [72, 85, 90, 45, 60, 85, 100, 38, 77];
  int gecen = gecenSayisi(notlar);

  print('Notlar       : $notlar');
  print('Öğrenci      : ${notlar.length}');
  print('Ortalama     : ${ortalamaHesapla(notlar).toStringAsFixed(2)}');
  print('En yüksek    : ${enYuksekBul(notlar)}');
  print('En düşük     : ${enDusukBul(notlar)}');
  print('Geçen (>=50) : $gecen');
  print('Kalan        : ${notlar.length - gecen}');
}
