// Dosya: 11_01_nullable.dart
void main() {
  String ad = 'Ayşe';     // Asla null olamaz
  String? takmaAd;        // null olabilir; başlangıç değeri null
  int? dogumYili;         // null olabilir

  print(ad);
  print(takmaAd);
  print(dogumYili);

  takmaAd = 'Ayşo';
  dogumYili = 2004;
  print(takmaAd);
  print(dogumYili);
}
