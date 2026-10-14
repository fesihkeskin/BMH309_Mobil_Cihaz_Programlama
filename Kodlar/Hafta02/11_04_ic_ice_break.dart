// Dosya: 11_04_ic_ice_break.dart
void main() {
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (j == 2) {
        break; // Yalnızca İÇ döngüden çıkar
      }
      print('i = $i, j = $j');
    }
  }
}
