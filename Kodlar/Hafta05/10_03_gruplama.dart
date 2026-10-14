// Dosya: 10_03_gruplama.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;

  Urun(this.ad, this.kategori, this.fiyat);
}

void main() {
  List<Urun> katalog = [
    Urun('Kulaklık', 'Elektronik', 749.90),
    Urun('Şarj Kablosu', 'Elektronik', 129.90),
    Urun('Akıllı Saat', 'Elektronik', 2400.00),
    Urun('Süt', 'Gıda', 32.50),
    Urun('Peynir', 'Gıda', 145.00),
    Urun('Defter', 'Kırtasiye', 45.00),
    Urun('Kalem', 'Kırtasiye', 12.00),
  ];

  Map<String, List<String>> gruplar = {};
  for (Urun u in katalog) {
    gruplar.putIfAbsent(u.kategori, () => []).add(u.ad);
  }
  gruplar.forEach((kategori, urunler) => print('$kategori (${urunler.length}): ${urunler.join(', ')}'));

  Map<String, double> kategoriToplami = katalog.fold({}, (toplam, u) {
    toplam[u.kategori] = (toplam[u.kategori] ?? 0.0) + u.fiyat;
    return toplam;
  });
  kategoriToplami.forEach((kategori, tutar) => print('$kategori toplamı: ${tutar.toStringAsFixed(2)} TL'));
}
