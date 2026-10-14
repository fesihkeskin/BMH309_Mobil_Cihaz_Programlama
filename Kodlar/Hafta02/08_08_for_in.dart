// Dosya: 08_08_for_in.dart
void main() {
  var bildirimler = ['Kargonuz yola çıktı', 'Yeni kampanya!', 'Şifreniz değiştirildi'];

  for (var bildirim in bildirimler) {
    print('- $bildirim');
  }

  print('---');

  int sira = 0;
  for (var bildirim in bildirimler) {
    sira++;
    print('$sira. $bildirim (${bildirim.length} karakter)');
  }
}
