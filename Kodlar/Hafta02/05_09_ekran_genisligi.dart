// Dosya: 05_09_ekran_genisligi.dart
void main() {
  double genislik = 700;

  String duzen = switch (genislik) {
    <= 0 => 'Geçersiz genişlik',
    > 0 && < 600 => 'Kompakt: telefon (tek sütun)',
    >= 600 && < 840 => 'Orta: tablet veya katlanabilir (iki sütun)',
    _ => 'Geniş: yatay tablet veya masaüstü (yan menü)',
  };

  print('$genislik dp → $duzen');
}
