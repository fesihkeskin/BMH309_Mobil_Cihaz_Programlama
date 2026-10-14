// Dosya: 02_01_dagik_veri.dart
// ❌ ÇALIŞMA ZAMANI HATASI: Listelerden biri güncellenmeyi unuttu.
void main() {
  List<String> adlar = ['Süt', 'Ekmek', 'Peynir'];
  List<double> fiyatlar = [32.50, 15.00, 145.00];
  List<int> stoklar = [12, 0, 5];

  // Yeni ürün: üç listeyi birden güncellemek gerekiyor
  adlar.add('Zeytin');
  fiyatlar.add(120.00);
  // stoklar.add(...) unutuldu!

  for (int i = 0; i < adlar.length; i++) {
    print('${adlar[i]}: ${fiyatlar[i]} TL, stok: ${stoklar[i]}');
  }
}
