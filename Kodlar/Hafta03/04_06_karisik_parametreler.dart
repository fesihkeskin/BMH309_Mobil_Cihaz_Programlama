// Dosya: 04_06_karisik_parametreler.dart
String urunEtiketi(String ad, double fiyat, {int indirimYuzdesi = 0, bool yeniMi = false}) {
  double sonFiyat = fiyat * (100 - indirimYuzdesi) / 100;
  String etiket = '$ad: ${sonFiyat.toStringAsFixed(2)} TL';

  if (indirimYuzdesi > 0) {
    etiket += ' (%$indirimYuzdesi indirim)';
  }
  if (yeniMi) {
    etiket = '[YENİ] $etiket';
  }
  return etiket;
}

void main() {
  print(urunEtiketi('Kulaklık', 750));
  print(urunEtiketi('Kulaklık', 750, indirimYuzdesi: 20));
  print(urunEtiketi('Akıllı Saat', 2400, yeniMi: true, indirimYuzdesi: 10));
}
