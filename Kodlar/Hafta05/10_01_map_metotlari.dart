// Dosya: 10_01_map_metotlari.dart
void main() {
  Map<String, int> stok = {'Süt': 20, 'Ekmek': 0, 'Peynir': 4, 'Zeytin': 0, 'Yumurta': 12};

  stok.forEach((urun, adet) => print('$urun: $adet'));

  stok.update('Süt', (adet) => adet - 2);
  stok.update('Çay', (adet) => adet + 10, ifAbsent: () => 10);
  print(stok);

  stok.removeWhere((urun, adet) => adet == 0);
  print(stok);

  Map<String, String> etiketler = stok.map((urun, adet) => MapEntry(urun, adet < 5 ? 'Son $adet!' : 'Stokta'));
  print(etiketler);

  List<String> azalanlar = stok.entries.where((e) => e.value < 15).map((e) => e.key).toList();
  print('15 adetin altındakiler: $azalanlar');
}
