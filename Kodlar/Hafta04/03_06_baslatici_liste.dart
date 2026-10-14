// Dosya: 03_06_baslatici_liste.dart
class Kullanici {
  String ad;
  String eposta;
  String kullaniciAdi;
  int kayitYili;

  Kullanici(this.ad, String eposta)
      : eposta = eposta.trim().toLowerCase(),
        kullaniciAdi = eposta.trim().toLowerCase().split('@')[0],
        kayitYili = 2026 {
    print('Yeni kullanıcı oluşturuldu: $kullaniciAdi');
  }
}

void main() {
  Kullanici k = Kullanici('Ayşe Yılmaz', '  Ayse.Yilmaz@Ornek.com ');
  print('Ad           : ${k.ad}');
  print('E-posta      : ${k.eposta}');
  print('Kullanıcı adı: ${k.kullaniciAdi}');
  print('Kayıt yılı   : ${k.kayitYili}');
}
