// Dosya: 05_04_switch_string.dart
void main() {
  String siparisDurumu = 'kargoda';

  switch (siparisDurumu) {
    case 'hazirlaniyor':
      print('Siparişiniz hazırlanıyor.');
    case 'kargoda':
      print('Siparişiniz yolda.');
      print('Tahmini teslimat: 2 gün.');
    case 'teslim':
      print('Siparişiniz teslim edildi.');
    case 'iptal' || 'iade':
      print('Bu sipariş kapatıldı.');
    default:
      print('Bilinmeyen durum: $siparisDurumu');
  }
}
