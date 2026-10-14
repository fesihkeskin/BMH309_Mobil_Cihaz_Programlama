// Dosya: 06_02_sabit_uzunluklu.dart
void main() {
  List<int> adimlar = List.filled(7, 0); // 7 elemanlı, hepsi 0

  print(adimlar);
  print('Uzunluk: ${adimlar.length}');

  adimlar[0] = 6500;
  adimlar[1] = 8200;
  adimlar[6] = 9000;

  print(adimlar);
  print('İlk gün: ${adimlar[0]}');
  print('Son gün: ${adimlar[adimlar.length - 1]}');
}
