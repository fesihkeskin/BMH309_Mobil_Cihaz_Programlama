// Dosya: 05_01_kapsulleme_sorunu.dart
// ❌ MANTIK HATASI: Bakiye dışarıdan serbestçe değiştirilebiliyor.
class Cuzdan {
  double bakiye = 0;

  void paraYatir(double tutar) {
    if (tutar > 0) {
      bakiye += tutar;
    }
  }
}

void main() {
  Cuzdan c = Cuzdan();
  c.paraYatir(100);
  c.bakiye = -5000; // Kimse engellemiyor!
  print('Bakiye: ${c.bakiye}');
}
