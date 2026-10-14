// Dosya: 05_06_getter.dart
class Urun {
  final String ad;
  double _fiyat;
  int _stok;

  Urun(this.ad, this._fiyat, this._stok);

  double get fiyat => _fiyat;
  int get stok => _stok;

  // Hesaplanan getter'lar: bir alanı değil, alanlardan hesaplanan bir değeri verir
  double get kdvliFiyat => _fiyat * 1.20;
  bool get stoktaVar => _stok > 0;
  String get durum => switch (_stok) {
        0 => 'Tükendi',
        < 5 => 'Son $_stok ürün!',
        _ => 'Stokta',
      };

  void sat(int adet) {
    if (adet > 0 && adet <= _stok) {
      _stok -= adet;
    }
  }
}

void main() {
  Urun kulaklik = Urun('Kulaklık', 749.90, 6);

  print('${kulaklik.ad}: ${kulaklik.fiyat} TL');
  print('KDV dahil: ${kulaklik.kdvliFiyat.toStringAsFixed(2)} TL');
  print('Durum: ${kulaklik.durum}');
  kulaklik.sat(3);
  print('Durum: ${kulaklik.durum}');
  kulaklik.sat(3);
  print('Durum: ${kulaklik.durum} / stokta var mı? ${kulaklik.stoktaVar}');
}
