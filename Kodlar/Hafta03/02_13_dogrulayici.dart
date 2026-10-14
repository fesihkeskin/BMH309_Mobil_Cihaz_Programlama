// Dosya: 02_13_dogrulayici.dart
String? epostaDogrula(String eposta) {
  String temiz = eposta.trim();
  if (temiz.isEmpty) {
    return 'E-posta boş olamaz.';
  }
  if (!temiz.contains('@') || !temiz.contains('.')) {
    return 'Geçerli bir e-posta adresi girin.';
  }
  return null; // null = hata yok
}

void main() {
  print(epostaDogrula(''));
  print(epostaDogrula('ayse'));
  print(epostaDogrula('ayse@ornek.com'));

  String? hata = epostaDogrula('mert@ornek.com');
  print(hata ?? 'E-posta geçerli, kayıt devam ediyor.');
}
