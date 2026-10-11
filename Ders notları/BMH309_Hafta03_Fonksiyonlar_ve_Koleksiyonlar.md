# <font color='blue'>**Hafta 3 · Fonksiyonlar ve Koleksiyonlar**</font>

---
**Ders:** BMH309 Mobil Cihaz Programlama
**Konular:** Ödev 1 çözümleri · Fonksiyon kavramı · Kısa gösterim (fat arrow) · İsteğe bağlı ve isimlendirilmiş parametreler · Dizi kavramı ve sabit uzunluklu listeler · Dinamik listeler · Liste metotları · Set · Map
**Yazar:** Dr. Öğr. Üyesi Fesih Keskin

---

# Giriş

Geçen hafta programlarımıza karar verme ve tekrar etme yeteneği kazandırdık. Ama Ödev 1'i çözerken muhtemelen bir şey dikkatinizi çekti: Kullanıcıdan sayı okuyan **aynı satırları** her programda, hatta aynı programın içinde defalarca yazdık. Ayrıca bir sınıftaki 40 öğrencinin notunu tutmak için 40 ayrı değişken tanımlamak zorunda kalsaydık ne yapardık?

Bu hafta bu iki sorunu çözüyoruz:

1. **Fonksiyonlar** ile bir kodu bir kez yazıp istediğimiz yerden, istediğimiz kadar kullanacağız.
2. **Koleksiyonlar** (List, Set, Map) ile birbiriyle ilgili çok sayıda değeri tek bir isim altında tutacağız.

Flutter'da her ekran fonksiyonlardan, ekrandaki her liste de koleksiyonlardan oluşur. Bu haftanın konuları, Flutter'a geçtiğimizde en çok kullanacağınız yapılardır.

### Bu Haftanın Hedefleri

Bu haftanın sonunda şunları yapabiliyor olmalısınız:

1. Fonksiyon tanımlayıp çağırmak; parametre, argüman ve dönüş değeri kavramlarını açıklamak.
2. Değişkenlerin kapsamını (yerel / üst düzey) ayırt etmek.
3. Tek ifadelik fonksiyonları `=>` ile kısa yazmak.
4. Zorunlu, isteğe bağlı konumsal (`[ ]`) ve isimlendirilmiş (`{ }`, `required`) parametreleri kullanmak.
5. Sabit ve dinamik uzunluklu listeler oluşturmak; indeksle erişmek; listeleri döngülerle dolaşmak.
6. Liste metotlarını (ekleme, silme, arama, sıralama, parçalama) kullanmak; listelerin **referans** davranışını açıklamak.
7. Tekrarsız veriler için `Set`, anahtar–değer eşleşmeleri için `Map` kullanmak.
8. Koleksiyonları parametre olarak alan ve döndüren fonksiyonlar yazmak.

### Bu Haftanın AI Kuralı

> **Hafta 1–5: "AI açıklar, siz yazarsınız."**
> - AI'ı kavram sormak, hata mesajlarını açıklatmak ve kodunuzu okutmak için kullanabilirsiniz.
> - AI'a kod yazdırmak veya dosyalarınızı değiştirtmek **yasaktır**. Claude Code'u plan modunda kullanınız.
> - Sınıf içi mini görevler AI kapalı yapılır.
> - AI yanılabilir; şüphelendiğiniz her bilgiyi dart.dev'den doğrulayınız.

### Başlamadan Önce

- Bu hafta için `C:\dev\bmh309\hafta3` klasörünü oluşturup VS Code'da açın.
- Her kod bloğu tek başına çalışan tam bir programdır ve ilk satırında önerilen dosya adı yazar (`// Dosya: ...`).
- **Klavyeden veri alan programları** terminalden çalıştırın (`dart run dosya_adi.dart`) veya VS Code'da `dart.cliConsole` ayarını `terminal` yapın. Debug Console klavyeden veri kabul etmez.
- ❌ işaretli bloklar bilerek hatalıdır; hata mesajını görmeniz için verilmiştir.

---

# İçindekiler

1. [Ödev 1 Çözümleri](#1-ödev-1-çözümleri)
2. [Fonksiyon Kavramı](#2-fonksiyon-kavramı)
3. [Kısa Gösterim: Fat Arrow (=>)](#3-kısa-gösterim-fat-arrow-)
4. [İsteğe Bağlı ve İsimlendirilmiş Parametreler](#4-isteğe-bağlı-ve-isimlendirilmiş-parametreler)
5. [Fonksiyonlar: Bölüm Sonu Soru ve Cevapları](#5-fonksiyonlar-bölüm-sonu-soru-ve-cevapları)
6. [Dizi Kavramı ve Sabit Uzunluklu Listeler](#6-dizi-kavramı-ve-sabit-uzunluklu-listeler)
7. [Dinamik Uzunluklu Listeler](#7-dinamik-uzunluklu-listeler)
8. [Listelerle İlgili Metotlar](#8-listelerle-ilgili-metotlar)
9. [Set: Tekrarsız Koleksiyon](#9-set-tekrarsız-koleksiyon)
10. [Map: Anahtar–Değer Koleksiyonu](#10-map-anahtardeğer-koleksiyonu)
11. [Hepsini Birleştirelim: Cep Market Sepet Özeti](#11-hepsini-birleştirelim-cep-market-sepet-özeti)
12. [Örnek Problem ve Farklı Çözüm Yolları](#12-örnek-problem-ve-farklı-çözüm-yolları)
13. [Özet](#13-özet)
14. [Koleksiyonlar: Kendinizi Test Edin](#14-koleksiyonlar-kendinizi-test-edin)
15. [Ödev 2](#15-ödev-2)
16. [Kaynaklar](#16-kaynaklar)

---

# 1. Ödev 1 Çözümleri

Bu bölümde geçen haftanın ödev sorularının birer örnek çözümünü veriyoruz. **Sizin çözümünüz farklı olabilir.** Kurallar sağlanıyor, çıktı beklenen çıktıyla aynıysa ve program hatalı girdide çökmüyorsa çözümünüz doğrudur.

> Tüm çözümler klavyeden veri alır; **terminalden** çalıştırın.

Çözümleri okurken şuna dikkat edin: Her programın başında "soruyu yaz, satırı oku, boşlukları temizle, sayıya çevir" işini yapan **neredeyse aynı satırlar** var. Bu tekrarı Bölüm 2'de fonksiyonlarla ortadan kaldıracağız.

## Soru 1 — Pil Tasarruf Simülasyonu

**Çözümün mantığı:**
- Girilen değer doğrulandıktan sonra **null olmayan** ayrı bir değişkene (`pil`) aktarılır. Böylece döngü içinde rahatça değiştirilebilir.
- Her dakikanın başında pilin o anki değerine bakılarak 4 mü 2 mi azalacağına karar verilir.
- Güç tasarrufu mesajının **bir kez** yazılması için `tasarrufModu` adında bir bayrak (flag) değişkeni kullanılır.

```dart
// Dosya: 01_s1_pil_simulasyonu.dart
import 'dart:io';

void main() {
  stdout.write('Başlangıç pil seviyesi (1-100): ');
  int? girilen = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (girilen == null || girilen < 1 || girilen > 100) {
    print('Lütfen 1 ile 100 arasında bir sayı girin.');
    return;
  }

  int pil = girilen;
  int dakika = 0;
  bool tasarrufModu = pil <= 20;

  if (tasarrufModu) {
    print('Güç tasarrufu modu açıldı.');
  }

  while (pil > 0) {
    dakika++;
    pil -= pil > 20 ? 4 : 2;
    if (pil < 0) {
      pil = 0;
    }
    print('$dakika. dk: %$pil');

    if (!tasarrufModu && pil <= 20) {
      tasarrufModu = true;
      print('Güç tasarrufu modu açıldı.');
    }
  }

  print('Cihaz kapandı. Toplam süre: $dakika dakika.');
}
```

**Örnek çalışma:**

```text
Başlangıç pil seviyesi (1-100): 30
1. dk: %26
2. dk: %22
3. dk: %18
Güç tasarrufu modu açıldı.
4. dk: %16
5. dk: %14
6. dk: %12
7. dk: %10
8. dk: %8
9. dk: %6
10. dk: %4
11. dk: %2
12. dk: %0
Cihaz kapandı. Toplam süre: 12 dakika.
```

**Açıklama:** `int pil = girilen;` satırı önemlidir. `girilen` bir `int?`'dir; null kontrolünden sonra Dart onu `int` kabul eder. Ancak bir değişken **döngünün içinde değiştiriliyorsa**, Dart döngünün başında bu kabulü güvenli bulmayabilir ve değişkeni yeniden "null olabilir" sayabilir. Değeri baştan null olamayan `int` tipindeki bir değişkene aktarmak bu sorunu tamamen ortadan kaldırır.

## Soru 2 — Kargo Ücreti Hesaplayıcı

**Çözümün mantığı:** Üç girdi de alındıktan sonra kurallar soruda verilen sırayla uygulanır. Hatalı durumlar erken çıkışla (`return`) ele alınır. Bölge ücreti switch ifadesiyle belirlenir.

```dart
// Dosya: 01_s2_kargo_ucreti.dart
import 'dart:io';

void main() {
  stdout.write('Sepet tutarı (TL): ');
  double? tutar = double.tryParse((stdin.readLineSync() ?? '').trim().replaceAll(',', '.'));

  stdout.write('Bölge (1: Şehir içi, 2: Yurt içi, 3: Uzak bölge): ');
  int? bolge = int.tryParse((stdin.readLineSync() ?? '').trim());

  stdout.write('Premium üye misiniz? (e/h): ');
  String premiumCevap = (stdin.readLineSync() ?? '').trim().toLowerCase();
  bool premium = premiumCevap == 'e' || premiumCevap == 'evet';

  if (tutar == null || tutar <= 0) {
    print('Geçersiz tutar.');
    return;
  }

  if (bolge == null || bolge < 1 || bolge > 3) {
    print('Geçersiz bölge.');
    return;
  }

  double kargoUcreti;
  String kargoMetni;

  if (premium) {
    kargoUcreti = 0.0;
    kargoMetni = 'Ücretsiz (Premium üye)';
  } else if (tutar >= 300) {
    kargoUcreti = 0.0;
    kargoMetni = 'Ücretsiz (300 TL üzeri)';
  } else {
    kargoUcreti = switch (bolge) {
      1 => 29.90,
      2 => 39.90,
      3 => 59.90,
      _ => 0.0, // Bu kola ulaşılmaz; bölge yukarıda doğrulandı.
    };
    kargoMetni = '${kargoUcreti.toStringAsFixed(2)} TL';
  }

  print('Kargo: $kargoMetni');
  print('Ödenecek toplam: ${(tutar + kargoUcreti).toStringAsFixed(2)} TL');
}
```

**Örnek çalışmalar:**

```text
Sepet tutarı (TL): 250
Bölge (1: Şehir içi, 2: Yurt içi, 3: Uzak bölge): 2
Premium üye misiniz? (e/h): h
Kargo: 39.90 TL
Ödenecek toplam: 289.90 TL
```

```text
Sepet tutarı (TL): 349,50
Bölge (1: Şehir içi, 2: Yurt içi, 3: Uzak bölge): 1
Premium üye misiniz? (e/h): h
Kargo: Ücretsiz (300 TL üzeri)
Ödenecek toplam: 349.50 TL
```

**Açıklama:**
- `double kargoUcreti;` ve `String kargoMetni;` satırlarında değer verilmedi. Dart, `if / else if / else` zincirinin **her kolunda** iki değişkene de değer atandığını görür ve sonraki satırlarda kullanılmalarına izin verir.
- Switch ifadesinde `_` kolu, ifadenin eksiksiz olması için zorunludur; bölge daha önce doğrulandığı için bu kola hiç ulaşılmaz.

## Soru 3 — Asal Sayı Kontrolü

**Çözümün mantığı:** 2'den başlayarak bölenler denenir. İlk bölen bulunduğunda `break` ile döngüden çıkılır. Bölen bulunamazsa sayı asaldır.

**Neden yalnızca `bolen * bolen <= sayi`?** Bir sayının karekökünden büyük bir böleni varsa, karekökünden küçük bir böleni de mutlaka vardır (`91 = 7 × 13`: 13'ü bulmadan önce 7'yi zaten buluruz). Bu sayede 97 için 95 değil, yalnızca 8 bölen denenir.

```dart
// Dosya: 01_s3_asal_sayi.dart
import 'dart:io';

void main() {
  stdout.write('Bir sayı girin: ');
  int? girilen = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (girilen == null || girilen < 2) {
    print('Lütfen 2 veya daha büyük bir tam sayı girin.');
    return;
  }

  int sayi = girilen;
  int enKucukBolen = 0; // 0: bölen bulunamadı

  for (int bolen = 2; bolen * bolen <= sayi; bolen++) {
    if (sayi % bolen == 0) {
      enKucukBolen = bolen;
      break;
    }
  }

  if (enKucukBolen == 0) {
    print('$sayi asal bir sayıdır.');
  } else {
    print('$sayi asal değildir; en küçük böleni $enKucukBolen.');
  }
}
```

**Örnek çalışmalar:**

```text
Bir sayı girin: 97
97 asal bir sayıdır.
```

```text
Bir sayı girin: 91
91 asal değildir; en küçük böleni 7.
```

**Açıklama:** `enKucukBolen = 0` başlangıç değeri, "henüz bölen bulunamadı" anlamına gelen bir **işaret değeridir**. 0 hiçbir zaman gerçek bir bölen olamayacağı için bu amaçla güvenle kullanılabilir.

## Soru 4 — Ayın Gün Sayısı

```dart
// Dosya: 01_s4_ayin_gun_sayisi.dart
import 'dart:io';

void main() {
  stdout.write('Yıl: ');
  int? yil = int.tryParse((stdin.readLineSync() ?? '').trim());

  stdout.write('Ay (1-12): ');
  int? ay = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (yil == null || yil <= 0) {
    print('Geçerli bir yıl girin.');
    return;
  }

  if (ay == null || ay < 1 || ay > 12) {
    print('Ay 1 ile 12 arasında olmalı.');
    return;
  }

  bool artikYil = (yil % 4 == 0 && yil % 100 != 0) || yil % 400 == 0;

  int gunSayisi = switch (ay) {
    1 || 3 || 5 || 7 || 8 || 10 || 12 => 31,
    4 || 6 || 9 || 11 => 30,
    2 => artikYil ? 29 : 28,
    _ => 0, // Bu kola ulaşılmaz; ay yukarıda doğrulandı.
  };

  print('$yil yılının $ay. ayı $gunSayisi gündür.');
}
```

**Örnek çalışmalar:**

```text
Yıl: 2024
Ay (1-12): 2
2024 yılının 2. ayı 29 gündür.
```

```text
Yıl: 1900
Ay (1-12): 2
1900 yılının 2. ayı 28 gündür.
```

**Açıklama:** Artık yıl kuralındaki parantezler okunabilirlik içindir: "4'e bölünür **ve** 100'e bölünmez" **ya da** "400'e bölünür". 1900, 4'e ve 100'e bölündüğü, ama 400'e bölünmediği için artık yıl değildir. 2000 ise 400'e bölündüğü için artık yıldır.

## Soru 5 — Birim Dönüştürücü Menüsü

**Çözümün mantığı:** Menü bir `while (true)` döngüsünde gösterilir. Değer gerektiren dört seçenek tek bir `case`'te toplanır; hangi dönüşümün yapılacağı içerideki bir switch ifadesiyle belirlenir. Çıkış, etiketli `break` ile yapılır.

```dart
// Dosya: 01_s5_birim_donusturucu.dart
import 'dart:io';

void main() {
  const double kmMil = 0.621371;
  const double milKm = 1.609344;
  int donusumSayisi = 0;

  menu:
  while (true) {
    print('');
    print('--- BİRİM DÖNÜŞTÜRÜCÜ ---');
    print('1) km → mil');
    print('2) mil → km');
    print('3) °C → °F');
    print('4) °F → °C');
    print('0) Çıkış');
    stdout.write('Seçiminiz: ');
    String secim = (stdin.readLineSync() ?? '').trim();

    switch (secim) {
      case '0':
        print('Toplam $donusumSayisi dönüşüm yapıldı. Güle güle!');
        break menu;

      case '1' || '2' || '3' || '4':
        stdout.write('Değer: ');
        String girdi = (stdin.readLineSync() ?? '').trim().replaceAll(',', '.');
        double? deger = double.tryParse(girdi);

        if (deger == null) {
          print('Geçersiz değer.');
        } else {
          String sonuc = switch (secim) {
            '1' => '${deger.toStringAsFixed(2)} km = ${(deger * kmMil).toStringAsFixed(2)} mil',
            '2' => '${deger.toStringAsFixed(2)} mil = ${(deger * milKm).toStringAsFixed(2)} km',
            '3' => '${deger.toStringAsFixed(2)} °C = ${(deger * 9 / 5 + 32).toStringAsFixed(2)} °F',
            _ => '${deger.toStringAsFixed(2)} °F = ${((deger - 32) * 5 / 9).toStringAsFixed(2)} °C',
          };
          print(sonuc);
          donusumSayisi++;
        }

      default:
        print('Geçersiz seçim.');
    }
  }
}
```

**Örnek çalışma (menü satırları kısaltılmıştır):**

```text
Seçiminiz: 1
Değer: 10
10.00 km = 6.21 mil

Seçiminiz: 3
Değer: 36,6
36.60 °C = 97.88 °F

Seçiminiz: 0
Toplam 2 dönüşüm yapıldı. Güle güle!
```

**Açıklama:** `case '0'` içindeki `break menu;` yalnızca switch'ten değil, etiketli `while` döngüsünden de çıkar. Etiket kullanılmasaydı `break` yalnızca switch'i bitirir ve menü sonsuza kadar tekrarlanırdı (Hafta 2, Bölüm 11.7).

## Soru 6 — Sayı Tahmin Oyunu

**Çözümün mantığı:** Geçersiz girdide hak harcanmaması için `deneme` sayacı yalnızca geçerli bir tahminden **sonra** artırılır. Geçersiz girdide `continue` ile döngünün koşul kontrolüne atlanır.

```dart
// Dosya: 01_s6_sayi_tahmin.dart
import 'dart:io';
import 'dart:math';

void main() {
  const int maksimumHak = 7;
  int gizliSayi = Random().nextInt(100) + 1;
  int deneme = 0;
  bool bildi = false;

  print('1 ile 100 arasında bir sayı tuttum. $maksimumHak hakkınız var.');

  do {
    stdout.write('Tahmin ${deneme + 1}/$maksimumHak: ');
    int? tahmin = int.tryParse((stdin.readLineSync() ?? '').trim());

    if (tahmin == null || tahmin < 1 || tahmin > 100) {
      print('Geçersiz girdi, hakkınız azalmadı.');
      continue;
    }

    deneme++;

    if (tahmin == gizliSayi) {
      bildi = true;
      break;
    } else if (tahmin < gizliSayi) {
      print('Daha büyük bir sayı söyleyin.');
    } else {
      print('Daha küçük bir sayı söyleyin.');
    }
  } while (deneme < maksimumHak);

  if (bildi) {
    print('Tebrikler! $deneme. denemede bildiniz.');
  } else {
    print('Hakkınız bitti. Tuttuğum sayı $gizliSayi idi.');
  }
}
```

**Açıklama:**
- `do-while` içinde `continue`, gövdenin geri kalanını atlayıp **koşul kontrolüne** gider. `deneme` artmadığı için kullanıcı aynı tahmin numarasıyla tekrar dener.
- Doğru tahminde `break` ile döngüden çıkılır; döngüden sonra `bildi` bayrağına bakılarak hangi sonuçla bitildiği anlaşılır.
- En iyi strateji her seferinde aralığın **ortasını** söylemektir (50, 25, 37...). Bu yöntemle 1–100 arasındaki her sayı en fazla 7 tahminde bulunur. Bilgisayar bilimindeki **ikili arama** (binary search) algoritmasının mantığı budur.

## Soru 7 — Değerlendirme Yıldızları

```dart
// Dosya: 01_s7_degerlendirme.dart
import 'dart:io';

void main() {
  stdout.write('Uygulamamızı 1-5 arası puanlayın: ');
  int? puan = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (puan == null || puan < 1 || puan > 5) {
    print('Lütfen 1 ile 5 arasında bir puan girin.');
    return;
  }

  for (int seviye = 1; seviye <= 5; seviye++) {
    String cubuk = '*' * seviye + '-' * (5 - seviye);
    String etiket = switch (seviye) {
      1 => 'Çok kötü',
      2 => 'Kötü',
      3 => 'Orta',
      4 => 'İyi',
      _ => 'Mükemmel',
    };
    String isaret = seviye == puan ? '  ← sizin puanınız' : '';
    print('$seviye [$cubuk] $etiket$isaret');
  }

  print('Teşekkürler!');
}
```

**Örnek çalışma:**

```text
Uygulamamızı 1-5 arası puanlayın: 4
1 [*----] Çok kötü
2 [**---] Kötü
3 [***--] Orta
4 [****-] İyi  ← sizin puanınız
5 [*****] Mükemmel
Teşekkürler!
```

## Soru 8 — Şifre Güç Göstergesi

**Çözümün mantığı:** Her ölçüt için bir `bool` bayrak tutulur. Şifrenin karakterleri tek tek dolaşılarak bayraklar güncellenir. Sonra doğru olan her bayrak için puan artırılır.

```dart
// Dosya: 01_s8_sifre_gucu.dart
import 'dart:io';

void main() {
  stdout.write('Şifreniz: ');
  String sifre = stdin.readLineSync() ?? '';

  const String rakamlar = '0123456789';
  const String buyukHarfler = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String kucukHarfler = 'abcdefghijklmnopqrstuvwxyz';
  const String ozelKarakterler = r'!@#$%^&*.-_';

  bool uzunlukYeterli = sifre.length >= 8;
  bool rakamVar = false;
  bool buyukVar = false;
  bool kucukVar = false;
  bool ozelVar = false;

  for (var k in sifre.split('')) {
    if (rakamlar.contains(k)) {
      rakamVar = true;
    } else if (buyukHarfler.contains(k)) {
      buyukVar = true;
    } else if (kucukHarfler.contains(k)) {
      kucukVar = true;
    } else if (ozelKarakterler.contains(k)) {
      ozelVar = true;
    }
  }

  int puan = 0;
  if (uzunlukYeterli) puan++;
  if (rakamVar) puan++;
  if (buyukVar) puan++;
  if (kucukVar) puan++;
  if (ozelVar) puan++;

  String seviye = switch (puan) {
    0 || 1 => 'Çok zayıf',
    2 => 'Zayıf',
    3 => 'Orta',
    4 => 'Güçlü',
    _ => 'Çok güçlü',
  };

  print('Puan: $puan/5 → $seviye');

  if (puan < 5) {
    print('Eksikler:');
    if (!uzunlukYeterli) print('- En az 8 karakter');
    if (!rakamVar) print('- En az bir rakam');
    if (!buyukVar) print('- En az bir büyük harf (A-Z)');
    if (!kucukVar) print('- En az bir küçük harf (a-z)');
    if (!ozelVar) print('- En az bir özel karakter');
  }
}
```

**Örnek çalışmalar:**

```text
Şifreniz: flutter2026
Puan: 3/5 → Orta
Eksikler:
- En az bir büyük harf (A-Z)
- En az bir özel karakter
```

```text
Şifreniz: Flutter2026!
Puan: 5/5 → Çok güçlü
```

**Açıklama:**
- Şifreye `trim()` **uygulanmadı**: Bir şifredeki boşluk da şifrenin parçasıdır.
- `r'!@#$%^&*.-_'` bir **ham metindir**; `$` işareti burada değişken başlatmaz, olduğu gibi kalır.
- Karakter kontrolünde `else if` kullanıldı, çünkü bir karakter aynı anda hem rakam hem harf olamaz; bir koşul doğru çıktığında diğerlerine bakmaya gerek yoktur.

---

# 2. Fonksiyon Kavramı

## 2.1 Neden fonksiyon?

Bir uygulamanın açılış ekranını konsolda çizelim:

```dart
// Dosya: 02_01_tekrar_sorunu.dart
void main() {
  print('------------------------------');
  print('CEP MARKET');
  print('------------------------------');
  print('Hoş geldiniz!');
  print('------------------------------');
}
```

**Çıktı:**

```text
------------------------------
CEP MARKET
------------------------------
Hoş geldiniz!
------------------------------
```

Çizgiyi üç kez yazdık. Çizginin uzunluğunu değiştirmek istesek üç yeri ayrı ayrı değiştirmemiz gerekir; birini unutursak ekran bozuk görünür. Aynı kodu bir **fonksiyon** içine koyalım:

```dart
// Dosya: 02_02_ilk_fonksiyon.dart
void cizgiCiz() {
  print('-' * 30);
}

void main() {
  cizgiCiz();
  print('CEP MARKET');
  cizgiCiz();
  print('Hoş geldiniz!');
  cizgiCiz();
}
```

**Çıktı:** (öncekiyle aynı)

```text
------------------------------
CEP MARKET
------------------------------
Hoş geldiniz!
------------------------------
```

**Açıklama:** **Fonksiyon**, bir işi yapan ve bir **isim** verilmiş kod bloğudur. Bir kez **tanımlanır**, istenildiği kadar **çağrılır**. Artık çizgiyi değiştirmek için yalnızca `cizgiCiz` fonksiyonunun içini değiştirmek yeter.

Fonksiyonların faydaları:
- **Tekrarı önler:** Aynı kodu bir kez yazarsınız (DRY: *Don't Repeat Yourself*).
- **Değişikliği kolaylaştırır:** Bir hatayı düzeltmek veya bir davranışı değiştirmek için tek bir yeri değiştirirsiniz.
- **Okunabilirliği artırır:** `cizgiCiz();` satırı, `print('-' * 30);` satırından daha çok şey anlatır.
- **Problemi parçalara böler:** Büyük bir problemi küçük, test edilebilir parçalara ayırırsınız.

> Aslında fonksiyonları ilk günden beri kullanıyoruz: `main` bir fonksiyondur; `print`, `int.tryParse`, `toUpperCase` da birer fonksiyondur. Bu hafta **kendi** fonksiyonlarımızı yazmayı öğreniyoruz.

## 2.2 Fonksiyonun yapısı

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz, yalnızca yapıyı gösterir.
donusTipi fonksiyonAdi(parametreler) {
  // gövde: fonksiyon çağrıldığında çalışacak kodlar
  return deger; // dönüş tipi void değilse
}
```

| Parça | Örnek | Anlamı |
|---|---|---|
| **Dönüş tipi** | `void`, `int`, `String`, `double?` | Fonksiyonun geri vereceği değerin tipi. Değer vermiyorsa `void`. |
| **Ad** | `cizgiCiz`, `kdvEkle` | `lowerCamelCase`. Fonksiyonlar bir iş yaptığı için genellikle **fiil** ile adlandırılır: `hesapla`, `goster`, `dogrula`. |
| **Parametreler** | `(double fiyat)` | Fonksiyonun dışarıdan aldığı değerler. Parametre yoksa boş parantez: `()` |
| **Gövde** | `{ ... }` | Fonksiyon çağrıldığında çalışan kodlar |
| **`return`** | `return fiyat * 1.20;` | Değeri geri gönderir ve fonksiyonu **bitirir**. |

Fonksiyonlar `main`'in **dışında**, dosyanın en üst seviyesinde tanımlanır. `main`'den önce veya sonra tanımlanmaları fark etmez.

## 2.3 Fonksiyon çağrıldığında ne olur?

```dart
// Dosya: 02_03_akis.dart
void selamVer() {
  print('2. Fonksiyonun içindeyiz.');
}

void main() {
  print('1. main başladı.');
  selamVer();
  print('3. main kaldığı yerden devam ediyor.');
  selamVer();
  print('4. Program bitti.');
}
```

**Çıktı:**

```text
1. main başladı.
2. Fonksiyonun içindeyiz.
3. main kaldığı yerden devam ediyor.
2. Fonksiyonun içindeyiz.
4. Program bitti.
```

**Açıklama:** Bir fonksiyon çağrıldığında program akışı fonksiyonun gövdesine **atlar**, gövde bitince çağrıldığı yere **geri döner** ve kaldığı satırdan devam eder.

## 2.4 Parametreler ve argümanlar

Fonksiyonlar dışarıdan değer alarak her çağrıldıklarında farklı bir iş yapabilir.

```dart
// Dosya: 02_04_parametre.dart
void selamla(String ad) {
  print('Merhaba $ad, Cep Market\'e hoş geldin!');
}

void bildirimGoster(String baslik, int adet) {
  print('[$baslik] $adet yeni bildirim');
}

void main() {
  selamla('Ayşe');
  selamla('Mert');
  bildirimGoster('Mesajlar', 3);
  bildirimGoster('Kampanyalar', 1);
}
```

**Çıktı:**

```text
Merhaba Ayşe, Cep Market'e hoş geldin!
Merhaba Mert, Cep Market'e hoş geldin!
[Mesajlar] 3 yeni bildirim
[Kampanyalar] 1 yeni bildirim
```

| Terim | Nerede? | Örnek |
|---|---|---|
| **Parametre** | Fonksiyon **tanımında**, değeri karşılayan değişken | `String ad` |
| **Argüman** | Fonksiyon **çağrısında**, gönderilen gerçek değer | `'Ayşe'` |

**Açıklama:** `selamla('Ayşe')` çağrısında `'Ayşe'` değeri `ad` parametresine konur ve fonksiyon bu değerle çalışır. Birden fazla parametre virgülle ayrılır; argümanlar **aynı sırayla** verilmelidir: `bildirimGoster('Mesajlar', 3)` çağrısında ilk argüman `baslik`'a, ikincisi `adet`'e gider.

### ❌ Argüman hataları

```dart
// Dosya: 02_05_tuzak_arguman.dart
// ❌ DERLEME HATALARI
void selamla(String ad) {
  print('Merhaba $ad');
}

void main() {
  selamla();
  selamla(42);
  selamla('Ayşe', 'Mert');
}
```

VS Code üç satırı da kırmızıyla çizer:

| Satır | Sorun |
|---|---|
| `selamla();` | Fonksiyon 1 argüman bekliyor, hiç verilmedi. |
| `selamla(42);` | *"The argument type 'int' can't be assigned to the parameter type 'String'."* Tip uyuşmuyor. |
| `selamla('Ayşe', 'Mert');` | Fonksiyon 1 argüman bekliyor, 2 verildi. |

Dart, argümanların **sayısını** ve **tipini** program çalışmadan önce denetler.

## 2.5 Dönüş değeri ve return

Fonksiyonlar bir hesap yapıp sonucu **geri verebilir**. Bunun için dönüş tipi yazılır ve `return` kullanılır.

```dart
// Dosya: 02_06_donus_degeri.dart
double kdvEkle(double fiyat) {
  double sonuc = fiyat * 1.20;
  return sonuc;
}

void main() {
  double etiketFiyati = kdvEkle(100);
  print('KDV dahil: ${etiketFiyati.toStringAsFixed(2)} TL');

  double toplam = kdvEkle(50) + kdvEkle(25);
  print('İki ürün KDV dahil: ${toplam.toStringAsFixed(2)} TL');

  print('Doğrudan kullanım: ${kdvEkle(10).toStringAsFixed(2)} TL');
}
```

**Çıktı:**

```text
KDV dahil: 120.00 TL
İki ürün KDV dahil: 90.00 TL
Doğrudan kullanım: 12.00 TL
```

**Açıklama:**
- `kdvEkle(100)` çağrısı, fonksiyonun `return` ile geri verdiği değerle **yer değiştirir**. Bu değer bir değişkene atanabilir, bir hesapta kullanılabilir veya doğrudan yazdırılabilir.
- `return` iki iş yapar: Değeri geri gönderir ve fonksiyonu **hemen bitirir**. `return`'den sonraki satırlar çalışmaz.
- Dönen değerin tipi, tanımdaki dönüş tipiyle (`double`) uyumlu olmalıdır.

### ❌ return'ü unutmak

```dart
// Dosya: 02_07_tuzak_return.dart
// ❌ DERLEME HATASI
int topla(int a, int b) {
  int sonuc = a + b;
}

void main() {
  print(topla(3, 4));
}
```

**Hata mesajı:**

```text
The body might complete normally, causing 'null' to be returned, but the return type, 'int', is a potentially non-nullable type.
```

*Türkçesi: "Gövde return olmadan bitebilir; bu durumda null döner, ama dönüş tipi 'int' null olamaz."* Dönüş tipi `void` olmayan her fonksiyon, her durumda bir değer döndürmelidir. Düzeltme: `return sonuc;`

### ❌ void bir fonksiyonun sonucunu kullanmak

```dart
// Dosya: 02_08_tuzak_void.dart
// ❌ DERLEME HATASI
void cizgiCiz() {
  print('-' * 30);
}

void main() {
  print(cizgiCiz());
}
```

**Hata mesajı:**

```text
This expression has a type of 'void' so its value can't be used.
```

*Türkçesi: "Bu ifadenin tipi 'void'; bu yüzden değeri kullanılamaz."* `void` fonksiyonlar bir iş yapar ama geriye **değer vermez**; sonuçları yazdırılamaz veya bir değişkene atanamaz.

## 2.6 Birden fazla return ve erken çıkış

`return` fonksiyonu hemen bitirdiği için, birden fazla `return` ile `else` yazmaya gerek kalmadan durumlar ayrı ayrı ele alınabilir:

```dart
// Dosya: 02_09_coklu_return.dart
String pilDurumu(int seviye) {
  if (seviye < 0 || seviye > 100) {
    return 'Geçersiz değer';
  }
  if (seviye <= 5) {
    return 'Kritik';
  }
  if (seviye <= 20) {
    return 'Düşük';
  }
  return 'Normal';
}

void siparisVer(String urun, int adet) {
  if (adet <= 0) {
    print('$urun: Adet en az 1 olmalı.');
    return; // void fonksiyondan erken çıkış
  }
  print('$urun: $adet adet sipariş verildi.');
}

void main() {
  print(pilDurumu(3));
  print(pilDurumu(18));
  print(pilDurumu(75));
  print(pilDurumu(150));

  siparisVer('Süt', 2);
  siparisVer('Ekmek', 0);
}
```

**Çıktı:**

```text
Kritik
Düşük
Normal
Geçersiz değer
Süt: 2 adet sipariş verildi.
Ekmek: Adet en az 1 olmalı.
```

**Açıklama:** `pilDurumu(3)` çağrısında ilk `if` yanlış, ikinci `if` doğrudur; `return 'Kritik'` çalışır ve fonksiyon orada biter. `void` bir fonksiyonda da değer vermeden `return;` yazarak erken çıkılabilir.

## 2.7 Fonksiyonlar birbirini çağırabilir

Küçük, tek bir iş yapan fonksiyonlar birleştirilerek daha büyük işler yapılır:

```dart
// Dosya: 02_10_fonksiyon_zinciri.dart
double kdvEkle(double fiyat) {
  return fiyat * 1.20;
}

String tlFormatla(double tutar) {
  return '${tutar.toStringAsFixed(2)} TL';
}

String etiketOlustur(String urun, double fiyat) {
  return '$urun: ${tlFormatla(kdvEkle(fiyat))} (KDV dahil)';
}

void main() {
  print(etiketOlustur('Kulaklık', 749.90));
  print(etiketOlustur('Şarj Kablosu', 129.90));
}
```

**Çıktı:**

```text
Kulaklık: 899.88 TL (KDV dahil)
Şarj Kablosu: 155.88 TL (KDV dahil)
```

**Açıklama:** `tlFormatla(kdvEkle(fiyat))` ifadesi **içten dışa** çalışır: Önce `kdvEkle(749.90)` hesaplanır (899.88), sonra bu değer `tlFormatla`'ya verilir. Her fonksiyon tek bir iş yapar; bu yüzden her biri ayrı ayrı anlaşılır ve başka yerlerde tekrar kullanılabilir.

> **İyi fonksiyonun kuralı:** Bir fonksiyon **tek bir iş** yapmalı ve adı bu işi anlatmalıdır. Bir fonksiyonu anlatırken "ve" kelimesini kullanmak zorunda kalıyorsanız, onu ikiye bölmeyi düşünün.

## 2.8 Değişkenlerin kapsamı

```dart
// Dosya: 02_11_kapsam.dart
const String uygulamaAdi = 'Cep Market'; // Üst düzey sabit: her yerden erişilir
int ziyaretSayisi = 0;                   // Üst düzey değişken

void ziyaretKaydet(String sayfa) {
  ziyaretSayisi++;
  String mesaj = '$uygulamaAdi > $sayfa sayfası açıldı'; // Yerel değişken
  print('$mesaj (toplam ziyaret: $ziyaretSayisi)');
}

void main() {
  ziyaretKaydet('Ana Sayfa');
  ziyaretKaydet('Sepet');
  print('$uygulamaAdi: toplam $ziyaretSayisi sayfa görüntülendi.');
  // print(mesaj); // HATA: 'mesaj' yalnızca ziyaretKaydet içinde tanımlı
}
```

**Çıktı:**

```text
Cep Market > Ana Sayfa sayfası açıldı (toplam ziyaret: 1)
Cep Market > Sepet sayfası açıldı (toplam ziyaret: 2)
Cep Market: toplam 2 sayfa görüntülendi.
```

| Değişken türü | Nerede tanımlanır? | Nereden erişilir? |
|---|---|---|
| **Yerel** (local) | Bir fonksiyonun veya bloğun içinde | Yalnızca o fonksiyon veya blok içinden |
| **Parametre** | Fonksiyonun parantezinde | Yalnızca o fonksiyonun içinden |
| **Üst düzey** (top-level) | Tüm fonksiyonların dışında | Dosyadaki her yerden |

> ⚠️ **Üst düzey değişkenleri az kullanın.** `ziyaretSayisi` gibi her fonksiyonun değiştirebildiği bir değişken, programın büyüdükçe "bu değeri kim, ne zaman değiştirdi?" sorusunu cevaplanamaz hale getirir. Fonksiyonların ihtiyaç duyduğu değerleri **parametreyle** almaları, sonuçlarını **return ile** vermeleri en temiz yoldur. Üst düzey **sabitler** (`const uygulamaAdi`) ise güvenle kullanılabilir.

### Parametreler değerin bir kopyasını alır

```dart
// Dosya: 02_12_deger_kopyasi.dart
void ikiyeKatla(int sayi) {
  sayi = sayi * 2;
  print('Fonksiyonun içinde: $sayi');
}

void main() {
  int puan = 10;
  ikiyeKatla(puan);
  print('main içinde: $puan');
}
```

**Çıktı:**

```text
Fonksiyonun içinde: 20
main içinde: 10
```

**Açıklama:** `ikiyeKatla(puan)` çağrısında `sayi` parametresi `puan`'ın değerini alır. Fonksiyonun içinde `sayi`'yı değiştirmek, `main`'deki `puan`'ı **etkilemez**. Sonucu `main`'e taşımak isteseydik `return` kullanmalıydık. Listelerde bu davranışın farklı olduğunu Bölüm 7.6'da göreceğiz.

## 2.9 Null döndüren fonksiyonlar: Doğrulayıcılar

Bir fonksiyonun bazen değer döndürmemesi gerekir. Bunun için dönüş tipi **nullable** yapılır. Flutter'daki form doğrulayıcılarının kuralı tam olarak budur: **Hata varsa hata mesajını, yoksa `null` döndür.**

```dart
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
```

**Çıktı:**

```text
E-posta boş olamaz.
Geçerli bir e-posta adresi girin.
null
E-posta geçerli, kayıt devam ediyor.
```

> 🔗 **Flutter'da:** Bir form alanına doğrulayıcı bağlarken bu fonksiyonun aynısını kullanacaksınız: `TextFormField(validator: ...)`. Flutter, doğrulayıcı `null` döndürürse alanı geçerli sayar; bir metin döndürürse o metni alanın altında kırmızı hata mesajı olarak gösterir.

## 2.10 Uygulama: Kullanıcıdan veri alan fonksiyonlar

Geçen hafta her programda yazdığımız `stdout.write(...)` + `(stdin.readLineSync() ?? '').trim()` + `tryParse` üçlüsünü fonksiyonlara dönüştürelim:

```dart
// Dosya: 02_14_girdi_fonksiyonlari.dart
import 'dart:io';

String metinOku(String soru) {
  stdout.write(soru);
  return (stdin.readLineSync() ?? '').trim();
}

int? tamSayiOku(String soru) {
  return int.tryParse(metinOku(soru));
}

double? ondalikOku(String soru) {
  return double.tryParse(metinOku(soru).replaceAll(',', '.'));
}

void main() {
  String ad = metinOku('Adınız: ');
  int? yas = tamSayiOku('Yaşınız: ');
  double? boy = ondalikOku('Boyunuz (m): ');

  print('Ad : ${ad.isEmpty ? 'Belirtilmedi' : ad}');
  print('Yaş: ${yas ?? 'Geçersiz'}');
  print('Boy: ${boy == null ? 'Geçersiz' : boy.toStringAsFixed(2)}');
}
```

**Örnek çalışma:**

```text
Adınız: Ayşe
Yaşınız: 21
Boyunuz (m): 1,68
Ad : Ayşe
Yaş: 21
Boy: 1.68
```

**Açıklama:** `tamSayiOku` ve `ondalikOku`, kendi içlerinde `metinOku`'yu çağırır. Okuma ve temizleme kodu artık **tek bir yerde**. Bir gün girdileri farklı okumak istersek (örneğin UTF-8 desteği eklemek) yalnızca `metinOku`'yu değiştirmemiz yeter.

Şimdi bu fonksiyonları, geçerli bir değer girilene kadar tekrar soran bir fonksiyonla birleştirerek bir **Vücut Kitle İndeksi (VKİ)** hesaplayıcı yazalım:

```dart
// Dosya: 02_15_vki_hesaplayici.dart
import 'dart:io';

String metinOku(String soru) {
  stdout.write(soru);
  return (stdin.readLineSync() ?? '').trim();
}

double? ondalikOku(String soru) {
  return double.tryParse(metinOku(soru).replaceAll(',', '.'));
}

double aralikliOndalikOku(String soru, double min, double max) {
  while (true) {
    double? deger = ondalikOku(soru);
    if (deger != null && deger >= min && deger <= max) {
      return deger;
    }
    print('Lütfen $min ile $max arasında bir değer girin.');
  }
}

double vkiHesapla(double boy, double kilo) {
  return kilo / (boy * boy);
}

String vkiKategorisi(double vki) {
  if (vki < 18.5) {
    return 'Zayıf';
  } else if (vki < 25) {
    return 'Normal';
  } else if (vki < 30) {
    return 'Fazla kilolu';
  }
  return 'Obez';
}

void main() {
  print('=== Vücut Kitle İndeksi (VKİ) ===');
  double boy = aralikliOndalikOku('Boyunuz (m, ör. 1,75): ', 0.5, 2.5);
  double kilo = aralikliOndalikOku('Kilonuz (kg): ', 20, 300);

  double vki = vkiHesapla(boy, kilo);
  print('VKİ: ${vki.toStringAsFixed(2)} → ${vkiKategorisi(vki)}');
}
```

**Örnek çalışma:**

```text
=== Vücut Kitle İndeksi (VKİ) ===
Boyunuz (m, ör. 1,75): 175
Lütfen 0.5 ile 2.5 arasında bir değer girin.
Boyunuz (m, ör. 1,75): 1,75
Kilonuz (kg): 70
VKİ: 22.86 → Normal
```

**Açıklama:**
- `aralikliOndalikOku`, geçerli bir değer gelene kadar sormaya devam eder. Geçerli değer gelince `return` hem değeri döndürür hem de **döngüyü ve fonksiyonu** bitirir. Bu yüzden `while (true)` içinde ayrıca `break` gerekmez.
- `main` fonksiyonu artık neredeyse bir **yapılacaklar listesi** gibi okunuyor: Boyu oku, kiloyu oku, VKİ'yi hesapla, sonucu yazdır. Ayrıntılar fonksiyonların içinde.
- `aralikliOndalikOku('Kilonuz (kg): ', 20, 300)` çağrısında `20` ve `300`'ün ne olduğunu anlamak için fonksiyonun tanımına bakmak gerekiyor. Bu okunabilirlik sorununu Bölüm 4'te **isimlendirilmiş parametrelerle** çözeceğiz.

> VKİ yalnızca genel bir göstergedir; sağlıkla ilgili kararlar için bir uzmana danışılmalıdır. Burada yalnızca programlama örneği olarak kullanılmıştır.

## 2.11 Kendini çağıran fonksiyonlar: Özyineleme *(isteğe bağlı)*

Bir fonksiyon kendi kendini çağırabilir. Buna **özyineleme** (recursion) denir.

```dart
// Dosya: 02_16_ozyineleme.dart
int faktoriyel(int n) {
  if (n <= 1) {
    return 1; // Durma koşulu
  }
  return n * faktoriyel(n - 1);
}

void geriSay(int saniye) {
  if (saniye == 0) {
    print('Başla!');
    return; // Durma koşulu
  }
  print(saniye);
  geriSay(saniye - 1);
}

void main() {
  print('5! = ${faktoriyel(5)}');
  geriSay(3);
}
```

**Çıktı:**

```text
5! = 120
3
2
1
Başla!
```

**Açıklama:** `faktoriyel(5)` → `5 * faktoriyel(4)` → `5 * 4 * faktoriyel(3)` → ... → `5 * 4 * 3 * 2 * 1`. Her özyinelemeli fonksiyonun bir **durma koşulu** olmalıdır; yoksa fonksiyon kendini sonsuza kadar çağırır ve program `Stack Overflow` hatasıyla çöker. Bu derste özyinelemeyi az kullanacağız; döngüyle yazılabilen işleri döngüyle yazmak genellikle daha anlaşılırdır.

---

# 3. Kısa Gösterim: Fat Arrow (=>)

## 3.1 Yapısı

Gövdesi **tek bir ifadeden** oluşan fonksiyonlar `=>` (fat arrow, "kalın ok") ile kısaca yazılabilir.

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
donusTipi fonksiyonAdi(parametreler) => ifade;

// Şununla tamamen aynıdır:
donusTipi fonksiyonAdi(parametreler) {
  return ifade;
}
```

```dart
// Dosya: 03_01_fat_arrow.dart
double kdvEkle(double fiyat) => fiyat * 1.20;

String tlFormatla(double tutar) => '${tutar.toStringAsFixed(2)} TL';

bool ciftMi(int sayi) => sayi % 2 == 0;

String tamAd(String ad, String soyad) => '$ad $soyad';

void cizgiCiz() => print('-' * 20);

void main() {
  cizgiCiz();
  print(tlFormatla(kdvEkle(250)));
  print(ciftMi(7));
  print(tamAd('Ayşe', 'Yılmaz'));
  cizgiCiz();
}
```

**Çıktı:**

```text
--------------------
300.00 TL
false
Ayşe Yılmaz
--------------------
```

**Açıklama:**
- `=> ifade`, "**bu ifadeyi hesapla ve döndür**" demektir. `return` kelimesi yazılmaz.
- `void` fonksiyonlarda da kullanılabilir: `void cizgiCiz() => print(...);` Bu durumda ifade çalıştırılır, bir değer döndürülmez.
- `bool` döndüren fonksiyonlar, Hafta 1'deki değişkenler gibi soru şeklinde adlandırılır: `ciftMi`, `gecerliMi`, `stoktaVarMi`.

## 3.2 Üçlü operatör ve switch ifadesiyle

`=>` sonrasına yazılan tek ifade bir üçlü operatör veya bir switch ifadesi de olabilir:

```dart
// Dosya: 03_02_arrow_ifadeler.dart
String bildirimMetni(int adet) => adet == 0 ? 'Yeni bildirim yok' : '$adet yeni bildirim';

String durumMesaji(int kod) => switch (kod) {
  200 => 'Başarılı',
  404 => 'Bulunamadı',
  >= 500 => 'Sunucu hatası',
  _ => 'Bilinmeyen durum',
};

String saatFormatla(int saat, int dakika) =>
    '${saat.toString().padLeft(2, '0')}:${dakika.toString().padLeft(2, '0')}';

void main() {
  print(bildirimMetni(0));
  print(bildirimMetni(4));
  print(durumMesaji(404));
  print(durumMesaji(503));
  print(saatFormatla(9, 5));
}
```

**Çıktı:**

```text
Yeni bildirim yok
4 yeni bildirim
Bulunamadı
Sunucu hatası
09:05
```

**Açıklama:** `saatFormatla` uzun olduğu için `=>`'dan sonra alt satıra geçildi; bu tamamen geçerlidir. `Shift + Alt + F` ile biçimlendirdiğinizde VS Code satırları bu şekilde düzenler.

## 3.3 Ne zaman =>, ne zaman { }?

| Durum | Tercih |
|---|---|
| Gövde **tek bir ifade** | `=>` |
| Gövdede değişken tanımı, `if` bloğu, döngü veya birden fazla satır var | `{ }` |
| Emin değilseniz | `{ }` her zaman çalışır |

### ❌ => ile sık yapılan hatalar

- **`=> return a + b;`** yazmak: `=>` zaten "döndür" demektir; `return` yazılmaz.
- **`=>` sonrasına birden fazla ifade yazmaya çalışmak:** `=>` işaretinden sonra yalnızca tek bir ifade yazılabilir. Değişken tanımı veya birden fazla satır gerekiyorsa `{ }` kullanın.
- **JavaScript alışkanlığıyla `=> { ... }` yazmak:** JavaScript'te `=> { ... }` bir kod bloğudur; Dart'ta ise **süslü parantezli bir koleksiyon (Set) değeri** anlamına gelir ve beklenmedik hatalara yol açar. Dart'ta blok için `=>` kullanılmaz: `void f() { ... }`

> 🔗 **Flutter'da:** `=>` her yerde karşınıza çıkacak. Örneğin bir ekranın tek satırlık `build` metodu: `Widget build(BuildContext context) => const Text('Merhaba');` Ayrıca butonlara tıklanınca çalışacak kısa işler de `=>` ile yazılır: `onPressed: () => sepeteEkle(urun)`. Bu ikinci kullanımı (isimsiz fonksiyonlar) 5. haftada göreceğiz.

---

# 4. İsteğe Bağlı ve İsimlendirilmiş Parametreler

## 4.1 Sorun: Konumsal parametreler çoğalınca

```dart
// Dosya: 04_01_konumsal_sorun.dart
void bildirimAyarla(String kanal, bool sesli, bool titresim, int oncelik) {
  print('$kanal → ses: $sesli, titreşim: $titresim, öncelik: $oncelik');
}

void main() {
  bildirimAyarla('Mesajlar', true, false, 2);
  bildirimAyarla('Kampanyalar', false, false, 1);
}
```

**Çıktı:**

```text
Mesajlar → ses: true, titreşim: false, öncelik: 2
Kampanyalar → ses: false, titreşim: false, öncelik: 1
```

Program çalışıyor, ama `bildirimAyarla('Mesajlar', true, false, 2)` satırını okuyan biri `true`'nun, `false`'un ve `2`'nin ne anlama geldiğini bilemez; fonksiyonun tanımına bakmak zorundadır. `true` ile `false`'un yerini yanlışlıkla değiştirseniz Dart sizi uyarmaz, çünkü ikisi de `bool`'dur. Ayrıca kullanıcıların çoğu varsayılan ayarları değiştirmek istemez; her seferinde dört değeri birden yazmak zorunda kalmamalıyız.

Dart bu sorunlar için iki çözüm sunar: **isteğe bağlı konumsal** ve **isimlendirilmiş** parametreler.

## 4.2 İsteğe bağlı konumsal parametreler: [ ]

Köşeli parantez içindeki parametreler **verilmeyebilir**. Verilmezlerse ya `null` olurlar (tipleri nullable olmalıdır) ya da varsayılan değerlerini alırlar.

```dart
// Dosya: 04_02_istege_bagli_konumsal.dart
String selamla(String ad, [String? unvan]) {
  if (unvan == null) {
    return 'Merhaba $ad';
  }
  return 'Merhaba $unvan $ad';
}

String fiyatYaz(double tutar, [String paraBirimi = 'TL']) {
  return '${tutar.toStringAsFixed(2)} $paraBirimi';
}

void main() {
  print(selamla('Ayşe'));
  print(selamla('Yılmaz', 'Dr.'));
  print(fiyatYaz(49.9));
  print(fiyatYaz(12.5, 'USD'));
}
```

**Çıktı:**

```text
Merhaba Ayşe
Merhaba Dr. Yılmaz
49.90 TL
12.50 USD
```

**Kurallar:**
- İsteğe bağlı konumsal parametreler, zorunlu parametrelerden **sonra** ve **köşeli parantez içinde** yazılır.
- Sıra hâlâ önemlidir: İkinci argüman her zaman `unvan`'a gider.
- Varsayılan değeri olmayan isteğe bağlı parametre **nullable** olmalıdır (`String? unvan`).

## 4.3 İsimlendirilmiş parametreler: { }

Süslü parantez içindeki parametreler çağrılırken **adlarıyla** verilir. Bu, Flutter'ın en çok kullandığı parametre türüdür.

```dart
// Dosya: 04_03_isimli_parametreler.dart
void bildirimAyarla({
  required String kanal,
  bool sesli = true,
  bool titresim = false,
  int oncelik = 1,
}) {
  print('$kanal → ses: $sesli, titreşim: $titresim, öncelik: $oncelik');
}

void main() {
  bildirimAyarla(kanal: 'Mesajlar', titresim: true, oncelik: 2);
  bildirimAyarla(kanal: 'Kampanyalar', sesli: false);
  bildirimAyarla(oncelik: 3, kanal: 'Güvenlik');
}
```

**Çıktı:**

```text
Mesajlar → ses: true, titreşim: true, öncelik: 2
Kampanyalar → ses: false, titreşim: false, öncelik: 1
Güvenlik → ses: true, titreşim: false, öncelik: 3
```

**Açıklama:**
- Çağrıda her argümanın **adı** yazılır: `titresim: true`. Kod okuyan herkes neyin ne olduğunu anlar.
- **Sıra önemli değildir:** Üçüncü çağrıda `oncelik`'i `kanal`'dan önce yazdık.
- Verilmeyen parametreler **varsayılan değerlerini** alır: İkinci çağrıda `titresim` ve `oncelik` belirtilmedi.
- **`required`** ile işaretlenen parametre zorunludur.

İsimlendirilmiş bir parametre şu üç yoldan biriyle tanımlanmalıdır:

| Yazım | Anlamı |
|---|---|
| `required String kanal` | Zorunlu; mutlaka verilmeli |
| `bool sesli = true` | İsteğe bağlı; verilmezse varsayılan değer |
| `String? not` | İsteğe bağlı; verilmezse `null` |

### ❌ İsimlendirilmiş parametre hataları

```dart
// Dosya: 04_04_tuzak_isimli.dart
// ❌ DERLEME HATALARI
void bildirimAyarla({required String kanal, bool sesli = true}) {
  print('$kanal → ses: $sesli');
}

void main() {
  bildirimAyarla(sesli: false);
  bildirimAyarla('Mesajlar');
}
```

| Satır | Sorun |
|---|---|
| `bildirimAyarla(sesli: false);` | *"The named parameter 'kanal' is required, but there's no corresponding argument."* Zorunlu parametre verilmedi. |
| `bildirimAyarla('Mesajlar');` | İsimlendirilmiş parametre **adı yazılmadan** verildi. Doğrusu: `bildirimAyarla(kanal: 'Mesajlar');` |

```dart
// Dosya: 04_05_tuzak_varsayilan.dart
// ❌ DERLEME HATALARI
void profilGoster({String ad}) {
  print(ad);
}

void kayitOlustur({DateTime tarih = DateTime.now()}) {
  print(tarih);
}

void main() {}
```

| Satır | Sorun |
|---|---|
| `{String ad}` | `ad` ne zorunlu, ne varsayılan değerli, ne de nullable. Verilmezse `null` olurdu, ama `String` null olamaz. VS Code bu çelişkiyi bildirir (*"...can't have a value of 'null' because of its type..."*). Düzeltme: `required String ad`, `String ad = 'Misafir'` veya `String? ad`. |
| `DateTime tarih = DateTime.now()` | *"The default value of an optional parameter must be constant."* Varsayılan değerler **sabit** (`const`) olmalıdır; `DateTime.now()` sabit değildir. |

## 4.4 Konumsal ve isimlendirilmiş parametreleri birlikte kullanmak

En yaygın kullanım: **Zorunlu ve anlamı açık** değerler konumsal, **ayar niteliğindeki** değerler isimlendirilmiş.

```dart
// Dosya: 04_06_karisik_parametreler.dart
String urunEtiketi(String ad, double fiyat, {int indirimYuzdesi = 0, bool yeniMi = false}) {
  double sonFiyat = fiyat * (100 - indirimYuzdesi) / 100;
  String etiket = '$ad: ${sonFiyat.toStringAsFixed(2)} TL';

  if (indirimYuzdesi > 0) {
    etiket += ' (%$indirimYuzdesi indirim)';
  }
  if (yeniMi) {
    etiket = '[YENİ] $etiket';
  }
  return etiket;
}

void main() {
  print(urunEtiketi('Kulaklık', 750));
  print(urunEtiketi('Kulaklık', 750, indirimYuzdesi: 20));
  print(urunEtiketi('Akıllı Saat', 2400, yeniMi: true, indirimYuzdesi: 10));
}
```

**Çıktı:**

```text
Kulaklık: 750.00 TL
Kulaklık: 600.00 TL (%20 indirim)
[YENİ] Akıllı Saat: 2160.00 TL (%10 indirim)
```

**Açıklama:** `urunEtiketi('Kulaklık', 750, indirimYuzdesi: 20)` çağrısı kendini anlatıyor: Ürün adı ve fiyat her zaman gerekli olduğu için konumsal; indirim ve "yeni" etiketi ayar olduğu için isimlendirilmiş. `etiket += '...'` ifadesi, metnin sonuna ekleme yapar (`etiket = etiket + '...'`).

> ⚠️ Bir fonksiyonda **hem `[ ]` hem `{ }` birlikte kullanılamaz.** İsteğe bağlı parametreler ya konumsal ya isimlendirilmiş olmalıdır.

## 4.5 Uygulama: VKİ hesaplayıcıyı iyileştirmek

Bölüm 2.10'daki `aralikliOndalikOku` fonksiyonunu isimlendirilmiş parametrelerle yeniden yazalım. **Değişen satırlar** (tek başına çalışmaz):

```dart
// ŞABLON: 02_15_vki_hesaplayici.dart dosyasında yalnızca bu satırları değiştirin.
double aralikliOndalikOku(String soru, {required double min, required double max}) {
  // ... gövde aynı kalır ...
}

// main içindeki çağrılar:
double boy = aralikliOndalikOku('Boyunuz (m, ör. 1,75): ', min: 0.5, max: 2.5);
double kilo = aralikliOndalikOku('Kilonuz (kg): ', min: 20, max: 300);
```

**Açıklama:** `aralikliOndalikOku('Kilonuz (kg): ', 20, 300)` yerine `aralikliOndalikOku('Kilonuz (kg): ', min: 20, max: 300)`. Artık `20`'nin ve `300`'ün ne olduğu çağrının kendisinden okunuyor; `min` ile `max`'ı yanlışlıkla ters yazma ihtimali de azaldı.

> **Deneyin:** `02_15_vki_hesaplayici.dart` dosyasının bir kopyasını `04_07_vki_isimli.dart` adıyla oluşturun ve yukarıdaki değişiklikleri yapıp çalıştırın.

## 4.6 Parametre türlerinin özeti

| Tür | Tanım | Çağrı | Verilmezse |
|---|---|---|---|
| Zorunlu konumsal | `f(String ad)` | `f('Ayşe')` | Derleme hatası |
| İsteğe bağlı konumsal | `f(String ad, [String? unvan])` | `f('Ayşe')` · `f('Ayşe', 'Dr.')` | `null` veya varsayılan değer |
| İsimlendirilmiş (isteğe bağlı) | `f({bool sesli = true})` | `f()` · `f(sesli: false)` | `null` veya varsayılan değer |
| İsimlendirilmiş (zorunlu) | `f({required String kanal})` | `f(kanal: 'Mesajlar')` | Derleme hatası |

> 🔗 **Flutter'da:** Flutter'daki arayüz bileşenlerinin neredeyse tamamı isimlendirilmiş parametre kullanır:
> ```dart
> Text('Merhaba', maxLines: 2, textAlign: TextAlign.center)
> ElevatedButton(onPressed: kaydet, child: const Text('Kaydet'))
> ```
> `maxLines:`, `textAlign:`, `onPressed:`, `child:` birer isimlendirilmiş parametredir. Bu bölümü anladıysanız, Flutter kodunun büyük bölümünü okuyabilirsiniz.

---

# 5. Fonksiyonlar: Bölüm Sonu Soru ve Cevapları

Sorulardaki kod parçaları tam program değildir; denemek için fonksiyonları dosyanın üst düzeyine, çağrıları `void main() { ... }` içine yazın.

**1.** Parametre ile argüman arasındaki fark nedir?

**Cevap:** **Parametre**, fonksiyon tanımındaki değişkendir (`String ad`). **Argüman**, fonksiyon çağrılırken gönderilen gerçek değerdir (`'Ayşe'`).

**2.** Çıktı nedir?
```dart
int karesi(int x) {
  return x * x;
  print('Hesaplandı');
}
// main içinde:
print(karesi(4));
```

**Cevap:** `16`. `return` fonksiyonu hemen bitirir; `print('Hesaplandı')` satırına hiç ulaşılmaz. VS Code bu satırı "ulaşılamayan kod" (dead code) olarak işaretler.

**3.** Aşağıdaki fonksiyonu `=>` ile tek satırda yazın.
```dart
bool yetiskinMi(int yas) {
  return yas >= 18;
}
```

**Cevap:** `bool yetiskinMi(int yas) => yas >= 18;`

**4.** Çıktı nedir?
```dart
String selamla(String ad, [String selam = 'Merhaba']) => '$selam $ad';
// main içinde:
print(selamla('Ayşe'));
print(selamla('Mert', 'Günaydın'));
```

**Cevap:** `Merhaba Ayşe` ve `Günaydın Mert`.

**5.** Aşağıdaki çağrılardan hangileri geçerlidir?
```dart
void kaydet({required String ad, int yas = 18}) { }
```
(a) `kaydet(ad: 'Ayşe')` (b) `kaydet(yas: 20, ad: 'Mert')` (c) `kaydet('Ayşe')` (d) `kaydet(yas: 20)`

**Cevap:** (a) ve (b) geçerlidir. (c) isimlendirilmiş parametreyi adsız verdiği için, (d) zorunlu `ad` parametresini vermediği için geçersizdir.

**6.** Çıktı nedir?
```dart
void arttir(int sayi) {
  sayi++;
}
// main içinde:
int a = 5;
arttir(a);
print(a);
```

**Cevap:** `5`. Fonksiyon, `a`'nın değerinin bir kopyasını alır; kopyayı değiştirmek `a`'yı etkilemez. Sonucu almak için fonksiyon değeri döndürmeli ve `a = arttir(a);` biçiminde kullanılmalıdır.

**7.** `{String ad}` parametresi neden derlenmez? Üç farklı düzeltme yazın.

**Cevap:** İsimlendirilmiş parametre verilmezse `null` olur, ama `String` null olamaz. Düzeltmeler: `{required String ad}`, `{String ad = 'Misafir'}`, `{String? ad}`.

**8.** Bir form doğrulayıcı fonksiyonun dönüş tipi neden `String?`'dir?

**Cevap:** Hata varsa hata mesajını (`String`) döndürür; hata yoksa döndürecek bir mesaj yoktur ve `null` döndürür. Flutter, `null`'u "alan geçerli" olarak yorumlar.

**9.** Aşağıdaki fonksiyonu yazın: Saniye cinsinden bir süre alıp `"3 dk 47 sn"` biçiminde metin döndürsün. Süre 60 saniyeden azsa yalnızca `"47 sn"` döndürsün.

**Örnek çözüm:**

```dart
// Dosya: 05_01_sure_metni.dart
String sureMetni(int toplamSaniye) {
  int dakika = toplamSaniye ~/ 60;
  int saniye = toplamSaniye % 60;
  if (dakika == 0) {
    return '$saniye sn';
  }
  return '$dakika dk $saniye sn';
}

void main() {
  print(sureMetni(227));
  print(sureMetni(47));
  print(sureMetni(120));
}
```

**Çıktı:**

```text
3 dk 47 sn
47 sn
2 dk 0 sn
```

**10.** Aşağıdaki fonksiyonu yazın: Bir ürün adı ve isteğe bağlı isimlendirilmiş `adet` (varsayılan 1) ve `hediyePaketi` (varsayılan `false`) parametreleri alsın; `"2 x Kitap (hediye paketi)"` biçiminde bir sipariş satırı döndürsün.

**Örnek çözüm:**

```dart
// Dosya: 05_02_siparis_satiri.dart
String siparisSatiri(String urun, {int adet = 1, bool hediyePaketi = false}) {
  String satir = '$adet x $urun';
  return hediyePaketi ? '$satir (hediye paketi)' : satir;
}

void main() {
  print(siparisSatiri('Kalem'));
  print(siparisSatiri('Kitap', adet: 2, hediyePaketi: true));
  print(siparisSatiri('Defter', adet: 5));
}
```

**Çıktı:**

```text
1 x Kalem
2 x Kitap (hediye paketi)
5 x Defter
```

---

# 6. Dizi Kavramı ve Sabit Uzunluklu Listeler

## 6.1 Neden koleksiyon?

```dart
// Dosya: 06_01_neden_liste.dart
void main() {
  // Liste olmadan: her not için ayrı değişken
  int not1 = 72;
  int not2 = 85;
  int not3 = 90;
  double ortalama1 = (not1 + not2 + not3) / 3;
  print('Ortalama: ${ortalama1.toStringAsFixed(2)}');

  // Liste ile: tüm notlar tek bir isim altında
  List<int> notlar = [72, 85, 90];
  int toplam = 0;
  for (int not in notlar) {
    toplam += not;
  }
  print('Ortalama: ${(toplam / notlar.length).toStringAsFixed(2)}');
}
```

**Çıktı:**

```text
Ortalama: 82.33
Ortalama: 82.33
```

**Açıklama:** Üç not için üç değişken tanımlamak mümkün. Peki 40 öğrenci için? Ya öğrenci sayısı her dönem değişiyorsa? Liste kullanan ikinci yöntemde öğrenci sayısı ne olursa olsun kod **hiç değişmez**; yalnızca listeye yeni değerler eklenir.

## 6.2 Dizi kavramı

**Dizi** (array), aynı tipteki birden fazla değeri **sıralı** olarak, tek bir isim altında tutan yapıdır. Her elemana **sıra numarasıyla** (indeks) erişilir:

```text
indeks:    0     1     2     3     4
        ┌─────┬─────┬─────┬─────┬─────┐
notlar: │ 72  │ 85  │ 90  │ 45  │ 60  │
        └─────┴─────┴─────┴─────┴─────┘
         notlar[0]           notlar[4]
```

- İndeksler **0'dan başlar**. İlk eleman `notlar[0]`, son eleman `notlar[notlar.length - 1]`.
- C ve Java gibi dillerde "dizi" ayrı bir yapıdır. **Dart'ta ayrı bir dizi tipi yoktur; bu görevi `List` üstlenir.** Bir `List` hem uzunluğu sabit bir dizi gibi hem de büyüyüp küçülebilen bir liste gibi kullanılabilir.

## 6.3 Sabit uzunluklu liste

Uzunluğu baştan belli olan ve değişmeyecek veriler için **sabit uzunluklu** liste kullanılır: haftanın 7 günü, yılın 12 ayı, 3x3'lük bir oyun tahtası...

```dart
// Dosya: 06_02_sabit_uzunluklu.dart
void main() {
  List<int> adimlar = List.filled(7, 0); // 7 elemanlı, hepsi 0

  print(adimlar);
  print('Uzunluk: ${adimlar.length}');

  adimlar[0] = 6500;
  adimlar[1] = 8200;
  adimlar[6] = 9000;

  print(adimlar);
  print('İlk gün: ${adimlar[0]}');
  print('Son gün: ${adimlar[adimlar.length - 1]}');
}
```

**Çıktı:**

```text
[0, 0, 0, 0, 0, 0, 0]
Uzunluk: 7
[6500, 8200, 0, 0, 0, 0, 9000]
İlk gün: 6500
Son gün: 9000
```

**Açıklama:**
- `List.filled(7, 0)`, **7 elemanlı** ve her elemanı `0` olan bir liste oluşturur. Bu liste varsayılan olarak **sabit uzunlukludur**.
- Elemanlar `adimlar[indeks] = deger` ile **değiştirilebilir**; ama eleman **eklenip çıkarılamaz**.

### ❌ Sabit uzunluklu listeye eleman eklemek

```dart
// Dosya: 06_03_tuzak_sabit_ekleme.dart
// ❌ ÇALIŞMA ZAMANI HATASI
void main() {
  List<int> adimlar = List.filled(7, 0);
  adimlar.add(5000);
  print(adimlar);
}
```

**Çıktı (bir bölümü):**

```text
Unhandled exception:
Unsupported operation: Cannot add to a fixed-length list
```

*Türkçesi: "Desteklenmeyen işlem: Sabit uzunluklu bir listeye eleman eklenemez."* Büyüyebilen bir liste gerekiyorsa `List.filled(7, 0, growable: true)` yazılabilir veya bir sonraki bölümdeki dinamik listeler kullanılır.

## 6.4 ❌ İndeks sınırları

```dart
// Dosya: 06_04_tuzak_indeks.dart
// ❌ ÇALIŞMA ZAMANI HATASI
void main() {
  List<String> gunler = ['Pzt', 'Sal', 'Çar'];
  print(gunler[0]);
  print(gunler[3]);
}
```

**Açıklama:** Program `Pzt` yazar, ardından **`RangeError (index)`** ile başlayan bir hatayla durur. Hata mesajı geçerli indekslerin `0..2` aralığında olduğunu, sizin ise `3`'e erişmeye çalıştığınızı söyler. Üç elemanlı bir listede son indeks **2**'dir. Listelerde en sık yaşanan çökme budur; bu yüzden döngülerde koşulu her zaman `i < liste.length` şeklinde yazın (`<=` değil).

## 6.5 Listeyi dolaşmak

```dart
// Dosya: 06_05_liste_dolasma.dart
void main() {
  List<String> gunler = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
  List<int> adimlar = [5200, 7800, 9100, 6400, 11250, 4300, 8600];

  int toplam = 0;
  int enYuksekIndeks = 0;

  for (int i = 0; i < adimlar.length; i++) {
    print('${gunler[i]}: ${adimlar[i]} adım');
    toplam += adimlar[i];
    if (adimlar[i] > adimlar[enYuksekIndeks]) {
      enYuksekIndeks = i;
    }
  }

  print('Toplam   : $toplam');
  print('Ortalama : ${(toplam / adimlar.length).toStringAsFixed(0)}');
  print('En aktif : ${gunler[enYuksekIndeks]} (${adimlar[enYuksekIndeks]} adım)');
}
```

**Çıktı:**

```text
Pzt: 5200 adım
Sal: 7800 adım
Çar: 9100 adım
Per: 6400 adım
Cum: 11250 adım
Cmt: 4300 adım
Paz: 8600 adım
Toplam   : 52650
Ortalama : 7521
En aktif : Cum (11250 adım)
```

**Açıklama:**
- **İndeksli `for`** kullandık, çünkü hem `gunler[i]`'ye hem `adimlar[i]`'ye aynı indeksle erişmemiz gerekiyordu. Yalnızca elemanların kendisi gerekseydi `for-in` daha okunur olurdu.
- En büyük değerin **değerini** değil **indeksini** tuttuk; böylece hangi güne ait olduğunu da bulabildik.
- Aynı indeksle eşleşen iki ayrı liste (`gunler` ve `adimlar`) kullanmaya **paralel listeler** denir. Kullanışlıdır ama hataya açıktır: Bir listeye eleman eklenip diğerine eklenmezse eşleşme bozulur. Bölüm 10'da göreceğimiz `Map` ve 4. haftada göreceğimiz sınıflar bu sorunu çözer.

## 6.6 Listeleri fonksiyonlara göndermek

```dart
// Dosya: 06_06_liste_fonksiyon.dart
int enBuyuk(List<int> sayilar) {
  int enBuyukDeger = sayilar[0];
  for (int sayi in sayilar) {
    if (sayi > enBuyukDeger) {
      enBuyukDeger = sayi;
    }
  }
  return enBuyukDeger;
}

double ortalama(List<int> sayilar) {
  if (sayilar.isEmpty) {
    return 0;
  }
  int toplam = 0;
  for (int sayi in sayilar) {
    toplam += sayi;
  }
  return toplam / sayilar.length;
}

void main() {
  List<int> fiyatlar = [120, 45, 300, 80, 15];

  print('En yüksek fiyat: ${enBuyuk(fiyatlar)}');
  print('Ortalama fiyat : ${ortalama(fiyatlar).toStringAsFixed(2)}');
  print('Boş liste ort. : ${ortalama([])}');
}
```

**Çıktı:**

```text
En yüksek fiyat: 300
Ortalama fiyat : 112.00
Boş liste ort. : 0.0
```

**Açıklama:**
- Parametre tipi `List<int>`: "tam sayılardan oluşan bir liste". Fonksiyon, listenin uzunluğu ne olursa olsun çalışır.
- `ortalama` fonksiyonu boş listeyi ayrıca kontrol ediyor; aksi halde sıfıra bölme olurdu.
- `enBuyuk` ise boş bir listeyle çağrılırsa `sayilar[0]` satırında **RangeError** verir. Gerçek bir uygulamada bu durum da ele alınmalıdır.

## 6.7 İki boyutlu listeler

Bir listenin elemanları da liste olabilir. Satır ve sütunlardan oluşan veriler (tablo, oyun tahtası, koltuk düzeni) böyle tutulur.

```dart
// Dosya: 06_07_iki_boyutlu.dart
void main() {
  // 0: boş koltuk, 1: dolu koltuk
  List<List<int>> koltuklar = [
    [1, 1, 0, 0, 1],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 1, 1],
  ];
  List<String> siraAdlari = ['A', 'B', 'C'];

  print('Perde');
  print('=' * 17);
  int bosKoltuk = 0;

  for (int sira = 0; sira < koltuklar.length; sira++) {
    String satir = '${siraAdlari[sira]} ';
    for (int no = 0; no < koltuklar[sira].length; no++) {
      if (koltuklar[sira][no] == 0) {
        satir += '[ ]';
        bosKoltuk++;
      } else {
        satir += '[X]';
      }
    }
    print(satir);
  }

  print('Boş koltuk sayısı: $bosKoltuk');
  print('B3 koltuğu: ${koltuklar[1][2] == 0 ? 'boş' : 'dolu'}');
}
```

**Çıktı:**

```text
Perde
=================
A [X][X][ ][ ][X]
B [ ][X][X][X][ ]
C [ ][ ][ ][X][X]
Boş koltuk sayısı: 7
B3 koltuğu: dolu
```

**Açıklama:** `koltuklar[1]` ikinci sırayı (B), `koltuklar[1][2]` ise o sıranın üçüncü koltuğunu verir. Bu yüzden B3 koltuğu indekslerle `[1][2]`'dir. İç içe döngülerin dıştakisi sıraları, içteki koltukları dolaşır.

> 🔗 **Flutter'da:** Sinema bileti, otobüs koltuğu, satranç veya hafıza oyunu gibi ızgara şeklindeki ekranlar bu yapıyla tutulur ve `GridView` ile çizilir.

---

# 7. Dinamik Uzunluklu Listeler

## 7.1 Oluşturma ve büyütme

Uzunluğu program çalışırken değişen veriler için **dinamik** (büyüyebilen) listeler kullanılır: alışveriş sepeti, bildirimler, mesajlar, arama geçmişi... Köşeli parantezle oluşturulan listeler varsayılan olarak dinamiktir.

```dart
// Dosya: 07_01_dinamik_liste.dart
void main() {
  List<String> sepet = ['Süt', 'Ekmek'];
  var bildirimler = <String>[];
  var puanlar = [4, 5, 3];

  print(sepet);
  print(bildirimler);
  print(puanlar);
  print('${sepet.length} / ${bildirimler.length} / ${puanlar.length}');

  sepet.add('Yumurta');
  bildirimler.add('Kargonuz yolda');
  puanlar.add(5);

  print(sepet);
  print(bildirimler);
  print(puanlar);
  print('${sepet.length} / ${bildirimler.length} / ${puanlar.length}');
}
```

**Çıktı:**

```text
[Süt, Ekmek]
[]
[4, 5, 3]
2 / 0 / 3
[Süt, Ekmek, Yumurta]
[Kargonuz yolda]
[4, 5, 3, 5]
3 / 1 / 4
```

| Yazım | Anlamı |
|---|---|
| `List<String> sepet = ['Süt', 'Ekmek'];` | Tipi açıkça yazılmış liste |
| `var bildirimler = <String>[];` | **Boş** bir `String` listesi; tip açılı parantezle verilir |
| `var puanlar = [4, 5, 3];` | Tip, elemanlardan çıkarılır: `List<int>` |

Açılı parantez içindeki tipe **generic tip** denir: `List<String>`, "yalnızca metinlerden oluşan liste" demektir. Dart, listeye yanlış tipte bir değer eklenmesini engeller:

```dart
// Dosya: 07_02_tuzak_liste_tipi.dart
// ❌ DERLEME HATASI
void main() {
  List<String> sepet = ['Süt'];
  sepet.add(42);
}
```

**Hata mesajı:**

```text
The argument type 'int' can't be assigned to the parameter type 'String'.
```

> ⚠️ `var liste = [];` yazarsanız tip `List<dynamic>` olur: Her türlü değer eklenebilir ve Dart tip denetimi yapamaz. Boş liste oluştururken **tipini mutlaka belirtin**: `<String>[]` veya `List<String> liste = [];`

## 7.2 Listeler ve null

```dart
// Dosya: 07_03_liste_ve_null.dart
void main() {
  List<String?> anketCevaplari = ['Evet', null, 'Hayır']; // Elemanlar null olabilir
  List<String>? favoriler;                                   // Listenin kendisi null olabilir

  print(anketCevaplari);
  print(favoriler);
  print(favoriler?.length ?? 0);
}
```

**Çıktı:**

```text
[Evet, null, Hayır]
null
0
```

| Tip | Anlamı |
|---|---|
| `List<String>` | Liste var, elemanları null olamaz |
| `List<String?>` | Liste var, **elemanları** null olabilir (ör. cevaplanmamış anket soruları) |
| `List<String>?` | **Listenin kendisi** olmayabilir (ör. sunucudan henüz gelmemiş veri) |

## 7.3 final ve const listeler

```dart
// Dosya: 07_04_final_const_liste.dart
void main() {
  final List<String> favoriler = ['Süt'];
  favoriler.add('Peynir');
  print(favoriler);

  const List<String> kategoriler = ['Meyve', 'Sebze'];
  print(kategoriler);
}
```

**Çıktı:**

```text
[Süt, Peynir]
[Meyve, Sebze]
```

**Açıklama:** `final` liste **değiştirilebilir**: `final`, yalnızca `favoriler` değişkeninin **başka bir listeye** bağlanmasını engeller (`favoriler = ['Çay'];` derleme hatası verir). `const` liste ise tamamen dondurulmuştur:

```dart
// Dosya: 07_05_tuzak_const_liste.dart
// ❌ ÇALIŞMA ZAMANI HATASI
void main() {
  const List<String> kategoriler = ['Meyve', 'Sebze'];
  kategoriler.add('Et');
}
```

**Çıktı (bir bölümü):**

```text
Unhandled exception:
Unsupported operation: Cannot add to an unmodifiable list
```

| Tanım | Değişken başka listeye bağlanabilir mi? | Listenin içeriği değişebilir mi? |
|---|---|---|
| `var` / `List<T>` | Evet | Evet |
| `final` | Hayır | **Evet** |
| `const` | Hayır | Hayır |

## 7.4 Liste oluştururken if, for ve yayma (...)

Bir liste tanımlanırken **içine** `if` ve `for` yazılabilir. Bu özellik Flutter'da ekranları veriye göre kurmanın temelidir.

```dart
// Dosya: 07_06_koleksiyon_if_for.dart
void main() {
  bool girisYapti = true;
  bool yonetici = false;
  List<String> kategoriler = ['Meyve', 'Sebze', 'Süt Ürünleri'];
  List<String> sabitMenu = ['Ayarlar', 'Yardım'];

  List<String> menu = [
    'Ana Sayfa',
    for (var k in kategoriler) 'Kategori: $k',
    if (girisYapti) 'Profilim' else 'Giriş Yap',
    if (yonetici) 'Yönetim Paneli',
    ...sabitMenu,
  ];

  for (var oge in menu) {
    print(oge);
  }
}
```

**Çıktı:**

```text
Ana Sayfa
Kategori: Meyve
Kategori: Sebze
Kategori: Süt Ürünleri
Profilim
Ayarlar
Yardım
```

**Açıklama:**
- `for (var k in kategoriler) 'Kategori: $k'`: Her kategori için listeye bir eleman ekler.
- `if (girisYapti) 'Profilim' else 'Giriş Yap'`: Koşula göre iki elemandan birini ekler.
- `if (yonetici) 'Yönetim Paneli'`: Koşul yanlış olduğu için hiçbir şey eklemez.
- `...sabitMenu`: **Yayma** (spread) operatörü; başka bir listenin tüm elemanlarını bu listeye döker. Liste null olabiliyorsa `...?` kullanılır.

> **Deneyin:** `girisYapti = false` ve `yonetici = true` yapıp çalıştırın.

> 🔗 **Flutter'da:** Bir ekrandaki elemanlar bir liste olarak verilir ve bu liste tam olarak bu şekilde kurulur:
> ```dart
> Column(
>   children: [
>     const Text('Ana Sayfa'),
>     for (var k in kategoriler) Text(k),
>     if (girisYapti) const Text('Profilim'),
>   ],
> )
> ```

## 7.5 ⚠️ Listeler referansla tutulur

Bu, programlamaya yeni başlayanların en çok zorlandığı konulardan biridir. Dikkatle okuyun.

```dart
// Dosya: 07_07_tuzak_referans.dart
// ❌ MANTIK HATASI: İki değişken aynı listeyi gösteriyor.
void main() {
  List<String> sepet = ['Süt', 'Ekmek'];
  List<String> yedek = sepet; // Kopya DEĞİL!

  yedek.add('Çikolata');

  print('sepet: $sepet');
  print('yedek: $yedek');
}
```

**Çıktı:**

```text
sepet: [Süt, Ekmek, Çikolata]
yedek: [Süt, Ekmek, Çikolata]
```

**Açıklama:** `yedek = sepet` satırı listenin bir **kopyasını oluşturmaz**. Bellekte hâlâ **tek bir liste** vardır; `yedek` yalnızca o listeye verilen **ikinci bir isimdir**. Bu yüzden `yedek`'e eklenen eleman `sepet`'te de görünür.

```text
  sepet ──┐
          ├──► [Süt, Ekmek, Çikolata]   (bellekte tek bir liste)
  yedek ──┘
```

`int`, `double`, `String`, `bool` gibi temel tiplerde atama değeri kopyalar ve bu sorun yaşanmaz (Bölüm 2.8). Listelerde (ve ileride göreceğimiz Set, Map ve nesnelerde) ise değişken, verinin kendisini değil, verinin **bellekteki yerini** tutar. Buna **referans** denir.

**Gerçek bir kopya oluşturmak için:**

```dart
// Dosya: 07_08_liste_kopyalama.dart
void main() {
  List<String> sepet = ['Süt', 'Ekmek'];
  List<String> yedek1 = List.of(sepet);
  List<String> yedek2 = [...sepet];

  yedek1.add('Çikolata');
  yedek2.remove('Süt');

  print('sepet : $sepet');
  print('yedek1: $yedek1');
  print('yedek2: $yedek2');
}
```

**Çıktı:**

```text
sepet : [Süt, Ekmek]
yedek1: [Süt, Ekmek, Çikolata]
yedek2: [Ekmek]
```

### Fonksiyonlar ve listeler

Bu davranış fonksiyonlarda da geçerlidir:

```dart
// Dosya: 07_09_fonksiyon_ve_liste.dart
void sepeteEkle(List<String> sepet, String urun) {
  sepet.add(urun);
}

void ikiyeKatla(int sayi) {
  sayi = sayi * 2;
}

void main() {
  List<String> sepet = ['Süt'];
  sepeteEkle(sepet, 'Ekmek');
  print(sepet);

  int puan = 10;
  ikiyeKatla(puan);
  print(puan);
}
```

**Çıktı:**

```text
[Süt, Ekmek]
10
```

**Açıklama:** `ikiyeKatla`, `puan`'ın değerinin bir kopyasını aldığı için `main`'deki `puan` değişmedi. `sepeteEkle` ise listenin **kendisine** erişir; fonksiyonun içinde yapılan ekleme `main`'deki listede de görünür. Bu bazen tam istediğimiz şeydir (sepete ürün ekleyen bir fonksiyon), bazen de beklenmedik bir hatadır. Bir fonksiyonun aldığı listeyi değiştirip değiştirmeyeceği, fonksiyonun adından anlaşılmalıdır.

### Listeleri karşılaştırmak

```dart
// Dosya: 07_10_liste_karsilastirma.dart
void main() {
  List<int> a = [1, 2, 3];
  List<int> b = [1, 2, 3];
  List<int> c = a;

  print(a == b);
  print(a == c);
}
```

**Çıktı:**

```text
false
true
```

**Açıklama:** Listelerde `==`, içerik aynı mı diye değil, **aynı liste mi** diye bakar. `a` ve `b`'nin içeriği aynıdır ama bellekte iki ayrı listedir. `c` ise `a`'nın kendisidir. İki listenin içeriğini karşılaştırmak için elemanları bir döngüyle tek tek karşılaştırmak gerekir. (Flutter'da bunun için hazır bir `listEquals` fonksiyonu vardır.)

---

# 8. Listelerle İlgili Metotlar

## 8.1 Ekleme

```dart
// Dosya: 08_01_ekleme.dart
void main() {
  List<String> sepet = ['Süt'];

  sepet.add('Ekmek');
  print(sepet);

  sepet.addAll(['Yumurta', 'Peynir']);
  print(sepet);

  sepet.insert(0, 'Su');
  print(sepet);

  sepet.insertAll(2, ['Çay', 'Şeker']);
  print(sepet);
}
```

**Çıktı:**

```text
[Süt, Ekmek]
[Süt, Ekmek, Yumurta, Peynir]
[Su, Süt, Ekmek, Yumurta, Peynir]
[Su, Süt, Çay, Şeker, Ekmek, Yumurta, Peynir]
```

| Metot | Ne yapar? |
|---|---|
| `add(x)` | Sona bir eleman ekler |
| `addAll([...])` | Sona birden çok eleman ekler |
| `insert(i, x)` | `i` indeksine bir eleman ekler; sonrakiler bir kayar |
| `insertAll(i, [...])` | `i` indeksine birden çok eleman ekler |

## 8.2 Silme

```dart
// Dosya: 08_02_silme.dart
void main() {
  List<String> sepet = ['Su', 'Süt', 'Çay', 'Şeker', 'Ekmek', 'Yumurta', 'Peynir'];

  bool silindi = sepet.remove('Çay');
  print('Çay silindi mi? $silindi → $sepet');

  bool silindi2 = sepet.remove('Kahve');
  print('Kahve silindi mi? $silindi2');

  String ikinci = sepet.removeAt(1);
  print('$ikinci silindi → $sepet');

  String son = sepet.removeLast();
  print('$son silindi → $sepet');

  sepet.removeRange(0, 2);
  print('İlk iki eleman silindi → $sepet');

  sepet.clear();
  print('Sepet temizlendi → $sepet (boş mu? ${sepet.isEmpty})');
}
```

**Çıktı:**

```text
Çay silindi mi? true → [Su, Süt, Şeker, Ekmek, Yumurta, Peynir]
Kahve silindi mi? false
Süt silindi → [Su, Şeker, Ekmek, Yumurta, Peynir]
Peynir silindi → [Su, Şeker, Ekmek, Yumurta]
İlk iki eleman silindi → [Ekmek, Yumurta]
Sepet temizlendi → [] (boş mu? true)
```

| Metot | Ne yapar? | Ne döndürür? |
|---|---|---|
| `remove(x)` | **Değere** göre ilk eşleşen elemanı siler | Silindiyse `true`, bulunamadıysa `false` |
| `removeAt(i)` | **İndekse** göre siler | Silinen eleman |
| `removeLast()` | Son elemanı siler | Silinen eleman |
| `removeRange(a, b)` | `a` indeksinden `b` indeksine kadar (b hariç) siler | Hiçbir şey (`void`) |
| `clear()` | Tüm elemanları siler | Hiçbir şey (`void`) |

## 8.3 Arama ve erişim

```dart
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
```

**Çıktı:**

```text
5
Kargo
Güvenlik
true
false
1
3
-1
false
true
```

| Özellik / metot | Ne verir? |
|---|---|
| `length` | Eleman sayısı |
| `first` / `last` | İlk / son eleman (liste **boşsa hata verir**) |
| `contains(x)` | `x` listede var mı? |
| `indexOf(x)` | `x`'in **ilk** geçtiği indeks; yoksa **`-1`** |
| `lastIndexOf(x)` | `x`'in **son** geçtiği indeks; yoksa `-1` |
| `isEmpty` / `isNotEmpty` | Liste boş mu? / dolu mu? |

> **İpucu:** `first` ve `last`'ı kullanmadan önce listenin boş olmadığından emin olun: `if (liste.isNotEmpty) { print(liste.first); }`

## 8.4 Sıralama ve ters çevirme

```dart
// Dosya: 08_04_siralama.dart
void main() {
  List<int> fiyatlar = [120, 45, 300, 80, 15];
  fiyatlar.sort();
  print(fiyatlar);

  List<int> azalan = fiyatlar.reversed.toList();
  print(azalan);
  print(fiyatlar.reversed);

  List<String> urunler = ['Muz', 'elma', 'Armut', 'Çilek', 'Zeytin'];
  urunler.sort();
  print(urunler);
}
```

**Çıktı:**

```text
[15, 45, 80, 120, 300]
[300, 120, 80, 45, 15]
(300, 120, 80, 45, 15)
[Armut, Muz, Zeytin, elma, Çilek]
```

**Açıklama:**
- `sort()` listeyi **yerinde** sıralar; yani orijinal listeyi değiştirir ve geriye bir değer **döndürmez** (`void`).
- `reversed` listeyi ters sırada verir, ama sonuç bir liste değil, bir **Iterable**'dır (dolaşılabilir bir dizi). Yazdırıldığında köşeli parantez yerine normal parantezle görünür. Liste olarak kullanmak için `.toList()` eklenir.
- ⚠️ **Metin sıralaması harf sırasına değil, karakter kodlarına göredir.** Büyük harfler küçük harflerden önce gelir (`Zeytin` < `elma`), Türkçe karakterler (`Ç`, `Ş`, `Ö`...) ise İngilizce harflerin tamamından sonra gelir. Türkçe alfabetik sıralama için özel bir karşılaştırma gerekir; bunu 5. haftada göreceğiz.

### ❌ sort()'un sonucunu kullanmaya çalışmak

```dart
// Dosya: 08_05_tuzak_sort.dart
// ❌ DERLEME HATASI
void main() {
  List<int> fiyatlar = [120, 45, 300];
  List<int> sirali = fiyatlar.sort();
  print(sirali);
}
```

**Açıklama:** VS Code, `sort()`'un bir değer döndürmediğini (`void`) bildirir. Orijinal listeyi bozmadan sıralı bir kopya istiyorsanız önce kopyalayın, sonra kopyayı sıralayın:

```dart
// Dosya: 08_06_sirali_kopya.dart
void main() {
  List<int> fiyatlar = [120, 45, 300];
  List<int> sirali = List.of(fiyatlar);
  sirali.sort();

  print('Orijinal: $fiyatlar');
  print('Sıralı  : $sirali');
}
```

**Çıktı:**

```text
Orijinal: [120, 45, 300]
Sıralı  : [45, 120, 300]
```

## 8.5 Parçalama, birleştirme ve metne çevirme

```dart
// Dosya: 08_07_parcalama_birlestirme.dart
void main() {
  List<String> gunler = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];

  List<String> haftaIci = gunler.sublist(0, 5);
  List<String> haftaSonu = gunler.sublist(5);
  print(haftaIci);
  print(haftaSonu);

  print(haftaIci.join(', '));
  print(gunler.join(' | '));

  List<String> tumu = haftaSonu + haftaIci;
  print(tumu);

  String etiketMetni = 'yeni,indirim,kargo bedava';
  List<String> etiketler = etiketMetni.split(',');
  print(etiketler);
  print(etiketler.length);
}
```

**Çıktı:**

```text
[Pzt, Sal, Çar, Per, Cum]
[Cmt, Paz]
Pzt, Sal, Çar, Per, Cum
Pzt | Sal | Çar | Per | Cum | Cmt | Paz
[Cmt, Paz, Pzt, Sal, Çar, Per, Cum]
[yeni, indirim, kargo bedava]
3
```

| Metot / operatör | Ne yapar? |
|---|---|
| `sublist(a, b)` | `a`'dan `b`'ye kadar (b hariç) olan parçayı **yeni bir liste** olarak verir. `b` verilmezse sona kadar. |
| `join(ayirici)` | Elemanları aralarına ayırıcı koyarak **tek bir metinde** birleştirir |
| `liste1 + liste2` | İki listeyi birleştiren **yeni bir liste** oluşturur |
| `metin.split(ayirici)` | Bir metni ayırıcıdan bölerek **listeye** çevirir (`join`'in tersi) |

## 8.6 Döngülerle liste işlemleri

Listelerdeki en yaygın üç işlem **filtreleme** (bazı elemanları seçmek), **dönüştürme** (her elemandan yeni bir değer üretmek) ve **saymadır**. Şimdilik bunları döngülerle yapıyoruz:

```dart
// Dosya: 08_08_dongu_ile_islemler.dart
void main() {
  List<int> fiyatlar = [120, 45, 300, 80, 15];

  // Filtreleme: 100 TL altındakiler
  List<int> ucuzlar = [];
  for (int f in fiyatlar) {
    if (f < 100) {
      ucuzlar.add(f);
    }
  }
  print('100 TL altı: $ucuzlar');

  // Aynı filtreleme, koleksiyon içi for ve if ile tek satırda:
  List<int> ucuzlar2 = [for (int f in fiyatlar) if (f < 100) f];
  print('100 TL altı: $ucuzlar2');

  // Dönüştürme: her fiyatın KDV dahil metni
  List<String> etiketler = [];
  for (int f in fiyatlar) {
    etiketler.add('${(f * 1.2).toStringAsFixed(2)} TL');
  }
  print('KDV dahil: $etiketler');

  // Sayma: 100 TL ve üzeri kaç ürün var?
  int pahaliSayisi = 0;
  for (int f in fiyatlar) {
    if (f >= 100) pahaliSayisi++;
  }
  print('100 TL ve üzeri: $pahaliSayisi ürün');
}
```

**Çıktı:**

```text
100 TL altı: [45, 80, 15]
100 TL altı: [45, 80, 15]
KDV dahil: [144.00 TL, 54.00 TL, 360.00 TL, 96.00 TL, 18.00 TL]
100 TL ve üzeri: 2 ürün
```

> **İleriye bakış:** 5. haftada bu işlemleri `where` (filtrele), `map` (dönüştür) gibi hazır metotlarla tek satırda yapmayı öğreneceğiz: `fiyatlar.where((f) => f < 100).toList()`. Bu metotları anlamak için önce döngüyle nasıl yapıldığını bilmek gerekir.

## 8.7 Liste metotlarının özeti

| Amaç | Metotlar |
|---|---|
| Ekleme | `add`, `addAll`, `insert`, `insertAll` |
| Silme | `remove`, `removeAt`, `removeLast`, `removeRange`, `clear` |
| Erişim | `[i]`, `first`, `last`, `length`, `isEmpty`, `isNotEmpty` |
| Arama | `contains`, `indexOf`, `lastIndexOf` |
| Düzen | `sort`, `reversed`, `shuffle` (karıştırır) |
| Parça ve birleştirme | `sublist`, `join`, `+`, `...` |
| Kopyalama | `List.of(liste)`, `[...liste]` |
| Dönüşüm | `toList()`, `toSet()`, `metin.split()` |

---

# 9. Set: Tekrarsız Koleksiyon

## 9.1 Set nedir?

**Set** (küme), her elemanın **yalnızca bir kez** bulunabildiği bir koleksiyondur. Aynı elemanı ikinci kez eklemek hiçbir şeyi değiştirmez. Süslü parantezle yazılır.

```dart
// Dosya: 09_01_set.dart
void main() {
  Set<String> favoriler = {'Süt', 'Peynir'};

  print(favoriler.add('Zeytin'));
  print(favoriler.add('Süt'));
  print(favoriler);
  print(favoriler.length);
  print(favoriler.contains('Peynir'));

  favoriler.remove('Peynir');
  print(favoriler);

  for (var urun in favoriler) {
    print('- $urun');
  }
}
```

**Çıktı:**

```text
true
false
{Süt, Peynir, Zeytin}
3
true
{Süt, Zeytin}
- Süt
- Zeytin
```

**Açıklama:**
- `add` metodu eleman eklendiyse `true`, eleman zaten varsa (eklenmediyse) `false` döndürür.
- Dart'taki varsayılan `Set`, elemanları **ekleme sırasıyla** tutar; `for-in` ile bu sırayla dolaşılır.
- `contains` kontrolü Set'te listeye göre çok daha hızlıdır. "Bu eleman var mı?" sorusunun çok sorulduğu durumlarda Set tercih edilir.

## 9.2 ❌ Set'te indeks yoktur

```dart
// Dosya: 09_02_tuzak_set_indeks.dart
// ❌ DERLEME HATASI
void main() {
  Set<String> etiketler = {'yeni', 'indirim'};
  print(etiketler[0]);
}
```

**Hata mesajı:**

```text
The operator '[]' isn't defined for the type 'Set<String>'.
```

**Açıklama:** Set'te "kaçıncı eleman" kavramı yoktur. Gerekirse `etiketler.elementAt(0)` kullanılabilir veya Set `toList()` ile listeye çevrilir.

## 9.3 ⚠️ Boş Set tuzağı

```dart
// Dosya: 09_03_bos_set.dart
void main() {
  var a = {};          // DİKKAT: Bu bir Set değil, Map!
  var b = <String>{};  // Boş Set
  Set<int> c = {};     // Tip yazıldığı için Set

  a['anahtar'] = 1;
  b.add('yeni');
  c.add(7);

  print(a);
  print(b);
  print(c);
}
```

**Çıktı:**

```text
{anahtar: 1}
{yeni}
{7}
```

**Açıklama:** Boş süslü parantez `{}`, Dart'ta varsayılan olarak bir **Map**'tir (Bölüm 10). `a`'ya `'anahtar': 1` çifti eklenebildi; bu onun bir Map olduğunu gösterir. Boş bir Set için tipi yazmalısınız: `<String>{}` veya `Set<int> c = {};`

## 9.4 Listedeki tekrarları temizlemek

```dart
// Dosya: 09_04_tekrar_temizleme.dart
void main() {
  List<String> aramalar = ['kulaklık', 'kılıf', 'kulaklık', 'şarj aleti', 'kılıf', 'kulaklık'];

  Set<String> tekil = aramalar.toSet();
  print(tekil);
  print('${aramalar.length} aramada ${tekil.length} farklı kelime');

  List<String> sonAramalar = tekil.toList();
  print(sonAramalar[0]);
}
```

**Çıktı:**

```text
{kulaklık, kılıf, şarj aleti}
6 aramada 3 farklı kelime
kulaklık
```

**Açıklama:** `toSet()` tekrarları atar; `toList()` ise indeksle erişebilmek için tekrar listeye çevirir. Bir arama kutusunun "son aramalar" listesi böyle hazırlanır.

## 9.5 Küme işlemleri

```dart
// Dosya: 09_05_kume_islemleri.dart
void main() {
  Set<String> aliTakip = {'ayse', 'mert', 'zeynep', 'can'};
  Set<String> veliTakip = {'mert', 'ece', 'can', 'deniz'};

  print('Ortak takip edilenler: ${aliTakip.intersection(veliTakip)}');
  print('Herhangi biri        : ${aliTakip.union(veliTakip)}');
  print('Yalnızca Ali         : ${aliTakip.difference(veliTakip)}');
  print('Ali\'ye öneriler      : ${veliTakip.difference(aliTakip)}');
}
```

**Çıktı:**

```text
Ortak takip edilenler: {mert, can}
Herhangi biri        : {ayse, mert, zeynep, can, ece, deniz}
Yalnızca Ali         : {ayse, zeynep}
Ali'ye öneriler      : {ece, deniz}
```

| Metot | Matematik | Anlamı |
|---|---|---|
| `a.intersection(b)` | A ∩ B | İkisinde de olanlar (kesişim) |
| `a.union(b)` | A ∪ B | En az birinde olanlar (birleşim) |
| `a.difference(b)` | A − B | A'da olup B'de olmayanlar (fark) |

> 📱 Sosyal medya uygulamalarındaki "ortak arkadaşlar" ve "tanıyor olabileceğin kişiler" özellikleri tam olarak bu küme işlemleriyle çalışır.

---

# 10. Map: Anahtar–Değer Koleksiyonu

## 10.1 Map nedir?

**Map** (eşleme), her **anahtarı** (key) bir **değerle** (value) eşleştiren bir koleksiyondur. Bir sözlük gibi düşünebilirsiniz: Kelimeye (anahtar) bakarak anlamını (değer) bulursunuz. Anahtarlar **benzersizdir**; değerler tekrar edebilir.

```dart
// Dosya: 10_01_map.dart
void main() {
  Map<String, double> fiyatlar = {
    'Süt': 32.50,
    'Ekmek': 15.00,
    'Yumurta': 89.90,
  };

  print(fiyatlar);
  print(fiyatlar['Süt']);
  print(fiyatlar['Çay']);
  print(fiyatlar.length);

  fiyatlar['Çay'] = 120.0;  // Yeni anahtar: ekleme
  fiyatlar['Süt'] = 34.90;  // Var olan anahtar: güncelleme
  print(fiyatlar);

  double? silinen = fiyatlar.remove('Ekmek');
  print('Silinen fiyat: $silinen');
  print(fiyatlar);
}
```

**Çıktı:**

```text
{Süt: 32.5, Ekmek: 15.0, Yumurta: 89.9}
32.5
null
3
{Süt: 34.9, Ekmek: 15.0, Yumurta: 89.9, Çay: 120.0}
Silinen fiyat: 15.0
{Süt: 34.9, Yumurta: 89.9, Çay: 120.0}
```

**Açıklama:**
- `Map<String, double>`: Anahtarlar `String`, değerler `double`.
- `fiyatlar['Süt']` ile **anahtara göre** değer okunur. Olmayan bir anahtar sorulduğunda program çökmez, **`null`** döner.
- `fiyatlar['Çay'] = 120.0` anahtar yoksa **ekler**, varsa **günceller**.
- `remove` silinen değeri döndürür; anahtar yoksa `null` döndürür.

## 10.2 Map'ten okunan değer nullable'dır

```dart
// Dosya: 10_02_tuzak_map_erisim.dart
// ❌ DERLEME HATASI
void main() {
  Map<String, double> fiyatlar = {'Süt': 32.50};
  double sutFiyati = fiyatlar['Süt'];
  print(sutFiyati);
}
```

**Hata mesajı:**

```text
A value of type 'double?' can't be assigned to a variable of type 'double'.
```

**Açıklama:** Dart, `'Süt'` anahtarının Map'te olduğunu program çalışmadan bilemez. Bu yüzden `fiyatlar['Süt']` ifadesinin tipi `double?`'dir. Çözüm:

```dart
// Dosya: 10_03_map_guvenli_erisim.dart
void main() {
  Map<String, double> fiyatlar = {'Süt': 32.50};

  double sutFiyati = fiyatlar['Süt'] ?? 0.0;
  double cayFiyati = fiyatlar['Çay'] ?? 0.0;
  print('$sutFiyati / $cayFiyati');

  if (fiyatlar.containsKey('Çay')) {
    print('Çay katalogda var.');
  } else {
    print('Çay katalogda yok.');
  }
}
```

**Çıktı:**

```text
32.5 / 0.0
Çay katalogda yok.
```

## 10.3 Map'i dolaşmak

```dart
// Dosya: 10_04_map_dolasma.dart
void main() {
  Map<String, int> stok = {'Süt': 12, 'Ekmek': 0, 'Yumurta': 5};

  print(stok.keys);
  print(stok.values);

  for (var urun in stok.keys) {
    print('$urun → ${stok[urun]} adet');
  }

  for (var kayit in stok.entries) {
    String durum = kayit.value == 0 ? 'TÜKENDİ' : '${kayit.value} adet';
    print('${kayit.key}: $durum');
  }
}
```

**Çıktı:**

```text
(Süt, Ekmek, Yumurta)
(12, 0, 5)
Süt → 12 adet
Ekmek → 0 adet
Yumurta → 5 adet
Süt: 12 adet
Ekmek: TÜKENDİ
Yumurta: 5 adet
```

| Özellik / metot | Ne verir? |
|---|---|
| `keys` | Tüm anahtarlar (Iterable) |
| `values` | Tüm değerler (Iterable) |
| `entries` | Anahtar–değer çiftleri; her çiftin `.key` ve `.value` özellikleri vardır |
| `length`, `isEmpty`, `isNotEmpty` | Boyut bilgileri |
| `containsKey(k)` / `containsValue(v)` | Anahtar / değer var mı? |
| `remove(k)` | Anahtarı siler, değerini döndürür |
| `clear()` | Tüm çiftleri siler |

**Açıklama:** Map'i dolaşmanın en okunur yolu `entries`'tir; her turda hem anahtara (`kayit.key`) hem değere (`kayit.value`) doğrudan erişilir.

## 10.4 Sayma (frekans) kalıbı

Bir listedeki elemanların kaçar kez geçtiğini saymak çok yaygın bir iştir:

```dart
// Dosya: 10_05_frekans.dart
void main() {
  List<String> siparisler = ['Latte', 'Çay', 'Latte', 'Americano', 'Çay', 'Latte'];
  Map<String, int> sayac = {};

  for (var urun in siparisler) {
    sayac[urun] = (sayac[urun] ?? 0) + 1;
  }

  print(sayac);

  String enCok = '';
  int enCokAdet = 0;
  for (var kayit in sayac.entries) {
    if (kayit.value > enCokAdet) {
      enCok = kayit.key;
      enCokAdet = kayit.value;
    }
  }
  print('En çok satan: $enCok ($enCokAdet adet)');
}
```

**Çıktı:**

```text
{Latte: 3, Çay: 2, Americano: 1}
En çok satan: Latte (3 adet)
```

**Açıklama:** `sayac[urun] = (sayac[urun] ?? 0) + 1;` satırı bu bölümün en önemli kalıbıdır: "Ürünün mevcut sayısını al, **hiç yoksa 0 kabul et**, bir artır ve geri yaz." `?? 0` olmasaydı, ilk kez görülen bir ürün için `null + 1` hesaplanmaya çalışılırdı.

## 10.5 Değerleri liste olan Map

Map'in değerleri de koleksiyon olabilir. Bir kafe menüsünü kategorilere göre tutalım:

```dart
// Dosya: 10_06_map_ve_liste.dart
void main() {
  Map<String, List<String>> menu = {
    'Sıcak İçecekler': ['Çay', 'Latte'],
    'Soğuk İçecekler': ['Limonata'],
  };

  menu['Soğuk İçecekler']?.add('Ice Latte');
  menu['Tatlılar'] = ['Cheesecake', 'Brownie'];

  for (var kategori in menu.entries) {
    print('${kategori.key} (${kategori.value.length})');
    for (var urun in kategori.value) {
      print('  - $urun');
    }
  }
}
```

**Çıktı:**

```text
Sıcak İçecekler (2)
  - Çay
  - Latte
Soğuk İçecekler (2)
  - Limonata
  - Ice Latte
Tatlılar (2)
  - Cheesecake
  - Brownie
```

**Açıklama:** `menu['Soğuk İçecekler']` bir `List<String>?` döndürür (anahtar olmayabilir). Bu yüzden listeye eleman eklerken `?.add(...)` kullandık: Kategori varsa eklenir, yoksa hiçbir şey olmaz.

## 10.6 İleriye bakış: JSON ve Map<String, dynamic>

İnternetten gelen veriler genellikle **JSON** biçimindedir ve Dart'ta bir `Map<String, dynamic>` olarak temsil edilir. `dynamic`, değerlerin farklı tiplerde olabileceği anlamına gelir.

```dart
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
```

**Çıktı:**

```text
Ayşe
[müzik, yazılım]
(id, ad, premium, puan, ilgiAlanlari)
```

> 🔗 **Flutter'da:** Hava durumu, ürün listesi, kullanıcı profili gibi internetten gelen tüm veriler önce bu yapıya dönüştürülür. 4. haftada sınıfları öğrendikten sonra bu Map'leri düzgün **model sınıflarına** çevirmeyi göreceğiz.

## 10.7 Hangi koleksiyonu seçmeli?

| | `List` | `Set` | `Map` |
|---|---|---|---|
| Yazım | `[a, b]` | `{a, b}` | `{k: v}` |
| Sıralı mı? | Evet, indeksli | Ekleme sırasını korur, indeks yok | Ekleme sırasını korur, anahtarla erişim |
| Tekrar | Olabilir | **Olamaz** | Anahtar olamaz, değer olabilir |
| Erişim | `liste[0]` | `kume.contains(x)` | `map['anahtar']` |
| Ne zaman? | Sıra önemli, tekrar olabilir | Tekrar istenmiyor, "var mı?" sık soruluyor | Bir değere bir anahtarla ulaşılacak |
| 📱 Örnek | Sepet, mesajlar, bildirimler | Favoriler, etiketler, takip edilenler | Ürün → fiyat, kelime → sayı, ayarlar, JSON |

---

# 11. Hepsini Birleştirelim: Cep Market Sepet Özeti

Bu bölümde haftanın konularını tek bir programda birleştiriyoruz: Ürün kataloğu bir **Map**, sepet bir **Map**, favoriler bir **Set**; her iş ayrı bir **fonksiyonda**.

```dart
// Dosya: 11_01_sepet_ozeti.dart
const double kdvOrani = 0.20;
const double ucretsizKargoLimiti = 300;
const double kargoUcreti = 39.90;

String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

void sepeteEkle(Map<String, int> sepet, Map<String, double> katalog, String urun, {int adet = 1}) {
  if (!katalog.containsKey(urun)) {
    print('"$urun" katalogda yok.');
    return;
  }
  sepet[urun] = (sepet[urun] ?? 0) + adet;
  print('$urun eklendi (sepetteki adet: ${sepet[urun]}).');
}

bool sepettenCikar(Map<String, int> sepet, String urun) {
  int? silinen = sepet.remove(urun);
  if (silinen == null) {
    print('"$urun" sepette yok.');
    return false;
  }
  print('$urun sepetten çıkarıldı.');
  return true;
}

double araToplamHesapla(Map<String, int> sepet, Map<String, double> katalog) {
  double toplam = 0;
  for (var kalem in sepet.entries) {
    double birimFiyat = katalog[kalem.key] ?? 0.0;
    toplam += birimFiyat * kalem.value;
  }
  return toplam;
}

void sepetiYazdir(Map<String, int> sepet, Map<String, double> katalog) {
  print('=========== SEPET ===========');
  if (sepet.isEmpty) {
    print('Sepetiniz boş.');
    return;
  }

  for (var kalem in sepet.entries) {
    double tutar = (katalog[kalem.key] ?? 0.0) * kalem.value;
    print('${kalem.key.padRight(10)} x${kalem.value}  ${tl(tutar).padLeft(12)}');
  }

  double araToplam = araToplamHesapla(sepet, katalog);
  double kdv = araToplam * kdvOrani;
  double kargo = araToplam >= ucretsizKargoLimiti ? 0.0 : kargoUcreti;

  print('-----------------------------');
  print('Ara toplam : ${tl(araToplam)}');
  print('KDV (%20)  : ${tl(kdv)}');
  print('Kargo      : ${kargo == 0 ? 'Ücretsiz' : tl(kargo)}');
  print('TOPLAM     : ${tl(araToplam + kdv + kargo)}');
}

void favorileriYazdir(Set<String> favoriler, Map<String, int> sepet) {
  print('========= FAVORİLER =========');
  for (var urun in favoriler) {
    String durum = sepet.containsKey(urun) ? 'sepette' : 'sepette değil';
    print('- $urun ($durum)');
  }

  Set<String> sepetteOlmayanlar = favoriler.difference(sepet.keys.toSet());
  print('Sepete eklemeyi unutmayın: ${sepetteOlmayanlar.join(', ')}');
}

void main() {
  Map<String, double> katalog = {
    'Süt': 32.50,
    'Ekmek': 15.00,
    'Yumurta': 89.90,
    'Peynir': 145.00,
    'Zeytin': 120.00,
  };
  Map<String, int> sepet = {};
  Set<String> favoriler = {'Peynir', 'Zeytin'};

  sepeteEkle(sepet, katalog, 'Süt', adet: 2);
  sepeteEkle(sepet, katalog, 'Ekmek');
  sepeteEkle(sepet, katalog, 'Süt');
  sepeteEkle(sepet, katalog, 'Çay');
  sepeteEkle(sepet, katalog, 'Peynir');
  sepettenCikar(sepet, 'Ekmek');
  sepettenCikar(sepet, 'Kahve');

  print('');
  sepetiYazdir(sepet, katalog);
  print('');
  favorileriYazdir(favoriler, sepet);
}
```

**Çıktı:**

```text
Süt eklendi (sepetteki adet: 2).
Ekmek eklendi (sepetteki adet: 1).
Süt eklendi (sepetteki adet: 3).
"Çay" katalogda yok.
Peynir eklendi (sepetteki adet: 1).
Ekmek sepetten çıkarıldı.
"Kahve" sepette yok.

=========== SEPET ===========
Süt        x3      97.50 TL
Peynir     x1     145.00 TL
-----------------------------
Ara toplam : 242.50 TL
KDV (%20)  : 48.50 TL
Kargo      : 39.90 TL
TOPLAM     : 330.90 TL

========= FAVORİLER =========
- Peynir (sepette)
- Zeytin (sepette değil)
Sepete eklemeyi unutmayın: Zeytin
```

**Programda hangi konu nerede?**

| Kod parçası | Konu | Bölüm |
|---|---|---|
| `const double kdvOrani` (üst düzey) | Üst düzey sabit | 2.8 |
| `String tl(double tutar) => ...` | Kısa gösterim | 3 |
| `sepeteEkle(..., {int adet = 1})` | İsimlendirilmiş, varsayılan değerli parametre | 4.3 |
| `if (!katalog.containsKey(urun)) { ...; return; }` | Erken çıkış | 2.6, 10.3 |
| `sepet[urun] = (sepet[urun] ?? 0) + adet;` | Map'te sayma kalıbı | 10.4 |
| `int? silinen = sepet.remove(urun);` | `remove`'un dönüş değeri | 10.1 |
| `bool sepettenCikar(...)` | Değer döndüren fonksiyon | 2.5 |
| `for (var kalem in sepet.entries)` | Map'i dolaşmak | 10.3 |
| `katalog[kalem.key] ?? 0.0` | Map'ten güvenli okuma | 10.2 |
| `padRight(10)` · `padLeft(12)` | Hizalı yazdırma | Hafta 1 |
| `favoriler.difference(sepet.keys.toSet())` | Küme farkı, Map anahtarlarını Set'e çevirme | 9.5 |
| `join(', ')` | Koleksiyonu metne çevirme | 8.5 |

**Açıklama:**
- Fonksiyonlar sepeti **parametre olarak alıyor ve değiştiriyor**. Map'ler de listeler gibi referansla tutulduğu için (Bölüm 7.5) `sepeteEkle` içinde yapılan değişiklik `main`'deki sepette görünür.
- `sepettenCikar` bir `bool` döndürüyor ama `main`'de bu değer kullanılmadı. Dönüş değerini kullanmak zorunlu değildir; ileride örneğin "çıkarılamadıysa uyarı sesi çal" gibi bir iş için kullanılabilir.
- `main` fonksiyonu bir senaryo gibi okunuyor; her ayrıntı adı anlamlı bir fonksiyonun içinde.

> 🔗 **Flutter'da:** Bu fonksiyonların neredeyse hiçbiri değişmeden bir Flutter uygulamasında kullanılabilir. `print` yerine ekrandaki yazılar, fonksiyon çağrıları yerine buton tıklamaları gelir. Hesap mantığını arayüzden ayırmak, iyi bir mobil uygulamanın temelidir.

> **Deneyin:**
> 1. Sepete 2 adet Zeytin ekleyin. Ara toplam 300 TL'yi geçtiği için kargo `Ücretsiz` olmalı; "Sepete eklemeyi unutmayın" satırı ise boş kalmalı. Bu durumda o satırı hiç yazdırmamak için `favorileriYazdir`'a bir `if` ekleyin.
> 2. `sepetiYazdir`'a toplam ürün adedini (`Toplam ürün: 4 adet`) yazdıran bir satır ekleyin.

---

# 12. Örnek Problem ve Farklı Çözüm Yolları

### **Problem:** Sınav Notu İstatistikleri

Bir dersin sınav notları bir listede veriliyor:

```dart
// ŞABLON: Bu blok tek başına çalışmaz; çözümlerde kullanılacak veriyi gösterir.
List<int> notlar = [72, 85, 90, 45, 60, 85, 100, 38, 77];
```

Programınız şunları yazdırmalı: notların kendisi, öğrenci sayısı, ortalama (iki ondalık basamak), en yüksek not, en düşük not, 50 ve üzeri alan (geçen) öğrenci sayısı ve kalan öğrenci sayısı. **Orijinal liste değiştirilmemeli.**

**İpuçları:**
1. Toplam için döngüde bir değişkende biriktirin; ortalama = toplam / öğrenci sayısı.
2. En yüksek ve en düşük için ilk elemanla başlayıp her elemanı karşılaştırın.
3. Geçen sayısı için koşullu sayma yapın; kalan = öğrenci sayısı − geçen.

**Beklenen ekran çıktısı:**

```text
Notlar       : [72, 85, 90, 45, 60, 85, 100, 38, 77]
Öğrenci      : 9
Ortalama     : 72.44
En yüksek    : 100
En düşük     : 38
Geçen (>=50) : 7
Kalan        : 2
```

> **Önce kendiniz deneyin.** Çözümlere bakmadan önce en az 15 dakika kendi çözümünüz üzerinde çalışın.

### Çözüm Şekilleri

**1. Tek döngüyle, main içinde**

```dart
// Dosya: 12_01_istatistik_tek_dongu.dart
void main() {
  List<int> notlar = [72, 85, 90, 45, 60, 85, 100, 38, 77];

  int toplam = 0;
  int enYuksek = notlar[0];
  int enDusuk = notlar[0];
  int gecen = 0;

  for (int not in notlar) {
    toplam += not;
    if (not > enYuksek) enYuksek = not;
    if (not < enDusuk) enDusuk = not;
    if (not >= 50) gecen++;
  }

  double ortalama = toplam / notlar.length;

  print('Notlar       : $notlar');
  print('Öğrenci      : ${notlar.length}');
  print('Ortalama     : ${ortalama.toStringAsFixed(2)}');
  print('En yüksek    : $enYuksek');
  print('En düşük     : $enDusuk');
  print('Geçen (>=50) : $gecen');
  print('Kalan        : ${notlar.length - gecen}');
}
```

**Açıklama:** Listeyi yalnızca **bir kez** dolaşarak tüm istatistikler aynı anda hesaplandı. En **verimli** çözümdür. Ancak tüm hesaplar tek bir yerde iç içe olduğu için, ileride "medyanı da hesapla" gibi yeni bir istek geldiğinde bu döngü giderek kalabalıklaşır.

**2. Her istatistik için ayrı fonksiyon**

```dart
// Dosya: 12_02_istatistik_fonksiyonlar.dart
int toplamHesapla(List<int> sayilar) {
  int toplam = 0;
  for (int sayi in sayilar) {
    toplam += sayi;
  }
  return toplam;
}

double ortalamaHesapla(List<int> sayilar) =>
    sayilar.isEmpty ? 0.0 : toplamHesapla(sayilar) / sayilar.length;

int enYuksekBul(List<int> sayilar) {
  int enYuksek = sayilar[0];
  for (int sayi in sayilar) {
    if (sayi > enYuksek) enYuksek = sayi;
  }
  return enYuksek;
}

int enDusukBul(List<int> sayilar) {
  int enDusuk = sayilar[0];
  for (int sayi in sayilar) {
    if (sayi < enDusuk) enDusuk = sayi;
  }
  return enDusuk;
}

int gecenSayisi(List<int> notlar, {int gecmeNotu = 50}) {
  int sayac = 0;
  for (int not in notlar) {
    if (not >= gecmeNotu) sayac++;
  }
  return sayac;
}

void main() {
  List<int> notlar = [72, 85, 90, 45, 60, 85, 100, 38, 77];
  int gecen = gecenSayisi(notlar);

  print('Notlar       : $notlar');
  print('Öğrenci      : ${notlar.length}');
  print('Ortalama     : ${ortalamaHesapla(notlar).toStringAsFixed(2)}');
  print('En yüksek    : ${enYuksekBul(notlar)}');
  print('En düşük     : ${enDusukBul(notlar)}');
  print('Geçen (>=50) : $gecen');
  print('Kalan        : ${notlar.length - gecen}');
}
```

**Açıklama:** Liste birkaç kez dolaşıldığı için biraz daha yavaştır; ama 9 hatta 9000 not için bu fark hissedilmez. Karşılığında her fonksiyon **tek bir iş** yapar, adı ne yaptığını söyler ve başka programlarda (örneğin adım sayar uygulamasında) **tekrar kullanılabilir**. `gecenSayisi(notlar, gecmeNotu: 60)` ile geçme notunu değiştirmek de tek bir argümanla mümkün. Gerçek projelerde genellikle bu yaklaşım tercih edilir.

**3. Sıralı bir kopya üzerinden**

```dart
// Dosya: 12_03_istatistik_siralama.dart
void main() {
  List<int> notlar = [72, 85, 90, 45, 60, 85, 100, 38, 77];

  List<int> sirali = List.of(notlar); // Orijinali bozmamak için kopya
  sirali.sort();

  int toplam = 0;
  for (int not in sirali) {
    toplam += not;
  }

  List<int> gecenler = [for (int not in notlar) if (not >= 50) not];

  print('Notlar       : $notlar');
  print('Öğrenci      : ${notlar.length}');
  print('Ortalama     : ${(toplam / notlar.length).toStringAsFixed(2)}');
  print('En yüksek    : ${sirali.last}');
  print('En düşük     : ${sirali.first}');
  print('Geçen (>=50) : ${gecenler.length}');
  print('Kalan        : ${notlar.length - gecenler.length}');
}
```

**Açıklama:** Sıralı bir listede en düşük değer **ilk**, en yüksek değer **son** elemandır; karşılaştırma yazmaya gerek kalmaz. Geçenler, koleksiyon içi `for` ve `if` ile tek satırda ayrı bir listeye toplandı. **Dikkat:** `notlar.sort()` yazsaydık orijinal liste değişirdi ve ilk satırda notlar sıralı görünürdü; problem orijinalin değişmemesini istediği için önce `List.of` ile kopya aldık. Sıralı bir listenin ayrıca bir faydası daha var: Ortanca değer (medyan) doğrudan ortadaki elemandır (`sirali[4]` → 77).

**Hangisini seçmeli?** Üç çözüm de aynı çıktıyı üretir. Öğrenirken 1. çözümün mantığını kavramak önemlidir; gerçek projelerde 2. çözümün **küçük, tekrar kullanılabilir fonksiyonlar** yaklaşımı tercih edilir; 3. çözüm ise listenin hazır özelliklerinden yararlanmanın kodu nasıl kısaltabileceğini gösterir.

---

# 13. Özet

| Konu | Sözdizimi | Not |
|---|---|---|
| Fonksiyon | `double kdvEkle(double fiyat) { return fiyat * 1.2; }` | Bir kez tanımla, çok kez çağır |
| void | `void cizgiCiz() { ... }` | Değer döndürmez; sonucu kullanılamaz |
| return | `return deger;` · `return;` | Değeri gönderir ve fonksiyonu **bitirir** |
| Kısa gösterim | `bool ciftMi(int x) => x % 2 == 0;` | Yalnızca tek ifade; `return` yazılmaz |
| Kapsam | Yerel · parametre · üst düzey | Üst düzey değişkenleri az kullanın |
| İsteğe bağlı konumsal | `f(String ad, [String? unvan])` | Sıra önemli |
| İsimlendirilmiş | `f({required String ad, int yas = 18, String? not})` | Adla verilir; sıra önemsiz; Flutter'ın tercihi |
| Varsayılan değer | `{int adet = 1}` | Sabit (`const`) olmalı |
| Sabit uzunluklu liste | `List.filled(7, 0)` | Eleman değişir, uzunluk değişmez |
| Dinamik liste | `<String>[]` · `['a', 'b']` | Boş listede tipi belirtin |
| İndeks | `liste[0]` … `liste[liste.length - 1]` | Dışına çıkılırsa `RangeError` |
| Liste metotları | `add` `insert` `remove` `removeAt` `contains` `indexOf` `sort` `sublist` `join` | `sort()` void döndürür |
| Koleksiyon içi if/for | `[for (var x in l) if (x > 0) x]` · `[...a, ...b]` | Flutter'da ekran kurmanın temeli |
| Referans | `var b = a;` → aynı liste | Kopya: `List.of(a)` · `[...a]` |
| Set | `{'a', 'b'}` · `<String>{}` | Tekrarsız; indeks yok; `union` `intersection` `difference` |
| Map | `{'Süt': 32.5}` · `m['Süt'] ?? 0` | Okunan değer nullable; `entries` ile dolaşın |
| Sayma kalıbı | `m[k] = (m[k] ?? 0) + 1;` | Frekans hesabı |
| Boş `{}` | `var x = {};` | **Map**'tir, Set değil |

---

# 14. Koleksiyonlar: Kendinizi Test Edin

Sorulardaki kod parçaları tam program değildir; denemek için `void main() { ... }` içine yazın.

**1.** `List<int> a = [4, 7, 9];` için `a[a.length - 1]` ve `a.indexOf(7)` neyi verir?

**Cevap:** `9` (son eleman) ve `1` (7'nin indeksi).

**2.** `List.filled(3, 0).add(1);` neden hata verir? Bu hata ne zaman ortaya çıkar?

**Cevap:** `List.filled` varsayılan olarak **sabit uzunluklu** liste oluşturur; eleman eklenemez. Hata derleme sırasında değil, **çalışma zamanında** (`Unsupported operation`) ortaya çıkar.

**3.** Çıktı nedir?
```dart
var l = ['a', 'b', 'c'];
l.insert(1, 'x');
l.removeAt(0);
print(l);
```

**Cevap:** `[x, b, c]`. `insert` sonrası `[a, x, b, c]`, `removeAt(0)` sonrası `[x, b, c]`.

**4.** `remove` ile `removeAt` arasındaki fark nedir?

**Cevap:** `remove(x)` **değere** göre ilk eşleşen elemanı siler ve silinip silinmediğini (`bool`) döndürür. `removeAt(i)` **indekse** göre siler ve silinen elemanı döndürür.

**5.** Çıktı nedir?
```dart
List<int> a = [1, 2];
List<int> b = a;
b.add(3);
print(a);
```

**Cevap:** `[1, 2, 3]`. `b = a` bir kopya oluşturmaz; ikisi de aynı listeyi gösterir. Kopya için `List.of(a)` veya `[...a]` kullanılmalıdır.

**6.** Çıktı nedir?
```dart
print([1, 2] == [1, 2]);
```

**Cevap:** `false`. Listelerde `==` içeriği değil, **aynı liste nesnesi** olup olmadıklarını karşılaştırır.

**7.** Çıktı nedir?
```dart
List<String> l = ['b', 'A', 'a'];
l.sort();
print(l);
```

**Cevap:** `[A, a, b]`. Metinler karakter kodlarına göre sıralanır; büyük harfler küçük harflerden önce gelir.

**8.** Çıktı nedir?
```dart
Set<int> s = {1, 2, 3};
s.add(2);
s.add(4);
print(s.length);
```

**Cevap:** `4`. `2` zaten olduğu için eklenmedi; `4` eklendi: `{1, 2, 3, 4}`.

**9.** `var x = {};` ifadesinde `x`'in tipi nedir?

**Cevap:** `Map<dynamic, dynamic>`. Boş bir Set için `<int>{}` gibi tip belirtilmelidir.

**10.** Çıktı nedir?
```dart
Map<String, int> m = {'a': 1};
m['b'] = 2;
m['a'] = 5;
print(m);
```

**Cevap:** `{a: 5, b: 2}`. `'b'` yeni anahtar olduğu için eklendi; `'a'` var olduğu için değeri güncellendi.

**11.** `Map<String, int> m = {'a': 1};` için `int x = m['a'];` neden derlenmez? Nasıl düzeltilir?

**Cevap:** Map'ten okunan değerin tipi `int?`'dir; anahtar Map'te olmayabilir. Düzeltme: `int x = m['a'] ?? 0;`

**12.** Aşağıdaki veriler için hangi koleksiyonu seçersiniz? (a) Uygulama ayarları (tema, dil, bildirim) (b) Gelen mesajlar, geliş sırasıyla (c) Bir kullanıcının engellediği kişiler

**Cevap:** (a) **Map**: Her ayara bir adla (anahtar) erişilir. (b) **List**: Sıra önemli, aynı içerikli iki mesaj olabilir. (c) **Set**: Bir kişi iki kez engellenemez; "bu kişi engelli mi?" sorusu sık sorulur.

---

# 15. Ödev 2

> **AI kuralı:** AI'ı kavram sormak ve hata mesajlarını açıklatmak için kullanabilirsiniz; **kod yazdırmak yasaktır.** Ödev çözümleri **4. haftanın ilk 15 dakikasında** sınıfta birlikte yapılacaktır. Derste rastgele seçilen öğrencilerden çözümlerini kısaca açıklamaları istenebilir.

**Teslim:**
- Her soru ayrı bir dosya: `odev2_s1.dart`, `odev2_s2.dart`, ...
- Teslimden önce `Shift + Alt + F` ile biçimlendirin; **Problems** panelinde hata kalmasın.
- **Her soruda istenen işleri ayrı fonksiyonlar olarak yazın.** `main` yalnızca bu fonksiyonları çağırmalıdır.
- Teslim tarihi ve yöntemi Classroom'daki ödev sayfasındadır.

---

### Soru 1 — Alışveriş Listesi *(List, fonksiyonlar)*

Aşağıdaki fonksiyonları yazın:

| Fonksiyon | Görevi |
|---|---|
| `bool urunEkle(List<String> sepet, String urun)` | Ürün adındaki boşlukları temizler. Ad boşsa `Ürün adı boş olamaz.`, ürün zaten varsa `X zaten sepette.` yazar ve `false` döndürür. Değilse ekler, `X eklendi.` yazar, `true` döndürür. |
| `bool urunCikar(List<String> sepet, String urun)` | Ürünü çıkarır: `X çıkarıldı.` / `X sepette bulunamadı.` |
| `void sepetiYazdir(List<String> sepet)` | Sepet boşsa `Sepet boş.`; değilse numaralı liste: `1. Süt` |
| `List<String> alfabetik(List<String> sepet)` | Sepetin **alfabetik sıralı bir kopyasını** döndürür; **orijinal sepet değişmemeli.** |

`main` fonksiyonunu **aynen** şöyle yazın:

```dart
// ŞABLON: Kendi fonksiyonlarınızı bu main'in üstüne yazın.
void main() {
  List<String> sepet = [];
  sepetiYazdir(sepet);
  urunEkle(sepet, 'Süt');
  urunEkle(sepet, '  Ekmek ');
  urunEkle(sepet, 'Süt');
  urunEkle(sepet, '');
  urunEkle(sepet, 'Armut');
  urunCikar(sepet, 'Çay');
  urunCikar(sepet, 'Ekmek');
  urunEkle(sepet, 'Domates');
  sepetiYazdir(sepet);
  print('Alfabetik: ${alfabetik(sepet)}');
  print('Orijinal : $sepet');
}
```

**Beklenen ekran çıktısı:**

```text
Sepet boş.
Süt eklendi.
Ekmek eklendi.
Süt zaten sepette.
Ürün adı boş olamaz.
Armut eklendi.
Çay sepette bulunamadı.
Ekmek çıkarıldı.
Domates eklendi.
1. Süt
2. Armut
3. Domates
Alfabetik: [Armut, Domates, Süt]
Orijinal : [Süt, Armut, Domates]
```

---

### Soru 2 — Haftalık Adım Raporu *(sabit uzunluklu liste, isimlendirilmiş parametreler)*

- `List<String> gunler = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];`
- Adımları `List.filled(7, 0)` ile oluşturduğunuz **sabit uzunluklu** bir listede tutun ve değerleri **indeksle tek tek** atayın: `6500, 8200, 7400, 10350, 5600, 12100, 9000`

Aşağıdaki fonksiyonları yazın:

| Fonksiyon | Görevi |
|---|---|
| `int toplamAdim(List<int> adimlar)` | Toplam adım |
| `double ortalamaAdim(List<int> adimlar)` | Günlük ortalama |
| `int enAktifGunIndeksi(List<int> adimlar)` | En çok adım atılan günün **indeksi** |
| `int hedefeUlasilanGun(List<int> adimlar, {int hedef = 8000})` | Hedefe ulaşılan (hedef ve üzeri) gün sayısı |
| `void grafikCiz(List<String> gunler, List<int> adimlar, {int birim = 1000})` | Her `birim` adım için bir `#` çizer |

**Beklenen ekran çıktısı:**

```text
Toplam adım  : 59150
Ortalama     : 8450.0
En aktif gün : Cmt (12100 adım)
Hedef 8000   : 4 gün
Hedef 10000  : 2 gün
Pzt | ###### 6500
Sal | ######## 8200
Çar | ####### 7400
Per | ########## 10350
Cum | ##### 5600
Cmt | ############ 12100
Paz | ######### 9000
```

**Ek görev:** Programın sonuna `adimlar.add(7000);` satırını ekleyip çalıştırın. Ne oldu? Neden? Cevabınızı bu satırın üstüne **yorum olarak** yazın, ardından satırı yorum satırı haline getirin.

---

### Soru 3 — Ortak İlgi Alanları *(Set)*

```dart
// ŞABLON: Kullanılacak veriler.
Set<String> ayse = {'müzik', 'sinema', 'yazılım', 'fotoğraf', 'koşu'};
Set<String> mert = {'yazılım', 'oyun', 'müzik', 'basketbol'};
List<String> etiketGirdisi = ['yazılım', 'Müzik', 'yazılım', 'oyun', 'müzik '];
```

Aşağıdaki fonksiyonları yazın:

| Fonksiyon | Görevi |
|---|---|
| `void karsilastir(Set<String> a, Set<String> b, String adA, String adB)` | Ortak, tüm, yalnızca A'da ve yalnızca B'de olan ilgi alanlarını yazdırır |
| `double benzerlikYuzdesi(Set<String> a, Set<String> b)` | Ortak sayısı / tüm (birleşim) sayısı × 100 |
| `Set<String> etiketleriTemizle(List<String> etiketler)` | Her etiketin boşluklarını temizler, küçük harfe çevirir ve **tekrarsız** bir küme döndürür |

**Beklenen ekran çıktısı:**

```text
Ortak ilgi alanları : {müzik, yazılım}
Tüm ilgi alanları   : {müzik, sinema, yazılım, fotoğraf, koşu, oyun, basketbol}
Yalnızca Ayşe       : {sinema, fotoğraf, koşu}
Yalnızca Mert       : {oyun, basketbol}
Benzerlik           : %28.57
Temizlenmiş etiketler: {yazılım, müzik, oyun}
```

---

### Soru 4 — Uygulama Yorumu Analizi *(Map, String, Set)*

Bir uygulama mağazasındaki kullanıcı yorumunda en çok geçen kelimeleri bulun:

```dart
// ŞABLON: Kullanılacak veriler.
String yorum = 'Uygulama çok hızlı ve kullanışlı. Tasarım güzel, menü hızlı. '
    'Bildirimler bazen geç geliyor ama uygulama genel olarak hızlı ve güzel.';
Set<String> haricTutulanlar = {'ve', 'çok', 'ama', 'bir', 'bu'};
```

Aşağıdaki fonksiyonları yazın:

| Fonksiyon | Görevi |
|---|---|
| `Map<String, int> kelimeSay(String metin, Set<String> haricTutulanlar)` | Metni küçük harfe çevirir; `.` `,` `!` `?` işaretlerini siler; boşluklardan böler; boş ve hariç tutulan kelimeleri atlar; her kelimenin kaç kez geçtiğini sayar |
| `String enSikKelime(Map<String, int> sayac)` | En çok geçen kelimeyi döndürür |
| `List<String> tekrarEdenler(Map<String, int> sayac, {int enAz = 2})` | En az `enAz` kez geçen kelimeleri döndürür |

**Beklenen ekran çıktısı:**

```text
Farklı kelime sayısı : 12
Toplam kelime sayısı : 16
En sık geçen         : hızlı (3 kez)
En az 2 kez geçenler : [uygulama, hızlı, güzel]
```

**İpucu:** Uzun yorum metni, Hafta 1'de gördüğümüz gibi **yan yana yazılmış iki metinden** oluşur; Dart bunları otomatik birleştirir.

---

### Soru 5 — Telefon Rehberi *(Map, fonksiyonlar, menü döngüsü, kullanıcı girdisi)*

Kullanıcı `0` seçene kadar çalışan bir rehber uygulaması yazın. Rehber `Map<String, String>` (ad → telefon) olsun ve şu iki kişiyle başlasın: `Ayşe: 05321112233`, `Mert: 05449998877`.

**Menü:**

```text
--- REHBER (2 kişi) ---
1) Kişi ekle / güncelle
2) Kişi ara
3) Kişi sil
4) Rehberi listele
0) Çıkış
Seçiminiz:
```

**Kurallar:**
- Başlıktaki kişi sayısı her seferinde güncel olmalı.
- **Ekle / güncelle:** Ad boş olamaz (`Ad boş olamaz.`). Telefondaki boşluklar silinir; kalan metin **yalnızca rakamlardan** oluşmalı ve **10 veya 11 haneli** olmalı (`Geçersiz telefon numarası.`). Ad rehberde varsa `"Ad" güncellendi.`, yoksa `"Ad" eklendi.` yazılır.
- **Ara:** Büyük-küçük harf duyarsız, **kısmi** arama yapılır (`ay` → `Ayşe`). Bulunanlar `Ad: telefon` biçiminde listelenir; bulunamazsa `Kişi bulunamadı.`
- **Sil:** Ad tam olarak eşleşmeli: `"Ad" silindi.` / `Kişi bulunamadı.`
- **Listele:** Kişiler **alfabetik sırayla** numaralanarak listelenir; rehber boşsa `Rehber boş.`
- Telefonlar ekranda 11 haneliyse `0532 111 22 33` biçiminde gösterilir.
- **Çıkış:** `Rehberde X kişi var. Güle güle!` yazıp **etiketli break** ile çıkın.

**Yazmanız gereken fonksiyonlar (en az):** `metinOku`, `bool telefonGecerliMi(String no)`, `String telefonFormatla(String no)`, `bool kisiEkle(Map<String, String> rehber, String ad, String telefon)` (yeni eklendiyse `true`, güncellendiyse `false`), `List<String> kisiAra(Map<String, String> rehber, String aranan)`, `void rehberiListele(Map<String, String> rehber)`

**Örnek çalışma (menü satırları kısaltılmıştır):**

```text
--- REHBER (2 kişi) ---
Seçiminiz: 1
Ad: Zeynep
Telefon: 0505 123 45 67
"Zeynep" eklendi.

--- REHBER (3 kişi) ---
Seçiminiz: 1
Ad: Can
Telefon: 12ab
Geçersiz telefon numarası.

--- REHBER (3 kişi) ---
Seçiminiz: 2
Aranacak ad: ay
Ayşe: 0532 111 22 33

--- REHBER (3 kişi) ---
Seçiminiz: 4
1. Ayşe: 0532 111 22 33
2. Mert: 0544 999 88 77
3. Zeynep: 0505 123 45 67

--- REHBER (3 kişi) ---
Seçiminiz: 3
Silinecek ad: Mert
"Mert" silindi.

--- REHBER (2 kişi) ---
Seçiminiz: 0
Rehberde 2 kişi var. Güle güle!
```

**İpuçları:**
- Bir metnin yalnızca rakamlardan oluştuğunu, karakterlerini dolaşıp her birinin `'0123456789'` içinde olup olmadığına bakarak kontrol edebilirsiniz.
- `telefonFormatla` için `substring` kullanın: `'05321112233'.substring(0, 4)` → `'0532'`
- Alfabetik listeleme için anahtarları listeye çevirip sıralayın: `List<String> adlar = rehber.keys.toList();` → `adlar.sort();`

---

# 16. Kaynaklar

| Kaynak | Adres | Konu |
|---|---|---|
| Fonksiyonlar | [dart.dev/language/functions](https://dart.dev/language/functions) | Parametre türleri, `=>`, dönüş değerleri |
| Koleksiyonlar | [dart.dev/language/collections](https://dart.dev/language/collections) | List, Set, Map, koleksiyon içi if/for, yayma |
| Generic tipler | [dart.dev/language/generics](https://dart.dev/language/generics) | `List<String>` gibi tip parametreleri |
| Effective Dart: Tasarım | [dart.dev/effective-dart/design](https://dart.dev/effective-dart/design) | Fonksiyon ve parametre adlandırma |
| API belgeleri | [api.dart.dev](https://api.dart.dev) → `dart:core` → `List`, `Set`, `Map` | Tüm metotların listesi |

---

### Gelecek Hafta

**Hafta 4 — Nesne Yönelimli Programlama I:** Sınıf ve nesne, kurucu metotlar (constructor), `this`, isimlendirilmiş kurucular ve `factory`, private alanlar ve getter/setter, kalıtım, `super`, polimorfizm ve `is`. Bu hafta paralel listelerle ve Map'lerle tuttuğumuz ürün bilgilerini (ad, fiyat, stok) tek bir `Urun` sınıfında toplayacağız.

**Derse hazırlık:**
- Ödev 2'yi teslim edin. Çözümler derse ilk 15 dakikada birlikte yapılacak.
- Bu nottaki "Kendinizi Test Edin" sorularını çözün.
- Bölüm 11'deki sepet programını inceleyin: Ürünün adı, fiyatı ve sepetteki adedi üç ayrı yerde (iki Map ve bir anahtar) tutuluyor. Gelecek hafta bunu nasıl daha düzenli yapabileceğimizi göreceğiz.

---

*BMH309 Mobil Cihaz Programlama · Hafta 3 Ders Notu*
