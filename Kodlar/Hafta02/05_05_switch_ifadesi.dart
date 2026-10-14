// Dosya: 05_05_switch_ifadesi.dart
void main() {
  int durumKodu = 404;

  String mesaj = switch (durumKodu) {
    200 => 'İşlem başarılı.',
    401 || 403 => 'Yetkiniz yok, lütfen tekrar giriş yapın.',
    404 => 'Aradığınız içerik bulunamadı.',
    500 => 'Sunucu hatası, daha sonra tekrar deneyin.',
    _ => 'Beklenmeyen durum: $durumKodu',
  };

  print(mesaj);
}
