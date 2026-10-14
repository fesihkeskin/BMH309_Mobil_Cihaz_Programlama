// Dosya: 03_18_null_kontrol.dart
void main() {
  bool kuponGirildi = true;
  String? kuponKodu = kuponGirildi ? 'OGRENCI10' : null;

  if (kuponKodu != null) {
    print('Kupon uygulandı: $kuponKodu (${kuponKodu.length} karakter)');
  } else {
    print('Kupon girilmedi.');
  }
}
