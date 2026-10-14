// Dosya: 08_09_for_in_metin.dart
void main() {
  String sifre = 'Flutter2026';
  int rakamSayisi = 0;

  for (var karakter in sifre.split('')) {
    if ('0123456789'.contains(karakter)) {
      rakamSayisi++;
    }
  }

  print('"$sifre" içinde $rakamSayisi rakam var.');
}
