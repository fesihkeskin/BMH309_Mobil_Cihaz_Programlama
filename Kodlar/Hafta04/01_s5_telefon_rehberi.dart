// Dosya: 01_s5_telefon_rehberi.dart
import 'dart:io';

String metinOku(String soru) {
  stdout.write(soru);
  return (stdin.readLineSync() ?? '').trim();
}

bool telefonGecerliMi(String no) {
  if (no.length != 10 && no.length != 11) {
    return false;
  }
  for (String karakter in no.split('')) {
    if (!'0123456789'.contains(karakter)) {
      return false;
    }
  }
  return true;
}

String telefonFormatla(String no) {
  if (no.length != 11) {
    return no;
  }
  return '${no.substring(0, 4)} ${no.substring(4, 7)} ${no.substring(7, 9)} ${no.substring(9)}';
}

bool kisiEkle(Map<String, String> rehber, String ad, String telefon) {
  bool yeniMi = !rehber.containsKey(ad);
  rehber[ad] = telefon;
  return yeniMi;
}

List<String> kisiAra(Map<String, String> rehber, String aranan) {
  String kucukAranan = aranan.toLowerCase();
  List<String> bulunanlar = [];
  for (String ad in rehber.keys) {
    if (ad.toLowerCase().contains(kucukAranan)) {
      bulunanlar.add(ad);
    }
  }
  return bulunanlar;
}

void rehberiListele(Map<String, String> rehber) {
  if (rehber.isEmpty) {
    print('Rehber boş.');
    return;
  }
  List<String> adlar = rehber.keys.toList();
  adlar.sort();
  for (int i = 0; i < adlar.length; i++) {
    print('${i + 1}. ${adlar[i]}: ${telefonFormatla(rehber[adlar[i]] ?? '')}');
  }
}

void main() {
  Map<String, String> rehber = {'Ayşe': '05321112233', 'Mert': '05449998877'};

  menu:
  while (true) {
    print('');
    print('--- REHBER (${rehber.length} kişi) ---');
    print('1) Kişi ekle / güncelle');
    print('2) Kişi ara');
    print('3) Kişi sil');
    print('4) Rehberi listele');
    print('0) Çıkış');
    String secim = metinOku('Seçiminiz: ');

    switch (secim) {
      case '1':
        String ad = metinOku('Ad: ');
        if (ad.isEmpty) {
          print('Ad boş olamaz.');
        } else {
          String telefon = metinOku('Telefon: ').replaceAll(' ', '');
          if (!telefonGecerliMi(telefon)) {
            print('Geçersiz telefon numarası.');
          } else if (kisiEkle(rehber, ad, telefon)) {
            print('"$ad" eklendi.');
          } else {
            print('"$ad" güncellendi.');
          }
        }
      case '2':
        List<String> bulunanlar = kisiAra(rehber, metinOku('Aranacak ad: '));
        if (bulunanlar.isEmpty) {
          print('Kişi bulunamadı.');
        } else {
          for (String kisi in bulunanlar) {
            print('$kisi: ${telefonFormatla(rehber[kisi] ?? '')}');
          }
        }
      case '3':
        String silinecek = metinOku('Silinecek ad: ');
        if (rehber.remove(silinecek) == null) {
          print('Kişi bulunamadı.');
        } else {
          print('"$silinecek" silindi.');
        }
      case '4':
        rehberiListele(rehber);
      case '0':
        print('Rehberde ${rehber.length} kişi var. Güle güle!');
        break menu;
      default:
        print('Geçersiz seçim.');
    }
  }
}
