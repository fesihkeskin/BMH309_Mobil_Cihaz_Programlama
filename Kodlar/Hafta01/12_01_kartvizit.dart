// Dosya: 12_01_kartvizit.dart
void main() {
  const String baslik = 'BMH309 Dijital Kartvizit';

  String ad = '  ayşe  ';
  String soyad = 'YILMAZ';
  String bolum = 'Bilgisayar Mühendisliği';
  int sinif = 3;
  double gano = 3.276;
  bool mezunMu = false;
  String? github;
  int? mezuniyetYili = int.tryParse('2027');

  String temizAd = ad.trim();
  String duzgunAd = temizAd[0].toUpperCase() + temizAd.substring(1);
  String cizgi = '-' * 34;

  print(cizgi);
  print(baslik);
  print(cizgi);
  print('Ad Soyad   : $duzgunAd $soyad');
  print('Bölüm      : $bolum');
  print('Sınıf      : $sinif');
  print('GANO       : ${gano.toStringAsFixed(2)}');
  print('Mezun mu   : $mezunMu');
  print('GitHub     : ${github ?? 'Belirtilmedi'}');
  print('Mezuniyet  : ${mezuniyetYili ?? 'Belirtilmedi'}');
  print('Ad uzunluğu: ${duzgunAd.length} harf');
  print(cizgi);
}
