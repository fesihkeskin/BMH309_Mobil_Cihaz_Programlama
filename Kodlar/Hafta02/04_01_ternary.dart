// Dosya: 04_01_ternary.dart
void main() {
  bool karanlikMod = true;

  String tema = karanlikMod ? 'Koyu tema' : 'Açık tema';
  print(tema);

  // Aynı işin if / else ile yazılmış hali:
  String tema2;
  if (karanlikMod) {
    tema2 = 'Koyu tema';
  } else {
    tema2 = 'Açık tema';
  }
  print(tema2);
}
