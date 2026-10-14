// Dosya: 10_01_map.dart
void main() {
  Map<String, double> fiyatlar = {
    'Süt': 32.50,
    'Ekmek': 15.00,
    'Yumurta': 89.90,
  };

  print(fiyatlar);
  print(fiyatlar['Süt']);
  print(fiyatlar['Çay']);
  print(fiyatlar.length);

  fiyatlar['Çay'] = 120.0;  // Yeni anahtar: ekleme
  fiyatlar['Süt'] = 34.90;  // Var olan anahtar: güncelleme
  print(fiyatlar);

  double? silinen = fiyatlar.remove('Ekmek');
  print('Silinen fiyat: $silinen');
  print(fiyatlar);
}
