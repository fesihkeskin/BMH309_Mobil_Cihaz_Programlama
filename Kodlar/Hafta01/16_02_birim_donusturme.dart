// Dosya: 16_02_birim_donusturme.dart
void main() {
  const double kmMilOrani = 0.621371;

  double mesafeKm = 42.195;
  double mesafeMil = mesafeKm * kmMilOrani;

  double sicaklikC = 36.6;
  double sicaklikF = sicaklikC * 9 / 5 + 32;

  print('${mesafeKm.toStringAsFixed(2)} km = ${mesafeMil.toStringAsFixed(2)} mil');
  print('${sicaklikC.toStringAsFixed(2)} °C = ${sicaklikF.toStringAsFixed(2)} °F');
}
