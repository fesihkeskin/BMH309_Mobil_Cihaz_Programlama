// Dosya: 09_05_fold_reduce.dart
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
  double stokDegeri = katalog.fold(0.0, (toplam, u) => toplam + u.fiyat * u.stok);
  print('Toplam stok değeri: ${stokDegeri.toStringAsFixed(2)} TL');

  int toplamAdet = katalog.fold(0, (toplam, u) => toplam + u.stok);
  print('Toplam stok: $toplamAdet adet');

  double ortalamaPuan = katalog.map((u) => u.puan).reduce((a, b) => a + b) / katalog.length;
  print('Ortalama puan: ${ortalamaPuan.toStringAsFixed(2)}');

  Urun enPahali = katalog.reduce((a, b) => a.fiyat >= b.fiyat ? a : b);
  print('En pahalı ürün: $enPahali');

  Urun enUcuzStokta = katalog.where((u) => u.stoktaVar).reduce((a, b) => a.fiyat <= b.fiyat ? a : b);
  print('Stoktaki en ucuz ürün: $enUcuzStokta');
}
