// Dosya: 11_01_sepet_ozeti.dart
const double kdvOrani = 0.20;
const double ucretsizKargoLimiti = 300;
const double kargoUcreti = 39.90;

String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

void sepeteEkle(Map<String, int> sepet, Map<String, double> katalog, String urun, {int adet = 1}) {
  if (!katalog.containsKey(urun)) {
    print('"$urun" katalogda yok.');
    return;
  }
  sepet[urun] = (sepet[urun] ?? 0) + adet;
  print('$urun eklendi (sepetteki adet: ${sepet[urun]}).');
}

bool sepettenCikar(Map<String, int> sepet, String urun) {
  int? silinen = sepet.remove(urun);
  if (silinen == null) {
    print('"$urun" sepette yok.');
    return false;
  }
  print('$urun sepetten çıkarıldı.');
  return true;
}

double araToplamHesapla(Map<String, int> sepet, Map<String, double> katalog) {
  double toplam = 0;
  for (var kalem in sepet.entries) {
    double birimFiyat = katalog[kalem.key] ?? 0.0;
    toplam += birimFiyat * kalem.value;
  }
  return toplam;
}

void sepetiYazdir(Map<String, int> sepet, Map<String, double> katalog) {
  print('=========== SEPET ===========');
  if (sepet.isEmpty) {
    print('Sepetiniz boş.');
    return;
  }

  for (var kalem in sepet.entries) {
    double tutar = (katalog[kalem.key] ?? 0.0) * kalem.value;
    print('${kalem.key.padRight(10)} x${kalem.value}  ${tl(tutar).padLeft(12)}');
  }

  double araToplam = araToplamHesapla(sepet, katalog);
  double kdv = araToplam * kdvOrani;
  double kargo = araToplam >= ucretsizKargoLimiti ? 0.0 : kargoUcreti;

  print('-----------------------------');
  print('Ara toplam : ${tl(araToplam)}');
  print('KDV (%20)  : ${tl(kdv)}');
  print('Kargo      : ${kargo == 0 ? 'Ücretsiz' : tl(kargo)}');
  print('TOPLAM     : ${tl(araToplam + kdv + kargo)}');
}

void favorileriYazdir(Set<String> favoriler, Map<String, int> sepet) {
  print('========= FAVORİLER =========');
  for (var urun in favoriler) {
    String durum = sepet.containsKey(urun) ? 'sepette' : 'sepette değil';
    print('- $urun ($durum)');
  }

  Set<String> sepetteOlmayanlar = favoriler.difference(sepet.keys.toSet());
  print('Sepete eklemeyi unutmayın: ${sepetteOlmayanlar.join(', ')}');
}

void main() {
  Map<String, double> katalog = {
    'Süt': 32.50,
    'Ekmek': 15.00,
    'Yumurta': 89.90,
    'Peynir': 145.00,
    'Zeytin': 120.00,
  };
  Map<String, int> sepet = {};
  Set<String> favoriler = {'Peynir', 'Zeytin'};

  sepeteEkle(sepet, katalog, 'Süt', adet: 2);
  sepeteEkle(sepet, katalog, 'Ekmek');
  sepeteEkle(sepet, katalog, 'Süt');
  sepeteEkle(sepet, katalog, 'Çay');
  sepeteEkle(sepet, katalog, 'Peynir');
  sepettenCikar(sepet, 'Ekmek');
  sepettenCikar(sepet, 'Kahve');

  print('');
  sepetiYazdir(sepet, katalog);
  print('');
  favorileriYazdir(favoriler, sepet);
}
