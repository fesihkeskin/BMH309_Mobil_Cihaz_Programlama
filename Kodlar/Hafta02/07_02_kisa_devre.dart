// Dosya: 07_02_kisa_devre.dart
void main() {
  bool kullaniciVar = false;
  String? kullaniciAdi = kullaniciVar ? 'ayse' : null;

  if (kullaniciAdi != null && kullaniciAdi.length > 3) {
    print('Kullanıcı adı geçerli.');
  } else {
    print('Kullanıcı adı yok veya çok kısa.');
  }

  if (kullaniciAdi == null || kullaniciAdi.isEmpty) {
    print('Lütfen bir kullanıcı adı girin.');
  }
}
