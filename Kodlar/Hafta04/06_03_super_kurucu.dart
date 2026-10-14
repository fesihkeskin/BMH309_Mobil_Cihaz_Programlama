// Dosya: 06_03_super_kurucu.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat) {
    print('1) Urun kurucusu çalıştı: $ad');
  }
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(String ad, double fiyat, this.garantiAy) : super(ad.trim(), fiyat) {
    print('2) Elektronik kurucusu çalıştı: $garantiAy ay garanti');
  }
}

void main() {
  Elektronik e = Elektronik('  Tablet ', 8999, 24);
  print('Oluşturulan: ${e.ad}');
}
