// Dosya: 08_07_ic_ice_for.dart
void main() {
  int satirSayisi = 3;
  int sutunSayisi = 4;

  for (int satir = 0; satir < satirSayisi; satir++) {
    String satirMetni = '';
    for (int sutun = 0; sutun < sutunSayisi; sutun++) {
      int indeks = satir * sutunSayisi + sutun;
      satirMetni += '[${indeks.toString().padLeft(2)}] ';
    }
    print(satirMetni);
  }
}
