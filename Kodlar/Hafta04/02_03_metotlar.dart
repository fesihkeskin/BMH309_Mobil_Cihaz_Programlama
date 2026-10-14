// Dosya: 02_03_metotlar.dart
class Urun {
  String ad = '';
  double fiyat = 0;
  int stok = 0;

  bool stoktaVarMi() {
    return stok > 0;
  }

  double kdvliFiyat() {
    return fiyat * 1.20;
  }

  void stokEkle(int adet) {
    stok += adet;
    print('$ad stoğuna $adet eklendi. Yeni stok: $stok');
  }

  bool sat(int adet) {
    if (adet > stok) {
      print('$ad: Yetersiz stok ($stok adet var).');
      return false;
    }
    stok -= adet;
    print('$ad: $adet adet satıldı. Kalan: $stok');
    return true;
  }
}

void main() {
  Urun peynir = Urun();
  peynir.ad = 'Peynir';
  peynir.fiyat = 145;
  peynir.stok = 3;

  print('Stokta var mı? ${peynir.stoktaVarMi()}');
  print('KDV dahil: ${peynir.kdvliFiyat().toStringAsFixed(2)} TL');
  peynir.sat(2);
  peynir.sat(5);
  peynir.stokEkle(10);
  peynir.sat(5);
}
