// Dosya: 03_03_this.dart
class Kullanici {
  String ad;
  int puan = 0;

  Kullanici(this.ad);

  void puanEkle(int puan) {
    this.puan += puan; // this.puan: nesnenin alanı, puan: parametre
    print('$ad: +$puan puan (toplam: ${this.puan})');
  }
}

void main() {
  Kullanici ayse = Kullanici('Ayşe');
  Kullanici mert = Kullanici('Mert');
  ayse.puanEkle(10);
  mert.puanEkle(5);
  ayse.puanEkle(25);
}
