// Dosya: 06_02_enum_temel.dart
enum SiparisDurumu { hazirlaniyor, kargoda, teslimEdildi, iptal }

String durumMesaji(SiparisDurumu durum) => switch (durum) {
      SiparisDurumu.hazirlaniyor => 'Siparişiniz hazırlanıyor.',
      SiparisDurumu.kargoda => 'Siparişiniz yolda!',
      SiparisDurumu.teslimEdildi => 'Siparişiniz teslim edildi.',
      SiparisDurumu.iptal => 'Siparişiniz iptal edildi.',
    };

void main() {
  SiparisDurumu durum = SiparisDurumu.kargoda;
  print(durum);
  print(durum.name);
  print(durum.index);
  print(durumMesaji(durum));
  print(SiparisDurumu.values);

  for (SiparisDurumu d in SiparisDurumu.values) {
    print('${d.index}: ${durumMesaji(d)}');
  }
}
