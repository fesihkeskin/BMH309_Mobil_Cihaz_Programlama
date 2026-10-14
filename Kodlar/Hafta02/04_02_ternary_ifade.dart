// Dosya: 04_02_ternary_ifade.dart
void main() {
  int okunmamis = 0;
  int sepetAdedi = 3;

  print(okunmamis > 0 ? '$okunmamis yeni mesaj' : 'Yeni mesaj yok');

  print('Sepetinizde $sepetAdedi ürün var${sepetAdedi >= 3 ? ' (kargo ücretsiz!)' : ''}.');

  int adet = 1;
  print('$adet ${adet == 1 ? 'ürün' : 'ürünler'} seçildi');
}
