// Dosya: 10_07_json_onizleme.dart
void main() {
  Map<String, dynamic> kullanici = {
    'id': 7,
    'ad': 'Ayşe',
    'premium': true,
    'puan': 4.8,
    'ilgiAlanlari': ['müzik', 'yazılım'],
  };

  print(kullanici['ad']);
  print(kullanici['ilgiAlanlari']);
  print(kullanici.keys);
}
