// Dosya: 04_03_from_map.dart
class Urun {
  final String ad;
  final double fiyat;
  final int stok;

  Urun(this.ad, this.fiyat, this.stok);

  Urun.fromMap(Map<String, dynamic> veri)
      : ad = veri['ad'] as String,
        fiyat = (veri['fiyat'] as num).toDouble(),
        stok = veri['stok'] as int;

  Map<String, dynamic> toMap() {
    return {'ad': ad, 'fiyat': fiyat, 'stok': stok};
  }

  @override
  String toString() => '$ad - ${fiyat.toStringAsFixed(2)} TL ($stok adet)';
}

void main() {
  // Bu verilerin bir sunucudan geldiğini düşünün
  List<Map<String, dynamic>> gelenVeri = [
    {'ad': 'Süt', 'fiyat': 32.5, 'stok': 12},
    {'ad': 'Ekmek', 'fiyat': 15, 'stok': 40},
  ];

  List<Urun> urunler = [];
  for (var veri in gelenVeri) {
    urunler.add(Urun.fromMap(veri));
  }

  for (var u in urunler) {
    print(u);
  }
  print(urunler[0].toMap());
}
