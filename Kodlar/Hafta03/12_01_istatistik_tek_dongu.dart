// Dosya: 12_01_istatistik_tek_dongu.dart
void main() {
  List<int> notlar = [72, 85, 90, 45, 60, 85, 100, 38, 77];

  int toplam = 0;
  int enYuksek = notlar[0];
  int enDusuk = notlar[0];
  int gecen = 0;

  for (int not in notlar) {
    toplam += not;
    if (not > enYuksek) enYuksek = not;
    if (not < enDusuk) enDusuk = not;
    if (not >= 50) gecen++;
  }

  double ortalama = toplam / notlar.length;

  print('Notlar       : $notlar');
  print('Öğrenci      : ${notlar.length}');
  print('Ortalama     : ${ortalama.toStringAsFixed(2)}');
  print('En yüksek    : $enYuksek');
  print('En düşük     : $enDusuk');
  print('Geçen (>=50) : $gecen');
  print('Kalan        : ${notlar.length - gecen}');
}
