// Dosya: 02_10_fonksiyon_zinciri.dart
double kdvEkle(double fiyat) {
  return fiyat * 1.20;
}

String tlFormatla(double tutar) {
  return '${tutar.toStringAsFixed(2)} TL';
}

String etiketOlustur(String urun, double fiyat) {
  return '$urun: ${tlFormatla(kdvEkle(fiyat))} (KDV dahil)';
}

void main() {
  print(etiketOlustur('Kulaklık', 749.90));
  print(etiketOlustur('Şarj Kablosu', 129.90));
}
