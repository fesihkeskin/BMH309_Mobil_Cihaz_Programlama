// Dosya: 03_14_erken_cikis.dart
void main() {
  String kullaniciAdi = 'mert';
  int yas = 15;

  if (kullaniciAdi.isEmpty) {
    print('Kullanıcı adı boş olamaz.');
    return;
  }

  if (yas < 18) {
    print('Bu uygulamayı kullanmak için 18 yaşından büyük olmalısınız.');
    return;
  }

  print('Kayıt başarılı: $kullaniciAdi');
}
