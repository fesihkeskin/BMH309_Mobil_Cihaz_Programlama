// Dosya: 05_02_cuzdan.dart
// BU BİR KÜTÜPHANE DOSYASIDIR: main fonksiyonu yoktur ve tek başına çalıştırılmaz.
// 05_03 ve 05_04 dosyaları bu dosyayı import eder.
class Cuzdan {
  double _bakiye = 0;
  int _islemSayisi = 0;

  bool paraYatir(double tutar) {
    if (tutar <= 0) {
      return false;
    }
    _bakiye += tutar;
    _islemSayisi++;
    return true;
  }

  bool paraCek(double tutar) {
    if (tutar <= 0 || tutar > _bakiye) {
      return false;
    }
    _bakiye -= tutar;
    _islemSayisi++;
    return true;
  }

  String ozet() => 'Bakiye: ${_bakiye.toStringAsFixed(2)} TL ($_islemSayisi işlem)';
}
