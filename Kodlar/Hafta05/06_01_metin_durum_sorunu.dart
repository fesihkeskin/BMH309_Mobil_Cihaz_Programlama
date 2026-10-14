// Dosya: 06_01_metin_durum_sorunu.dart
// ❌ MANTIK HATASI: Durumlar metin olarak tutulunca yazım hatası yakalanmaz.
String durumMesaji(String durum) => switch (durum) {
      'hazirlaniyor' => 'Siparişiniz hazırlanıyor.',
      'kargoda' => 'Siparişiniz yolda!',
      'teslimEdildi' => 'Siparişiniz teslim edildi.',
      _ => 'Bilinmeyen durum',
    };

void main() {
  print(durumMesaji('kargoda'));
  print(durumMesaji('Kargoda'));
  print(durumMesaji('teslim_edildi'));
}
