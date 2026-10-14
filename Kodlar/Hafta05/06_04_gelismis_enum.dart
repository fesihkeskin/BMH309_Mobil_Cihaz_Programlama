// Dosya: 06_04_gelismis_enum.dart
enum OdemeYontemi {
  krediKarti('Kredi Kartı', 0.02, 0),
  havale('Havale/EFT', 0, 5),
  kapidaOdeme('Kapıda Ödeme', 0, 25),
  cepCuzdan('Cep Cüzdan', 0, 0);

  const OdemeYontemi(this.ad, this.oran, this.sabitUcret);

  final String ad;
  final double oran;
  final double sabitUcret;

  double ucret(double tutar) => tutar * oran + sabitUcret;

  bool get ucretsizMi => oran == 0 && sabitUcret == 0;
}

void main() {
  double tutar = 450;
  for (OdemeYontemi y in OdemeYontemi.values) {
    String not = y.ucretsizMi ? ' (ücretsiz)' : '';
    print('${y.ad.padRight(13)}: ${y.ucret(tutar).toStringAsFixed(2)} TL$not');
  }
}
