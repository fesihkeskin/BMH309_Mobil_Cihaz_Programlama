// Dosya: 02_09_coklu_return.dart
String pilDurumu(int seviye) {
  if (seviye < 0 || seviye > 100) {
    return 'Geçersiz değer';
  }
  if (seviye <= 5) {
    return 'Kritik';
  }
  if (seviye <= 20) {
    return 'Düşük';
  }
  return 'Normal';
}

void siparisVer(String urun, int adet) {
  if (adet <= 0) {
    print('$urun: Adet en az 1 olmalı.');
    return; // void fonksiyondan erken çıkış
  }
  print('$urun: $adet adet sipariş verildi.');
}

void main() {
  print(pilDurumu(3));
  print(pilDurumu(18));
  print(pilDurumu(75));
  print(pilDurumu(150));

  siparisVer('Süt', 2);
  siparisVer('Ekmek', 0);
}
