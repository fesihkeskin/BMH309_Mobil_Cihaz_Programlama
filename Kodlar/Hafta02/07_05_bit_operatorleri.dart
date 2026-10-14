// Dosya: 07_05_bit_operatorleri.dart
void main() {
  int a = 6; // ikilik: 110
  int b = 3; // ikilik: 011

  print(a & b);
  print(a | b);
  print(a ^ b);
  print(a << 1);
  print(a >> 1);
  print(a.toRadixString(2));
}
