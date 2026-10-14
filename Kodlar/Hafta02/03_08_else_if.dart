// Dosya: 03_08_else_if.dart
void main() {
  int pilSeviyesi = 18;
  bool sarjOluyor = false;

  if (sarjOluyor) {
    print('Şarj oluyor (%$pilSeviyesi)');
  } else if (pilSeviyesi <= 5) {
    print('KRİTİK! Cihaz kapanmak üzere.');
  } else if (pilSeviyesi <= 20) {
    print('Düşük pil: Güç tasarrufu modu önerilir.');
  } else {
    print('Pil durumu iyi (%$pilSeviyesi)');
  }
}
