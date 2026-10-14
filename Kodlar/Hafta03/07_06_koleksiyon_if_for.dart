// Dosya: 07_06_koleksiyon_if_for.dart
void main() {
  bool girisYapti = true;
  bool yonetici = false;
  List<String> kategoriler = ['Meyve', 'Sebze', 'Süt Ürünleri'];
  List<String> sabitMenu = ['Ayarlar', 'Yardım'];

  List<String> menu = [
    'Ana Sayfa',
    for (var k in kategoriler) 'Kategori: $k',
    if (girisYapti) 'Profilim' else 'Giriş Yap',
    if (yonetici) 'Yönetim Paneli',
    ...sabitMenu,
  ];

  for (var oge in menu) {
    print(oge);
  }
}
