// Dosya: 08_01_ekleme.dart
void main() {
  List<String> sepet = ['Süt'];

  sepet.add('Ekmek');
  print(sepet);

  sepet.addAll(['Yumurta', 'Peynir']);
  print(sepet);

  sepet.insert(0, 'Su');
  print(sepet);

  sepet.insertAll(2, ['Çay', 'Şeker']);
  print(sepet);
}
