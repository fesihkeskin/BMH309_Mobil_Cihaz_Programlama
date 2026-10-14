// Dosya: 08_07_parcalama_birlestirme.dart
void main() {
  List<String> gunler = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];

  List<String> haftaIci = gunler.sublist(0, 5);
  List<String> haftaSonu = gunler.sublist(5);
  print(haftaIci);
  print(haftaSonu);

  print(haftaIci.join(', '));
  print(gunler.join(' | '));

  List<String> tumu = haftaSonu + haftaIci;
  print(tumu);

  String etiketMetni = 'yeni,indirim,kargo bedava';
  List<String> etiketler = etiketMetni.split(',');
  print(etiketler);
  print(etiketler.length);
}
