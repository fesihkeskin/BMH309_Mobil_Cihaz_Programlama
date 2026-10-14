// Dosya: 07_02_tuzak_sealed_eksik.dart
// ❌ DERLEME HATASI
sealed class EkranDurumu {}

class Yukleniyor extends EkranDurumu {}

class Basarili extends EkranDurumu {
  final List<String> urunler;

  Basarili(this.urunler);
}

class Hata extends EkranDurumu {
  final String mesaj;

  Hata(this.mesaj);
}

String ekraniCiz(EkranDurumu durum) => switch (durum) {
      Yukleniyor _ => 'Yükleniyor...',
      Basarili b => 'Ürünler: ${b.urunler.join(', ')}',
    };

void main() {
  print(ekraniCiz(Hata('Sunucu yanıt vermedi')));
}
