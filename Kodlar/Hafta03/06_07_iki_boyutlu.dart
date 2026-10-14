// Dosya: 06_07_iki_boyutlu.dart
void main() {
  // 0: boş koltuk, 1: dolu koltuk
  List<List<int>> koltuklar = [
    [1, 1, 0, 0, 1],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 1, 1],
  ];
  List<String> siraAdlari = ['A', 'B', 'C'];

  print('Perde');
  print('=' * 17);
  int bosKoltuk = 0;

  for (int sira = 0; sira < koltuklar.length; sira++) {
    String satir = '${siraAdlari[sira]} ';
    for (int no = 0; no < koltuklar[sira].length; no++) {
      if (koltuklar[sira][no] == 0) {
        satir += '[ ]';
        bosKoltuk++;
      } else {
        satir += '[X]';
      }
    }
    print(satir);
  }

  print('Boş koltuk sayısı: $bosKoltuk');
  print('B3 koltuğu: ${koltuklar[1][2] == 0 ? 'boş' : 'dolu'}');
}
