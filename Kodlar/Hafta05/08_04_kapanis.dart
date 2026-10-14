// Dosya: 08_04_kapanis.dart
double Function(double) indirimOlustur(int yuzde) {
  return (double fiyat) => fiyat * (100 - yuzde) / 100;
}

int Function() sayacOlustur() {
  int sayi = 0;
  return () {
    sayi++;
    return sayi;
  };
}

void main() {
  var yuzde10 = indirimOlustur(10);
  var yuzde25 = indirimOlustur(25);
  print(yuzde10(400).toStringAsFixed(2));
  print(yuzde25(400).toStringAsFixed(2));

  var bildirimSayaci = sayacOlustur();
  var mesajSayaci = sayacOlustur();
  bildirimSayaci();
  bildirimSayaci();
  print('Bildirim: ${bildirimSayaci()}');
  print('Mesaj: ${mesajSayaci()}');
}
