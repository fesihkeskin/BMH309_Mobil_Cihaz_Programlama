// Dosya: 16_01_profil.dart
void main() {
  const String adSoyad = 'Mert Kaya';
  int yas = 21;
  double boy = 1.78;
  bool ogrenciMi = true;
  String? hobi;

  print('Ad Soyad : $adSoyad');
  print('Yaş      : $yas');
  print('Boy      : ${boy.toStringAsFixed(2)} m');
  print('Öğrenci  : $ogrenciMi');
  print('Hobi     : ${hobi ?? 'Belirtilmedi'}');
  print('Ad soyad ${adSoyad.length} karakterden oluşuyor.');
}
