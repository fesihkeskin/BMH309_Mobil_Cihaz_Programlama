// Dosya: 04_03_tuzak_mixin_kurucu.dart
// ❌ DERLEME HATASI
mixin Begenilebilir {
  int begeniSayisi = 0;

  Begenilebilir(this.begeniSayisi);
}

class Urun with Begenilebilir {}

void main() {
  print(Urun().begeniSayisi);
}
