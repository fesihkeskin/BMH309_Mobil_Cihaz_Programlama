// Dosya: 03_13_ic_ice_sadelestirme.dart
void main() {
  bool girisYapti = true;
  bool premiumUye = false;
  double sepetTutari = 120.0;

  if (!girisYapti) {
    print('Sipariş vermek için giriş yapmalısınız.');
  } else if (premiumUye || sepetTutari >= 150) {
    print('Kargo ücretsiz.');
  } else {
    double eksik = 150 - sepetTutari;
    print('Ücretsiz kargo için ${eksik.toStringAsFixed(2)} TL daha ekleyin.');
  }
}
