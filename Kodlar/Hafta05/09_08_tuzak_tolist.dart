// Dosya: 09_08_tuzak_tolist.dart
// ❌ DERLEME HATASI
void main() {
  List<int> fiyatlar = [120, 45, 300];
  List<int> ucuzlar = fiyatlar.where((f) => f < 100);
  print(ucuzlar);
}
