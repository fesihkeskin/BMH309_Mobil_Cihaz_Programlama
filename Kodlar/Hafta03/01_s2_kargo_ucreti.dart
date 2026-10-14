// Dosya: 01_s2_kargo_ucreti.dart
import 'dart:io';

void main() {
  stdout.write('Sepet tutarı (TL): ');
  double? tutar = double.tryParse((stdin.readLineSync() ?? '').trim().replaceAll(',', '.'));

  stdout.write('Bölge (1: Şehir içi, 2: Yurt içi, 3: Uzak bölge): ');
  int? bolge = int.tryParse((stdin.readLineSync() ?? '').trim());

  stdout.write('Premium üye misiniz? (e/h): ');
  String premiumCevap = (stdin.readLineSync() ?? '').trim().toLowerCase();
  bool premium = premiumCevap == 'e' || premiumCevap == 'evet';

  if (tutar == null || tutar <= 0) {
    print('Geçersiz tutar.');
    return;
  }

  if (bolge == null || bolge < 1 || bolge > 3) {
    print('Geçersiz bölge.');
    return;
  }

  double kargoUcreti;
  String kargoMetni;

  if (premium) {
    kargoUcreti = 0.0;
    kargoMetni = 'Ücretsiz (Premium üye)';
  } else if (tutar >= 300) {
    kargoUcreti = 0.0;
    kargoMetni = 'Ücretsiz (300 TL üzeri)';
  } else {
    kargoUcreti = switch (bolge) {
      1 => 29.90,
      2 => 39.90,
      3 => 59.90,
      _ => 0.0, // Bu kola ulaşılmaz; bölge yukarıda doğrulandı.
    };
    kargoMetni = '${kargoUcreti.toStringAsFixed(2)} TL';
  }

  print('Kargo: $kargoMetni');
  print('Ödenecek toplam: ${(tutar + kargoUcreti).toStringAsFixed(2)} TL');
}
