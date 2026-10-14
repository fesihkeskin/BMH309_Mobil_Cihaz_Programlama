// Dosya: 08_05_interpolation.dart
void main() {
  String ad = 'Ayşe';
  int bildirim = 3;
  double bakiye = 1250.5;

  print('Merhaba $ad!');
  print('$ad, $bildirim yeni bildiriminiz var.');
  print('Bakiyeniz: ${bakiye.toStringAsFixed(2)} TL');
  print('Adınız ${ad.length} harfli.');
  print('İki katı: ${bildirim * 2}');
}
