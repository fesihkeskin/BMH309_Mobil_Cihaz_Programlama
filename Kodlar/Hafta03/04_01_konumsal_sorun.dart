// Dosya: 04_01_konumsal_sorun.dart
void bildirimAyarla(String kanal, bool sesli, bool titresim, int oncelik) {
  print('$kanal → ses: $sesli, titreşim: $titresim, öncelik: $oncelik');
}

void main() {
  bildirimAyarla('Mesajlar', true, false, 2);
  bildirimAyarla('Kampanyalar', false, false, 1);
}
