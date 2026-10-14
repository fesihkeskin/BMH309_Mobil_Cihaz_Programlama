// Dosya: 08_09_metin_arama.dart
void main() {
  String eposta = '  Ayse.Yilmaz@Ornek.com  ';

  String temiz = eposta.trim();
  print('[$temiz]');
  print(temiz.toLowerCase());
  print(temiz.contains('@'));
  print(temiz.startsWith('Ayse'));
  print(temiz.endsWith('.com'));
  print(temiz.indexOf('@'));
  print(temiz.substring(0, temiz.indexOf('@')));
  print(temiz.replaceAll('.', '_'));
}
