// Dosya: 03_02_arrow_ifadeler.dart
String bildirimMetni(int adet) => adet == 0 ? 'Yeni bildirim yok' : '$adet yeni bildirim';

String durumMesaji(int kod) => switch (kod) {
  200 => 'Başarılı',
  404 => 'Bulunamadı',
  >= 500 => 'Sunucu hatası',
  _ => 'Bilinmeyen durum',
};

String saatFormatla(int saat, int dakika) =>
    '${saat.toString().padLeft(2, '0')}:${dakika.toString().padLeft(2, '0')}';

void main() {
  print(bildirimMetni(0));
  print(bildirimMetni(4));
  print(durumMesaji(404));
  print(durumMesaji(503));
  print(saatFormatla(9, 5));
}
