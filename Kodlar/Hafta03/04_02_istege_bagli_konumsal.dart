// Dosya: 04_02_istege_bagli_konumsal.dart
String selamla(String ad, [String? unvan]) {
  if (unvan == null) {
    return 'Merhaba $ad';
  }
  return 'Merhaba $unvan $ad';
}

String fiyatYaz(double tutar, [String paraBirimi = 'TL']) {
  return '${tutar.toStringAsFixed(2)} $paraBirimi';
}

void main() {
  print(selamla('Ayşe'));
  print(selamla('Yılmaz', 'Dr.'));
  print(fiyatYaz(49.9));
  print(fiyatYaz(12.5, 'USD'));
}
