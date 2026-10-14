// Dosya: 12_01_rapor_dongu.dart
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
  int teslimSayisi = 0;
  double teslimToplam = 0;
  int iptalSayisi = 0;
  Siparis? enYuksek;
  Map<SiparisDurumu, int> sayac = {};

  for (Siparis s in siparisler) {
    sayac[s.durum] = (sayac[s.durum] ?? 0) + 1;
    if (s.durum == SiparisDurumu.teslimEdildi) {
      teslimSayisi++;
      teslimToplam += s.tutar;
      if (enYuksek == null || s.tutar > enYuksek.tutar) {
        enYuksek = s;
      }
    } else if (s.durum == SiparisDurumu.iptal) {
      iptalSayisi++;
    }
  }

  String durumlar = '';
  for (SiparisDurumu d in SiparisDurumu.values) {
    if (durumlar.isNotEmpty) {
      durumlar += ', ';
    }
    durumlar += '${d.etiket} ${sayac[d] ?? 0}';
  }

  print('Teslim edilen sipariş: $teslimSayisi');
  print('Teslim edilen toplam : ${teslimToplam.toStringAsFixed(2)} TL');
  print('Ortalama sepet       : ${(teslimToplam / teslimSayisi).toStringAsFixed(2)} TL');
  if (enYuksek != null) {
    print('En yüksek teslim     : #${enYuksek.no} (${enYuksek.tutar.toStringAsFixed(2)} TL)');
  }
  print('İptal oranı          : %${(iptalSayisi / siparisler.length * 100).toStringAsFixed(1)}');
  print('Durumlara göre       : $durumlar');
}
