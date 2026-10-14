// Dosya: 02_16_ozyineleme.dart
int faktoriyel(int n) {
  if (n <= 1) {
    return 1; // Durma koşulu
  }
  return n * faktoriyel(n - 1);
}

void geriSay(int saniye) {
  if (saniye == 0) {
    print('Başla!');
    return; // Durma koşulu
  }
  print(saniye);
  geriSay(saniye - 1);
}

void main() {
  print('5! = ${faktoriyel(5)}');
  geriSay(3);
}
