// Dosya: 09_01_bool.dart
void main() {
  bool girisYapti = true;
  bool karanlikMod = false;

  print(girisYapti);
  print('Karanlık mod açık mı? $karanlikMod');

  String sifre = 'abc';
  bool sifreYeterliMi = sifre.length >= 8;
  bool epostaGecerliMi = 'ayse@ornek.com'.contains('@');

  print('Şifre yeterince uzun mu? $sifreYeterliMi');
  print('E-posta geçerli mi? $epostaGecerliMi');
  print('Tersi: ${!epostaGecerliMi}');
}
