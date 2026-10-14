// Dosya: 05_02_turkce_harfler.dart
extension TurkceMetin on String {
  String get trBuyuk => replaceAll('i', 'İ').replaceAll('ı', 'I').toUpperCase();

  String get trKucuk => replaceAll('I', 'ı').replaceAll('İ', 'i').toLowerCase();
}

void main() {
  String sehir = 'istanbul';
  print(sehir.toUpperCase());
  print(sehir.trBuyuk);

  print('IĞDIR'.toLowerCase());
  print('IĞDIR'.trKucuk);
  print('Işık İzmir'.trKucuk);
}
