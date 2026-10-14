// Dosya: 06_01_neden_liste.dart
void main() {
  // Liste olmadan: her not için ayrı değişken
  int not1 = 72;
  int not2 = 85;
  int not3 = 90;
  double ortalama1 = (not1 + not2 + not3) / 3;
  print('Ortalama: ${ortalama1.toStringAsFixed(2)}');

  // Liste ile: tüm notlar tek bir isim altında
  List<int> notlar = [72, 85, 90];
  int toplam = 0;
  for (int not in notlar) {
    toplam += not;
  }
  print('Ortalama: ${(toplam / notlar.length).toStringAsFixed(2)}');
}
