// Dosya: 02_05_soyut_ekran.dart
abstract class Ekran {
  final String baslik;

  Ekran(this.baslik);

  List<String> icerik(); // Her ekran kendi içeriğini üretmek ZORUNDA

  void ciz() {
    print('==== $baslik ====');
    for (String satir in icerik()) {
      print('  $satir');
    }
  }
}

class GirisEkrani extends Ekran {
  GirisEkrani() : super('Giriş');

  @override
  List<String> icerik() => ['[ E-posta      ]', '[ Şifre        ]', '( Giriş yap )'];
}

class ProfilEkrani extends Ekran {
  final String ad;
  final int siparisSayisi;

  ProfilEkrani(this.ad, this.siparisSayisi) : super('Profil');

  @override
  List<String> icerik() => ['Merhaba, $ad!', 'Siparişlerim ($siparisSayisi)', 'Ayarlar', 'Çıkış yap'];
}

void main() {
  List<Ekran> ekranlar = [GirisEkrani(), ProfilEkrani('Ayşe', 3)];
  for (Ekran e in ekranlar) {
    e.ciz();
  }
}
