// Dosya: 04_01_mixin.dart
mixin Begenilebilir {
  int _begeniSayisi = 0;

  int get begeniSayisi => _begeniSayisi;

  void begen() {
    _begeniSayisi++;
  }

  void begeniyiGeriAl() {
    if (_begeniSayisi > 0) {
      _begeniSayisi--;
    }
  }
}

mixin Yorumlanabilir {
  final List<String> _yorumlar = [];

  List<String> get yorumlar => List.of(_yorumlar);

  void yorumYap(String kullanici, String metin) {
    _yorumlar.add('$kullanici: $metin');
  }
}

class Gonderi with Begenilebilir, Yorumlanabilir {
  final String yazar;
  final String metin;

  Gonderi(this.yazar, this.metin);
}

class Urun with Begenilebilir {
  final String ad;

  Urun(this.ad);
}

void main() {
  Gonderi g = Gonderi('ayse', 'Yeni projem yayında!');
  g.begen();
  g.begen();
  g.yorumYap('mert', 'Tebrikler!');
  g.yorumYap('zeynep', 'Harika görünüyor.');

  print('${g.yazar}: ${g.metin}');
  print('Beğeni: ${g.begeniSayisi}, yorum: ${g.yorumlar.length}');
  for (String y in g.yorumlar) {
    print('  - $y');
  }

  Urun u = Urun('Kulaklık');
  u.begen();
  u.begen();
  u.begen();
  u.begeniyiGeriAl();
  print('${u.ad} beğeni: ${u.begeniSayisi}');
}
