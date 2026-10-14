// Dosya: 10_04_map_dolasma.dart
void main() {
  Map<String, int> stok = {'Süt': 12, 'Ekmek': 0, 'Yumurta': 5};

  print(stok.keys);
  print(stok.values);

  for (var urun in stok.keys) {
    print('$urun → ${stok[urun]} adet');
  }

  for (var kayit in stok.entries) {
    String durum = kayit.value == 0 ? 'TÜKENDİ' : '${kayit.value} adet';
    print('${kayit.key}: $durum');
  }
}
