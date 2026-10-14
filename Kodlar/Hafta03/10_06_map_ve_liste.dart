// Dosya: 10_06_map_ve_liste.dart
void main() {
  Map<String, List<String>> menu = {
    'Sıcak İçecekler': ['Çay', 'Latte'],
    'Soğuk İçecekler': ['Limonata'],
  };

  menu['Soğuk İçecekler']?.add('Ice Latte');
  menu['Tatlılar'] = ['Cheesecake', 'Brownie'];

  for (var kategori in menu.entries) {
    print('${kategori.key} (${kategori.value.length})');
    for (var urun in kategori.value) {
      print('  - $urun');
    }
  }
}
