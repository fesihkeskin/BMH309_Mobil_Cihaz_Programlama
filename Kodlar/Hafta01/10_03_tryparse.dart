// Dosya: 10_03_tryparse.dart
void main() {
  int? adet1 = int.tryParse('25');
  int? adet2 = int.tryParse('yirmi beş');
  double? fiyat1 = double.tryParse('49.90');
  double? fiyat2 = double.tryParse('49,90');

  print(adet1);
  print(adet2);
  print(fiyat1);
  print(fiyat2);
}
