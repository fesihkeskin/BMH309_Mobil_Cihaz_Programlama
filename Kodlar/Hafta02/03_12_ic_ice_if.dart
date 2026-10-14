// Dosya: 03_12_ic_ice_if.dart
void main() {
  bool girisYapti = true;
  bool premiumUye = false;
  double sepetTutari = 120.0;

  if (girisYapti) {
    print('Hoş geldiniz!');
    if (premiumUye) {
      print('Premium üyelere kargo ücretsiz.');
    } else {
      if (sepetTutari >= 150) {
        print('150 TL üzeri siparişte kargo ücretsiz.');
      } else {
        double eksik = 150 - sepetTutari;
        print('Ücretsiz kargo için ${eksik.toStringAsFixed(2)} TL daha ekleyin.');
      }
    }
  } else {
    print('Sipariş vermek için giriş yapmalısınız.');
  }
}
