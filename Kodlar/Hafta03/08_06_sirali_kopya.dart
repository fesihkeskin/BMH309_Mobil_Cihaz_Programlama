// Dosya: 08_06_sirali_kopya.dart
void main() {
  List<int> fiyatlar = [120, 45, 300];
  List<int> sirali = List.of(fiyatlar);
  sirali.sort();

  print('Orijinal: $fiyatlar');
  print('Sıralı  : $sirali');
}
