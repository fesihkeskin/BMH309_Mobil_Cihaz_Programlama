// Dosya: 12_05_double_virgul.dart
import 'dart:io';

void main() {
  stdout.write('Ürün fiyatı (TL): ');
  String girdi = (stdin.readLineSync() ?? '').trim();

  // Türkçede ondalık ayırıcı virgüldür ("49,90"); Dart ise nokta bekler ("49.90").
  String duzeltilmis = girdi.replaceAll(',', '.');
  double? fiyat = double.tryParse(duzeltilmis);

  if (fiyat == null || fiyat < 0) {
    print('Geçerli bir fiyat girin.');
  } else {
    double kdvli = fiyat * 1.20;
    print('KDV dahil fiyat: ${kdvli.toStringAsFixed(2)} TL');
  }
}
