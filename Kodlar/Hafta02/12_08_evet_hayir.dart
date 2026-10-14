// Dosya: 12_08_evet_hayir.dart
import 'dart:io';

void main() {
  stdout.write('Bildirimlere izin vermek istiyor musunuz? (e/h): ');
  String cevap = (stdin.readLineSync() ?? '').trim().toLowerCase();

  switch (cevap) {
    case 'e' || 'evet':
      print('Bildirimler açıldı.');
    case 'h' || 'hayır' || 'hayir':
      print('Bildirimler kapalı. Ayarlardan daha sonra açabilirsiniz.');
    default:
      print('Cevap anlaşılamadı; bildirimler kapalı bırakıldı.');
  }
}
