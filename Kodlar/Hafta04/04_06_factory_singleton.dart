// Dosya: 04_06_factory_singleton.dart
class Ayarlar {
  static final Ayarlar _tekOrnek = Ayarlar._ic();

  String tema = 'Açık';
  String dil = 'Türkçe';

  Ayarlar._ic() {
    print('Ayarlar yüklendi.');
  }

  factory Ayarlar() {
    return _tekOrnek;
  }
}

void main() {
  Ayarlar a1 = Ayarlar();
  Ayarlar a2 = Ayarlar();

  a1.tema = 'Koyu';
  print('a2.tema: ${a2.tema}');
  print('Aynı nesne mi? ${identical(a1, a2)}');
}
