// Dosya: 09_04_tekrar_temizleme.dart
void main() {
  List<String> aramalar = ['kulaklık', 'kılıf', 'kulaklık', 'şarj aleti', 'kılıf', 'kulaklık'];

  Set<String> tekil = aramalar.toSet();
  print(tekil);
  print('${aramalar.length} aramada ${tekil.length} farklı kelime');

  List<String> sonAramalar = tekil.toList();
  print(sonAramalar[0]);
}
