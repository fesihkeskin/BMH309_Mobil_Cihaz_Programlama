// Dosya: 02_05_nesne_referans.dart
class Sayac {
  int deger = 0;
}

void arttir(Sayac s) {
  s.deger++;
}

void main() {
  Sayac a = Sayac();
  Sayac b = a;
  b.deger = 5;
  print('a: ${a.deger}, b: ${b.deger}');

  arttir(a);
  print('a: ${a.deger}');

  Sayac c = Sayac();
  c.deger = 6;
  print(a == c);
  print(a == b);
}
