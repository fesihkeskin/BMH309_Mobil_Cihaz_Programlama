// Dosya: 06_09_karsilastirma.dart
void main() {
  int x = 10;
  double y = 10.0;
  String s1 = 'flutter';
  String s2 = 'Flutter';

  print(x == y);
  print(x != 3);
  print(x >= 10);
  print(s1 == s2);
  print(s1 == s2.toLowerCase());
  print('elma'.compareTo('armut') > 0);
}
