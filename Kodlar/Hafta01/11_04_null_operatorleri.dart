// Dosya: 11_04_null_operatorleri.dart
void main() {
  String? profilFoto;

  print(profilFoto ?? 'varsayilan_avatar.png');
  print(profilFoto?.length);

  profilFoto ??= 'varsayilan_avatar.png';
  print(profilFoto);
}
