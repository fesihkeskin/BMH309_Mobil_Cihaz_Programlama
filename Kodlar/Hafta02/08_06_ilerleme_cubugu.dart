// Dosya: 08_06_ilerleme_cubugu.dart
void main() {
  int toplamAdim = 10;

  for (int adim = 0; adim <= toplamAdim; adim += 2) {
    String dolu = '#' * adim;
    String bos = '-' * (toplamAdim - adim);
    int yuzde = adim * 100 ~/ toplamAdim;
    print('[$dolu$bos] %$yuzde');
  }
}
