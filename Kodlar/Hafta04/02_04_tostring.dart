// Dosya: 02_04_tostring.dart
class Urun {
  String ad = '';
  double fiyat = 0;
}

class Konum {
  double enlem = 0;
  double boylam = 0;

  @override
  String toString() => 'Konum($enlem, $boylam)';
}

void main() {
  Urun u = Urun();
  u.ad = 'Süt';
  print(u);

  Konum k = Konum();
  k.enlem = 37.93;
  k.boylam = 41.94;
  print(k);
  print('Teslimat noktası: $k');
}
