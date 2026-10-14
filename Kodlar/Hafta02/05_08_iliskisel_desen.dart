// Dosya: 05_08_iliskisel_desen.dart
void main() {
  int puan = 78;

  String harf = switch (puan) {
    < 0 || > 100 => 'Geçersiz puan',
    >= 90 => 'AA',
    >= 85 => 'BA',
    >= 80 => 'BB',
    >= 75 => 'CB',
    >= 70 => 'CC',
    >= 60 => 'DC',
    >= 50 => 'DD',
    _ => 'FF',
  };

  print('Puan: $puan → Harf notu: $harf');
}
