// Dosya: 01_s2_adim_raporu.dart
int toplamAdim(List<int> adimlar) {
  int toplam = 0;
  for (int adim in adimlar) {
    toplam += adim;
  }
  return toplam;
}

double ortalamaAdim(List<int> adimlar) =>
    adimlar.isEmpty ? 0.0 : toplamAdim(adimlar) / adimlar.length;

int enAktifGunIndeksi(List<int> adimlar) {
  int enIyi = 0;
  for (int i = 1; i < adimlar.length; i++) {
    if (adimlar[i] > adimlar[enIyi]) {
      enIyi = i;
    }
  }
  return enIyi;
}

int hedefeUlasilanGun(List<int> adimlar, {int hedef = 8000}) {
  int sayac = 0;
  for (int adim in adimlar) {
    if (adim >= hedef) {
      sayac++;
    }
  }
  return sayac;
}

void grafikCiz(List<String> gunler, List<int> adimlar, {int birim = 1000}) {
  for (int i = 0; i < adimlar.length; i++) {
    print('${gunler[i]} | ${'#' * (adimlar[i] ~/ birim)} ${adimlar[i]}');
  }
}

void main() {
  List<String> gunler = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
  List<int> adimlar = List.filled(7, 0);
  adimlar[0] = 6500;
  adimlar[1] = 8200;
  adimlar[2] = 7400;
  adimlar[3] = 10350;
  adimlar[4] = 5600;
  adimlar[5] = 12100;
  adimlar[6] = 9000;

  int enAktif = enAktifGunIndeksi(adimlar);

  print('Toplam adım  : ${toplamAdim(adimlar)}');
  print('Ortalama     : ${ortalamaAdim(adimlar).toStringAsFixed(1)}');
  print('En aktif gün : ${gunler[enAktif]} (${adimlar[enAktif]} adım)');
  print('Hedef 8000   : ${hedefeUlasilanGun(adimlar)} gün');
  print('Hedef 10000  : ${hedefeUlasilanGun(adimlar, hedef: 10000)} gün');
  grafikCiz(gunler, adimlar);

  // Ek görev:
  // adimlar.add(7000);
  // Bu satır çalıştırılınca "Unsupported operation: Cannot add to a fixed-length list"
  // hatası alınır. List.filled varsayılan olarak SABİT uzunluklu liste oluşturur;
  // elemanlar değiştirilebilir ama listeye eleman eklenemez.
}
