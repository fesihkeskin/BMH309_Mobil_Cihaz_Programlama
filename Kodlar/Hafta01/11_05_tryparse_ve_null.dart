// Dosya: 11_05_tryparse_ve_null.dart
void main() {
  String adetMetni = 'iki';

  int adet = int.tryParse(adetMetni) ?? 1;
  print('Sepete eklenecek adet: $adet');

  int? yas = int.tryParse('21');
  print('Gelecek yıl: ${(yas ?? 0) + 1}');
}
