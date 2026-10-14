// Dosya: 10_03_pin_simulasyon.dart
void main() {
  String dogruPin = '2580';
  int deneme = 0;
  String girilen;

  do {
    deneme++;
    // Simülasyon: Kullanıcının sırasıyla girdiği PIN'ler
    girilen = deneme == 1 ? '1111' : deneme == 2 ? '1234' : '2580';
    print('Deneme $deneme: $girilen');
  } while (girilen != dogruPin && deneme < 3);

  print(girilen == dogruPin ? 'Kilit açıldı.' : 'Çok fazla hatalı deneme!');
}
