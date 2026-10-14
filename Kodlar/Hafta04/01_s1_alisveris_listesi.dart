// Dosya: 01_s1_alisveris_listesi.dart
bool urunEkle(List<String> sepet, String urun) {
  String temiz = urun.trim();
  if (temiz.isEmpty) {
    print('Ürün adı boş olamaz.');
    return false;
  }
  if (sepet.contains(temiz)) {
    print('$temiz zaten sepette.');
    return false;
  }
  sepet.add(temiz);
  print('$temiz eklendi.');
  return true;
}

bool urunCikar(List<String> sepet, String urun) {
  String temiz = urun.trim();
  if (sepet.remove(temiz)) {
    print('$temiz çıkarıldı.');
    return true;
  }
  print('$temiz sepette bulunamadı.');
  return false;
}

void sepetiYazdir(List<String> sepet) {
  if (sepet.isEmpty) {
    print('Sepet boş.');
    return;
  }
  for (int i = 0; i < sepet.length; i++) {
    print('${i + 1}. ${sepet[i]}');
  }
}

List<String> alfabetik(List<String> sepet) {
  List<String> kopya = List.of(sepet);
  kopya.sort();
  return kopya;
}

void main() {
  List<String> sepet = [];
  sepetiYazdir(sepet);
  urunEkle(sepet, 'Süt');
  urunEkle(sepet, '  Ekmek ');
  urunEkle(sepet, 'Süt');
  urunEkle(sepet, '');
  urunEkle(sepet, 'Armut');
  urunCikar(sepet, 'Çay');
  urunCikar(sepet, 'Ekmek');
  urunEkle(sepet, 'Domates');
  sepetiYazdir(sepet);
  print('Alfabetik: ${alfabetik(sepet)}');
  print('Orijinal : $sepet');
}