// Dosya: 08_04_siralama.dart
void main() {
  List<int> fiyatlar = [120, 45, 300, 80, 15];
  fiyatlar.sort();
  print(fiyatlar);

  List<int> azalan = fiyatlar.reversed.toList();
  print(azalan);
  print(fiyatlar.reversed);

  List<String> urunler = ['Muz', 'elma', 'Armut', 'Çilek', 'Zeytin'];
  urunler.sort();
  print(urunler);
}
