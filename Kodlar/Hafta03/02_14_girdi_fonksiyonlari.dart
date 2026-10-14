// Dosya: 02_14_girdi_fonksiyonlari.dart
import 'dart:io';

String metinOku(String soru) {
  stdout.write(soru);
  return (stdin.readLineSync() ?? '').trim();
}

int? tamSayiOku(String soru) {
  return int.tryParse(metinOku(soru));
}

double? ondalikOku(String soru) {
  return double.tryParse(metinOku(soru).replaceAll(',', '.'));
}

void main() {
  String ad = metinOku('Adınız: ');
  int? yas = tamSayiOku('Yaşınız: ');
  double? boy = ondalikOku('Boyunuz (m): ');

  print('Ad : ${ad.isEmpty ? 'Belirtilmedi' : ad}');
  print('Yaş: ${yas ?? 'Geçersiz'}');
  print('Boy: ${boy == null ? 'Geçersiz' : boy.toStringAsFixed(2)}');
}
