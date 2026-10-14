// Dosya: 08_08_dongu_ile_islemler.dart
void main() {
  List<int> fiyatlar = [120, 45, 300, 80, 15];

  // Filtreleme: 100 TL altındakiler
  List<int> ucuzlar = [];
  for (int f in fiyatlar) {
    if (f < 100) {
      ucuzlar.add(f);
    }
  }
  print('100 TL altı: $ucuzlar');

  // Aynı filtreleme, koleksiyon içi for ve if ile tek satırda:
  List<int> ucuzlar2 = [for (int f in fiyatlar) if (f < 100) f];
  print('100 TL altı: $ucuzlar2');

  // Dönüştürme: her fiyatın KDV dahil metni
  List<String> etiketler = [];
  for (int f in fiyatlar) {
    etiketler.add('${(f * 1.2).toStringAsFixed(2)} TL');
  }
  print('KDV dahil: $etiketler');

  // Sayma: 100 TL ve üzeri kaç ürün var?
  int pahaliSayisi = 0;
  for (int f in fiyatlar) {
    if (f >= 100) pahaliSayisi++;
  }
  print('100 TL ve üzeri: $pahaliSayisi ürün');
}
