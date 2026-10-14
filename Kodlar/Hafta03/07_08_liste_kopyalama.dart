// Dosya: 07_08_liste_kopyalama.dart
void main() {
  List<String> sepet = ['Süt', 'Ekmek'];
  List<String> yedek1 = List.of(sepet);
  List<String> yedek2 = [...sepet];

  yedek1.add('Çikolata');
  yedek2.remove('Süt');

  print('sepet : $sepet');
  print('yedek1: $yedek1');
  print('yedek2: $yedek2');
}
