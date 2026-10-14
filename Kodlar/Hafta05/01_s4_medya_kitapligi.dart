// Dosya: 01_s4_medya_kitapligi.dart
class Medya {
  final String baslik;
  final int sure;

  Medya(this.baslik, this.sure);

  String etiket() => baslik;
}

class Sarki extends Medya {
  final String sanatci;

  Sarki(super.baslik, super.sure, this.sanatci);

  @override
  String etiket() => '[Şarkı] $sanatci - $baslik';
}

class Podcast extends Medya {
  final int bolum;

  Podcast(super.baslik, super.sure, this.bolum);

  @override
  String etiket() => '[Podcast] $baslik #$bolum';
}

class Video extends Medya {
  final bool hd;

  Video(super.baslik, super.sure, {this.hd = false});

  @override
  String etiket() => hd ? '[Video] $baslik (HD)' : '[Video] $baslik';
}

String sureMetni(int saniye) => '${saniye ~/ 60}:${(saniye % 60).toString().padLeft(2, '0')}';

int toplamSure(List<Medya> liste) {
  int toplam = 0;
  for (Medya m in liste) {
    toplam += m.sure;
  }
  return toplam;
}

Map<String, int> turSayilari(List<Medya> liste) {
  Map<String, int> sayac = {};
  for (Medya m in liste) {
    String tur;
    if (m is Sarki) {
      tur = 'Şarkı';
    } else if (m is Podcast) {
      tur = 'Podcast';
    } else if (m is Video) {
      tur = 'Video';
    } else {
      tur = 'Diğer';
    }
    sayac[tur] = (sayac[tur] ?? 0) + 1;
  }
  return sayac;
}

List<String> hdVideolar(List<Medya> liste) {
  List<String> sonuc = [];
  for (Medya m in liste) {
    if (m is Video && m.hd) {
      sonuc.add(m.baslik);
    }
  }
  return sonuc;
}

void main() {
  List<Medya> kitaplik = [
    Sarki('Mavi Gökyüzü', 252, 'Deniz Ekin'),
    Podcast('Kod Sohbetleri', 2285, 42),
    Video("Flutter'a Giriş", 750, hd: true),
    Sarki('Yağmur Sonrası', 347, 'Ege Tuna'),
    Video('Dart İpuçları', 428),
  ];

  for (int i = 0; i < kitaplik.length; i++) {
    print('${i + 1}. ${kitaplik[i].etiket()} (${sureMetni(kitaplik[i].sure)})');
  }
  print('Tür sayıları : ${turSayilari(kitaplik)}');
  print('Toplam süre  : ${sureMetni(toplamSure(kitaplik))}');
  print('HD videolar  : ${hdVideolar(kitaplik)}');
}
