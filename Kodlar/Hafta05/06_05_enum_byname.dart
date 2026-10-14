// Dosya: 06_05_enum_byname.dart
enum SiparisDurumu { hazirlaniyor, kargoda, teslimEdildi, iptal }

class Siparis {
  final String no;
  final SiparisDurumu durum;

  Siparis(this.no, this.durum);

  Siparis.fromMap(Map<String, dynamic> veri)
      : no = veri['no'] as String,
        durum = SiparisDurumu.values.byName(veri['durum'] as String);

  Map<String, dynamic> toMap() => {'no': no, 'durum': durum.name};
}

void main() {
  Siparis s = Siparis.fromMap({'no': 'SP-1024', 'durum': 'kargoda'});
  print('${s.no}: ${s.durum}');
  print(s.durum == SiparisDurumu.kargoda);
  print(s.toMap());
}
