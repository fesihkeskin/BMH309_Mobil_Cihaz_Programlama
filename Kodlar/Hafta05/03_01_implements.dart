// Dosya: 03_01_implements.dart
abstract class Paylasilabilir {
  String paylasimMetni();
}

class Urun implements Paylasilabilir {
  final String ad;
  final double fiyat;

  Urun(this.ad, this.fiyat);

  @override
  String paylasimMetni() => '$ad sadece ${fiyat.toStringAsFixed(2)} TL! Cep Market\'te.';
}

class Konum implements Paylasilabilir {
  final String ad;
  final double enlem;
  final double boylam;

  Konum(this.ad, this.enlem, this.boylam);

  @override
  String paylasimMetni() => 'Buradayım: $ad ($enlem, $boylam)';
}

class Basari implements Paylasilabilir {
  final int adim;

  Basari(this.adim);

  @override
  String paylasimMetni() => 'Bugün $adim adım attım!';
}

void paylas(Paylasilabilir icerik) {
  print('[Paylaş] ${icerik.paylasimMetni()}');
}

void main() {
  paylas(Urun('Kulaklık', 749.9));
  paylas(Konum('Siirt Merkez', 37.93, 41.94));
  paylas(Basari(12100));
}
