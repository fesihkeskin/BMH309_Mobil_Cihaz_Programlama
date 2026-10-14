// Dosya: 09_03_any_every_firstwhere.dart
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

void main() {
  print('Tükenen ürün var mı?        : ${katalog.any((u) => !u.stoktaVar)}');
  print('Hepsinin puanı 4+ mı?       : ${katalog.every((u) => u.puan >= 4.0)}');
  print('Hepsinin fiyatı pozitif mi? : ${katalog.every((u) => u.fiyat > 0)}');

  Urun ilkGida = katalog.firstWhere((u) => u.kategori == 'Gıda');
  print('İlk gıda ürünü: $ilkGida');

  Urun? oyuncak = katalog.where((u) => u.kategori == 'Oyuncak').firstOrNull;
  print(oyuncak?.ad ?? 'Oyuncak kategorisinde ürün yok.');

  int sira = katalog.indexWhere((u) => u.ad == 'Peynir');
  print('Peynir listede $sira. indekste.');
}
