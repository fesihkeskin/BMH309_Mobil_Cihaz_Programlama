// Dosya: 09_04_tuzak_firstwhere.dart
// ❌ ÇALIŞMA ZAMANI HATASI
void main() {
  List<String> kategoriler = ['Elektronik', 'Gıda', 'Kırtasiye'];
  String k = kategoriler.firstWhere((x) => x == 'Oyuncak');
  print(k);
}
