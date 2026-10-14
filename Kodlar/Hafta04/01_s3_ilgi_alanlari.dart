// Dosya: 01_s3_ilgi_alanlari.dart
void karsilastir(Set<String> a, Set<String> b, String adA, String adB) {
  print('${'Ortak ilgi alanları'.padRight(20)}: ${a.intersection(b)}');
  print('${'Tüm ilgi alanları'.padRight(20)}: ${a.union(b)}');
  print('${'Yalnızca $adA'.padRight(20)}: ${a.difference(b)}');
  print('${'Yalnızca $adB'.padRight(20)}: ${b.difference(a)}');
}

double benzerlikYuzdesi(Set<String> a, Set<String> b) {
  Set<String> tumu = a.union(b);
  if (tumu.isEmpty) {
    return 0.0;
  }
  return a.intersection(b).length / tumu.length * 100;
}

Set<String> etiketleriTemizle(List<String> etiketler) {
  Set<String> sonuc = {};
  for (String etiket in etiketler) {
    String temiz = etiket.trim().toLowerCase();
    if (temiz.isNotEmpty) {
      sonuc.add(temiz);
    }
  }
  return sonuc;
}

void main() {
  Set<String> ayse = {'müzik', 'sinema', 'yazılım', 'fotoğraf', 'koşu'};
  Set<String> mert = {'yazılım', 'oyun', 'müzik', 'basketbol'};
  List<String> etiketGirdisi = ['yazılım', 'Müzik', 'yazılım', 'oyun', 'müzik '];

  karsilastir(ayse, mert, 'Ayşe', 'Mert');
  print('${'Benzerlik'.padRight(20)}: %${benzerlikYuzdesi(ayse, mert).toStringAsFixed(2)}');
  print('Temizlenmiş etiketler: ${etiketleriTemizle(etiketGirdisi)}');
}
