// Dosya: 12_02_fiyat_hesaplama.dart
void main() {
  const double kdvOrani = 0.20;
  const double indirimOrani = 0.10;

  String urunAdi = 'Kablosuz Kulaklık';
  double birimFiyat = 749.90;
  int adet = 2;

  double araToplam = birimFiyat * adet;
  double indirim = araToplam * indirimOrani;
  double indirimliTutar = araToplam - indirim;
  double kdv = indirimliTutar * kdvOrani;
  double genelToplam = indirimliTutar + kdv;

  print('Ürün          : $urunAdi');
  print('Birim fiyat   : ${birimFiyat.toStringAsFixed(2)} TL');
  print('Adet          : $adet');
  print('Ara toplam    : ${araToplam.toStringAsFixed(2)} TL');
  print('İndirim (%${(indirimOrani * 100).round()}) : -${indirim.toStringAsFixed(2)} TL');
  print('KDV (%${(kdvOrani * 100).round()})     : ${kdv.toStringAsFixed(2)} TL');
  print('GENEL TOPLAM  : ${genelToplam.toStringAsFixed(2)} TL');
}
