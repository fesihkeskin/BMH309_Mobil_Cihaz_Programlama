// Dosya: 12_03_istatistik_siralama.dart
void main() {
  List<int> notlar = [72, 85, 90, 45, 60, 85, 100, 38, 77];

  List<int> sirali = List.of(notlar); // Orijinali bozmamak için kopya
  sirali.sort();

  int toplam = 0;
  for (int not in sirali) {
    toplam += not;
  }

  List<int> gecenler = [for (int not in notlar) if (not >= 50) not];

  print('Notlar       : $notlar');
  print('Öğrenci      : ${notlar.length}');
  print('Ortalama     : ${(toplam / notlar.length).toStringAsFixed(2)}');
  print('En yüksek    : ${sirali.last}');
  print('En düşük     : ${sirali.first}');
  print('Geçen (>=50) : ${gecenler.length}');
  print('Kalan        : ${notlar.length - gecenler.length}');
}
