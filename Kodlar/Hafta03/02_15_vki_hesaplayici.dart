// Dosya: 02_15_vki_hesaplayici.dart
import 'dart:io';

String metinOku(String soru) {
  stdout.write(soru);
  return (stdin.readLineSync() ?? '').trim();
}

double? ondalikOku(String soru) {
  return double.tryParse(metinOku(soru).replaceAll(',', '.'));
}

double aralikliOndalikOku(String soru, double min, double max) {
  while (true) {
    double? deger = ondalikOku(soru);
    if (deger != null && deger >= min && deger <= max) {
      return deger;
    }
    print('Lütfen $min ile $max arasında bir değer girin.');
  }
}

double vkiHesapla(double boy, double kilo) {
  return kilo / (boy * boy);
}

String vkiKategorisi(double vki) {
  if (vki < 18.5) {
    return 'Zayıf';
  } else if (vki < 25) {
    return 'Normal';
  } else if (vki < 30) {
    return 'Fazla kilolu';
  }
  return 'Obez';
}

void main() {
  print('=== Vücut Kitle İndeksi (VKİ) ===');
  double boy = aralikliOndalikOku('Boyunuz (m, ör. 1,75): ', 0.5, 2.5);
  double kilo = aralikliOndalikOku('Kilonuz (kg): ', 20, 300);

  double vki = vkiHesapla(boy, kilo);
  print('VKİ: ${vki.toStringAsFixed(2)} → ${vkiKategorisi(vki)}');
}
