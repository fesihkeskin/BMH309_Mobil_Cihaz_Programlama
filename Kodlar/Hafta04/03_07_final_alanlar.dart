// Dosya: 03_07_final_alanlar.dart
class Konum {
  final double enlem;
  final double boylam;

  const Konum(this.enlem, this.boylam);

  @override
  String toString() => '($enlem, $boylam)';
}

class Siparis {
  final String siparisNo;
  final double tutar;
  String durum;

  Siparis(this.siparisNo, this.tutar, {this.durum = 'Hazırlanıyor'});
}

void main() {
  const Konum magaza = Konum(37.93, 41.94);
  print('Mağaza konumu: $magaza');

  Siparis s = Siparis('SP-1024', 289.90);
  print('${s.siparisNo}: ${s.tutar.toStringAsFixed(2)} TL - ${s.durum}');
  s.durum = 'Kargoda';
  print('${s.siparisNo}: ${s.tutar.toStringAsFixed(2)} TL - ${s.durum}');
}
