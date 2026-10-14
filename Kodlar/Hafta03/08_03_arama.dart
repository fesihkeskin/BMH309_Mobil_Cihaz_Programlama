// Dosya: 08_03_arama.dart
void main() {
  List<String> bildirimler = ['Kargo', 'Kampanya', 'Mesaj', 'Kampanya', 'Güvenlik'];

  print(bildirimler.length);
  print(bildirimler.first);
  print(bildirimler.last);
  print(bildirimler.contains('Mesaj'));
  print(bildirimler.contains('Fatura'));
  print(bildirimler.indexOf('Kampanya'));
  print(bildirimler.lastIndexOf('Kampanya'));
  print(bildirimler.indexOf('Fatura'));
  print(bildirimler.isEmpty);
  print(bildirimler.isNotEmpty);
}
