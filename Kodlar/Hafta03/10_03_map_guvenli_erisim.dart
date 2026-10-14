// Dosya: 10_03_map_guvenli_erisim.dart
void main() {
  Map<String, double> fiyatlar = {'Süt': 32.50};

  double sutFiyati = fiyatlar['Süt'] ?? 0.0;
  double cayFiyati = fiyatlar['Çay'] ?? 0.0;
  print('$sutFiyati / $cayFiyati');

  if (fiyatlar.containsKey('Çay')) {
    print('Çay katalogda var.');
  } else {
    print('Çay katalogda yok.');
  }
}
