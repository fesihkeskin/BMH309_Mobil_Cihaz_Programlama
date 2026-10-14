// Dosya: 10_02_arama_istatistigi.dart
void main() {
  List<String> aramalar = [
    'kulaklık', 'kılıf', 'kulaklık', 'şarj', 'kılıf',
    'kulaklık', 'saat', 'şarj', 'kulaklık', 'şarj',
  ];

  Map<String, int> sayac = {};
  for (String a in aramalar) {
    sayac.update(a, (n) => n + 1, ifAbsent: () => 1);
  }
  print(sayac);

  List<MapEntry<String, int>> sirali = sayac.entries.toList();
  sirali.sort((a, b) => b.value.compareTo(a.value));

  print('Popüler aramalar:');
  for (var e in sirali.take(3)) {
    print('  ${e.key} (${e.value})');
  }
}
