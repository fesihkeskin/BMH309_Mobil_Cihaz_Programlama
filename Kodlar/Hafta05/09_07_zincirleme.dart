// Dosya: 09_07_zincirleme.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  bool get stoktaVar => stok > 0;

  @override
  String toString() => ad;
}

final List<Urun> katalog = [
  Urun('Kulaklık', 'Elektronik', 749.90, 5, 4.6),
  Urun('Şarj Kablosu', 'Elektronik', 129.90, 0, 4.1),
  Urun('Akıllı Saat', 'Elektronik', 2400.00, 2, 4.8),
  Urun('Süt', 'Gıda', 32.50, 20, 4.3),
  Urun('Peynir', 'Gıda', 145.00, 0, 4.7),
  Urun('Defter', 'Kırtasiye', 45.00, 30, 3.9),
  Urun('Kalem', 'Kırtasiye', 12.00, 100, 4.0),
];

List<String> ara(List<Urun> urunler, String aranan, {bool yalnizcaStokta = false}) {
  String kucukAranan = aranan.toLowerCase();
  return urunler
      .where((u) => u.ad.toLowerCase().contains(kucukAranan))
      .where((u) => !yalnizcaStokta || u.stoktaVar)
      .map((u) => '${u.ad} (${u.fiyat.toStringAsFixed(2)} TL)')
      .toList();
}

void main() {
  print(ara(katalog, 'ka'));
  print(ara(katalog, 'KA', yalnizcaStokta: true));
  print(ara(katalog, 'tablet'));

  List<Urun> stoktakiler = katalog.where((u) => u.stoktaVar).toList();
  stoktakiler.sort((a, b) => b.puan.compareTo(a.puan));
  List<String> enIyi3 = stoktakiler.take(3).map((u) => u.ad).toList();
  print('Stoktaki en yüksek puanlı 3 ürün: $enIyi3');
}
