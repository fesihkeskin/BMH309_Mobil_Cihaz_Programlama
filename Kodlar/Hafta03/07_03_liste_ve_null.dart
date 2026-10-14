// Dosya: 07_03_liste_ve_null.dart
void main() {
  List<String?> anketCevaplari = ['Evet', null, 'Hayır']; // Elemanlar null olabilir
  List<String>? favoriler;                                   // Listenin kendisi null olabilir

  print(anketCevaplari);
  print(favoriler);
  print(favoriler?.length ?? 0);
}
