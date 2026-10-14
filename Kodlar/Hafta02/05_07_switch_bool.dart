// Dosya: 05_07_switch_bool.dart
void main() {
  bool sarjda = true;
  int pil = 64;

  String gosterge = switch (sarjda) {
    true => 'Şarj oluyor (%$pil)',
    false => 'Pil: %$pil',
  };

  print(gosterge);
}
