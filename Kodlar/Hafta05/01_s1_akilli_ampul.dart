// Dosya: 01_s1_akilli_ampul.dart
class AkilliAmpul {
  final String oda;
  bool _acik = false;
  int _parlaklik;

  AkilliAmpul(this.oda, {int parlaklik = 70}) : _parlaklik = parlaklik;

  bool get acikMi => _acik;
  int get parlaklik => _parlaklik;

  set parlaklik(int deger) {
    if (deger < 0) {
      _parlaklik = 0;
    } else if (deger > 100) {
      _parlaklik = 100;
    } else {
      _parlaklik = deger;
    }
    _acik = _parlaklik > 0;
  }

  void ac() {
    if (_parlaklik == 0) {
      _parlaklik = 70;
    }
    _acik = true;
  }

  void kapat() {
    _acik = false;
  }

  String get durum => _acik ? '$oda: Açık (%$_parlaklik)' : '$oda: Kapalı';
}

void main() {
  AkilliAmpul salon = AkilliAmpul('Salon');
  AkilliAmpul mutfak = AkilliAmpul('Mutfak', parlaklik: 40);

  print(salon.durum);
  salon.ac();
  print(salon.durum);
  salon.parlaklik = 150;
  print(salon.durum);
  salon.parlaklik = 0;
  print(salon.durum);

  mutfak.ac();
  print(mutfak.durum);
  mutfak.parlaklik = -20;
  print(mutfak.durum);
  print('Açık ampul var mı? ${salon.acikMi || mutfak.acikMi}');
}
