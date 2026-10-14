// Dosya: 05_10_when.dart
void main() {
  int sepetTutari = 120;
  bool premium = true;

  String kargo = switch (sepetTutari) {
    _ when premium => 'Ücretsiz (Premium üye)',
    >= 150 => 'Ücretsiz',
    > 0 => '39,90 TL',
    _ => 'Sepet boş',
  };

  print('Kargo: $kargo');
}
