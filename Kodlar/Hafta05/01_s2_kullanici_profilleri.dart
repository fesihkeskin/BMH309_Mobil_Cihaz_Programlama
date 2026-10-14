// Dosya: 01_s2_kullanici_profilleri.dart
class Kullanici {
  final String kullaniciAdi;
  final String eposta;
  final String rol;

  Kullanici(this.kullaniciAdi, this.eposta, {this.rol = 'üye'});

  Kullanici.misafir()
      : kullaniciAdi = 'misafir',
        eposta = '-',
        rol = 'misafir';

  factory Kullanici.epostadan(String eposta) {
    String temiz = eposta.trim().toLowerCase();
    if (!temiz.contains('@')) {
      return Kullanici.misafir();
    }
    return Kullanici(temiz.split('@')[0], temiz);
  }

  Kullanici.fromMap(Map<String, dynamic> veri)
      : kullaniciAdi = veri['kullaniciAdi'] as String,
        eposta = veri['eposta'] as String,
        rol = (veri['rol'] as String?) ?? 'üye';

  @override
  String toString() => '@$kullaniciAdi <$eposta> [$rol]';
}

void main() {
  List<Kullanici> kullanicilar = [
    Kullanici('ayse', 'ayse@ornek.com', rol: 'yönetici'),
    Kullanici.misafir(),
    Kullanici.epostadan('  Mert.Kaya@Ornek.com '),
    Kullanici.epostadan('gecersiz-adres'),
    Kullanici.fromMap({'kullaniciAdi': 'zeynep', 'eposta': 'zeynep@ornek.com'}),
  ];

  for (Kullanici k in kullanicilar) {
    print(k);
  }
}
