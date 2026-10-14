// Dosya: 10_05_frekans.dart
void main() {
  List<String> siparisler = ['Latte', 'Çay', 'Latte', 'Americano', 'Çay', 'Latte'];
  Map<String, int> sayac = {};

  for (var urun in siparisler) {
    sayac[urun] = (sayac[urun] ?? 0) + 1;
  }

  print(sayac);

  String enCok = '';
  int enCokAdet = 0;
  for (var kayit in sayac.entries) {
    if (kayit.value > enCokAdet) {
      enCok = kayit.key;
      enCokAdet = kayit.value;
    }
  }
  print('En çok satan: $enCok ($enCokAdet adet)');
}
