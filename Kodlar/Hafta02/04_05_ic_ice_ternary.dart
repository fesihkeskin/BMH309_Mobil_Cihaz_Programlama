// Dosya: 04_05_ic_ice_ternary.dart
void main() {
  int pil = 15;

  String durum = pil <= 5 ? 'Kritik' : pil <= 20 ? 'Düşük' : 'Normal';
  print(durum);
}
