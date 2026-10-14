// Dosya: 09_05_kume_islemleri.dart
void main() {
  Set<String> aliTakip = {'ayse', 'mert', 'zeynep', 'can'};
  Set<String> veliTakip = {'mert', 'ece', 'can', 'deniz'};

  print('Ortak takip edilenler: ${aliTakip.intersection(veliTakip)}');
  print('Herhangi biri        : ${aliTakip.union(veliTakip)}');
  print('Yalnızca Ali         : ${aliTakip.difference(veliTakip)}');
  print('Ali\'ye öneriler      : ${veliTakip.difference(aliTakip)}');
}
