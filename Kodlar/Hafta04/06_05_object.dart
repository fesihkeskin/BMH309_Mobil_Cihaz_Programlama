// Dosya: 06_05_object.dart
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  Elektronik(super.ad);
}

void main() {
  Elektronik e = Elektronik('Kulaklık');
  print(e.runtimeType);
  print(e.toString());
  print(e.ad);
}
