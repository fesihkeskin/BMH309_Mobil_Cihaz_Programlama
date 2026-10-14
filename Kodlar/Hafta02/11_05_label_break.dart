// Dosya: 11_05_label_break.dart
void main() {
  int satirSayisi = 3;
  int sutunSayisi = 4;
  int arananIndeks = 6; // Ana ekrandaki 7. simge

  arama:
  for (int satir = 0; satir < satirSayisi; satir++) {
    for (int sutun = 0; sutun < sutunSayisi; sutun++) {
      int indeks = satir * sutunSayisi + sutun;
      print('Kontrol: satır $satir, sütun $sutun (indeks $indeks)');

      if (indeks == arananIndeks) {
        print('Bulundu! Simge $satir. satır, $sutun. sütunda.');
        break arama; // DIŞ döngüden de çıkar
      }
    }
  }

  print('Arama tamamlandı.');
}
