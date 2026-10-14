// Dosya: 03_04_tuzak_this.dart
// ❌ MANTIK HATASI: Parametre kendisine atanıyor; alan değişmiyor.
class Kullanici {
  String ad = 'Misafir';

  void adDegistir(String ad) {
    ad = ad;
  }
}

void main() {
  Kullanici k = Kullanici();
  k.adDegistir('Mert');
  print(k.ad);
}
