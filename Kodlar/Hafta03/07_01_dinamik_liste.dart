// Dosya: 07_01_dinamik_liste.dart
void main() {
  List<String> sepet = ['Süt', 'Ekmek'];
  var bildirimler = <String>[];
  var puanlar = [4, 5, 3];

  print(sepet);
  print(bildirimler);
  print(puanlar);
  print('${sepet.length} / ${bildirimler.length} / ${puanlar.length}');

  sepet.add('Yumurta');
  bildirimler.add('Kargonuz yolda');
  puanlar.add(5);

  print(sepet);
  print(bildirimler);
  print(puanlar);
  print('${sepet.length} / ${bildirimler.length} / ${puanlar.length}');
}
