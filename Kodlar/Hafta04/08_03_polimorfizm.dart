// Dosya: 08_03_polimorfizm.dart
class Bildirim {
  String baslik;

  Bildirim(this.baslik);

  String goster() => '[Bildirim] $baslik';
  int oncelik() => 1;
}

class MesajBildirimi extends Bildirim {
  String gonderen;

  MesajBildirimi(super.baslik, this.gonderen);

  @override
  String goster() => '[Mesaj] $gonderen: $baslik';

  @override
  int oncelik() => 2;
}

class GuvenlikBildirimi extends Bildirim {
  GuvenlikBildirimi(super.baslik);

  @override
  String goster() => '[GÜVENLİK] $baslik';

  @override
  int oncelik() => 3;
}

void main() {
  List<Bildirim> bildirimler = [
    Bildirim('Uygulama güncellendi'),
    MesajBildirimi('Akşam toplantı var mı?', 'Ayşe'),
    GuvenlikBildirimi('Yeni cihazdan giriş yapıldı'),
    MesajBildirimi('Ödev dosyası ekte', 'Mert'),
  ];

  int toplamOncelik = 0;
  for (Bildirim b in bildirimler) {
    print(b.goster());
    toplamOncelik += b.oncelik();
  }
  print('Toplam öncelik puanı: $toplamOncelik');
}
