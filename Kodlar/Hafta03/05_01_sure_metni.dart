// Dosya: 05_01_sure_metni.dart
String sureMetni(int toplamSaniye) {
  int dakika = toplamSaniye ~/ 60;
  int saniye = toplamSaniye % 60;
  if (dakika == 0) {
    return '$saniye sn';
  }
  return '$dakika dk $saniye sn';
}

void main() {
  print(sureMetni(227));
  print(sureMetni(47));
  print(sureMetni(120));
}
