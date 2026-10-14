// Dosya: 09_01_set.dart
void main() {
  Set<String> favoriler = {'Süt', 'Peynir'};

  print(favoriler.add('Zeytin'));
  print(favoriler.add('Süt'));
  print(favoriler);
  print(favoriler.length);
  print(favoriler.contains('Peynir'));

  favoriler.remove('Peynir');
  print(favoriler);

  for (var urun in favoriler) {
    print('- $urun');
  }
}
