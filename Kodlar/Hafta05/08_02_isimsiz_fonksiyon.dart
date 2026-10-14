// Dosya: 08_02_isimsiz_fonksiyon.dart
void main() {
  // Uzun yazım
  var karesi = (int x) {
    return x * x;
  };

  // Kısa yazım
  var kupu = (int x) => x * x * x;

  print(karesi(4));
  print(kupu(3));

  var selamla = (String ad, {String selam = 'Merhaba'}) => '$selam $ad!';
  print(selamla('Ayşe'));
  print(selamla('Mert', selam: 'Günaydın'));
}
