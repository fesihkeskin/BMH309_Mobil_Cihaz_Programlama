// Dosya: 06_06_liste_fonksiyon.dart
int enBuyuk(List<int> sayilar) {
  int enBuyukDeger = sayilar[0];
  for (int sayi in sayilar) {
    if (sayi > enBuyukDeger) {
      enBuyukDeger = sayi;
    }
  }
  return enBuyukDeger;
}

double ortalama(List<int> sayilar) {
  if (sayilar.isEmpty) {
    return 0;
  }
  int toplam = 0;
  for (int sayi in sayilar) {
    toplam += sayi;
  }
  return toplam / sayilar.length;
}

void main() {
  List<int> fiyatlar = [120, 45, 300, 80, 15];

  print('En yüksek fiyat: ${enBuyuk(fiyatlar)}');
  print('Ortalama fiyat : ${ortalama(fiyatlar).toStringAsFixed(2)}');
  print('Boş liste ort. : ${ortalama([])}');
}
