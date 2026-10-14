// Dosya: 03_02_coklu_arayuz.dart
abstract class Paylasilabilir {
  String paylasimMetni();
}

abstract class Kaydedilebilir {
  Map<String, dynamic> toMap();
}

class Gorev implements Paylasilabilir, Kaydedilebilir {
  final String baslik;
  bool tamamlandi;

  Gorev(this.baslik, {this.tamamlandi = false});

  @override
  String paylasimMetni() => tamamlandi ? 'Tamamlandı: $baslik' : 'Yapılacak: $baslik';

  @override
  Map<String, dynamic> toMap() => {'baslik': baslik, 'tamamlandi': tamamlandi};
}

void main() {
  Gorev g = Gorev('Flutter ödevini bitir');
  print(g.paylasimMetni());
  g.tamamlandi = true;
  print(g.paylasimMetni());
  print(g.toMap());

  Paylasilabilir p = g;
  print(p is Kaydedilebilir);
}
