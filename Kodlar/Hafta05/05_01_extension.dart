// Dosya: 05_01_extension.dart
extension ParaBicimi on double {
  String get tl => '${toStringAsFixed(2)} TL';

  double kdvEkle([double oran = 0.20]) => this * (1 + oran);
}

extension SureBicimi on int {
  String get dakikaSaniye => '${this ~/ 60}:${(this % 60).toString().padLeft(2, '0')}';
}

extension MetinKontrol on String {
  bool get gecerliEpostaMi => contains('@') && contains('.') && !contains(' ');

  String get kisalt => length <= 12 ? this : '${substring(0, 12)}...';
}

void main() {
  double fiyat = 749.9;
  print(fiyat.tl);
  print(fiyat.kdvEkle().tl);
  print(fiyat.kdvEkle(0.01).tl);

  print(252.dakikaSaniye);

  print('ayse@ornek.com'.gecerliEpostaMi);
  print('ayse ornek.com'.gecerliEpostaMi);
  print('Kablosuz Kulaklık Pro Max'.kisalt);
}
