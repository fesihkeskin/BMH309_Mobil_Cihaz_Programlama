// Dosya: 07_01_mantiksal.dart
void main() {
  bool girisYapti = true;
  bool sepetBos = false;
  bool adresVar = true;
  bool kampanyaAktif = false;
  bool premium = true;

  bool odemeAktif = girisYapti && !sepetBos && adresVar;
  bool indirimVar = kampanyaAktif || premium;

  print('Ödeme butonu aktif mi? $odemeAktif');
  print('İndirim uygulanacak mı? $indirimVar');
}
