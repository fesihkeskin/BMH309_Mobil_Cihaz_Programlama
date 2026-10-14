// Dosya: 12_03_rapor_gruplama.dart
enum SiparisDurumu {
  hazirlaniyor('Hazırlanıyor'),
  kargoda('Kargoda'),
  teslimEdildi('Teslim edildi'),
  iptal('İptal');

  const SiparisDurumu(this.etiket);

  final String etiket;
}

class Siparis {
  final int no;
  final double tutar;
  final SiparisDurumu durum;

  Siparis(this.no, this.tutar, this.durum);
}

final List<Siparis> siparisler = [
  Siparis(1001, 249.90, SiparisDurumu.teslimEdildi),
  Siparis(1002, 89.50, SiparisDurumu.iptal),
  Siparis(1003, 749.90, SiparisDurumu.teslimEdildi),
  Siparis(1004, 1205.00, SiparisDurumu.kargoda),
  Siparis(1005, 312.40, SiparisDurumu.teslimEdildi),
  Siparis(1006, 59.90, SiparisDurumu.iptal),
  Siparis(1007, 512.20, SiparisDurumu.teslimEdildi),
  Siparis(1008, 145.00, SiparisDurumu.kargoda),
];

void main() {
  Map<SiparisDurumu, List<Siparis>> gruplar = {};
  for (Siparis s in siparisler) {
    gruplar.putIfAbsent(s.durum, () => []).add(s);
  }

  List<Siparis> teslimler = gruplar[SiparisDurumu.teslimEdildi] ?? [];
  List<Siparis> iptaller = gruplar[SiparisDurumu.iptal] ?? [];
  double teslimToplam = teslimler.fold(0.0, (toplam, s) => toplam + s.tutar);
  Siparis enYuksek = teslimler.reduce((a, b) => a.tutar >= b.tutar ? a : b);
  String durumlar = SiparisDurumu.values.map((d) => '${d.etiket} ${gruplar[d]?.length ?? 0}').join(', ');

  print('Teslim edilen sipariş: ${teslimler.length}');
  print('Teslim edilen toplam : ${teslimToplam.toStringAsFixed(2)} TL');
  print('Ortalama sepet       : ${(teslimToplam / teslimler.length).toStringAsFixed(2)} TL');
  print('En yüksek teslim     : #${enYuksek.no} (${enYuksek.tutar.toStringAsFixed(2)} TL)');
  print('İptal oranı          : %${(iptaller.length / siparisler.length * 100).toStringAsFixed(1)}');
  print('Durumlara göre       : $durumlar');
}
