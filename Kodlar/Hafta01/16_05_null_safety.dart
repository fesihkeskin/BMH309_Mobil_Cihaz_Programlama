// Dosya: 16_05_null_safety.dart
void main() {
  String? biyografi;
  String takipciMetni = '1.250';

  print('Biyografi: ${biyografi ?? 'Henüz biyografi eklenmedi'}');

  int takipci = int.tryParse(takipciMetni) ?? 0;
  print('Takipçi: $takipci');

  biyografi ??= 'Merhaba, ben yeni bir kullanıcıyım.';
  print('Biyografi: $biyografi');
}
