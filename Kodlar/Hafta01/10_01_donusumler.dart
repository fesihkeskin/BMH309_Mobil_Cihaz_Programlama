// Dosya: 10_01_donusumler.dart
void main() {
  // Metinden sayıya
  String adetMetni = '25';
  String fiyatMetni = '49.90';
  int adet = int.parse(adetMetni);
  double fiyat = double.parse(fiyatMetni);
  print(adet + 1);
  print(fiyat * 2);

  // Sayıdan metne
  int puan = 87;
  String puanMetni = puan.toString();
  print(puanMetni + ' puan');
  print(3.14159.toStringAsFixed(2));

  // Metinden bool'a
  String ayar = 'true';
  bool bildirimAcik = ayar == 'true';
  print(bildirimAcik);
}
