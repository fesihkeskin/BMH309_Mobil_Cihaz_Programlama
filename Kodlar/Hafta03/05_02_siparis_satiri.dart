// Dosya: 05_02_siparis_satiri.dart
String siparisSatiri(String urun, {int adet = 1, bool hediyePaketi = false}) {
  String satir = '$adet x $urun';
  return hediyePaketi ? '$satir (hediye paketi)' : satir;
}

void main() {
  print(siparisSatiri('Kalem'));
  print(siparisSatiri('Kitap', adet: 2, hediyePaketi: true));
  print(siparisSatiri('Defter', adet: 5));
}
