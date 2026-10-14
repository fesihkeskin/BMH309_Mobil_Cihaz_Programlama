// Dosya: 05_07_setter.dart
class Urun {
  final String ad;
  double _fiyat;
  int _indirimYuzdesi = 0;

  Urun(this.ad, this._fiyat);

  double get fiyat => _fiyat;

  set fiyat(double yeniFiyat) {
    if (yeniFiyat < 0) {
      print('Uyarı: Fiyat negatif olamaz, değişiklik yapılmadı.');
      return;
    }
    _fiyat = yeniFiyat;
  }

  int get indirimYuzdesi => _indirimYuzdesi;

  set indirimYuzdesi(int yuzde) {
    if (yuzde < 0) {
      _indirimYuzdesi = 0;
    } else if (yuzde > 90) {
      _indirimYuzdesi = 90;
    } else {
      _indirimYuzdesi = yuzde;
    }
  }

  double get indirimliFiyat => _fiyat * (100 - _indirimYuzdesi) / 100;
}

void main() {
  Urun saat = Urun('Akıllı Saat', 2400);

  saat.fiyat = -100;
  saat.fiyat = 2200;
  saat.indirimYuzdesi = 150;
  print('İndirim: %${saat.indirimYuzdesi}');

  saat.indirimYuzdesi = 25;
  print('${saat.ad}: ${saat.fiyat.toStringAsFixed(2)} TL → '
      '${saat.indirimliFiyat.toStringAsFixed(2)} TL (%${saat.indirimYuzdesi} indirim)');
}
