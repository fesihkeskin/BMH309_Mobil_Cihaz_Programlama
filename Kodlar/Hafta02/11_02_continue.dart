// Dosya: 11_02_continue.dart
void main() {
  for (int saat = 0; saat < 24; saat += 3) {
    String saatMetni = '${saat.toString().padLeft(2, '0')}:00';

    if (saat >= 23 || saat < 7) {
      print('$saatMetni → sessiz saat, atlandı');
      continue;
    }

    print('$saatMetni → su içme hatırlatması gönderildi');
  }
}
