// Dosya: 02_11_kapsam.dart
const String uygulamaAdi = 'Cep Market'; // Üst düzey sabit: her yerden erişilir
int ziyaretSayisi = 0;                   // Üst düzey değişken

void ziyaretKaydet(String sayfa) {
  ziyaretSayisi++;
  String mesaj = '$uygulamaAdi > $sayfa sayfası açıldı'; // Yerel değişken
  print('$mesaj (toplam ziyaret: $ziyaretSayisi)');
}

void main() {
  ziyaretKaydet('Ana Sayfa');
  ziyaretKaydet('Sepet');
  print('$uygulamaAdi: toplam $ziyaretSayisi sayfa görüntülendi.');
  // print(mesaj); // HATA: 'mesaj' yalnızca ziyaretKaydet içinde tanımlı
}
