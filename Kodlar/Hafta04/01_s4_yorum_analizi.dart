// Dosya: 01_s4_yorum_analizi.dart
Map<String, int> kelimeSay(String metin, Set<String> haricTutulanlar) {
  String temiz = metin.toLowerCase();
  for (String isaret in ['.', ',', '!', '?']) {
    temiz = temiz.replaceAll(isaret, '');
  }

  Map<String, int> sayac = {};
  for (String kelime in temiz.split(' ')) {
    if (kelime.isEmpty || haricTutulanlar.contains(kelime)) {
      continue;
    }
    sayac[kelime] = (sayac[kelime] ?? 0) + 1;
  }
  return sayac;
}

String enSikKelime(Map<String, int> sayac) {
  String enSik = '';
  int enCok = 0;
  for (var kayit in sayac.entries) {
    if (kayit.value > enCok) {
      enSik = kayit.key;
      enCok = kayit.value;
    }
  }
  return enSik;
}

List<String> tekrarEdenler(Map<String, int> sayac, {int enAz = 2}) {
  List<String> sonuc = [];
  for (var kayit in sayac.entries) {
    if (kayit.value >= enAz) {
      sonuc.add(kayit.key);
    }
  }
  return sonuc;
}

void main() {
  String yorum = 'Uygulama çok hızlı ve kullanışlı. Tasarım güzel, menü hızlı. '
      'Bildirimler bazen geç geliyor ama uygulama genel olarak hızlı ve güzel.';
  Set<String> haricTutulanlar = {'ve', 'çok', 'ama', 'bir', 'bu'};

  Map<String, int> sayac = kelimeSay(yorum, haricTutulanlar);

  int toplam = 0;
  for (int adet in sayac.values) {
    toplam += adet;
  }
  String enSik = enSikKelime(sayac);

  print('Farklı kelime sayısı : ${sayac.length}');
  print('Toplam kelime sayısı : $toplam');
  print('En sık geçen         : $enSik (${sayac[enSik]} kez)');
  print('En az 2 kez geçenler : ${tekrarEdenler(sayac)}');
}
