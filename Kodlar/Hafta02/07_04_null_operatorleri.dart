// Dosya: 07_04_null_operatorleri.dart
void main() {
  bool fotoYuklendi = false;
  String? profilFoto = fotoYuklendi ? 'ayse.jpg' : null;

  print(profilFoto ?? 'varsayilan_avatar.png');
  print(profilFoto?.length);

  profilFoto ??= 'varsayilan_avatar.png';
  print(profilFoto);
}
