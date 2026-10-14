// Dosya: 11_03_while_true.dart
void main() {
  int indirilen = 0;
  int dosyaBoyutu = 100;

  while (true) {
    indirilen += 30;

    if (indirilen >= dosyaBoyutu) {
      print('İndirme tamamlandı (%100).');
      break;
    }

    print('İndiriliyor... %$indirilen');
  }
}
