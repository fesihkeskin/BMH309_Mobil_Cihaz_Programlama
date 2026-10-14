// Dosya: 03_09_tuzak_sira.dart
// ❌ MANTIK HATASI: Kritik pil uyarısına asla ulaşılamaz.
void main() {
  int pilSeviyesi = 3;

  if (pilSeviyesi <= 20) {
    print('Düşük pil');
  } else if (pilSeviyesi <= 5) {
    print('KRİTİK pil!');
  } else {
    print('Pil iyi');
  }
}
