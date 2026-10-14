// Dosya: 09_01_cep_market_oop.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

class Urun {
  final String ad;
  double _fiyat;
  int _stok;

  Urun(this.ad, this._fiyat, this._stok);

  factory Urun.fromMap(Map<String, dynamic> veri) {
    String ad = veri['ad'] as String;
    double fiyat = (veri['fiyat'] as num).toDouble();
    int stok = veri['stok'] as int;

    return switch (veri['tur']) {
      'elektronik' => Elektronik(ad, fiyat, stok, veri['garanti'] as int),
      'gida' => Gida(ad, fiyat, stok, soguk: veri['soguk'] == true),
      _ => Urun(ad, fiyat, stok),
    };
  }

  double get fiyat => _fiyat;
  int get stok => _stok;
  double get kdvOrani => 0.20;

  double kargoUcreti() => 29.90;

  bool stoktanDus(int adet) {
    if (adet <= 0 || adet > _stok) {
      return false;
    }
    _stok -= adet;
    return true;
  }

  @override
  String toString() => ad;
}

class Elektronik extends Urun {
  final int garantiAy;

  Elektronik(super.ad, super.fiyat, super.stok, this.garantiAy);

  @override
  double kargoUcreti() => fiyat >= 1000 ? 0.0 : 49.90;

  @override
  String toString() => '$ad ($garantiAy ay garanti)';
}

class Gida extends Urun {
  final bool soguk;

  Gida(super.ad, super.fiyat, super.stok, {this.soguk = false});

  @override
  double get kdvOrani => 0.01;

  @override
  double kargoUcreti() => soguk ? 59.90 : 19.90;

  @override
  String toString() => soguk ? '$ad (soğuk zincir)' : ad;
}

class SepetKalemi {
  final Urun urun;
  final int adet;

  SepetKalemi(this.urun, this.adet);

  double get araToplam => urun.fiyat * adet;
  double get kdv => araToplam * urun.kdvOrani;
}

class Sepet {
  static const double ucretsizKargoLimiti = 1500;

  final List<SepetKalemi> _kalemler = [];

  bool get bosMu => _kalemler.isEmpty;

  void ekle(Urun urun, {int adet = 1}) {
    if (!urun.stoktanDus(adet)) {
      print('${urun.ad}: Yetersiz stok (${urun.stok} adet var).');
      return;
    }
    _kalemler.add(SepetKalemi(urun, adet));
    print('${urun.ad} x$adet sepete eklendi.');
  }

  double get araToplam {
    double toplam = 0;
    for (SepetKalemi k in _kalemler) {
      toplam += k.araToplam;
    }
    return toplam;
  }

  double get kdvToplami {
    double toplam = 0;
    for (SepetKalemi k in _kalemler) {
      toplam += k.kdv;
    }
    return toplam;
  }

  double get kargo {
    if (araToplam >= ucretsizKargoLimiti) {
      return 0.0;
    }
    double enYuksek = 0;
    for (SepetKalemi k in _kalemler) {
      double ucret = k.urun.kargoUcreti();
      if (ucret > enYuksek) {
        enYuksek = ucret;
      }
    }
    return enYuksek;
  }

  void fisYazdir() {
    if (bosMu) {
      print('Sepetiniz boş.');
      return;
    }
    print('=============== FİŞ ===============');
    for (SepetKalemi k in _kalemler) {
      print('${k.urun.toString().padRight(24)} x${k.adet} ${k.araToplam.toStringAsFixed(2).padLeft(9)}');
    }
    print('-' * 35);
    print('Ara toplam : ${tl(araToplam)}');
    print('KDV        : ${tl(kdvToplami)}');
    print('Kargo      : ${kargo == 0 ? 'Ücretsiz' : tl(kargo)}');
    print('TOPLAM     : ${tl(araToplam + kdvToplami + kargo)}');
  }
}

void main() {
  List<Map<String, dynamic>> katalogVerisi = [
    {'tur': 'elektronik', 'ad': 'Kulaklık', 'fiyat': 749.90, 'stok': 5, 'garanti': 24},
    {'tur': 'gida', 'ad': 'Süt', 'fiyat': 32.50, 'stok': 20},
    {'tur': 'gida', 'ad': 'Dondurma', 'fiyat': 85, 'stok': 2, 'soguk': true},
    {'tur': 'diger', 'ad': 'Defter', 'fiyat': 45, 'stok': 30},
  ];

  List<Urun> katalog = [];
  for (var veri in katalogVerisi) {
    katalog.add(Urun.fromMap(veri));
  }

  print('Katalog:');
  for (Urun u in katalog) {
    print('- $u: ${tl(u.fiyat)} (${u.runtimeType})');
  }
  print('');

  Sepet sepet = Sepet();
  sepet.ekle(katalog[0]);
  sepet.ekle(katalog[1], adet: 2);
  sepet.ekle(katalog[2], adet: 5);
  sepet.ekle(katalog[2], adet: 2);
  sepet.ekle(katalog[3], adet: 2);
  print('');

  sepet.fisYazdir();
  print('Dondurma stoğu: ${katalog[2].stok}');
}
