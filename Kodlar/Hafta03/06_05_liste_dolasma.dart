// Dosya: 06_05_liste_dolasma.dart
void main() {
  List<String> gunler = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
  List<int> adimlar = [5200, 7800, 9100, 6400, 11250, 4300, 8600];

  int toplam = 0;
  int enYuksekIndeks = 0;

  for (int i = 0; i < adimlar.length; i++) {
    print('${gunler[i]}: ${adimlar[i]} adım');
    toplam += adimlar[i];
    if (adimlar[i] > adimlar[enYuksekIndeks]) {
      enYuksekIndeks = i;
    }
  }

  print('Toplam   : $toplam');
  print('Ortalama : ${(toplam / adimlar.length).toStringAsFixed(0)}');
  print('En aktif : ${gunler[enYuksekIndeks]} (${adimlar[enYuksekIndeks]} adım)');
}
