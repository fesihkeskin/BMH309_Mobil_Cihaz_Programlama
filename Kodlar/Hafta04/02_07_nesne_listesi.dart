// Dosya: 02_07_nesne_listesi.dart
class Urun {
  String ad = '';
  double fiyat = 0;
  int stok = 0;
}

void main() {
  List<Urun> katalog = [];

  Urun sut = Urun();
  sut.ad = 'Süt';
  sut.fiyat = 32.5;
  sut.stok = 12;
  katalog.add(sut);

  Urun ekmek = Urun();
  ekmek.ad = 'Ekmek';
  ekmek.fiyat = 15;
  katalog.add(ekmek);

  for (Urun u in katalog) {
    String durum = u.stok > 0 ? '${u.stok} adet' : 'TÜKENDİ';
    print('${u.ad.padRight(8)} ${u.fiyat.toStringAsFixed(2).padLeft(7)} TL  $durum');
  }
}
