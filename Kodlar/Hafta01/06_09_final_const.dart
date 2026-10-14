// Dosya: 06_09_final_const.dart
void main() {
  const String uygulamaAdi = 'Cep Market';
  const double kdvOrani = 0.20;
  const int maksimumSepetAdedi = 20;
  final DateTime acilisZamani = DateTime.now();

  print('$uygulamaAdi açıldı.');
  print('Açılış zamanı: $acilisZamani');
  print('KDV oranı: $kdvOrani');
  print('Sepete en fazla $maksimumSepetAdedi ürün eklenebilir.');
}
