// Dosya: 09_03_bos_set.dart
void main() {
  var a = {};          // DİKKAT: Bu bir Set değil, Map!
  var b = <String>{};  // Boş Set
  Set<int> c = {};     // Tip yazıldığı için Set

  a['anahtar'] = 1;
  b.add('yeni');
  c.add(7);

  print(a);
  print(b);
  print(c);
}
