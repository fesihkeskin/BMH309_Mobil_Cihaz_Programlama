// Dosya: 04_02_extends_with.dart
mixin Loglayici {
  final List<String> _kayitlar = [];

  void log(String mesaj) {
    _kayitlar.add(mesaj);
  }

  void kayitlariYazdir() {
    for (int i = 0; i < _kayitlar.length; i++) {
      print('${i + 1}) ${_kayitlar[i]}');
    }
  }
}

abstract class Medya {
  final String baslik;

  Medya(this.baslik);

  void oynat();
}

class Video extends Medya with Loglayici {
  Video(super.baslik);

  @override
  void oynat() {
    log('$baslik oynatıldı');
  }

  void durdur() {
    log('$baslik durduruldu');
  }
}

void main() {
  Video v = Video("Flutter'a Giriş");
  v.oynat();
  v.durdur();
  v.oynat();
  v.kayitlariYazdir();
}
