// Dosya: 04_07_factory_onbellek.dart
class Renk {
  static final Map<String, Renk> _onbellek = {};

  final String ad;
  final String hex;

  Renk._(this.ad, this.hex);

  factory Renk.adiyla(String ad) {
    Renk? kayitli = _onbellek[ad];
    if (kayitli != null) {
      return kayitli;
    }

    String hex = switch (ad) {
      'kırmızı' => '#E53935',
      'yeşil' => '#43A047',
      'mavi' => '#1E88E5',
      _ => '#000000',
    };
    Renk yeni = Renk._(ad, hex);
    _onbellek[ad] = yeni;
    print('Yeni renk oluşturuldu: $ad');
    return yeni;
  }
}

void main() {
  Renk r1 = Renk.adiyla('mavi');
  Renk r2 = Renk.adiyla('mavi');
  Renk r3 = Renk.adiyla('yeşil');

  print('${r1.hex} ${r3.hex}');
  print('r1 ve r2 aynı mı? ${identical(r1, r2)}');
}
