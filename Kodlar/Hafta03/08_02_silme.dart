// Dosya: 08_02_silme.dart
void main() {
  List<String> sepet = ['Su', 'Süt', 'Çay', 'Şeker', 'Ekmek', 'Yumurta', 'Peynir'];

  bool silindi = sepet.remove('Çay');
  print('Çay silindi mi? $silindi → $sepet');

  bool silindi2 = sepet.remove('Kahve');
  print('Kahve silindi mi? $silindi2');

  String ikinci = sepet.removeAt(1);
  print('$ikinci silindi → $sepet');

  String son = sepet.removeLast();
  print('$son silindi → $sepet');

  sepet.removeRange(0, 2);
  print('İlk iki eleman silindi → $sepet');

  sepet.clear();
  print('Sepet temizlendi → $sepet (boş mu? ${sepet.isEmpty})');
}
