// Dosya: 07_07_tuzak_referans.dart
// ❌ MANTIK HATASI: İki değişken aynı listeyi gösteriyor.
void main() {
  List<String> sepet = ['Süt', 'Ekmek'];
  List<String> yedek = sepet; // Kopya DEĞİL!

  yedek.add('Çikolata');

  print('sepet: $sepet');
  print('yedek: $yedek');
}
