// Dosya: 07_03_sealed_odeme.dart
sealed class Odeme {
  final double tutar;

  Odeme(this.tutar);
}

class KrediKarti extends Odeme {
  final int taksit;

  KrediKarti(super.tutar, {this.taksit = 1});
}

class Havale extends Odeme {
  Havale(super.tutar);
}

class CepCuzdan extends Odeme {
  CepCuzdan(super.tutar);
}

double ucret(Odeme o) => switch (o) {
      KrediKarti k => k.tutar * 0.02 + (k.taksit > 1 ? k.tutar * 0.03 : 0.0),
      Havale _ => 5.0,
      CepCuzdan _ => 0.0,
    };

void main() {
  List<Odeme> odemeler = [KrediKarti(1200, taksit: 3), Havale(800), CepCuzdan(150)];
  for (Odeme o in odemeler) {
    print('${o.runtimeType}: ${ucret(o).toStringAsFixed(2)} TL');
  }
}
