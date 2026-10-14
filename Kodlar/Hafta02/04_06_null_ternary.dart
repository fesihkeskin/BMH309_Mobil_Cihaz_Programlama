// Dosya: 04_06_null_ternary.dart
void main() {
  bool takmaAdVar = false;
  String? takmaAd = takmaAdVar ? 'Ayşo' : null;
  String ad = 'Ayşe';

  String gosterilecek1 = takmaAd != null ? takmaAd : ad;
  String gosterilecek2 = takmaAd ?? ad;

  print(gosterilecek1);
  print(gosterilecek2);
}
