// Dosya: 03_11_giris_dogrulama.dart
void main() {
  String eposta = 'ayse@ornek.com';
  String sifre = '12345';

  if (eposta.isEmpty || sifre.isEmpty) {
    print('Lütfen tüm alanları doldurun.');
  } else if (!eposta.contains('@')) {
    print('Geçerli bir e-posta adresi girin.');
  } else if (sifre.length < 8) {
    print('Şifre en az 8 karakter olmalı.');
  } else {
    print('Giriş yapılıyor...');
  }
}
