// Dosya: 09_01_foreach_where.dart
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
  print('--- forEach: tüm ürünler ---');
  katalog.forEach(print);

  print('--- where: stokta olanlar ---');
  List<Urun> stokta = katalog.where((u) => u.stoktaVar).toList();
  print(stokta);

  print('--- where: 1000 TL altı elektronik ---');
  var uygun = katalog.where((u) => u.kategori == 'Elektronik' && u.fiyat < 1000);
  print(uygun);
  print('${uygun.length} ürün');
}
