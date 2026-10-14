// Dosya: 07_03_tip_test.dart
void main() {
  Object gelenVeri = 42; // Örneğin sunucudan gelen ve tipi bilinmeyen bir veri

  if (gelenVeri is int) {
    print('Tam sayı geldi: ${gelenVeri + 1}');
  }

  if (gelenVeri is! String) {
    print('Gelen veri bir metin değil.');
  }

  Object metin = 'Merhaba';
  String s = metin as String;
  print(s.toUpperCase());
}
