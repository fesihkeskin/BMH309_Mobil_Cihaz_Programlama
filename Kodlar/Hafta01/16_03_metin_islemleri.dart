// Dosya: 16_03_metin_islemleri.dart
void main() {
  String metin = '  Dart ve Flutter  ';
  String temiz = metin.trim();

  print('[$temiz]');
  print(temiz.length);
  print(temiz.toUpperCase());
  print(temiz.contains('Flutter'));
  print(temiz.indexOf('Flutter'));
  print(temiz.substring(0, 4));
  print(temiz.replaceAll(' ', '_'));
}
