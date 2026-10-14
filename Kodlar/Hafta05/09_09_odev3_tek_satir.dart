// Dosya: 09_09_odev3_tek_satir.dart
class Medya {
  final String baslik;
  final int sure;

  Medya(this.baslik, this.sure);
}

class Sarki extends Medya {
  final String sanatci;

  Sarki(super.baslik, super.sure, this.sanatci);
}

class Podcast extends Medya {
  final int bolum;

  Podcast(super.baslik, super.sure, this.bolum);
}

class Video extends Medya {
  final bool hd;

  Video(super.baslik, super.sure, {this.hd = false});
}

int toplamSure(List<Medya> liste) => liste.fold(0, (toplam, m) => toplam + m.sure);

List<String> hdVideolar(List<Medya> liste) =>
    liste.whereType<Video>().where((v) => v.hd).map((v) => v.baslik).toList();

Map<String, int> turSayilari(List<Medya> liste) => {
      'Şarkı': liste.whereType<Sarki>().length,
      'Podcast': liste.whereType<Podcast>().length,
      'Video': liste.whereType<Video>().length,
    };

void main() {
  List<Medya> kitaplik = [
    Sarki('Mavi Gökyüzü', 252, 'Deniz Ekin'),
    Podcast('Kod Sohbetleri', 2285, 42),
    Video("Flutter'a Giriş", 750, hd: true),
    Sarki('Yağmur Sonrası', 347, 'Ege Tuna'),
    Video('Dart İpuçları', 428),
  ];

  print('Toplam süre (sn): ${toplamSure(kitaplik)}');
  print('Tür sayıları    : ${turSayilari(kitaplik)}');
  print('HD videolar     : ${hdVideolar(kitaplik)}');
}
