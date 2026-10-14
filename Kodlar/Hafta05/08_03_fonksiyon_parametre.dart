// Dosya: 08_03_fonksiyon_parametre.dart
void dugmeOlustur(String etiket, void Function() tiklaninca) {
  print('[ $etiket ] düğmesi çizildi.');
  print('Kullanıcı "$etiket" düğmesine dokundu...');
  tiklaninca();
}

double fiyatHesapla(double fiyat, double Function(double) kampanya) {
  return kampanya(fiyat);
}

void main() {
  int sepetAdedi = 0;

  dugmeOlustur('Sepete ekle', () {
    sepetAdedi++;
    print('Sepette $sepetAdedi ürün var.');
  });

  dugmeOlustur('Favorilere ekle', () => print('Favorilere eklendi.'));

  print(fiyatHesapla(200, (f) => f * 0.8).toStringAsFixed(2));
  print(fiyatHesapla(200, (f) => f > 150 ? f - 50 : f).toStringAsFixed(2));
}
