// Dosya: 05_03_cuzdan_kullan.dart
import '05_02_cuzdan.dart';

void main() {
  Cuzdan c = Cuzdan();
  print(c.paraYatir(250));
  print(c.paraCek(1000));
  print(c.paraCek(99.90));
  print(c.paraYatir(-50));
  print(c.ozet());
}
