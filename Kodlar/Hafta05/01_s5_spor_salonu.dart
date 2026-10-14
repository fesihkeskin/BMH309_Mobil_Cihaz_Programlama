// Dosya: 01_s5_spor_salonu.dart
class Uyelik {
  final String adSoyad;
  int _kalanGun;

  Uyelik(this.adSoyad, this._kalanGun);

  factory Uyelik.fromMap(Map<String, dynamic> veri) {
    String adSoyad = veri['adSoyad'] as String;
    int kalanGun = veri['kalanGun'] as int;
    return switch (veri['tur']) {
      'aylik' => Aylik(adSoyad, kalanGun),
      'yillik' => Yillik(adSoyad, kalanGun),
      'ogrenci' => OgrenciUyelik(adSoyad, kalanGun),
      _ => Uyelik(adSoyad, kalanGun),
    };
  }

  int get kalanGun => _kalanGun;
  String get tur => 'Üyelik';
  double aylikUcret() => 0;
  bool get bitiyorMu => _kalanGun <= 7;

  void gunGecir(int gun) {
    _kalanGun -= gun;
    if (_kalanGun < 0) {
      _kalanGun = 0;
    }
  }

  @override
  String toString() => '${tur.padRight(8)} $adSoyad (kalan $kalanGun gün)';
}

class Aylik extends Uyelik {
  Aylik(super.adSoyad, super.kalanGun);

  @override
  String get tur => 'Aylık';

  @override
  double aylikUcret() => 900;
}

class Yillik extends Uyelik {
  Yillik(super.adSoyad, super.kalanGun);

  @override
  String get tur => 'Yıllık';

  @override
  double aylikUcret() => 8400 / 12;
}

class OgrenciUyelik extends Aylik {
  OgrenciUyelik(super.adSoyad, super.kalanGun);

  @override
  String get tur => 'Öğrenci';

  @override
  double aylikUcret() => super.aylikUcret() * 0.6;
}

double aylikGelir(List<Uyelik> liste) {
  double toplam = 0;
  for (Uyelik u in liste) {
    toplam += u.aylikUcret();
  }
  return toplam;
}

List<String> bitenler(List<Uyelik> liste) {
  List<String> sonuc = [];
  for (Uyelik u in liste) {
    if (u.bitiyorMu) {
      sonuc.add(u.adSoyad);
    }
  }
  return sonuc;
}

void main() {
  List<Map<String, dynamic>> veriler = [
    {'tur': 'aylik', 'adSoyad': 'Ayşe Yılmaz', 'kalanGun': 12},
    {'tur': 'yillik', 'adSoyad': 'Mert Kaya', 'kalanGun': 200},
    {'tur': 'ogrenci', 'adSoyad': 'Zeynep Ak', 'kalanGun': 5},
    {'tur': 'aylik', 'adSoyad': 'Can Demir', 'kalanGun': 3},
  ];

  List<Uyelik> uyeler = [for (var v in veriler) Uyelik.fromMap(v)];

  for (Uyelik u in uyeler) {
    print(u);
  }
  print('Aylık gelir: ${aylikGelir(uyeler).toStringAsFixed(2)} TL');

  for (Uyelik u in uyeler) {
    u.gunGecir(5);
  }
  print('5 gün sonra süresi bitmek üzere olanlar: ${bitenler(uyeler)}');
}
