// Dosya: 04_03_isimli_parametreler.dart
void bildirimAyarla({
  required String kanal,
  bool sesli = true,
  bool titresim = false,
  int oncelik = 1,
}) {
  print('$kanal → ses: $sesli, titreşim: $titresim, öncelik: $oncelik');
}

void main() {
  bildirimAyarla(kanal: 'Mesajlar', titresim: true, oncelik: 2);
  bildirimAyarla(kanal: 'Kampanyalar', sesli: false);
  bildirimAyarla(oncelik: 3, kanal: 'Güvenlik');
}
