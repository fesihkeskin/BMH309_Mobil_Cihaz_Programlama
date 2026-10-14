// Dosya: 06_03_bolme_kalan.dart
void main() {
  // Müzik çalar: saniyeyi dakika ve saniyeye çevir
  int toplamSaniye = 227;
  int dakika = toplamSaniye ~/ 60;
  int saniye = toplamSaniye % 60;
  print('Şarkı süresi: $dakika dk $saniye sn');

  // Tek mi, çift mi?
  int sayi = 7;
  print('$sayi ${sayi % 2 == 0 ? 'çift' : 'tek'} sayıdır.');

  // Sayfalama: 23 ürün, sayfa başına 10 ürün → kaç sayfa?
  int toplamUrun = 23;
  int sayfaBasina = 10;
  int sayfaSayisi = (toplamUrun + sayfaBasina - 1) ~/ sayfaBasina;
  print('$toplamUrun ürün, sayfa başına $sayfaBasina → $sayfaSayisi sayfa');
}
