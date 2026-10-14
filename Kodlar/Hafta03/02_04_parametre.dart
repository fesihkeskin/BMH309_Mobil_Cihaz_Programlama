// Dosya: 02_04_parametre.dart
void selamla(String ad) {
  print('Merhaba $ad, Cep Market\'e hoş geldin!');
}

void bildirimGoster(String baslik, int adet) {
  print('[$baslik] $adet yeni bildirim');
}

void main() {
  selamla('Ayşe');
  selamla('Mert');
  bildirimGoster('Mesajlar', 3);
  bildirimGoster('Kampanyalar', 1);
}
