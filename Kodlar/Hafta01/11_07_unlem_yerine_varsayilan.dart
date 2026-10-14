// Dosya: 11_07_unlem_yerine_varsayilan.dart
void main() {
  int? adet = int.tryParse('on');
  print((adet ?? 0) + 1);
}
