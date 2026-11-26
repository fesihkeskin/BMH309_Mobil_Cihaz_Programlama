# <font color='blue'>**Hafta 7 · Flutter'a Giriş: Widget'lar, Widget Ağacı ve Yerleşim**</font>

---
**Ders:** BMH309 Mobil Cihaz Programlama
**Konular:** Ödev 5 çözümleri · Flutter nasıl çalışır · İlk Flutter projesi ve proje yapısı · `material_ui` paketi · Nokta kısaltmaları (dot shorthands) · Widget kavramı ve widget ağacı · `StatelessWidget`, `build` ve `BuildContext` · Temel widget'lar · `MaterialApp` ve `Scaffold` · Yerleşim: `Row`, `Column`, `Expanded`, `Stack` · Flutter'ın kısıt modeli · Hot reload ve Flutter DevTools · Tasarımdan koda · Yapay zekâ ile Flutter ekranı geliştirmek
**Yazar:** Dr. Öğr. Üyesi Fesih Keskin

---

# Giriş

Altı haftadır Dart dilini öğreniyoruz. Değişkenler, koleksiyonlar, fonksiyonlar, sınıflar, soyut sınıflar, sealed sınıflar, istisnalar, generic tipler, `Future` ve `Stream`... Bütün bunları **konsolda**, siyah bir pencereye metin yazdırarak denedik. Bu hafta o pencereyi kapatıp **telefon ekranına** geçiyoruz.

İyi haber şu: Flutter yeni bir dil değildir. Flutter, **Dart ile yazılmış bir arayüz kütüphanesidir**. Bu hafta yazacağımız her satır, önceki haftalarda öğrendiğiniz Dart'tır:

| Önceki haftalarda öğrendiğiniz | Bu hafta Flutter'da karşınıza çıkacağı yer |
|---|---|
| Sınıflar, kurucular, `final` alanlar (Hafta 4) | Her ekran parçası bir sınıftır: `class ProfilKarti extends StatelessWidget` |
| İsimlendirilmiş ve `required` parametreler (Hafta 3–4) | `Text('Merhaba', style: ..., maxLines: 2)`, `ProfilKarti(ad: 'Ayşe', bolum: '...')` |
| Soyut sınıflar ve `@override` (Hafta 5) | `StatelessWidget` soyut bir sınıftır; `build` metodunu siz yazarsınız |
| Enum'lar (Hafta 5) | `MainAxisAlignment.center`, `FontWeight.bold`, `TextAlign.center` |
| `map` ve `toList` (Hafta 5) | Bir veri listesini widget listesine çevirmek: `children: kisiler.map(...).toList()` |
| `sealed` ekran durumları (Hafta 5–6) | Yükleniyor / veri / hata durumlarına göre farklı widget çizmek |
| `Future`, `FutureBuilder` (Hafta 6) | İlerleyen haftalarda internetten gelen veriyi ekranda göstermek |

Bu haftanın sonunda; bir uygulama ekranına bakıp onu **kutulara bölebilecek**, bu kutuları **widget ağacına** dönüştürebilecek ve o ağacı **Dart koduyla** yazabileceksiniz. Henüz ekranlarımız etkileşimli olmayacak; düğmeye basınca değişen ekranları (`StatefulWidget`) gelecek hafta yazacağız. Bu hafta **ekran çizmeyi** öğreniyoruz.

### Bu Haftanın Hedefleri

Bu haftanın sonunda şunları yapabiliyor olmalısınız:

1. Flutter'ın bir ekranı nasıl çizdiğini (bildirimsel arayüz, widget ağacı) kendi cümlelerinizle anlatmak.
2. `flutter create` ile proje oluşturmak; proje klasörlerini ve `pubspec.yaml` dosyasını tanımak; uygulamayı emülatörde veya telefonda çalıştırmak.
3. `package:material_ui/material_ui.dart` içe aktarmasının neden kullanıldığını açıklamak; eski `package:flutter/material.dart` yazımını tanımak.
4. `.center`, `.fromSeed(...)` gibi **nokta kısaltmalarını** okumak ve yazmak.
5. Bir kodun widget ağacını çizmek; bir widget ağacını koda çevirmek.
6. `StatelessWidget` ile parametre alan, tekrar kullanılabilir kendi widget'larınızı yazmak; `const` ve `super.key`'in neden kullanıldığını açıklamak.
7. `BuildContext` ile temaya ve ekran boyutuna erişmek.
8. `Text`, `Icon`, `Image`, `Container`, `Padding`, `SizedBox`, `Card`, `ListTile` gibi temel widget'ları kullanmak.
9. `Row`, `Column`, `Expanded`, `Flexible`, `Spacer`, `Wrap`, `Stack` ve `Positioned` ile ekran yerleşimi yapmak.
10. Flutter'ın kısıt modelini ("kısıtlar aşağı, boyutlar yukarı, konumu ebeveyn belirler") açıklamak; taşma hatalarını okuyup düzeltmek.
11. Hot reload ve hot restart arasındaki farkı bilmek; Flutter DevTools'un Widget Inspector'ı ile yerleşim sorunlarını incelemek.
12. AI'ın ürettiği Flutter kodunu denetlemek: eski içe aktarmalar, kullanımdan kaldırılmış metotlar, taşmaya yol açan sabit boyutlar, dev `build` metotları.

### Bu Haftanın AI Kuralı

> **Hafta 6'daki kural geçerli: "AI eş programcıdır; kodun sahibi sizsiniz."**
> - AI'a kod yazdırabilirsiniz; ama teslim ettiğiniz **her satırı** açıklayabilmeli ve `AI_LOG.md` tutmalısınız.
> - **Flutter'a özgü uyarı:** AI araçlarının büyük bölümü, Flutter'ın **eski sürümleriyle** yazılmış milyonlarca kod örneğinden öğrenmiştir. Bu yüzden size sık sık eski yazımlar önerir: `package:flutter/material.dart`, `withOpacity(...)`, `MediaQuery.of(context).size` gibi. Bu kodlar çoğu zaman hâlâ çalışır; ama VS Code'un **Problems** panelinde uyarı verir. Bu uyarıları görmezden gelmeyin (Bölüm 14).
> - AI'dan ekran kodu istediğinizde önce **widget ağacını** istemeyi alışkanlık edinin. Ağacı anlamadan kodu kabul etmeyin.
> - Ara sınav, final sınavı ve sözlü savunma **AI kapalı** yapılır. Sınavda bir ekran görseli verilip widget ağacını çizmeniz istenebilir.

### Başlamadan Önce

- **Kurulumu kontrol edin.** Terminalde `flutter doctor` komutunu çalıştırın. En azından **Flutter**, **Android toolchain** (veya kullanacağınız platform) ve **VS Code** satırları yeşil tik (✓) göstermelidir. Sorun varsa Hafta 1 kurulum kılavuzuna dönün.
- **Bir cihaz seçin.** Uygulamayı çalıştırmak için bir **Android emülatörü**, USB ile bağlanmış **kendi telefonunuz** veya **Chrome** tarayıcısı kullanabilirsiniz. Bu haftanın örneklerinin tamamı üçünde de çalışır.
- **Proje klasörü:** Bu hafta tek tek `.dart` dosyaları yerine bir **Flutter projesi** kullanacağız: `C:\dev\bmh309\hafta7` (Bölüm 3'te birlikte oluşturacağız). Her örnek, projenin `lib` klasöründe ayrı bir dosyadır ve ilk satırında dosya adı yazar: `// Dosya: lib/ornek_04_01_ilk_ekran.dart`.
- **Bir örneği çalıştırmak:** Dosyayı VS Code'da açın; `void main()` satırının hemen üstünde beliren **Run** bağlantısına tıklayın. Ya da terminalde `flutter run -t lib/ornek_04_01_ilk_ekran.dart` yazın (`-t`: target, "hangi dosya çalışsın").
- **Ekran görüntüleri yerine taslaklar:** Kodların altında "**Ekranda (taslak):**" başlıklı kutular göreceksiniz. Bunlar ekranın **yerleşimini** gösteren basit çizimlerdir; renkler ve yazı tipleri cihazınızda farklı görünür. Her örneği mutlaka kendiniz çalıştırıp ekranla taslağı karşılaştırın.
- ❌ işaretli bloklar bilerek hatalıdır. Bu hafta bazı hatalar **derleme** sırasında (Problems paneli), bazıları ise **çalışırken** (ekranda sarı-siyah şeritler veya kırmızı hata ekranı ve terminalde uzun bir mesaj) ortaya çıkar.
- Bu nottaki Flutter kodları **Flutter 3.50 (stable)** ve `material_ui` paketiyle denetlenmiştir. Sürümünüzü `flutter --version` ile görebilirsiniz. Bölüm 1'deki Dart kodları ise önceki haftalarda olduğu gibi konsolda çalışır.

---

# İçindekiler

1. [Ödev 5 Çözümleri](#1-ödev-5-çözümleri)
2. [Dart'tan Flutter'a: Flutter Nasıl Çalışır?](#2-darttan-fluttera-flutter-nasıl-çalışır)
3. [İlk Flutter Projesi](#3-ilk-flutter-projesi)
4. [İlk Ekran: runApp, MaterialApp, Scaffold](#4-ilk-ekran-runapp-materialapp-scaffold)
5. [Widget Ağacı](#5-widget-ağacı)
6. [Kendi Widget'ımızı Yazmak: StatelessWidget ve BuildContext](#6-kendi-widgetımızı-yazmak-statelesswidget-ve-buildcontext)
7. [Temel Widget'lar](#7-temel-widgetlar)
8. [Yerleşim I: Row, Column, Expanded](#8-yerleşim-i-row-column-expanded)
9. [Yerleşim II: Stack ve Positioned](#9-yerleşim-ii-stack-ve-positioned)
10. [Kısıt Modeli: Flutter Boyutlara Nasıl Karar Verir?](#10-kısıt-modeli-flutter-boyutlara-nasıl-karar-verir)
11. [Hot Reload ve Flutter DevTools](#11-hot-reload-ve-flutter-devtools)
12. [Hepsini Birleştirelim: Kampüs Uygulaması Ana Sayfası](#12-hepsini-birleştirelim-kampüs-uygulaması-ana-sayfası)
13. [Tasarımdan Koda: Örnek Problem ve Farklı Çözüm Yolları](#13-tasarımdan-koda-örnek-problem-ve-farklı-çözüm-yolları)
14. [Yapay Zekâ ile Flutter Ekranı Geliştirmek](#14-yapay-zekâ-ile-flutter-ekranı-geliştirmek)
15. [Özet](#15-özet)
16. [Kendinizi Test Edin](#16-kendinizi-test-edin)
17. [Ödev 6](#17-ödev-6)
18. [Kaynaklar](#18-kaynaklar)

---

# 1. Ödev 5 Çözümleri

Bu bölümde geçen haftanın ödev sorularının birer örnek çözümünü veriyoruz. **Sizin çözümünüz farklı olabilir.** Verilen `main` fonksiyonuyla çıktınız beklenen çıktıyla birebir aynıysa, boş `catch` bloğu ve `void ... async` kullanmadıysanız çözümünüz doğrudur.

Ödev 5, AI'ı eş programcı olarak kullanabildiğiniz **ilk** ödevdi. Çözümleri okurken kendi kodunuzla birlikte `AI_LOG.md` dosyanıza da bakın: AI'ın önerdiği bir yazımı neden kabul ettiğinizi veya reddettiğinizi bu çözümlerle karşılaştırarak açıklayabiliyor musunuz?

Bu bölümdeki kodlar önceki haftalarda olduğu gibi **konsolda** çalışan Dart dosyalarıdır; onları `C:\dev\bmh309\hafta6` klasörünüzde çalıştırabilirsiniz.

## Soru 1 — Not Giriş Sistemi

**Çözümün mantığı:** Notu okuyan fonksiyon (`notOku`) üç farklı hatalı durumu ayırt eder ve her birinde **nedenini taşıyan** bir istisna fırlatır. Notları toplu işleyen fonksiyon (`notlariIsle`) bu istisnaları yakalar, hatalı girdileri kaydeder ve işine devam eder. Her girdinin işlendiğini saymak için `finally` kullanılır; çünkü sayaç başarılı ve hatalı **her durumda** artmalıdır.

```dart
// Dosya: 01_s1_not_giris.dart
class GecersizNotException implements Exception {
  final String girilen;
  final String neden;

  GecersizNotException(this.girilen, this.neden);

  @override
  String toString() => 'GecersizNotException: "$girilen" ($neden)';
}

int islenenSayisi = 0;

int notOku(String girilen) {
  String metin = girilen.trim();
  if (metin.isEmpty) {
    throw GecersizNotException(metin, 'boş');
  }
  int? not = int.tryParse(metin);
  if (not == null) {
    throw GecersizNotException(metin, 'sayı değil');
  }
  if (not < 0 || not > 100) {
    throw GecersizNotException(metin, 'aralık dışı');
  }
  return not;
}

String harfNotu(int n) => switch (n) {
      >= 90 => 'AA',
      >= 85 => 'BA',
      >= 80 => 'BB',
      >= 75 => 'CB',
      >= 70 => 'CC',
      >= 60 => 'DC',
      >= 50 => 'DD',
      _ => 'FF',
    };

({List<int> gecerli, List<String> hatalar}) notlariIsle(List<String> girdiler) {
  List<int> gecerli = [];
  List<String> hatalar = [];
  for (String g in girdiler) {
    try {
      gecerli.add(notOku(g));
    } on GecersizNotException catch (e) {
      hatalar.add(e.toString());
    } finally {
      islenenSayisi++;
    }
  }
  return (gecerli: gecerli, hatalar: hatalar);
}

void main() {
  List<String> girdiler = ['85', ' 92 ', 'yetmiş', '', '105', '47', '-3', '76'];
  var (:gecerli, :hatalar) = notlariIsle(girdiler);
  for (int n in gecerli) {
    print('$n → ${harfNotu(n)}');
  }
  print('Hatalı girişler (${hatalar.length}):');
  for (String h in hatalar) {
    print('  $h');
  }
  double ortalama = gecerli.fold(0, (t, n) => t + n) / gecerli.length;
  print('Ortalama: ${ortalama.toStringAsFixed(2)}');
  print('İşlenen girdi: $islenenSayisi');

  try {
    notOku('150');
  } on GecersizNotException catch (e) {
    print('Yakalandı: ${e.neden}');
  }
}
```

**Çıktı:**

```text
85 → BA
92 → AA
47 → FF
76 → CB
Hatalı girişler (4):
  GecersizNotException: "yetmiş" (sayı değil)
  GecersizNotException: "" (boş)
  GecersizNotException: "105" (aralık dışı)
  GecersizNotException: "-3" (aralık dışı)
Ortalama: 75.00
İşlenen girdi: 8
Yakalandı: aralık dışı
```

**Açıklama:**
- `notOku` içinde **kontrollerin sırası** önemlidir: Önce boş mu, sonra sayı mı, en son aralıkta mı? Boş metin `int.tryParse` ile de `null` döner; boşluk kontrolü önce yapılmasaydı boş girdi "sayı değil" olarak raporlanırdı.
- `int.tryParse` kullanıldı (Hafta 6, Bölüm 3.8): Sayıya çevirmek için `try-catch` gerekmez; istisnayı **kendi anlamlı sınıfımızla** biz fırlatıyoruz.
- `on GecersizNotException catch (e)`: Yalnızca bu türü yakalıyoruz. `notOku` içinde bir programcı hatası (ör. `RangeError`) olsaydı yakalanmaz ve gizlenmezdi.
- `finally { islenenSayisi++; }`: Sayaç, `try` başarılı olsa da `catch` çalışsa da artar. 8 girdinin 8'i de sayıldı.
- `({List<int> gecerli, List<String> hatalar})`: İsimli alanlı bir record (Hafta 6, Bölüm 6.2). `main` içinde `var (:gecerli, :hatalar) = ...` ile iki değişkene açılıyor.
- `harfNotu` Hafta 2'deki ilişkisel desenleri (`>= 90`) kullanan bir `switch` ifadesidir. Kollar yukarıdan aşağıya denendiği için sıralama büyükten küçüğe olmalıdır.

## Soru 2 — Son Görüntülenenler ve Puanlar

**Çözümün mantığı:** "Son görüntülenenler" şeridi içindeki öğenin tipinden bağımsızdır: ürün adı da olabilir, sayfa numarası da. Bu bir **generic sınıf** demektir. En iyi puanlı öğeyi bulan fonksiyonun ise öğelerin bir `puan`'ı olduğundan emin olması gerekir: Bu bir **tip sınırı** (`T extends Puanlanabilir`) demektir.

```dart
// Dosya: 01_s2_son_goruntulenenler.dart
class SonGoruntulenenler<T> {
  final int kapasite;
  final List<T> _ogeler = [];

  SonGoruntulenenler(this.kapasite);

  void ekle(T oge) {
    _ogeler.remove(oge);
    _ogeler.insert(0, oge);
    if (_ogeler.length > kapasite) {
      _ogeler.removeLast();
    }
  }

  List<T> get liste => _ogeler.toList();
}

abstract class Puanlanabilir {
  String get ad;
  double get puan;
}

class Film implements Puanlanabilir {
  @override
  final String ad;
  @override
  final double puan;
  final int yil;

  Film(this.ad, this.puan, this.yil);
}

class Restoran implements Puanlanabilir {
  @override
  final String ad;
  @override
  final double puan;
  final String semt;

  Restoran(this.ad, this.puan, this.semt);
}

T enIyi<T extends Puanlanabilir>(List<T> liste) {
  if (liste.isEmpty) {
    throw ArgumentError('Liste boş olamaz');
  }
  return liste.reduce((a, b) => b.puan > a.puan ? b : a);
}

Map<K, List<T>> grupla<T, K>(List<T> ogeler, K Function(T) anahtarBul) {
  Map<K, List<T>> sonuc = {};
  for (T oge in ogeler) {
    sonuc.putIfAbsent(anahtarBul(oge), () => []).add(oge);
  }
  return sonuc;
}

void main() {
  SonGoruntulenenler<String> urunler = SonGoruntulenenler(3);
  for (String u in ['Kulaklık', 'Telefon', 'Kılıf', 'Telefon', 'Saat']) {
    urunler.ekle(u);
  }
  print('Son görüntülenen ürünler: ${urunler.liste}');

  SonGoruntulenenler<int> sayfalar = SonGoruntulenenler(2);
  sayfalar.ekle(4);
  sayfalar.ekle(7);
  sayfalar.ekle(4);
  print('Son görüntülenen sayfalar: ${sayfalar.liste}');

  List<Film> filmler = [
    Film('Kayıp Şehir', 7.4, 2021),
    Film('Son Vapur', 8.6, 2019),
    Film('Dağların Sesi', 8.1, 2023),
  ];
  List<Restoran> restoranlar = [
    Restoran('Dicle Sofrası', 4.6, 'Merkez'),
    Restoran('Kampüs Kafe', 4.1, 'Kampüs'),
    Restoran('Büryan Evi', 4.8, 'Merkez'),
  ];

  Film film = enIyi(filmler);
  Restoran restoran = enIyi(restoranlar);
  print('En iyi film: ${film.ad} (${film.yil})');
  print('En iyi restoran: ${restoran.ad} - ${restoran.semt}');

  Map<String, List<Restoran>> semtlereGore = grupla(restoranlar, (r) => r.semt);
  for (var MapEntry(key: semt, value: liste) in semtlereGore.entries) {
    print('$semt: ${liste.map((r) => r.ad).toList()}');
  }
  Map<bool, List<Film>> yeniMi = grupla(filmler, (f) => f.yil >= 2020);
  print('2020 ve sonrası: ${yeniMi[true]?.map((f) => f.ad).toList()}');

  try {
    enIyi(<Film>[]);
  } on ArgumentError catch (e) {
    print('Hata: ${e.message}');
  }

  // The argument type 'int' can't be assigned to the parameter type 'String'.
  // urunler.ekle(5);
}
```

**Çıktı:**

```text
Son görüntülenen ürünler: [Saat, Telefon, Kılıf]
Son görüntülenen sayfalar: [4, 7]
En iyi film: Son Vapur (2019)
En iyi restoran: Büryan Evi - Merkez
Merkez: [Dicle Sofrası, Büryan Evi]
Kampüs: [Kampüs Kafe]
2020 ve sonrası: [Kayıp Şehir, Dağların Sesi]
Hata: Liste boş olamaz
```

**Açıklama:**
- `ekle` metodu üç adımda çalışır: (1) Öğe zaten varsa çıkar (`remove`, yoksa hiçbir şey yapmaz), (2) başa ekle (`insert(0, ...)`), (3) kapasite aşıldıysa en eskiyi (sondakini) sil. Ürünler için adım adım: `[Kulaklık]` → `[Telefon, Kulaklık]` → `[Kılıf, Telefon, Kulaklık]` → `Telefon` zaten var, başa alınır: `[Telefon, Kılıf, Kulaklık]` → `Saat` eklenir, `Kulaklık` düşer: `[Saat, Telefon, Kılıf]`.
- `List<T> get liste => _ogeler.toList();`: Listenin **kopyasını** döndürür. Kopya yerine `_ogeler`'in kendisi döndürülseydi, dışarıdaki kod `urunler.liste.clear()` yazarak private listeyi boşaltabilirdi; kapsülleme bozulurdu (Hafta 4).
- `Film` ve `Restoran` sınıflarındaki `@override final String ad;`: Soyut getter'lar (`String get ad;`) bir `final` alanla da karşılanabilir. Alanın kendisi getter görevi görür.
- `T enIyi<T extends Puanlanabilir>`: Sınır sayesinde fonksiyonun içinde `puan` kullanılabiliyor; generic olduğu için de telefon listesine telefon, restoran listesine restoran döndürüyor. `restoran.semt` satırı bu yüzden derleniyor (Hafta 6, Bölüm 5.6).
- `grupla` içindeki `putIfAbsent(anahtar, () => [])`: Anahtar yoksa boş bir liste ekler; her durumda o anahtarın listesini döndürür. Ardından `.add(oge)` ile öğe listeye eklenir. Hafta 5'teki gruplama kalıbının tek satırlık ve generic hali.
- `Map<bool, List<Film>>`: Anahtar `bool` da olabilir. `yeniMi[true]` 2020 ve sonrası filmleri verir. `?.` kullanıldı; çünkü hiç yeni film olmasaydı `yeniMi[true]` `null` olurdu.
- **Ek görevin cevabı:** `urunler.ekle(5);` satırı "The argument type 'int' can't be assigned to the parameter type 'String'." hatasını verir. `urunler`, `SonGoruntulenenler<String>` olarak tanımlandığı için `ekle` metodunun parametresi `String`'tir; generic sınıf, yanlış tipteki değeri **derleme sırasında** reddeder.

## Soru 3 — Kampüs Kart Yükleme

**Çözümün mantığı:** Her doğrulama ya başarılıdır (temizlenmiş değer) ya da hatalıdır (kullanıcıya gösterilecek mesaj): Bu bir `Sonuc<T>`'dir. İki doğrulamanın sonucunu birlikte değerlendirmek için iki sonucu bir **record'da** birleştirip tek bir `switch` ifadesiyle eşleştiriyoruz.

```dart
// Dosya: 01_s3_kart_yukleme.dart
sealed class Sonuc<T> {}

class Basarili<T> extends Sonuc<T> {
  final T veri;

  Basarili(this.veri);
}

class Hatali<T> extends Sonuc<T> {
  final String mesaj;

  Hatali(this.mesaj);
}

Sonuc<String> kartNoDogrula(String girilen) {
  String rakamlar = girilen.replaceAll(' ', '');
  bool hepsiRakam = rakamlar.split('').every((c) => '0123456789'.contains(c));
  if (rakamlar.length != 8 || !hepsiRakam) {
    return Hatali('Kart numarası 8 haneli olmalı.');
  }
  return Basarili(rakamlar);
}

Sonuc<double> tutarDogrula(String girilen) {
  double? tutar = double.tryParse(girilen.trim().replaceAll(',', '.'));
  if (tutar == null) {
    return Hatali('Tutar bir sayı olmalı.');
  }
  if (tutar < 10) {
    return Hatali('En az 10 TL yüklenebilir.');
  }
  if (tutar > 1000) {
    return Hatali('En fazla 1000 TL yüklenebilir.');
  }
  return Basarili(tutar);
}

Sonuc<(String, double)> yuklemeHazirla(String kartNo, String tutar) =>
    switch ((kartNoDogrula(kartNo), tutarDogrula(tutar))) {
      (Hatali(:final mesaj), _) => Hatali(mesaj),
      (_, Hatali(:final mesaj)) => Hatali(mesaj),
      (Basarili(veri: final kart), Basarili(veri: final miktar)) => Basarili((kart, miktar)),
    };

String makbuz(Sonuc<(String, double)> sonuc) => switch (sonuc) {
      Basarili(veri: (final kart, final miktar)) =>
        'Kart ${kart.substring(0, 2)}****${kart.substring(6)}: ${miktar.toStringAsFixed(2)} TL yüklendi.',
      Hatali(:final mesaj) => 'İşlem reddedildi: $mesaj',
    };

void main() {
  List<(String, String)> istekler = [
    ('1234 5678', '50'),
    ('12345678', '7,5'),
    ('1234-5678', '100'),
    ('87654321', '250,75'),
    ('11112222', 'elli'),
    ('99998888', '1500'),
  ];

  for (var (kart, tutar) in istekler) {
    print(makbuz(yuklemeHazirla(kart, tutar)));
  }

  double toplam = istekler
      .map((i) => yuklemeHazirla(i.$1, i.$2))
      .whereType<Basarili<(String, double)>>()
      .fold(0.0, (t, b) => t + b.veri.$2);
  print('Toplam yüklenen: ${toplam.toStringAsFixed(2)} TL');
}
```

**Çıktı:**

```text
Kart 12****78: 50.00 TL yüklendi.
İşlem reddedildi: En az 10 TL yüklenebilir.
İşlem reddedildi: Kart numarası 8 haneli olmalı.
Kart 87****21: 250.75 TL yüklendi.
İşlem reddedildi: Tutar bir sayı olmalı.
İşlem reddedildi: En fazla 1000 TL yüklenebilir.
Toplam yüklenen: 300.75 TL
```

**Açıklama:**
- `kartNoDogrula`: Ödev 4'teki telefon doğrulamasıyla aynı yöntem: boşluklar silinir, `split('')` ile karakterlere bölünür, `every` ile hepsinin rakam olduğu kontrol edilir. `'1234-5678'` içindeki tire yüzünden reddedilir.
- `tutarDogrula`: `'7,5'` → `'7.5'` → 7.5. Türkçe klavyede kullanıcılar ondalık ayıracı olarak virgül yazar; mobil formlarda bu dönüşüm çok sık gerekir (Hafta 6'daki boş `catch` tuzağını hatırlayın).
- `yuklemeHazirla`'daki `switch`, iki sonucu bir record olarak eşleştirir. Kolların **sırası** önemlidir: Önce kart hatası, sonra tutar hatası kontrol edilir. İkisi de hatalıysa yalnızca kart hatası raporlanır. Üç kol birlikte bütün durumları kapsadığı için `_` koluna gerek yoktur; Dart bu eksiksizliği kendisi doğrular.
- `Basarili(veri: (final kart, final miktar))`: **İç içe desen.** "Sonuç başarılıysa, `veri` alanındaki record'u da `kart` ve `miktar` olarak aç." Hafta 6, Bölüm 6.5'teki nesne ve record desenlerinin birleşimi.
- `whereType<Basarili<(String, double)>>()`: Yalnızca başarılı sonuçları seçer; `b.veri.$2` record'un ikinci alanıdır (tutar). Toplam: 50 + 250,75 = 300,75.

## Soru 4 — Kargo Takip

**Çözümün mantığı:** Durum ve tahmini teslim istekleri birbirinden **bağımsızdır**; bu yüzden **paralel** gönderilir (`Future.wait`). Tahmini teslim gecikirse kullanıcıyı bekletmek yerine **yedek değer** gösterilir (`timeout` + `onTimeout`). Kurye konumu servisi geçici olarak meşgul olabildiği için **yeniden denenir**. Birden fazla numaranın sırayla sorgulanması ise bir **akıştır** (`async*`).

```dart
// Dosya: 01_s4_kargo_takip.dart
class KargoBulunamadi implements Exception {
  final String takipNo;

  KargoBulunamadi(this.takipNo);
}

class SahteKargoServisi {
  int _konumIstegi = 0;

  Future<String> durumGetir(String takipNo) async {
    await Future.delayed(Duration(milliseconds: 300));
    return switch (takipNo) {
      'TR100' => 'Dağıtımda',
      'TR200' => 'Transfer merkezinde',
      'TR300' => 'Teslim edildi',
      _ => throw KargoBulunamadi(takipNo),
    };
  }

  Future<String> tahminiTeslimGetir(String takipNo) async {
    await Future.delayed(Duration(milliseconds: takipNo == 'TR200' ? 3000 : 400));
    return takipNo == 'TR300' ? 'Bugün 14.20' : 'Yarın akşam';
  }

  Future<String> kuryeKonumuGetir() async {
    await Future.delayed(Duration(milliseconds: 200));
    _konumIstegi++;
    if (_konumIstegi < 3) {
      throw Exception('Konum servisi meşgul');
    }
    return 'Merkez, 2 km uzakta';
  }
}

Future<String> kargoOzeti(SahteKargoServisi servis, String takipNo) async {
  try {
    List<String> sonuclar = await Future.wait([
      servis.durumGetir(takipNo),
      servis.tahminiTeslimGetir(takipNo).timeout(Duration(seconds: 1), onTimeout: () => 'bilinmiyor'),
    ]);
    return '$takipNo: ${sonuclar[0]} (tahmini teslim: ${sonuclar[1]})';
  } on KargoBulunamadi {
    return '$takipNo: Böyle bir kargo bulunamadı.';
  }
}

Future<T> tekrarDene<T>(Future<T> Function() islem, {int enFazla = 3}) async {
  int deneme = 1;
  while (true) {
    try {
      return await islem();
    } on Exception {
      print('Konum denemesi $deneme başarısız.');
      if (deneme == enFazla) {
        rethrow;
      }
    }
    await Future.delayed(Duration(milliseconds: 100 * deneme));
    deneme++;
  }
}

Stream<String> takipAkisi(SahteKargoServisi servis, List<String> numaralar) async* {
  for (String no in numaralar) {
    yield await kargoOzeti(servis, no);
  }
}

Future<void> main() async {
  SahteKargoServisi servis = SahteKargoServisi();

  Stopwatch k = Stopwatch();
  k.start();
  print(await kargoOzeti(servis, 'TR100'));
  print(k.elapsedMilliseconds < 600 ? 'İstekler paralel gönderildi.' : 'İstekler sıralı gönderildi!');

  await for (String satir in takipAkisi(servis, ['TR200', 'TR300', 'TR999'])) {
    print(satir);
  }

  String konum = await tekrarDene(servis.kuryeKonumuGetir);
  print('Kurye konumu: $konum');
}
```

**Çıktı:**

```text
TR100: Dağıtımda (tahmini teslim: Yarın akşam)
İstekler paralel gönderildi.
TR200: Transfer merkezinde (tahmini teslim: bilinmiyor)
TR300: Teslim edildi (tahmini teslim: Bugün 14.20)
TR999: Böyle bir kargo bulunamadı.
Konum denemesi 1 başarısız.
Konum denemesi 2 başarısız.
Kurye konumu: Merkez, 2 km uzakta
```

**Açıklama:**
- **Paralel istek:** `Future.wait` listesi oluşturulurken iki istek de **hemen** başlar. TR100 için süre, uzun olanınki kadardır (~0,4 sn); sıralı yazılsaydı 0,3 + 0,4 = 0,7 sn sürerdi. `main`'deki 600 ms kontrolü bunu ölçüyor.
- **Zaman aşımı yalnızca tahmini teslim isteğine konuldu.** TR200'de bu istek 3 saniye sürüyor; 1 saniye sonra `onTimeout` devreye girer ve `'bilinmiyor'` kullanılır. Durum bilgisi ise normal şekilde gösterilir: Bir bilginin gecikmesi diğerini engellemez.
- **TR999:** `durumGetir` bir `KargoBulunamadi` fırlatır. `Future.wait`, diğer isteğin bitmesini bekledikten sonra bu hatayı **aynen** fırlatır ve `on KargoBulunamadi` onu yakalar. (Record ile `.wait` kullanılsaydı hata `ParallelWaitError` adlı başka bir türe sarılırdı; bu yüzden ipucunda `Future.wait` önerilmişti.)
- **`switch` içinde `throw`:** `_ => throw KargoBulunamadi(takipNo)`. `throw` bir **ifadedir**; bu yüzden `switch` ifadesinin bir kolunda kullanılabilir.
- **`tekrarDene(servis.kuryeKonumuGetir)`:** Metot çağrılmıyor, **kendisi** gönderiliyor (parantez yok). `tekrarDene` onu üç kez çağırabiliyor. `return await islem();` satırındaki `await` olmasaydı hata `try` bloğunun dışında oluşur ve yeniden deneme hiç yapılmazdı (Hafta 6, Bölüm 8.7).
- **`yield await kargoOzeti(...)`:** Önce özet beklenir, sonra akışa gönderilir. Numaralar **sırayla** sorgulanır; `main`'deki `await for` her özeti geldiği anda yazar.

## Soru 5 — Akıllı Su Şişesi

**Çözümün mantığı:** Sensör akışı üç aşamalı bir **boru hattından** geçer: geçersiz ölçümleri süz (`where`), toplamları üret (`async*`), toplamları izleyip hedefe ulaşınca dur (`await for` + `return`). Sensör arızası, akışın içinden gelen bir istisnadır ve `await for` etrafındaki `try-catch` ile yakalanır.

```dart
// Dosya: 01_s5_su_sisesi.dart
class SensorHatasi implements Exception {
  @override
  String toString() => 'SensorHatasi: Şişe ile bağlantı koptu';
}

Stream<int> yudumSensoru({bool arizali = false}) async* {
  List<int> olcumler = [150, 0, 220, -5, 180, 650, 300, 90, 250];
  for (int i = 0; i < olcumler.length; i++) {
    await Future.delayed(Duration(milliseconds: 100));
    if (arizali && i == 4) {
      throw SensorHatasi();
    }
    yield olcumler[i];
  }
}

Stream<int> gecerliYudumlar(Stream<int> kaynak) => kaynak.where((ml) => ml > 0 && ml <= 500);

Stream<int> toplamlar(Stream<int> yudumlar) async* {
  int toplam = 0;
  await for (int ml in yudumlar) {
    toplam += ml;
    yield toplam;
  }
}

String cubuk(int toplam, int hedef) {
  int yuzde = toplam * 100 ~/ hedef;
  int dolu = yuzde >= 100 ? 10 : yuzde ~/ 10;
  return '[${'#' * dolu}${'-' * (10 - dolu)}] %$yuzde';
}

Future<int> gunlukTakip(Stream<int> sensor, int hedef) async {
  int son = 0;
  try {
    await for (int toplam in toplamlar(gecerliYudumlar(sensor))) {
      son = toplam;
      print('${toplam.toString().padLeft(5)} ml ${cubuk(toplam, hedef)}');
      if (toplam >= hedef) {
        print('Günlük hedefe ulaşıldı!');
        return toplam;
      }
    }
    print('Gün bitti, hedefe ulaşılamadı.');
  } on SensorHatasi catch (e) {
    print('Uyarı: $e');
  }
  return son;
}

Future<void> main() async {
  print('--- 1. gün (hedef 800 ml) ---');
  int birinci = await gunlukTakip(yudumSensoru(), 800);
  print('Kaydedilen: $birinci ml');

  print('--- 2. gün (hedef 2000 ml) ---');
  int ikinci = await gunlukTakip(yudumSensoru(), 2000);
  print('Kaydedilen: $ikinci ml');

  print('--- 3. gün (sensör arızalı) ---');
  int ucuncu = await gunlukTakip(yudumSensoru(arizali: true), 800);
  print('Kaydedilen: $ucuncu ml');
}
```

**Çıktı:**

```text
--- 1. gün (hedef 800 ml) ---
  150 ml [#---------] %18
  370 ml [####------] %46
  550 ml [######----] %68
  850 ml [##########] %106
Günlük hedefe ulaşıldı!
Kaydedilen: 850 ml
--- 2. gün (hedef 2000 ml) ---
  150 ml [----------] %7
  370 ml [#---------] %18
  550 ml [##--------] %27
  850 ml [####------] %42
  940 ml [####------] %47
 1190 ml [#####-----] %59
Gün bitti, hedefe ulaşılamadı.
Kaydedilen: 1190 ml
--- 3. gün (sensör arızalı) ---
  150 ml [#---------] %18
  370 ml [####------] %46
Uyarı: SensorHatasi: Şişe ile bağlantı koptu
Kaydedilen: 370 ml
```

**Açıklama:**
- **Boru hattı:** `toplamlar(gecerliYudumlar(sensor))` içten dışa okunur: Sensörün ölçümleri önce süzülür (0, −5 ve 650 atılır), kalanların toplamları üretilir. Geçerli yudumlar: 150, 220, 180, 300, 90, 250.
- **`toplamlar` bir `async*` fonksiyonudur ve içinde başka bir akışı `await for` ile dinler.** Her yudumda o ana kadarki toplamı `yield` eder. Bir akıştan yeni bir akış üretmenin en okunaklı yolu budur.
- **`await for` içinden `return`:** 1. günde toplam 850'ye ulaşınca fonksiyon hemen döner. Döngüden çıkmak, akışın dinlenmesini **kendiliğinden durdurur** (abonelik iptal edilir); sensör kalan ölçümleri göndermez (Hafta 6, Bölüm 9.4).
- **`cubuk`:** Yüzde 106 olduğunda 10'dan fazla `#` çizilmesin diye kutu sayısı 10 ile sınırlandı. `toplam * 100 ~/ hedef` işleminde önce çarpma yapılır (soldan sağa); `toplam ~/ hedef * 100` yazılsaydı tam sayı bölmesi yüzünden sonuç hep 0 veya 100 olurdu.
- **3. gün:** Sensör 5. ölçümde (`i == 4`) hata fırlatır. Hata `where` ve `toplamlar` aşamalarından geçerek `gunlukTakip`'teki `await for`'a ulaşır ve `on SensorHatasi` tarafından yakalanır. Son bilinen toplam (370 ml) kaybolmaz; çünkü her toplam `son` değişkeninde saklanıyordu.

> 💡 **Ödevden derse:** Bu beş sorunun çıktılarını konsolda gördük. Ama bir kullanıcı, bir notu, bir kargo özetini veya bir ilerleme çubuğunu **konsolda** görmez; **telefon ekranında** görür. `cubuk` fonksiyonunun ürettiği `[####------]` metni, gerçek bir uygulamada renkli bir ilerleme çubuğu widget'ıdır. Bu hafta tam olarak bu geçişi yapıyoruz: verileri **widget'lara** dönüştürmek.

---

# 2. Dart'tan Flutter'a: Flutter Nasıl Çalışır?

## 2.1 Flutter nedir?

Flutter, Google'ın geliştirdiği, **Dart ile yazılan** bir arayüz (UI) kütüphanesidir. En önemli özelliği şudur: **Tek bir kod tabanından** birçok platform için uygulama üretir.

| Platform | Çıktı | Bu derste |
|---|---|---|
| Android | `.apk` / `.aab` | ✓ Ana hedefimiz |
| iOS | iPhone / iPad uygulaması | ✓ (derlemek için macOS gerekir) |
| Web | Tarayıcıda çalışan uygulama | ✓ Chrome ile deneme |
| Windows, macOS, Linux | Masaüstü uygulaması | Değinilecek |

Bir benzetme: Geleneksel yöntemde Android uygulaması **Kotlin** ile, iOS uygulaması **Swift** ile ayrı ayrı yazılır; aynı ekranı iki farklı ekip iki farklı dilde iki kez kodlar. Flutter'da ekran **bir kez**, Dart ile yazılır.

## 2.2 Flutter ekranı nasıl çizer?

Flutter'ı diğer birçok çözümden ayıran şey, ekrandaki her pikseli **kendisinin çizmesidir.** Android'in veya iOS'un hazır düğmelerini kullanmaz; düğmeyi, metni, gölgeyi kendi çizim motoruyla (adı **Impeller**) kendisi çizer.

Bir benzetme: İki farklı ev düşünün. Birincisinde mobilyalar hazır alınmıştır; her şehirde mağazada ne varsa o kullanılır, bu yüzden İstanbul'daki ev ile Siirt'teki ev biraz farklı görünür. İkincisinde bir marangoz her mobilyayı kendisi yapar; iki ev de **birebir aynı** görünür. Flutter ikinci evdeki marangozdur. Bu yüzden bir Flutter uygulaması Android'de de iOS'ta da aynı görünür.

## 2.3 Bildirimsel arayüz: Ekran, durumun bir fonksiyonudur

Flutter'ın arayüz yazma biçimine **bildirimsel** (declarative) denir. Farkı bir örnekle görelim. Bir sepet ekranında ürün sayısı değiştiğinde ekranın güncellenmesi gerekiyor.

**Emredici (imperative) yaklaşım** (eski yöntemler): "Ekrandaki sayaç etiketini **bul**, metnini 3 **yap**; sepet boşsa 'Ödeme' düğmesini **gizle**, değilse **göster**." Ekranın her parçasını adım adım siz değiştirirsiniz. Bir adımı unutursanız ekran ile veri birbirini tutmaz.

**Bildirimsel yaklaşım** (Flutter): "Sepette **n** ürün varsa ekran **şöyle görünür**." Ekranın tarifini bir kez yazarsınız; veri değiştiğinde Flutter tarifi **yeniden** okur ve ekranı baştan oluşturur.

Bu fikri aslında tanıyorsunuz. Hafta 6, Bölüm 10'daki `ciz` fonksiyonunu hatırlayın:

```text
ciz(EkranDurumu durum)  →  ekranda görünecek metin       (Hafta 6, konsol)
build(BuildContext context)  →  ekranda görünecek widget  (Flutter)
```

İkisi de aynı düşünceyi taşır: **Ekran = f(durum).** Durumu verirsiniz, ekranın nasıl görüneceğini fonksiyon söyler.

## 2.4 Widget: Ekranın bir parçasının tarifi

Flutter'da ekrandaki her şey bir **widget**'tır: bir metin, bir simge, bir boşluk, bir hizalama, bir düğme, hatta uygulamanın kendisi. Widget'ı ekranın bir parçasının **tarifi** olarak düşünün.

Bir benzetme: Widget bir **yemek tarifidir**; yemeğin kendisi değildir. "Ortaya hizalanmış, 24 punto, kalın bir 'Merhaba' yazısı" bir tariftir. Flutter bu tarifi okur ve ekranda gerçek pikselleri oluşturur. Tarif değişirse (örneğin metin "Hoş geldin" olursa), Flutter yeni tarife bakar ve ekranın **yalnızca değişen kısmını** günceller.

Bu benzetmenin önemli bir sonucu var: **Tarifler değiştirilmez, yenisi yazılır.** Widget'lar **değişmezdir** (immutable); alanları `final`'dır. Ekranda bir şey değişecekse eski widget değiştirilmez, yeni bir widget oluşturulur. Bölüm 6'da bunun kodda nasıl göründüğünü göreceğiz.

> 💡 **Perde arkası (ileri okuma):** Flutter aslında üç ağaçla çalışır: **Widget ağacı** (sizin yazdığınız tarifler), **Element ağacı** (tariflerin ekrandaki yerini takip eden yönetici nesneler) ve **Render ağacı** (boyut hesaplayan ve çizen nesneler). Bu derste yalnızca widget ağacını yazacağız; diğer ikisini Flutter yönetir. Hata mesajlarında `RenderFlex`, `RenderBox` gibi adlar görürseniz, bunların render ağacındaki nesneler olduğunu bilin.

## 2.5 Geliştirme sırasında ve yayında: JIT ve AOT

Flutter uygulaması iki farklı biçimde derlenir:

| | Geliştirme (debug) | Yayın (release) |
|---|---|---|
| Derleme türü | **JIT** (Just-In-Time, çalışırken derleme) | **AOT** (Ahead-Of-Time, önceden makine koduna derleme) |
| Hız | Biraz yavaş | Hızlı, akıcı |
| Hot reload | **Var**: Kodu kaydedin, ekran 1 saniyede güncellensin | Yok |
| `assert`'ler | Açık (Hafta 6, Bölüm 4.6) | Kaldırılmış |
| Ekranın sağ üstü | "DEBUG" şeridi | Şerit yok |
| Ne zaman? | Ders boyunca | Mağazaya yüklerken |

Geliştirme modunda uygulamanın bir miktar yavaş çalışması normaldir; performansı her zaman yayın modunda (`flutter run --release`) ölçün.

---

# 3. İlk Flutter Projesi

## 3.1 Projeyi oluşturmak

Terminali açın (VS Code'da **Terminal → New Terminal**) ve şu komutları yazın:

```text
cd C:\dev\bmh309
flutter create hafta7
cd hafta7
code .
```

**Açıklama:**
- `flutter create hafta7`: `hafta7` adında yeni bir Flutter projesi oluşturur. Komut birkaç saniye sürer ve sonunda "All done!" yazar.
- **Proje adı kuralı:** Proje adı küçük harf, rakam ve alt çizgiden oluşmalıdır (`hafta7`, `kampus_app`). `Hafta 7` veya `kampüs-app` gibi adlar kabul edilmez; Türkçe karakter ve boşluk kullanmayın.
- `code .`: Klasörü VS Code'da açar. Alternatif olarak VS Code'da `Ctrl + Shift + P` → **Flutter: New Project** komutu da aynı işi yapar.

## 3.2 Proje yapısı

`flutter create` birçok dosya ve klasör oluşturur. İlk anda kalabalık görünebilir; ama bu derste neredeyse bütün zamanımızı **iki** yerde geçireceğiz: `lib` klasörü ve `pubspec.yaml` dosyası.

```text
hafta7/
├── lib/
│   └── main.dart          ← Uygulamanın kodu burada (bütün Dart dosyalarımız)
├── pubspec.yaml           ← Projenin kimliği ve kullandığı paketler
├── analysis_options.yaml  ← Kod denetim (lint) kuralları
├── test/
│   └── widget_test.dart   ← Otomatik testler (ileride)
├── android/               ← Android'e özgü ayarlar (izinler, uygulama simgesi...)
├── ios/                   ← iOS'a özgü ayarlar
├── web/                   ← Web'e özgü dosyalar
├── windows/ linux/ macos/ ← Masaüstü platformları
├── .dart_tool/            ← Araçların ürettiği dosyalar (elle değiştirmeyin)
└── build/                 ← Derleme çıktıları (elle değiştirmeyin)
```

| Klasör / dosya | Ne zaman dokunacağız? |
|---|---|
| `lib/` | **Her zaman.** Bütün Dart kodumuz burada. |
| `pubspec.yaml` | Paket veya resim/yazı tipi eklerken |
| `analysis_options.yaml` | Kod denetim kurallarını değiştirirken (nadiren) |
| `test/` | Test yazarken (Hafta 13) |
| `android/`, `ios/` | Uygulama adı, simgesi, izinler (kamera, konum) ayarlanırken |
| `.dart_tool/`, `build/` | **Hiçbir zaman.** Bunlar otomatik üretilir; Git'e de eklenmez. |

## 3.3 pubspec.yaml: Projenin kimlik kartı

`pubspec.yaml`, projenin adını, sürümünü ve kullandığı **paketleri** (dış kütüphaneleri) tanımlar. Yorum satırları çıkarıldığında şuna benzer:

```text
name: hafta7
description: "A new Flutter project."
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: ^3.10.0

dependencies:
  flutter:
    sdk: flutter
  material_ui: ^1.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0

flutter:
  uses-material-design: true
```

**Açıklama:**
- `name`: Projenin adı. `import 'package:hafta7/...'` yazarken bu ad kullanılır.
- `version: 1.0.0+1`: Uygulamanın sürümü. `+1`'den sonraki sayı, mağazaların kullandığı derleme numarasıdır.
- `environment: sdk:`: Projenin çalışacağı Dart sürümü aralığı. Bu satır, sizin bilgisayarınızdaki sürüme göre otomatik yazılır.
- `dependencies`: Uygulamanın **çalışırken** ihtiyaç duyduğu paketler. `flutter` çerçevenin kendisidir; `material_ui` ise Material Design widget'larını (`Scaffold`, `AppBar`, düğmeler...) içeren pakettir (Bölüm 3.4).
- `dev_dependencies`: Yalnızca **geliştirme sırasında** gereken paketler: test araçları ve `flutter_lints` (Problems panelinde gördüğünüz önerilerin kaynağı).
- `uses-material-design: true`: Material simgelerinin (`Icons.home`, `Icons.add`...) uygulamaya eklenmesini sağlar.
- Sizin dosyanızdaki sürüm numaraları biraz farklı olabilir; `flutter create` her zaman kullandığınız Flutter sürümüne uygun numaraları yazar.

> ⚠️ **YAML'da girinti anlamlıdır.** `material_ui:` satırı `dependencies:`'in altında **iki boşluk** içeride olmalıdır. Sekme (Tab) karakteri kullanmayın. Yanlış girinti, "Error on line 12" gibi bir hatayla `flutter pub get` komutunun başarısız olmasına yol açar.

**Paket eklemek:** Bir paketi elle yazmak yerine terminalde `flutter pub add paket_adi` komutunu kullanın; doğru satırı doğru yere kendisi ekler. `pubspec.yaml` dosyasını kaydettiğinizde VS Code paketleri otomatik olarak indirir (`flutter pub get`).

## 3.4 material_ui: Neden `package:flutter/material.dart` değil?

Bu nottaki bütün örnekler şu satırla başlıyor:

```text
import 'package:material_ui/material_ui.dart';
```

İnternetteki örneklerin, kitapların, video derslerin ve AI araçlarının neredeyse tamamında ise şu satırı göreceksiniz:

```text
import 'package:flutter/material.dart';
```

**Neden iki farklı yazım var?** Material Design widget'ları yıllarca Flutter'ın **içindeydi** (`package:flutter/material.dart`). Flutter ekibi 2026'da bu widget'ları çerçeveden ayırıp **bağımsız bir paket** haline getirdi: `material_ui`. Böylece Material widget'ları Flutter'ın kendisinden bağımsız olarak daha hızlı güncellenebiliyor. Flutter 3.50 ile eski içe aktarma **kullanımdan kaldırıldı** (deprecated) ve `flutter create` artık yeni projeleri `material_ui` ile oluşturuyor. (Aynı şekilde iOS görünümlü widget'lar da `cupertino_ui` paketine taşındı.)

| | Eski yazım | Yeni yazım |
|---|---|---|
| İçe aktarma | `package:flutter/material.dart` | `package:material_ui/material_ui.dart` |
| `pubspec.yaml` | Ek satır gerekmez | `material_ui: ^1.1.0` |
| Çalışır mı? | Evet, ama VS Code uyarı verir | Evet |
| Widget adları | `Scaffold`, `AppBar`, `Text`... | **Aynı** |

Widget'ların adları ve kullanımları **değişmedi**. Eski bir örneği kullanmak istediğinizde yalnızca içe aktarma satırını değiştirmeniz yeterlidir. Eski bir projeyi topluca taşımak için Flutter şu komutu sunar:

```text
dart fix --apply --code=migrate_design_widgets
```

> 🤖 **AI uyarısı:** AI araçları büyük olasılıkla size `package:flutter/material.dart` yazacaktır; çünkü öğrendikleri kodların neredeyse tamamı bu dönüşümden önce yazıldı. Kod çalışır; ama Problems panelinde şu uyarıyı görürsünüz: *"'package:flutter/material.dart' is deprecated and shouldn't be used. Use package:material_ui/material_ui.dart instead."* Bu, AI'ın ürettiği kodu neden **okumanız** gerektiğinin ilk Flutter örneği.

## 3.5 Varsayılan uygulama ve ilk çalıştırma

`flutter create` ile gelen `lib/main.dart` dosyasında hazır bir **sayaç uygulaması** vardır: Sağ alttaki **+** düğmesine her bastığınızda ortadaki sayı bir artar. Bu uygulama `StatefulWidget` kullanır; onu gelecek hafta ayrıntılı inceleyeceğiz. Şimdilik yalnızca çalıştıralım:

1. VS Code'un sağ alt köşesindeki **cihaz seçiciye** tıklayın ve bir cihaz seçin (Android emülatörü, bağlı telefonunuz veya Chrome).
2. `lib/main.dart` dosyasını açın ve **F5**'e basın (ya da `main`'in üstündeki **Run** bağlantısına tıklayın).
3. İlk çalıştırma Android'de 1–3 dakika sürebilir; çünkü Android projesi baştan derlenir. Sonraki çalıştırmalar çok daha hızlıdır.

Uygulama açıldıktan sonra **hot reload**'u deneyin: `main.dart` içinde `'You have pushed the button this many times:'` metnini `'Düğmeye bu kadar bastınız:'` olarak değiştirin ve dosyayı **kaydedin** (`Ctrl + S`). Ekran bir saniye içinde güncellenir ve **sayaç sıfırlanmaz.** Hot reload'u Bölüm 11'de ayrıntılı inceleyeceğiz.

Terminalden çalıştırıyorsanız uygulama açıkken şu tuşlar kullanılır:

| Tuş | İşlevi |
|---|---|
| `r` | Hot reload (kodu yeniden yükle, durumu koru) |
| `R` | Hot restart (uygulamayı baştan başlat, durumu sıfırla) |
| `q` | Uygulamayı kapat |

## 3.6 Bu haftanın çalışma düzeni

Bu hafta her örnek, projenin `lib` klasöründe **ayrı bir dosyadır** ve kendi `main` fonksiyonunu içerir. Böylece `main.dart`'ı her örnekte silip yeniden yazmanız gerekmez.

- Yeni bir örnek için `lib` klasörüne sağ tıklayın → **New File** → dosya adını yazın (`ornek_04_01_en_kucuk.dart`).
- Kodu yapıştırın veya yazın, kaydedin.
- `main`'in üstündeki **Run** bağlantısına tıklayın. Terminalden: `flutter run -t lib/ornek_04_01_en_kucuk.dart`.

> 💡 Dosya adları neden `ornek_` ile başlıyor? Dart dosya adlarının **rakamla başlamaması** önerilir. `04_01_en_kucuk.dart` gibi bir ad çalışır; ama Flutter projelerindeki kod denetimi (`file_names` kuralı) Problems panelinde bir uyarı gösterir.

---

# 4. İlk Ekran: runApp, MaterialApp, Scaffold

## 4.1 En küçük Flutter uygulaması

```dart
// Dosya: lib/ornek_04_01_en_kucuk.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: Text('Merhaba Flutter!')));
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ 12:30               ▲ ■ 87%  │  ← telefonun durum çubuğu
│Merhaba Flutter!              │  ← büyük, kırmızı, sarı çift alt çizgili
│ ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾             │
│                              │
│         (siyah zemin)        │
│                              │
└──────────────────────────────┘
```

**Açıklama:**
- `import 'package:material_ui/material_ui.dart';`: Material widget'larını (ve Flutter'ın temel widget'larını) dosyaya ekler.
- `runApp(widget)`: Verilen widget'ı uygulamanın **kökü** yapar ve ekranın tamamına yerleştirir. Her Flutter uygulamasının `main` fonksiyonu `runApp` çağırır.
- `MaterialApp`: Uygulamanın tamamını saran widget. Tema, sayfa geçişleri, dil ayarları gibi uygulama düzeyindeki işleri yönetir. `home:` uygulama açıldığında görünecek ilk ekrandır.
- **Neden metin bu kadar çirkin?** Metni bir `Scaffold` (veya Material zemin) içine koymadık. `MaterialApp`, Material zemin olmadan yazılan metinleri **bilerek** büyük, kırmızı ve sarı çift alt çizgili gösterir: "Bu metin bir Material zemin içinde değil, bir şeyi unuttun!" Ekranınızda bu görünümü gördüğünüzde çözüm neredeyse her zaman metni bir `Scaffold`'un içine almaktır.
- Metin ayrıca durum çubuğunun altına, sol üste yapışık durur: Henüz hiçbir hizalama veya boşluk widget'ı kullanmadık.

## 4.2 Scaffold: Bir ekranın iskeleti

Neredeyse her ekran aynı iskelete sahiptir: üstte bir başlık çubuğu, ortada içerik, bazen sağ altta yuvarlak bir eylem düğmesi, bazen altta bir gezinme çubuğu. `Scaffold` (iskele) bu iskeleti hazır sunar:

```dart
// Dosya: lib/ornek_04_02_scaffold.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const KampusApp());
}

class KampusApp extends StatelessWidget {
  const KampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kampüs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.indigo)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Siirt Üniversitesi')),
        body: const Center(child: Text('Kampüse hoş geldiniz!')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ 12:30               ▲ ■ 87%  │
│ Siirt Üniversitesi           │  ← AppBar (başlık çubuğu)
├──────────────────────────────┤
│                              │
│                              │
│    Kampüse hoş geldiniz!     │  ← body: ortalanmış metin
│                              │
│                              │
│                        ╭───╮ │
│                        │ + │ │  ← FloatingActionButton
│                        ╰───╯ │
└──────────────────────────────┘
```

**Açıklama:**
- `KampusApp`: **Kendi** widget'ımız. `StatelessWidget`'tan türer ve ekranın tarifini `build` metodunda döndürür. Bu yapıyı Bölüm 6'da ayrıntılı inceleyeceğiz; şimdilik "her ekran parçası bir sınıftır ve `build` metodu onun nasıl görüneceğini söyler" demek yeterli.
- `debugShowCheckedModeBanner: false`: Sağ üstteki kırmızı "DEBUG" şeridini gizler.
- `theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.indigo))`: Uygulamanın renklerini tek bir **tohum renkten** (seed color) üretir. Material 3, bu renkten uyumlu bir renk paleti (ana renk, ikincil renk, zemin renkleri...) hesaplar. `.fromSeed` yazımını Bölüm 4.3'te açıklayacağız.
- `Scaffold` parametreleri:

| Parametre | Ekrandaki yeri | Tipik içerik |
|---|---|---|
| `appBar` | Üst çubuk | `AppBar(title: Text(...))` |
| `body` | Ana içerik | Ekranın asıl içeriği |
| `floatingActionButton` | Sağ alttaki yuvarlak düğme | `FloatingActionButton` |
| `bottomNavigationBar` | Alt gezinme çubuğu | `NavigationBar` (ileride) |
| `drawer` | Soldan açılan menü | `Drawer` (ileride) |
| `backgroundColor` | Zemin rengi | Bir `Color` |

- `onPressed: () {}`: Düğmeye basılınca çalışacak fonksiyon (Hafta 5'teki isimsiz fonksiyonlar). Şimdilik boş; gelecek hafta düğmelerle ekranı değiştireceğiz.
- `const Text(...)`, `const Center(...)`: `const`'u Bölüm 6.4'te açıklayacağız.

## 4.3 Nokta kısaltmaları (dot shorthands)

Bölüm 4.2'deki `.fromSeed(...)` yazımı size garip gelmiş olabilir. Bu, **Dart 3.10** ile gelen bir dil özelliğidir: **nokta kısaltması** (dot shorthand). Yeni Flutter projelerinin şablonunda kullanıldığı için her yerde göreceksiniz.

**Kural:** Bir yere hangi tipte bir değer yazılacağı **zaten belliyse**, o tipin adını yazmadan doğrudan nokta ile başlayabilirsiniz.

```dart
// Dosya: lib/ornek_04_03_nokta_kisaltma.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const NoktaKisaltmaApp());
}

class NoktaKisaltmaApp extends StatelessWidget {
  const NoktaKisaltmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.teal)),
      home: const Scaffold(
        body: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .stretch,
          children: [
            Text('Uzun yazım', textAlign: TextAlign.center),
            Text('Kısa yazım', textAlign: .center),
            Text(
              'Kalın ve ortada',
              textAlign: .center,
              style: TextStyle(fontWeight: .bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│                              │
│                              │
│          Uzun yazım          │
│          Kısa yazım          │
│      **Kalın ve ortada**     │
│                              │
│                              │
└──────────────────────────────┘
```

**Açıklama:** `textAlign` parametresinin tipi `TextAlign`'dır. Dart bunu bildiği için `TextAlign.center` yerine yalnızca `.center` yazabiliriz. İki satır **tamamen aynı** anlama gelir.

| Uzun yazım | Kısa yazım | Neden mümkün? |
|---|---|---|
| `mainAxisAlignment: MainAxisAlignment.center` | `mainAxisAlignment: .center` | Parametrenin tipi `MainAxisAlignment` |
| `textAlign: TextAlign.center` | `textAlign: .center` | Parametrenin tipi `TextAlign` |
| `fontWeight: FontWeight.bold` | `fontWeight: .bold` | Parametrenin tipi `FontWeight` |
| `colorScheme: ColorScheme.fromSeed(...)` | `colorScheme: .fromSeed(...)` | Parametrenin tipi `ColorScheme`; `fromSeed` onun bir kurucusu |
| `padding: EdgeInsets.all(16)` | `padding: .all(16)` | Parametrenin tipi bir kenar boşluğu tipi |

Kısaltma **her yerde** kullanılamaz. Değerin, beklenen tipin **kendi** üyesi olması gerekir:

```dart
// Dosya: lib/ornek_04_04_tuzak_nokta.dart
// ❌ DERLEME HATASI
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(backgroundColor: .indigo)));
}
```

**Hata mesajı:**

```text
The static getter 'indigo' isn't defined for the context type 'Color'.
```

**Açıklama:** `backgroundColor`'ın tipi `Color`'dır; ama `indigo` rengi `Color` sınıfının değil, `Colors` (sonunda **s** olan) sınıfının bir üyesidir. Bu yüzden renkler her zaman tam adıyla yazılır: `Colors.indigo`. Aynı şekilde simgeler de `Icons.add` olarak yazılır.

> 💡 **Hangisini kullanmalı?** İkisi de doğrudur. Bu notta, yeni Flutter projelerindeki şablona uygun olarak enum değerlerinde ve kurucularda kısa yazımı kullanacağız. İnternetteki eski kodlarda ve AI çıktılarında uzun yazımı göreceksiniz; ikisini de okuyabilmeniz yeterli. Kısa yazım Dart 3.10 ve sonrasında çalışır; daha eski bir sürümde "Expected an identifier" gibi hatalar alırsınız.

## 4.4 MaterialApp ve tema

`MaterialApp`'in en sık kullanılan parametreleri:

| Parametre | Ne işe yarar? |
|---|---|
| `home` | Açılıştaki ekran |
| `title` | Uygulamanın görev yöneticisindeki (son uygulamalar ekranındaki) adı |
| `theme` | Açık tema: renkler, yazı tipleri, bileşen görünümleri |
| `darkTheme` + `themeMode` | Karanlık tema ve hangisinin kullanılacağı (ileride) |
| `debugShowCheckedModeBanner` | "DEBUG" şeridini gösterir / gizler |

Tema bir kez `MaterialApp`'te tanımlanır; uygulamadaki bütün widget'lar renklerini oradan alır. Tohum rengi `Colors.indigo` yerine `Colors.green` yapıp kaydedin: Başlık çubuğundan düğmelere kadar her şeyin rengi **birlikte** değişir. Bir widget'ın içinden temaya nasıl erişildiğini Bölüm 6.5'te göreceğiz.

---

# 5. Widget Ağacı

## 5.1 Kod bir ağaçtır

Flutter'da widget'lar **iç içe** yazılır: Bir widget'ın içinde başka widget'lar, onların içinde başka widget'lar... Bu iç içe yapıya **widget ağacı** denir. Basit bir profil ekranı yazalım:

```dart
// Dosya: lib/ornek_05_01_agac.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Profil')),
        body: const Center(
          child: Column(
            mainAxisSize: .min,
            children: [
              Icon(Icons.account_circle, size: 96),
              Text('Ayşe Yılmaz'),
              Text('Bilgisayar Mühendisliği'),
            ],
          ),
        ),
      ),
    ),
  );
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ Profil                       │
├──────────────────────────────┤
│                              │
│              ◉               │  ← büyük kişi simgesi
│         Ayşe Yılmaz          │
│   Bilgisayar Mühendisliği    │
│                              │
└──────────────────────────────┘
```

Aynı kodun **widget ağacı**:

```text
MaterialApp
 └─ home: Scaffold
     ├─ appBar: AppBar
     │   └─ title: Text("Profil")
     └─ body: Center
         └─ child: Column
             ├─ Icon(account_circle)
             ├─ Text("Ayşe Yılmaz")
             └─ Text("Bilgisayar Mühendisliği")
```

**Açıklama:**
- Ağacın **kökü** `MaterialApp`'tir. Her widget, kendisini içeren widget'ın **çocuğudur**: `Column`, `Center`'ın çocuğu; üç `Text`/`Icon` ise `Column`'un çocuklarıdır.
- Koddaki girintiler ağacın dallarını gösterir. Kodu her kaydettiğinizde `Shift + Alt + F` ile biçimlendirin; doğru girinti, ağacı okumayı kolaylaştırır.
- Kapanış parantezlerinin sonundaki **virgüller** (`),`) önemlidir: Dart biçimlendiricisi virgül gördüğü yerde satırı böler ve ağaç yapısı kodda görünür hale gelir.
- `mainAxisSize: .min`: Sütunun yalnızca çocukları kadar yer kaplamasını sağlar; bu sayede `Center` sütunu dikeyde de ortalayabilir. Bunu Bölüm 8'de açıklayacağız.

## 5.2 child ve children

Widget'lar çocuk sayısına göre üç gruba ayrılır:

| Grup | Parametre | Örnekler |
|---|---|---|
| Çocuksuz (yaprak) | — | `Text`, `Icon`, `Image`, `CircularProgressIndicator` |
| Tek çocuklu | `child:` | `Center`, `Padding`, `Container`, `SizedBox`, `Align`, `Card`, `Expanded` |
| Çok çocuklu | `children: [...]` | `Column`, `Row`, `Stack`, `Wrap`, `ListView` |

- `child` bir **widget** alır; `children` ise bir **widget listesi** (`List<Widget>`) alır. `children: Text('...')` yazarsanız derleme hatası alırsınız.
- `Scaffold` ve `AppBar` gibi bazı widget'ların çocukları için özel adlar vardır: `body`, `appBar`, `title`... Bunlar da birer `child`'dır; yalnızca ekrandaki yerlerine göre adlandırılmışlardır.

## 5.3 Kompozisyon: Özellik yerine sarmalama

Flutter'ın en önemli tasarım fikri şudur: **Yeni bir özellik istiyorsanız widget'ı başka bir widget ile sarın.**

- Bir metnin etrafında boşluk mu istiyorsunuz? `Text`'in `padding` diye bir parametresi yoktur; onu `Padding` ile sararsınız.
- Bir simgeyi ortalamak mı istiyorsunuz? `Center` ile sararsınız.
- Bir kartı tıklanabilir yapmak mı istiyorsunuz? (Gelecek hafta) `InkWell` ile sararsınız.

```text
Text("Merhaba")
        ↓  Padding ile sar
Padding(padding: .all(16), child: Text("Merhaba"))
        ↓  Center ile sar
Center(child: Padding(padding: .all(16), child: Text("Merhaba")))
```

Bir benzetme: **Hediye paketi.** Hediyeyi (metni) önce bir kutuya (`Padding`), kutuyu süslü bir kâğıda (`Container`), onu da bir poşete (`Center`) koyarsınız. Her katman tek bir iş yapar.

> 💡 **VS Code ipucu:** Bir widget'ın adına tıklayın ve `Ctrl + .` (nokta) tuşlarına basın. Açılan menüde **Wrap with Padding**, **Wrap with Center**, **Wrap with Column**, **Wrap with widget...**, **Remove this widget** gibi seçenekler çıkar. Parantezlerle uğraşmadan sarmalama yapmanın en güvenli yolu budur.

## 5.4 Okuma alıştırması

**Soru:** Aşağıdaki ağacı koda çevirin.

```text
Scaffold
 └─ body: Padding (her kenardan 24)
     └─ child: Column
         ├─ Text("Bugünkü Menü")
         ├─ Text("Mercimek çorbası")
         └─ Text("Pilav")
```

**Cevap:**

```dart
// Dosya: lib/ornek_05_02_okuma.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: .all(24),
          child: Column(
            children: [
              Text('Bugünkü Menü'),
              Text('Mercimek çorbası'),
              Text('Pilav'),
            ],
          ),
        ),
      ),
    ),
  );
}
```

**Açıklama:** Ağaçtaki her satır bir widget kurucusuna, her dal bir `child:` veya `children:` parametresine dönüşür. Bu örnekte bütün değerler sabit olduğu için en dıştaki `const` tüm ağaca yayılır; içerideki widget'ların önüne ayrıca `const` yazmaya gerek kalmaz. Sütun, `Scaffold`'un tepesinden başlar ve durum çubuğunun **altına** kayabilir; bunu Bölüm 7.5'teki `SafeArea` ile çözeceğiz.

---

# 6. Kendi Widget'ımızı Yazmak: StatelessWidget ve BuildContext

## 6.1 İlk kendi widget'ımız

Bir uygulamada aynı görünüm defalarca tekrarlanır: öğrenci kartları, ürün kartları, mesaj satırları... Bu görünümü bir kez **kendi widget'ımız** olarak yazarız ve farklı verilerle tekrar tekrar kullanırız.

```dart
// Dosya: lib/ornek_06_01_profil_karti.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const ProfilApp());
}

class ProfilApp extends StatelessWidget {
  const ProfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ProfilKarti(
            ad: 'Ayşe Yılmaz',
            bolum: 'Bilgisayar Mühendisliği',
            sinif: 3,
          ),
        ),
      ),
    );
  }
}

class ProfilKarti extends StatelessWidget {
  const ProfilKarti({
    super.key,
    required this.ad,
    required this.bolum,
    required this.sinif,
  });

  final String ad;
  final String bolum;
  final int sinif;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        const Icon(Icons.account_circle, size: 96),
        Text(ad, style: const TextStyle(fontSize: 22, fontWeight: .bold)),
        Text(bolum),
        Text('$sinif. sınıf'),
      ],
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│                              │
│              ◉               │
│        **Ayşe Yılmaz**       │
│   Bilgisayar Mühendisliği    │
│           3. sınıf           │
│                              │
└──────────────────────────────┘
```

`ProfilKarti` sınıfını parça parça inceleyelim; neredeyse her satırı önceki haftalardan tanıyorsunuz:

| Kod | Anlamı | Hangi hafta? |
|---|---|---|
| `class ProfilKarti extends StatelessWidget` | `StatelessWidget` soyut bir sınıftır; ondan türüyoruz | Hafta 4–5 |
| `const ProfilKarti({...})` | **const kurucu**: Bütün argümanlar sabitse nesne derleme sırasında oluşturulabilir | Hafta 4 |
| `super.key` | Üst sınıfın `key` parametresini iletir (Bölüm 6.4) | Hafta 4 |
| `required this.ad` | Zorunlu, isimlendirilmiş parametre; değeri doğrudan `ad` alanına yazılır | Hafta 3–4 |
| `final String ad;` | Widget'lar değişmezdir; bütün alanlar `final` olmalıdır | Hafta 4 |
| `@override Widget build(BuildContext context)` | Soyut `build` metodunu yazıyoruz: "Bu widget nasıl görünür?" | Hafta 5 |

**Açıklama:**
- `StatelessWidget`: "Durumsuz widget." Görünümü yalnızca **kurucusuna verilen değerlere** bağlıdır; kendi içinde değişen bir şey yoktur. Aynı değerlerle her zaman aynı görünür.
- `build` metodu bir `Widget` döndürür. Bu widget, `ProfilKarti`'nın ekrandaki tarifidir. Flutter, `ProfilKarti`'nı çizeceği zaman bu metodu **kendisi** çağırır; siz hiçbir zaman `build`'i elle çağırmazsınız.
- `Text('$sinif. sınıf')`: Hafta 1'deki metin içine değer yerleştirme (string interpolation).
- `ProfilApp` da bir `StatelessWidget`'tır. Flutter uygulamaları yukarıdan aşağıya **kendi widget'larınızın** iç içe geçmesiyle oluşur.

## 6.2 Bir kez yaz, çok kullan

Kendi widget'ımızın asıl gücü, onu **farklı verilerle** tekrar kullanmaktır. Bir ders listesindeki öğrencileri gösterelim. Veriyi bir model sınıfında (Hafta 4) tutuyoruz:

```dart
// Dosya: lib/ornek_06_02_ogrenci_listesi.dart
import 'package:material_ui/material_ui.dart';

class Ogrenci {
  final String ad;
  final String numara;
  final double ortalama;

  const Ogrenci(this.ad, this.numara, this.ortalama);
}

const List<Ogrenci> ogrenciler = [
  Ogrenci('Ayşe Yılmaz', '23010101', 3.45),
  Ogrenci('Mert Kaya', '23010102', 2.80),
  Ogrenci('Zeynep Ak', '23010103', 3.92),
];

void main() {
  runApp(const OgrenciApp());
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('BMH309 Öğrencileri')),
        body: Column(
          children: [
            for (final Ogrenci o in ogrenciler) OgrenciSatiri(ogrenci: o),
          ],
        ),
      ),
    );
  }
}

class OgrenciSatiri extends StatelessWidget {
  const OgrenciSatiri({super.key, required this.ogrenci});

  final Ogrenci ogrenci;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(ogrenci.ad),
      subtitle: Text(ogrenci.numara),
      trailing: Text(ogrenci.ortalama.toStringAsFixed(2)),
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ BMH309 Öğrencileri           │
├──────────────────────────────┤
│ 👤  Ayşe Yılmaz         3.45 │
│     23010101                 │
│ 👤  Mert Kaya           2.80 │
│     23010102                 │
│ 👤  Zeynep Ak           3.92 │
│     23010103                 │
│                              │
└──────────────────────────────┘
```

**Açıklama:**
- `for (final Ogrenci o in ogrenciler) OgrenciSatiri(ogrenci: o)`: Liste içinde **for** (collection for, Hafta 3). Her öğrenci için bir `OgrenciSatiri` widget'ı üretilir ve `children` listesine eklenir. Aynı işi Hafta 5'teki `map` ile de yapabilirdik: `children: ogrenciler.map((o) => OgrenciSatiri(ogrenci: o)).toList()`.
- `Ogrenci` sınıfının da `const` kurucusu var; bu yüzden öğrenci listesi derleme sırasında oluşturulabilen bir sabittir (`const List<Ogrenci>`).
- `ListTile`: Material'in hazır **liste satırı** widget'ı: solda simge (`leading`), ortada başlık ve alt başlık, sağda ek bilgi (`trailing`). Bölüm 7.6'da ayrıntılı göreceğiz.
- **Veri ile görünüm ayrıldı:** Yeni bir öğrenci eklemek için yalnızca `ogrenciler` listesine bir satır eklemek yeter; arayüz kodu değişmez. Gerçek uygulamada bu liste internetten (Hafta 6'daki gibi bir `Future`'dan) gelecektir.

## 6.3 Büyük build metotlarını bölmek

Bir ekranın bütün kodunu tek bir `build` metoduna yazarsanız, metot yüzlerce satıra ve onlarca girinti düzeyine ulaşır. Okumak, anlamak ve değiştirmek zorlaşır. Kural: **Bir ekran parçası kendi başına anlamlıysa onu ayrı bir widget sınıfı yapın.**

> 💡 **VS Code ipucu:** Ayırmak istediğiniz widget'ın adına tıklayın → `Ctrl + .` → **Extract Widget**. VS Code sizden bir sınıf adı ister, seçili ağacı yeni bir `StatelessWidget` sınıfına taşır ve gerekli parametreleri kendisi ekler.

Widget'ı bir **yardımcı metoda** (`Widget _baslikOlustur() {...}`) ayırmak da mümkündür; ama ayrı bir **sınıf** tercih edilir: Sınıflar `const` olabilir, Flutter onları ayrı ayrı yeniden çizebilir ve DevTools'ta (Bölüm 11) kendi adlarıyla görünürler.

## 6.4 const ve key

**`const` ne kazandırır?** Bir widget'ın önüne `const` yazıldığında, o widget **derleme sırasında bir kez** oluşturulur ve uygulama boyunca aynı nesne kullanılır. Ekran yeniden çizildiğinde Flutter, `const` widget'ların değişmediğini bildiği için onları yeniden oluşturmakla uğraşmaz. Küçük bir örnekte fark hissedilmez; ama yüzlerce widget'lı bir ekranda akıcılığa katkısı vardır.

**Ne zaman `const` yazılır?** Widget'a verilen **bütün** değerler sabitse:

| Kod | `const` olabilir mi? |
|---|---|
| `Text('Merhaba')` | ✓ Metin sabit |
| `Icon(Icons.home, size: 32)` | ✓ Hepsi sabit |
| `Text(ogrenci.ad)` | ✗ `ogrenci.ad` çalışma sırasında belli olur |
| `Text('$sinif. sınıf')` | ✗ `sinif` bir değişken |

VS Code, `const` eklenebilecek yerleri Problems panelinde mavi bir bilgi notuyla gösterir: *"Use 'const' with the constructor to improve performance."* Bu notları görünce `const` ekleyin; `Ctrl + .` → **Add 'const' modifier** bunu sizin yerinize yapar. Sabit olmayan bir değerin önüne `const` yazmak ise derleme hatasıdır:

```dart
// Dosya: lib/ornek_06_03_tuzak_const.dart
// ❌ DERLEME HATASI
import 'package:material_ui/material_ui.dart';

class Selam extends StatelessWidget {
  const Selam({super.key, required this.ad});

  final String ad;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Merhaba, $ad'));
  }
}

void main() {
  runApp(const MaterialApp(home: Selam(ad: 'Mert')));
}
```

**Hata mesajı:**

```text
Invalid constant value.
```

**Açıklama:** `const Center(...)` derleme sırasında oluşturulmak ister; ama içindeki metin `ad` alanına bağlıdır ve `ad`'ın değeri ancak çalışma sırasında belli olur. Çözüm: `const`'u yalnızca gerçekten sabit olan kısımlara yazmak: `Center(child: Text('Merhaba, $ad'))`.

**`super.key` nedir?** Her widget isteğe bağlı bir `key` (anahtar) parametresi alır. Anahtar, Flutter'ın bir widget'ı ağaçta **tanımasını** sağlar; özellikle sırası değişen listelerde ("bu satır, az önceki satırın aynısı mı?") önemlidir. Şimdilik yapmanız gereken tek şey her widget kurucusuna `super.key` yazmaktır; VS Code bunu unuttuğunuzda sizi uyarır. Anahtarları listeler konusunda tekrar ele alacağız.

## 6.5 BuildContext: Widget'ın ağaçtaki adresi

`build` metodunun parametresi olan `context` (`BuildContext`), widget'ın **ağaçtaki konumudur**. Bir benzetme: Context, widget'ın **ev adresidir**. Adresi bilen biri, o evin bulunduğu mahallenin özelliklerini sorabilir: "Bu mahallede hangi tema geçerli? Ekran ne kadar geniş?"

```dart
// Dosya: lib/ornek_06_04_context.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepOrange)),
      home: const Scaffold(body: Center(child: EkranBilgisi())),
    ),
  );
}

class EkranBilgisi extends StatelessWidget {
  const EkranBilgisi({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme renkler = Theme.of(context).colorScheme;
    TextTheme yazilar = Theme.of(context).textTheme;
    Size ekran = MediaQuery.sizeOf(context);

    return Column(
      mainAxisSize: .min,
      children: [
        Text('Ekran bilgisi', style: yazilar.headlineMedium),
        Text(
          'Genişlik: ${ekran.width.toStringAsFixed(0)} · Yükseklik: ${ekran.height.toStringAsFixed(0)}',
          style: yazilar.bodyLarge,
        ),
        Icon(Icons.phone_android, size: 64, color: renkler.primary),
        Text(
          ekran.width < 600 ? 'Telefon düzeni' : 'Tablet / masaüstü düzeni',
          style: yazilar.titleMedium?.copyWith(color: renkler.primary),
        ),
      ],
    );
  }
}
```

**Ekranda (taslak, bir telefonda):**

```text
┌──────────────────────────────┐
│                              │
│        Ekran bilgisi         │  ← büyük başlık stili
│ Genişlik: 412 · Yükseklik: 915│  ← cihaza göre değişir
│              📱              │  ← tema renginde simge
│        Telefon düzeni        │  ← tema renginde
│                              │
└──────────────────────────────┘
```

**Açıklama:**
- `Theme.of(context)`: "Bu widget'ın bulunduğu yerde geçerli tema hangisi?" Ağaçta yukarı doğru çıkılır ve en yakın tema bulunur (burada `MaterialApp`'teki tema).
- `colorScheme.primary`: Temanın **ana rengi**. Renkleri `Colors.deepOrange` diye sabit yazmak yerine temadan almak, tema değiştiğinde (örneğin karanlık modda) uygulamanın kendiliğinden uyum sağlamasını sağlar.
- `textTheme.headlineMedium`, `bodyLarge`, `titleMedium`: Material 3'ün hazır yazı stilleri. Yazı boyutlarını her yerde elle vermek yerine bu stilleri kullanın; uygulama tutarlı görünür.
- `titleMedium?.copyWith(color: ...)`: Hazır bir stilin bir özelliğini değiştirip kopyasını alır. `?.` kullanıldı; çünkü tema stilleri `TextStyle?` (null olabilir) tipindedir (Hafta 2'deki null güvenli erişim).
- `MediaQuery.sizeOf(context)`: Ekranın **mantıksal** genişliği ve yüksekliği. Bu değerler fiziksel piksel değildir; cihazın piksel yoğunluğuna göre ölçeklenmiş birimlerdir. Bu sayede aynı kod farklı yoğunluktaki ekranlarda benzer boyutta görünür.
- `ekran.width < 600 ? ... : ...`: Ekran genişliğine göre farklı düzen seçmek (**duyarlı tasarım**). Bölüm 10.5'te tekrar göreceğiz.

## 6.6 build ne zaman çalışır?

Flutter, bir widget'ın `build` metodunu **ihtiyaç duyduğu her an** çağırabilir: ekran ilk açıldığında, telefon döndürüldüğünde, tema değiştiğinde, üstteki bir widget yeniden çizildiğinde... Saniyede onlarca kez de çağrılabilir. Bu yüzden:

- `build` metodu **hızlı** olmalı: İçinde ağır hesaplamalar, dosya okuma veya internet isteği yapılmaz.
- `build` metodu **yan etkisiz** olmalı: Bir sayacı artırmak, veritabanına yazmak gibi işler `build` içinde yapılmaz. `build`'in tek işi, o anki verilere bakarak bir widget ağacı **tarif etmektir.**

Hafta 6'daki `FutureBuilder` şablonunda "future'ı `build` içinde oluşturmayın" notunu hatırlayın: Ekran her yeniden çizildiğinde istek yeniden gönderilirdi. Sebebi bu bölümdeki kuraldır.

## 6.7 ❌ StatelessWidget tuzakları

### Tuzak 1: final olmayan alan

```dart
// Dosya: lib/ornek_06_05_tuzak_final.dart
// ❌ UYARI: StatelessWidget alanları final olmalı.
import 'package:material_ui/material_ui.dart';

class Sayac extends StatelessWidget {
  Sayac({super.key});

  int deger = 0;

  @override
  Widget build(BuildContext context) {
    return Text('Değer: $deger');
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: Sayac())));
}
```

**Uyarı mesajı:**

```text
This class (or a class that this class inherits from) is marked as '@immutable', but one or more of its instance fields aren't final: Sayac.deger
```

**Açıklama:** *Türkçesi:* "Bu sınıf (veya türediği bir sınıf) '@immutable' (değişmez) olarak işaretlenmiş; ama alanlarından biri `final` değil." Bölüm 2.4'teki kural: Widget bir tariftir; tarifler değiştirilmez. `deger`'i artırsanız bile ekran güncellenmez; çünkü Flutter'ın bundan haberi olmaz. Değişen bir değeri ekranda göstermek için gelecek hafta göreceğimiz `StatefulWidget` ve `setState` kullanılır.

### Tuzak 2: build'de return'ü unutmak

```dart
// Dosya: lib/ornek_06_06_tuzak_return.dart
// ❌ DERLEME HATASI
import 'package:material_ui/material_ui.dart';

class Baslik extends StatelessWidget {
  const Baslik({super.key});

  @override
  Widget build(BuildContext context) {
    Text('Duyurular');
  }
}

void main() {
  runApp(const MaterialApp(home: Scaffold(body: Baslik())));
}
```

**Hata mesajı:**

```text
The body might complete normally, causing 'null' to be returned, but the return type, 'Widget', is a potentially non-nullable type.
```

**Açıklama:** `Text('Duyurular');` satırı bir widget **oluşturur** ama onu **döndürmez**; oluşturulan nesne hemen kaybolur. `build` bir `Widget` döndürmek zorundadır (null safety, Hafta 2). Çözüm: `return const Text('Duyurular');`. VS Code ayrıca bu satır için "Unused instance" gibi bir uyarı da gösterebilir.

---

# 7. Temel Widget'lar

Bu bölümde en sık kullanacağınız widget'ları tanıyacağız. Her birinin onlarca parametresi vardır; hepsini ezberlemeye çalışmayın. Bir widget'ın adını yazıp parantez açtığınızda (`Text(`) VS Code bütün parametreleri listeler; bir parametrenin üzerine fareyle gelince açıklamasını gösterir.

## 7.1 Text

```dart
// Dosya: lib/ornek_07_01_text.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: SafeArea(child: MetinOrnekleri()))));
}

class MetinOrnekleri extends StatelessWidget {
  const MetinOrnekleri({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme yazilar = Theme.of(context).textTheme;
    return Padding(
      padding: const .all(16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Başlık (headlineSmall)', style: yazilar.headlineSmall),
          Text('Alt başlık (titleMedium)', style: yazilar.titleMedium),
          Text('Gövde metni (bodyMedium)', style: yazilar.bodyMedium),
          const Text(
            'Elle stil: 18 punto, kalın, italik, mavi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: .bold,
              fontStyle: .italic,
              color: Colors.blue,
            ),
          ),
          const Text(
            'Bu çok uzun bir duyuru metnidir ve ekrana sığmadığında iki satırdan sonra üç nokta ile kesilecektir.',
            maxLines: 2,
            overflow: .ellipsis,
          ),
          const Text('Ortalanmış metin', textAlign: .center),
        ],
      ),
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ Başlık (headlineSmall)       │  ← büyük
│ Alt başlık (titleMedium)     │
│ Gövde metni (bodyMedium)     │  ← normal
│ Elle stil: 18 punto, kalın,  │  ← kalın, italik, mavi
│ italik, mavi                 │
│ Bu çok uzun bir duyuru       │
│ metnidir ve ekrana sığmad... │  ← 2 satırda kesildi
│ Ortalanmış metin             │  ← (bkz. açıklama)
└──────────────────────────────┘
```

**Açıklama:**
- `SafeArea`: İçeriği telefonun **durum çubuğundan** ve çentiğinden (notch) uzak tutar. `AppBar` kullanmadığınız ekranlarda içeriği `SafeArea` ile sarın.
- `crossAxisAlignment: .start`: Sütundaki metinleri **sola** hizalar (varsayılan ortadır; Bölüm 8).
- `maxLines: 2, overflow: .ellipsis`: En fazla iki satır göster; sığmayan kısmı `...` ile kes. Kart ve liste tasarımlarında çok sık kullanılır.
- **`textAlign: .center` neden işe yaramadı?** Metin, kendi **genişliği kadar** yer kaplar; dar bir kutuda ortalayacak boş yer yoktur. Hizalama ancak metne geniş bir alan verildiğinde görünür (örneğin sütun `crossAxisAlignment: .stretch` ile genişletildiğinde veya metin uzun olup birden çok satıra bölündüğünde). Bu, Bölüm 10'daki kısıt modelinin ilk ipucu.

| Sık kullanılan `TextStyle` özelliği | Örnek |
|---|---|
| `fontSize` | `fontSize: 18` |
| `fontWeight` | `fontWeight: .bold`, `.w500` |
| `fontStyle` | `fontStyle: .italic` |
| `color` | `color: Colors.blue` veya `renkler.primary` |
| `letterSpacing`, `height` | Harf arası ve satır yüksekliği |
| `decoration` | `decoration: .underline`, `.lineThrough` (indirimli eski fiyat!) |

## 7.2 Icon

```dart
// Dosya: lib/ornek_07_02_icon.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Icon(Icons.home),
              Icon(Icons.favorite, color: Colors.red, size: 40),
              Icon(Icons.school, color: Colors.indigo, size: 56),
              Icon(Icons.wb_sunny_outlined, color: Colors.orange, size: 40),
            ],
          ),
        ),
      ),
    ),
  );
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│                              │
│    ⌂      ♥     🎓     ☼     │  ← dört simge, eşit aralıklarla
│                              │
└──────────────────────────────┘
```

**Açıklama:** `Icons` sınıfı binlerce hazır Material simgesi içerir. Bir simgenin adını bulmak için VS Code'da `Icons.` yazıp listeye bakabilir veya Google'ın Material Symbols sayfasında (fonts.google.com/icons) arama yapabilirsiniz. Çoğu simgenin `_outlined` (çizgili) ve `_rounded` (yuvarlatılmış) türleri vardır. Simgeler aslında bir yazı tipindeki karakterlerdir; bu yüzden büyütüldüklerinde bulanıklaşmazlar.

## 7.3 Image

Flutter iki temel kaynaktan resim gösterir:

**1. Uygulamanın içindeki resim (asset):**
1. Proje klasöründe `assets/images` klasörünü oluşturun ve içine bir resim koyun (örneğin `kampus.jpg`).
2. `pubspec.yaml` dosyasının en altındaki `flutter:` bölümüne şu satırları ekleyin (girintilere dikkat):

```text
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

3. Dosyayı kaydedin; ardından uygulamayı **yeniden başlatın** (hot reload yeni dosyaları görmez).
4. Kodda: `Image.asset('assets/images/kampus.jpg')`

**2. İnternetteki resim:** `Image.network('https://...')`. Resim her açılışta internetten indirilir. Android'de uygulama mağaza sürümü için derlendiğinde internet izni gerekir: `android/app/src/main/AndroidManifest.xml` dosyasına `<uses-permission android:name="android.permission.INTERNET"/>` satırı eklenir. (Geliştirme sürümünde bu izin hazır gelir; bu yüzden hata mağaza sürümünde ortaya çıkar ve gözden kaçar.)

```dart
// Dosya: lib/ornek_07_03_image.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: Center(child: KampusResmi()))));
}

class KampusResmi extends StatelessWidget {
  const KampusResmi({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(16),
      child: Image.asset(
        'assets/images/kampus.jpg',
        width: 300,
        height: 180,
        fit: .cover,
      ),
    );
  }
}
```

**Açıklama:**
- `width: 300, height: 180`: Resmin kaplayacağı alan.
- `fit: .cover`: Resmi oranını bozmadan alanı **tamamen** dolduracak şekilde büyütür; taşan kısımları kırpar. Diğer seçenekler: `.contain` (resmin tamamı görünür, kenarlarda boşluk kalabilir), `.fill` (alanı doldurur ama resim **esner**).
- `ClipRRect(borderRadius: .circular(16))`: Çocuğunun köşelerini yuvarlatarak kırpar. Resimlerin köşelerini yuvarlatmanın en yaygın yolu.
- Resim dosyası yoksa veya `pubspec.yaml`'a eklenmediyse ekranda resim yerine bir hata kutusu, terminalde "Unable to load asset" mesajı görürsünüz.

## 7.4 Container: Çok amaçlı kutu

`Container`, boyut, renk, kenar boşluğu, kenarlık, köşe yuvarlaklığı ve gölgeyi **tek bir widget'ta** toplayan çok amaçlı bir kutudur:

```dart
// Dosya: lib/ornek_07_04_container.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: Center(child: BilgiKutusu()))));
}

class BilgiKutusu extends StatelessWidget {
  const BilgiKutusu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const .all(16),
      margin: const .symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: .circular(12),
        border: .all(color: Colors.amber.shade700, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: const Text('Yarın 10.00-12.00 arasında Kezer kampüsünde elektrik kesintisi olacaktır.'),
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│                              │
│   ╭──────────────────────╮   │
│   │ Yarın 10.00-12.00    │   │  ← açık sarı zemin, koyu sarı kenarlık,
│   │ arasında Kezer       │   │     yuvarlak köşeler, altında gölge
│   │ kampüsünde elektrik  │   │
│   │ kesintisi olacaktır. │   │
│   ╰──────────────────────╯   │
│                              │
└──────────────────────────────┘
```

**Açıklama:**
- `padding`: Kutunun **içindeki** boşluk (kenarlıkla metin arası). `margin`: Kutunun **dışındaki** boşluk (kutu ile çevresi arası). Bir benzetme: Padding, kolinin içindeki köpük dolgu; margin, koliler arasında bırakılan mesafe.
- `const .all(16)`: Dört kenardan 16 birim. `.symmetric(horizontal: 24)`: Yalnızca sağ ve soldan 24. `.only(top: 8, left: 4)`: Yalnızca istenen kenarlardan.
- `BoxDecoration`: Kutunun görünümü: renk, köşe yuvarlaklığı (`borderRadius`), kenarlık (`border`), gölge (`boxShadow`), renk geçişi (`gradient`).
- `Colors.amber.shade100`: Bir rengin açık–koyu tonları: `shade50` (en açık) ... `shade900` (en koyu).
- `Offset(0, 4)`: Gölgenin 4 birim **aşağı** kaydırılması; ışık yukarıdan geliyormuş gibi görünür.

> 💡 **Container'ı her şey için kullanmayın.** Yalnızca boşluk gerekiyorsa `Padding`, yalnızca boyut gerekiyorsa `SizedBox`, yalnızca ortalama gerekiyorsa `Center` kullanın. Bu widget'lar daha hafiftir ve kodun **niyetini** daha açık gösterir. Flutter'ın kod denetimi, gereksiz `Container`'ları işaretler.

### ❌ color ve decoration birlikte

```dart
// Dosya: lib/ornek_07_05_tuzak_container.dart
// ❌ ÇALIŞMA ZAMANI HATASI
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          decoration: BoxDecoration(borderRadius: .circular(12)),
          child: const Text('Kutu'),
        ),
      ),
    ),
  );
}
```

**Çıktı (bir bölümü):**

```text
Cannot provide both a color and a decoration.
The color argument is just a shorthand for "decoration: BoxDecoration(color: color)".
To use both a color and other decoration properties, set the color in the BoxDecoration instead.
```

**Açıklama:** Kod derlenir; ama uygulama açılırken bu kontrol (bir `assert`, Hafta 6 Bölüm 4.6) hata verir ve geliştirme modunda ekran kırmızıya döner. `color`, aslında `decoration: BoxDecoration(color: ...)` yazmanın **kısaltmasıdır**; ikisi birlikte verilemez. Çözüm: Rengi `BoxDecoration`'ın içine taşımak.

## 7.5 Boşluk ve hizalama: Padding, SizedBox, Center, Align, SafeArea

| Widget | Ne yapar? | Örnek |
|---|---|---|
| `Padding` | Çocuğunun etrafına boşluk koyar | `Padding(padding: .all(16), child: ...)` |
| `SizedBox` | Sabit boyutlu kutu; **boşluk** bırakmak için de kullanılır | `SizedBox(height: 12)` |
| `Center` | Çocuğunu ortalar | `Center(child: ...)` |
| `Align` | Çocuğunu istenen köşeye/kenara hizalar | `Align(alignment: .bottomRight, child: ...)` |
| `SafeArea` | Durum çubuğu ve çentik alanından uzak tutar | `SafeArea(child: ...)` |

`SizedBox(height: 12)`, sütundaki iki widget arasına 12 birimlik **boş alan** koymanın standart yoludur. Satırlarda (`Row`) aynı iş `SizedBox(width: 12)` ile yapılır.

## 7.6 Hazır Material bileşenleri

Material paketi, sık kullanılan arayüz parçalarını hazır sunar. Bir "Ayarlar" ekranında birkaçını görelim:

```dart
// Dosya: lib/ornek_07_06_material_bilesenleri.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: AyarlarEkrani()));
}

class AyarlarEkrani extends StatelessWidget {
  const AyarlarEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: Column(
        children: [
          const Card(
            margin: .all(16),
            child: ListTile(
              leading: CircleAvatar(child: Text('AY')),
              title: Text('Ayşe Yılmaz'),
              subtitle: Text('ayse@ornek.edu.tr'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Bildirimler'),
            subtitle: Text('Duyurular ve sınav hatırlatmaları'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Dil'),
            trailing: Text('Türkçe'),
          ),
          const Divider(),
          const Padding(
            padding: .all(16),
            child: Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('Dart')),
                Chip(label: Text('Flutter')),
                Chip(label: Text('Firebase')),
              ],
            ),
          ),
          FilledButton(onPressed: () {}, child: const Text('Kaydet')),
          TextButton(onPressed: () {}, child: const Text('Çıkış yap')),
        ],
      ),
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ Ayarlar                      │
├──────────────────────────────┤
│ ╭──────────────────────────╮ │
│ │ (AY) Ayşe Yılmaz       › │ │  ← Card içinde ListTile
│ │      ayse@ornek.edu.tr   │ │
│ ╰──────────────────────────╯ │
│ 🔔  Bildirimler              │
│     Duyurular ve sınav ...   │
│ ──────────────────────────── │  ← Divider
│ 🌐  Dil               Türkçe │
│ ──────────────────────────── │
│ (Dart) (Flutter) (Firebase)  │  ← Chip'ler
│          ( Kaydet )          │  ← FilledButton
│          Çıkış yap           │  ← TextButton
└──────────────────────────────┘
```

| Bileşen | Kullanım |
|---|---|
| `Card` | Hafif gölgeli, köşeleri yuvarlak bir yüzey; ilgili bilgileri gruplar |
| `ListTile` | Hazır liste satırı: `leading`, `title`, `subtitle`, `trailing` |
| `CircleAvatar` | Yuvarlak profil resmi veya baş harfler |
| `Divider` | İnce yatay ayırıcı çizgi |
| `Chip` | Küçük etiket (kategori, beceri, filtre) |
| `FilledButton` | En vurgulu düğme (ana eylem: Kaydet, Gönder) |
| `ElevatedButton`, `OutlinedButton` | Orta vurgulu düğmeler |
| `TextButton` | En az vurgulu düğme (İptal, Çıkış) |
| `IconButton` | Yalnızca simgeden oluşan düğme |

**Açıklama:**
- Düğmelerin `onPressed` parametresine `null` verilirse düğme **pasif** (gri) görünür ve basılamaz. Bir formun eksik alanları doldurulana kadar "Gönder" düğmesini pasif yapmak için bu kullanılır.
- `Wrap`: Çocuklarını yan yana dizer; satır dolunca **alt satıra geçer**. Etiket ve filtre listeleri için idealdir (Bölüm 8.5).
- `Column` içinde `const` olabilen widget'lar tek tek `const` ile yazıldı; düğmeler `onPressed: () {}` fonksiyonu yüzünden `const` olamaz.

## 7.7 Renkler

Flutter'da bir renk birkaç yolla yazılabilir:

| Yazım | Örnek | Ne zaman? |
|---|---|---|
| Hazır Material renkleri | `Colors.indigo`, `Colors.red.shade300` | Hızlı denemeler |
| Onaltılık (hex) kod | `Color(0xFF1E88E5)` | Tasarımcının verdiği kesin renk |
| Saydamlık | `Colors.black.withValues(alpha: 0.5)` | Yarı saydam katmanlar |
| **Temadan** | `Theme.of(context).colorScheme.primary` | **Tercih edilen yol** |

**Açıklama:**
- `Color(0xFF1E88E5)`: `0x` onaltılık sayı demektir; ilk iki hane (`FF`) **saydamlıktır** (FF = tamamen opak), kalan altı hane tasarım araçlarındaki `#1E88E5` kodudur. İlk iki haneyi unutup `Color(0x1E88E5)` yazarsanız renk **tamamen saydam** olur ve ekranda görünmez.
- `withValues(alpha: 0.5)`: Rengin yüzde 50 saydam kopyası. Eski kodlarda ve AI önerilerinde `withOpacity(0.5)` göreceksiniz; bu metot **kullanımdan kaldırıldı** ve VS Code uyarı verir.
- **Neden temadan?** Renkleri tek tek `Colors.indigo` diye yazarsanız, temayı değiştirdiğinizde veya karanlık moda geçtiğinizde bütün dosyaları dolaşmanız gerekir. `colorScheme.primary`, `colorScheme.surface`, `colorScheme.onPrimary` gibi **rol adlarıyla** yazılan renkler temayla birlikte kendiliğinden değişir.

---

# 8. Yerleşim I: Row, Column, Expanded

Ekranların neredeyse tamamı iki temel yerleşim widget'ının iç içe kullanılmasıyla oluşur: Çocuklarını **yan yana** dizen `Row` (satır) ve **alt alta** dizen `Column` (sütun).

## 8.1 Ana eksen ve çapraz eksen

`Row` ve `Column` aynı mantıkla çalışır; yalnızca yönleri farklıdır. Her ikisinde de iki eksen vardır:

```text
          Row                                 Column
 ──────── ana eksen (main) ───────▶      │  ┌──────┐
 ┌──────┐ ┌──────┐ ┌──────┐          ana │  │  A   │
 │  A   │ │  B   │ │  C   │        eksen │  └──────┘
 └──────┘ └──────┘ └──────┘       (main) │  ┌──────┐
          ▲                              │  │  B   │
          │ çapraz eksen (cross)         │  └──────┘
                                         ▼  ┌──────┐
                                            │  C   │
                                            └──────┘
                                       ◀── çapraz eksen ──▶
```

| | `Row` | `Column` |
|---|---|---|
| Ana eksen (çocukların dizildiği yön) | Yatay | Dikey |
| Çapraz eksen | Dikey | Yatay |
| Ana eksende hizalama | `mainAxisAlignment` | `mainAxisAlignment` |
| Çapraz eksende hizalama | `crossAxisAlignment` | `crossAxisAlignment` |

Ezberlemenin kolay yolu: **"Ana eksen = çocukların dizildiği yön."**

## 8.2 mainAxisAlignment: Ana eksende hizalama

Altı hizalama seçeneğini tek ekranda görelim. `MainAxisAlignment` bir enum'dur (Hafta 5); `values` ile bütün değerlerini dolaşabiliriz:

```dart
// Dosya: lib/ornek_08_01_hizalama_vitrini.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: SafeArea(child: HizalamaVitrini()))));
}

class HizalamaVitrini extends StatelessWidget {
  const HizalamaVitrini({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        for (final MainAxisAlignment hizalama in MainAxisAlignment.values) ...[
          Padding(
            padding: const .only(left: 8, top: 8),
            child: Text(hizalama.name),
          ),
          Container(
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: hizalama,
              children: const [
                RenkliKutu(renk: Colors.red),
                RenkliKutu(renk: Colors.green),
                RenkliKutu(renk: Colors.blue),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class RenkliKutu extends StatelessWidget {
  const RenkliKutu({super.key, required this.renk});

  final Color renk;

  @override
  Widget build(BuildContext context) {
    return Container(width: 48, height: 48, color: renk);
  }
}
```

**Ekranda (taslak):**

```text
start
[■■■                         ]   ← başta toplanır (varsayılan)
end
[                         ■■■]   ← sonda toplanır
center
[            ■■■             ]   ← ortada toplanır
spaceBetween
[■            ■             ■]   ← ilk ve son kenarlara yapışık, aralar eşit
spaceAround
[  ■        ■        ■       ]   ← her kutunun iki yanında eşit boşluk (kenarlar yarım)
spaceEvenly
[     ■       ■       ■      ]   ← kenarlar dahil bütün boşluklar eşit
```

**Açıklama:**
- `for (...) ...[ ... ]`: Liste içinde for ile birlikte **yayma** (spread, `...`) operatörü. Her hizalama için **iki** widget (bir başlık ve bir satır) üretmek istiyoruz; `...[a, b]` bu iki widget'ı dıştaki listeye ayrı ayrı ekler.
- `hizalama.name`: Enum değerinin adını metin olarak verir (Hafta 5).
- `RenkliKutu`: Tekrar eden renkli kare için yazdığımız küçük bir widget. Parametre olarak bir `Color` alıyor.
- `children: const [...]`: Liste ve içindeki her şey sabit olduğu için listenin kendisi `const` yazıldı.
- En sık kullanılanlar: `start` (varsayılan), `center` ve `spaceBetween` (örneğin bir başlık solda, bir düğme sağda).

## 8.3 crossAxisAlignment ve mainAxisSize

`crossAxisAlignment` çocukların **çapraz eksende** nasıl hizalanacağını belirler. Bir `Column` için bu, yatay hizalama demektir:

| Değer | `Column` içinde etkisi |
|---|---|
| `.center` (varsayılan) | Çocuklar yatayda ortalanır |
| `.start` | Çocuklar sola yaslanır |
| `.end` | Çocuklar sağa yaslanır |
| `.stretch` | Çocuklar **tüm genişliğe** uzatılır |

`mainAxisSize` ise satırın/sütunun ana eksende ne kadar yer kaplayacağını belirler:

| Değer | Anlamı |
|---|---|
| `.max` (varsayılan) | Verilen alanın **tamamını** kaplar |
| `.min` | Yalnızca çocuklarının toplamı kadar yer kaplar |

Bölüm 5.1'de `Center` içindeki `Column`'a `mainAxisSize: .min` yazmamızın nedeni buydu: Varsayılan `.max` ile sütun ekranın tüm yüksekliğini kaplar ve çocukları en üstte toplanır; `Center`'ın ortalayacak bir şeyi kalmaz.

## 8.4 Expanded, Flexible ve Spacer: Kalan alanı paylaştırmak

`Row` ve `Column` önce sabit boyutlu çocuklara yer verir; geriye kalan alanı ise **esnek** (flex) çocuklar arasında paylaştırır:

```dart
// Dosya: lib/ornek_08_02_expanded.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: SafeArea(child: EsnekOrnekler()))));
}

class EsnekOrnekler extends StatelessWidget {
  const EsnekOrnekler({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(16),
      child: Column(
        children: [
          // 1) Expanded: kalan bütün alanı al
          Row(
            children: [
              const Icon(Icons.wb_sunny, color: Colors.orange),
              const SizedBox(width: 12),
              Expanded(child: Container(color: Colors.orange.shade100, child: const Text('Pazartesi'))),
              const Text('24°'),
            ],
          ),
          const SizedBox(height: 24),
          // 2) flex oranları: 70'e 30
          SizedBox(
            height: 16,
            child: Row(
              children: [
                Expanded(flex: 70, child: Container(color: Colors.green)),
                Expanded(flex: 30, child: Container(color: Colors.grey.shade300)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // 3) Spacer: araya itici boşluk
          const Row(
            children: [
              Text('Toplam'),
              Spacer(),
              Text('249,90 TL', style: TextStyle(fontWeight: .bold)),
            ],
          ),
        ],
      ),
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ ☼  [Pazartesi          ] 24° │  ← Expanded, ortadaki alanın tamamını aldı
│                              │
│ [█████████████████░░░░░░░░]  │  ← %70 yeşil, %30 gri
│                              │
│ Toplam            249,90 TL  │  ← Spacer araya girdi
└──────────────────────────────┘
```

**Açıklama:**
- **`Expanded`:** Satırdaki sabit çocuklar (simge, boşluk, derece) yerleştirildikten sonra **kalan bütün alanı** alır. Turuncu zemin, `Expanded`'ın ne kadar genişlediğini göstermek için kondu.
- **`flex`:** Birden fazla `Expanded` varsa kalan alan `flex` değerlerine **oranla** paylaşılır: 70 / (70 + 30) = %70. Ödev 5'teki `[#######---]` ilerleme çubuğunun widget hali tam olarak budur: `flex: yuzde` ve `flex: 100 - yuzde`.
- **`Spacer`:** İçi boş bir `Expanded`'dır. İki widget'ı satırın iki ucuna itmek için kullanılır. Aynı sonuç `mainAxisAlignment: .spaceBetween` ile de elde edilebilirdi.
- **`Flexible`:** `Expanded`'ın daha esnek kardeşi. `Expanded` çocuğunu kalan alanı **doldurmaya zorlar**; `Flexible` ise çocuğun kalan alandan **daha az** yer kaplamasına izin verir. Kısa bir metin `Flexible` içinde kendi boyutunda kalır; uzunsa en fazla kalan alan kadar genişler.

| | Kalan alana göre davranışı |
|---|---|
| `Expanded` | Kalan alanın **tamamını** kaplar (veya flex payını) |
| `Flexible` | Kalan alana **kadar** büyüyebilir; gerekmiyorsa küçük kalır |
| `Spacer` | Kalan alanı **boş** bırakır |

> ⚠️ `Expanded`, `Flexible` ve `Spacer` yalnızca bir `Row`, `Column` (veya `Flex`) widget'ının **doğrudan** çocuğu olabilir. Başka bir yerde kullanılırlarsa çalışma sırasında hata verirler (Bölüm 10.4).

## 8.5 İç içe Row ve Column: Bir mesaj satırı

Gerçek ekranlar `Row` ve `Column`'ların iç içe kullanılmasıyla oluşur. Bir mesajlaşma uygulamasının sohbet listesindeki tek bir satırı yazalım:

```dart
// Dosya: lib/ornek_08_03_mesaj_satiri.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              MesajSatiri(
                ad: 'Proje Grubu',
                sonMesaj: 'Mert: Toplantıyı yarın saat üçe alabilir miyiz? Laboratuvar dolu.',
                saat: '14:32',
                okunmamis: 3,
              ),
              MesajSatiri(
                ad: 'Zeynep',
                sonMesaj: 'Tamam, görüşürüz!',
                saat: 'Dün',
                okunmamis: 0,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class MesajSatiri extends StatelessWidget {
  const MesajSatiri({
    super.key,
    required this.ad,
    required this.sonMesaj,
    required this.saat,
    required this.okunmamis,
  });

  final String ad;
  final String sonMesaj;
  final String saat;
  final int okunmamis;

  @override
  Widget build(BuildContext context) {
    ColorScheme renkler = Theme.of(context).colorScheme;
    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(radius: 26, child: Text(ad[0])),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(ad, style: const TextStyle(fontWeight: .bold), overflow: .ellipsis),
                    ),
                    Text(saat, style: TextStyle(color: renkler.outline, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(child: Text(sonMesaj, maxLines: 1, overflow: .ellipsis)),
                    if (okunmamis > 0)
                      CircleAvatar(
                        radius: 11,
                        backgroundColor: renkler.primary,
                        child: Text('$okunmamis', style: TextStyle(color: renkler.onPrimary, fontSize: 12)),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ (P)  Proje Grubu       14:32 │
│      Mert: Toplantıyı y... ③ │  ← tek satıra kesildi, okunmamış rozeti
│ (Z)  Zeynep              Dün │
│      Tamam, görüşürüz!       │  ← okunmamış yok, rozet çizilmedi
└──────────────────────────────┘
```

Widget ağacı:

```text
Padding
 └─ Row
     ├─ CircleAvatar ("P")
     ├─ SizedBox (12)
     └─ Expanded
         └─ Column (sola yaslı)
             ├─ Row
             │   ├─ Expanded → Text (ad)
             │   └─ Text (saat)
             ├─ SizedBox (4)
             └─ Row
                 ├─ Expanded → Text (son mesaj, 1 satır)
                 └─ [okunmamis > 0 ise] CircleAvatar (sayı)
```

**Açıklama:**
- **Dış `Row`:** solda avatar, sağda metin bloğu. Metin bloğu `Expanded` içinde; çünkü avatardan sonra kalan bütün genişliği almalı.
- **İç `Column`:** ad/saat satırı ve son mesaj satırı alt alta.
- **İçteki `Row`'larda yine `Expanded`:** Ad veya son mesaj ne kadar uzun olursa olsun saat ve rozet için yer kalsın diye. `overflow: .ellipsis` sayesinde sığmayan metin `...` ile kesilir.
- `if (okunmamis > 0) CircleAvatar(...)`: Liste içinde **if** (collection if, Hafta 3). Koşul yanlışsa listeye hiçbir şey eklenmez; Zeynep'in satırında rozet çizilmez.
- `ad[0]`: Adın ilk harfi (Hafta 1'deki metin indeksleme). Avatarda resim yokken baş harf göstermek yaygın bir kalıptır.
- `renkler.outline`, `renkler.onPrimary`: Temadan rol renkleri (Bölüm 7.7). `onPrimary`, `primary` zemin **üzerine** yazılacak yazının rengidir; iki renk birbirine göre okunaklı olacak şekilde seçilmiştir.

## 8.6 ❌ Taşma hatası: Sarı-siyah şeritler

Flutter geliştiricilerinin **en sık** karşılaştığı hata budur. `Expanded` kullanmadan uzun bir metni bir satıra koyalım:

```dart
// Dosya: lib/ornek_08_04_tuzak_tasma.dart
// ❌ ÇALIŞMA ZAMANI HATASI: Satır taşıyor.
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              Icon(Icons.campaign),
              Text('Yarın 10.00-12.00 arasında Kezer kampüsünde elektrik kesintisi olacaktır.'),
            ],
          ),
        ),
      ),
    ),
  );
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ 📢 Yarın 10.00-12.00 arasın▐▌│  ← metin sağ kenardan dışarı taşıyor
│                            ▐▌│  ← sağ kenarda sarı-siyah şeritler ve
│                            ▐▌│     "RIGHT OVERFLOWED BY 236 PIXELS"
└──────────────────────────────┘
```

**Çıktı (bir bölümü, terminalde):**

```text
A RenderFlex overflowed by 236 pixels on the right.
```

**Açıklama:**
- `Row`, çocuklarına yatayda **sınırsız** yer tanır: "İstediğin kadar geniş olabilirsin." Metin de tek satırda kendi doğal genişliğini (ekrandan geniş) alır. Toplam genişlik ekranı aşınca Flutter taşan kenarı **sarı-siyah şeritlerle** işaretler ve terminale bu hatayı yazar. Taşan miktar (236) cihazınızın ekran genişliğine göre farklı olur.
- `RenderFlex`, `Row` ve `Column`'un perde arkasındaki render nesnesidir (Bölüm 2.4). Mesajı "Bir Row veya Column taştı" diye okuyun.
- Şeritler yalnızca **geliştirme** modunda görünür; yayınlanan uygulamada içerik sessizce kesilir. Bu yüzden geliştirirken gördüğünüz her şeridi düzeltin.

**Düzeltmeler (duruma göre seçin):**

| Çözüm | Kod | Sonuç |
|---|---|---|
| Metne kalan alanı ver | `Expanded(child: Text(...))` | Metin kalan genişliğe sığacak şekilde **alt satırlara** bölünür |
| Tek satırda kes | `Expanded(child: Text(..., maxLines: 1, overflow: .ellipsis))` | `Yarın 10.00-12.00 arası...` |
| Alt satıra geçen dizilim | `Wrap(children: [...])` | Sığmayan **çocuklar** alt satıra geçer |
| Kaydırılabilir yap | `SingleChildScrollView(scrollDirection: .horizontal, child: Row(...))` | Kullanıcı yana kaydırır |

Aynı hata `Column`'da da görülür: Küçük ekranlı bir telefonda sütunun içeriği ekrana sığmazsa alt kenarda şeritler ve "overflowed by ... pixels on the bottom" mesajı çıkar. Form ekranlarında klavye açılınca bu çok sık yaşanır. Çözüm genellikle sütunu `SingleChildScrollView` ile sarmak, uzun listelerde ise gelecek hafta göreceğimiz `ListView`'i kullanmaktır.

## 8.7 Wrap: Sığmayan alt satıra

`Wrap`, `Row` gibi çocuklarını yan yana dizer; ama satır dolunca taşmak yerine **alt satıra geçer**. Etiketler, filtreler ve beceri listeleri için idealdir:

```dart
// Dosya: lib/ornek_08_05_wrap.dart
import 'package:material_ui/material_ui.dart';

const List<String> ilgiAlanlari = [
  'Mobil', 'Yapay Zekâ', 'Oyun', 'Siber Güvenlik', 'Veri Bilimi', 'Robotik', 'Web',
];

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const .all(16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final String alan in ilgiAlanlari) Chip(label: Text(alan))],
            ),
          ),
        ),
      ),
    ),
  );
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ (Mobil) (Yapay Zekâ) (Oyun)  │
│ (Siber Güvenlik) (Veri Bilimi)│
│ (Robotik) (Web)              │
└──────────────────────────────┘
```

**Açıklama:** `spacing`: aynı satırdaki çocuklar arası boşluk; `runSpacing`: satırlar arası boşluk. Ekran genişledikçe (telefon yatay çevrildiğinde) bir satıra daha fazla etiket sığar; `Wrap` bunu kendiliğinden ayarlar.

---

# 9. Yerleşim II: Stack ve Positioned

## 9.1 Stack: Üst üste katmanlar

`Row` yan yana, `Column` alt alta dizer. **Üst üste** koymak için `Stack` (yığın) kullanılır: Bir resmin üzerine yazı, bir profil fotoğrafının köşesine rozet, bir ürün görselinin üzerine indirim etiketi...

```dart
// Dosya: lib/ornek_09_01_stack.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              CevrimiciAvatar(basHarfler: 'AY', cevrimici: true),
              CevrimiciAvatar(basHarfler: 'MK', cevrimici: false),
            ],
          ),
        ),
      ),
    ),
  );
}

class CevrimiciAvatar extends StatelessWidget {
  const CevrimiciAvatar({super.key, required this.basHarfler, required this.cevrimici});

  final String basHarfler;
  final bool cevrimici;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(radius: 36, child: Text(basHarfler, style: const TextStyle(fontSize: 22))),
        if (cevrimici)
          Positioned(
            right: 2,
            bottom: 2,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: .circle,
                border: .all(color: Colors.white, width: 3),
              ),
            ),
          ),
      ],
    );
  }
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│                              │
│      ╭────╮       ╭────╮     │
│      │ AY │       │ MK │     │
│      ╰───●╯       ╰────╯     │  ← AY'nin sağ altında yeşil nokta
│                              │
└──────────────────────────────┘
```

**Açıklama:**
- `Stack`'in çocukları **sırayla üst üste** çizilir: Listedeki **ilk** çocuk en altta, **son** çocuk en üsttedir. Yeşil nokta avatardan sonra yazıldığı için avatarın üzerinde görünür.
- `Positioned(right: 2, bottom: 2, ...)`: Çocuğu `Stack`'in **sağ alt köşesine** göre konumlandırır: sağdan 2, alttan 2 birim. `top`, `left`, `right`, `bottom` değerlerinden istenenler verilir.
- `shape: .circle`: Kutuyu daire yapar. Beyaz kenarlık, noktanın avatardan ayrışmasını sağlar.
- `if (cevrimici) Positioned(...)`: Çevrimdışı kullanıcıda nokta hiç çizilmez.

## 9.2 Bir ürün kartı: Görsel, etiket ve favori düğmesi

```dart
// Dosya: lib/ornek_09_02_urun_karti.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 220,
            child: UrunKarti(ad: 'Kablosuz Kulaklık', fiyat: 749.90, eskiFiyat: 999.90),
          ),
        ),
      ),
    ),
  );
}

class UrunKarti extends StatelessWidget {
  const UrunKarti({super.key, required this.ad, required this.fiyat, required this.eskiFiyat});

  final String ad;
  final double fiyat;
  final double eskiFiyat;

  int get indirimYuzdesi => ((eskiFiyat - fiyat) / eskiFiyat * 100).round();

  @override
  Widget build(BuildContext context) {
    ColorScheme renkler = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: .antiAlias,
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                alignment: .center,
                color: renkler.surfaceContainerHighest,
                child: Icon(Icons.headphones, size: 72, color: renkler.primary),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const .symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.red, borderRadius: .circular(8)),
                  child: Text(
                    '%$indirimYuzdesi',
                    style: const TextStyle(color: Colors.white, fontWeight: .bold),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
              ),
            ],
          ),
          Padding(
            padding: const .all(12),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(ad, maxLines: 1, overflow: .ellipsis),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${fiyat.toStringAsFixed(2)} TL',
                      style: const TextStyle(fontWeight: .bold, fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      eskiFiyat.toStringAsFixed(2),
                      style: TextStyle(color: renkler.outline, decoration: .lineThrough),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

**Ekranda (taslak):**

```text
        ╭──────────────────────╮
        │ [%25]             ♡  │  ← Stack: gri zemin + etiket + favori düğmesi
        │                      │
        │          🎧          │
        │                      │
        ├──────────────────────┤
        │ Kablosuz Kulaklık    │
        │ 749.90 TL  9̶9̶9̶.̶9̶0̶    │  ← eski fiyatın üstü çizili
        ╰──────────────────────╯
```

**Açıklama:**
- `Stack`'in **konumlandırılmamış** çocuğu (gri `Container`) yığının boyutunu belirler: 140 yüksekliğinde, kartın genişliğinde. `Positioned` çocuklar bu alanın üzerine yerleşir.
- `alignment: .center`: Simgeyi gri kutunun ortasına yerleştirir. Bu satırın bir etkisi daha var: `alignment` verilmiş bir `Container`, kendisine izin verilen **en geniş** alanı kaplar. Satırı silip deneyin: Gri zemin yalnızca simge genişliğinde kalır ve sol üst köşeye yapışır. Nedenini Bölüm 10'da göreceğiz.
- `indirimYuzdesi`: Hesaplanan bir getter (Hafta 4): (999,90 − 749,90) / 999,90 × 100 ≈ 25.
- `clipBehavior: .antiAlias`: Kartın yuvarlak köşelerinin, içindeki gri zemini de kırpmasını sağlar; yoksa gri zemin köşelerden taşar.
- `decoration: .lineThrough`: Metnin üstünü çizer (eski fiyat).
- `renkler.surfaceContainerHighest`: Temanın zemin tonlarından biri; görsel yokken yer tutucu olarak kullanılıyor.

## 9.3 Stack'in alignment'ı ve Positioned.fill

- `Stack(alignment: .center, ...)`: **Konumlandırılmamış** çocukları yığının ortasına hizalar (varsayılan sol üst).
- `Positioned.fill(child: ...)`: Çocuğu yığının **tamamını** kaplayacak şekilde yerleştirir. Bir resmin üzerine yarı saydam bir katman koymak için kullanılır: `Positioned.fill(child: Container(color: Colors.black.withValues(alpha: 0.4)))`. Ardından katmanın üzerine beyaz bir başlık yazılırsa, resim ne kadar açık renkli olursa olsun yazı okunaklı kalır.

**Ne zaman Stack?** Elemanlar gerçekten **üst üste** binecekse. Yalnızca alt alta veya yan yana dizilecekse `Column`/`Row` kullanın; `Stack` ve `Positioned` ile sabit koordinatlara yerleştirilen içerik, farklı ekran boyutlarında kolayca bozulur.

---

# 10. Kısıt Modeli: Flutter Boyutlara Nasıl Karar Verir?

Şimdiye kadar birkaç "garip" davranış gördük: `textAlign: .center` işe yaramadı (7.1), `alignment` satırı silinince gri zemin simge kadar daraldı (9.2), uzun metin satırdan taştı (8.6). Bunların hepsinin arkasında tek bir kural yatıyor.

## 10.1 Tek kural

> **Kısıtlar aşağı iner. Boyutlar yukarı çıkar. Konumu ebeveyn belirler.**
> *(Constraints go down. Sizes go up. Parent sets position.)*

Bir ebeveyn widget ile çocuğu arasında şöyle bir konuşma geçer:

```text
Ebeveyn → Çocuk : "Genişliğin 0 ile 360 arasında, yüksekliğin 0 ile 640 arasında olabilir."   (kısıt AŞAĞI)
Çocuk → Ebeveyn : "Tamam, ben 120 × 48 olacağım."                                             (boyut YUKARI)
Ebeveyn         : "Seni şu koordinata koyuyorum."                                              (konum)
```

Bu kuralın üç önemli sonucu vardır:

1. **Bir widget, ebeveyninin izin verdiğinden büyük veya küçük olamaz.** `Container(width: 100)` yazmak bir **istektir**, emir değil. Ebeveyn "tam 360 olmak zorundasın" derse, kutu 360 olur.
2. **Bir widget kendi konumunu bilmez ve seçemez.** Konumu ebeveyn belirler. Bu yüzden bir şeyi ortalamak için onu `Center` ile **sararız**.
3. **Boyut, ağaçta yukarıdan aşağıya pazarlıkla belirlenir.** Bir widget'ın neden o boyutta olduğunu anlamak için ebeveyninin ona **hangi kısıtı verdiğine** bakmak gerekir.

## 10.2 Kısıt türleri

Bir kısıt dört sayıdan oluşur: en az / en çok genişlik, en az / en çok yükseklik (`BoxConstraints`).

| Kısıt türü | Anlamı | Kim verir? (örnek) |
|---|---|---|
| **Sıkı** (tight) | En az = en çok: "Tam olarak şu boyutta olacaksın." | Ekran, uygulamanın köküne: tam ekran boyutu |
| **Gevşek** (loose) | En az = 0: "En fazla şu kadar olabilirsin." | `Center`, `Align`, `Scaffold`'un gövdesi |
| **Sınırsız** (unbounded) | En çok = sonsuz: "İstediğin kadar büyük olabilirsin." | `Row` (yatayda), `Column` (dikeyde), kaydırılabilir alanlar |

## 10.3 Şaşırtıcı sonuçlar ve nedenleri

```dart
// Dosya: lib/ornek_10_01_kisit_surprizi.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(Container(width: 100, height: 100, color: Colors.red));
}
```

**Ekranda:** Ekranın **tamamı** kırmızı.

**Açıklama:** Ekran, uygulamanın köküne **sıkı** bir kısıt verir: "Tam olarak ekran boyutunda olacaksın." `Container`'ın 100 × 100 isteği bu kısıta uymadığı için yok sayılır. Şimdi aynı kutuyu `Center` ile saralım:

```dart
// Dosya: lib/ornek_10_02_kisit_center.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(Center(child: Container(width: 100, height: 100, color: Colors.red)));
}
```

**Ekranda:** Siyah zeminin ortasında 100 × 100 kırmızı bir kare.

**Açıklama:** `Center` ekranın sıkı kısıtını kabul eder (kendisi tam ekran olur); ama çocuğuna **gevşek** bir kısıt iletir: "0 ile ekran boyutu arasında istediğin gibi ol." Artık kutunun 100 × 100 isteği kısıtın içinde kalır ve kabul edilir. `Center` da kutuyu ortaya **konumlandırır**.

Bu iki örnek, bölümün başındaki üç gizemi de açıklar:

| Gözlem | Kısıt modeliyle açıklaması |
|---|---|
| `Container(width: 100)` ekranı kapladı | Ebeveyn sıkı kısıt verdi; istek yok sayıldı |
| `textAlign: .center` işe yaramadı (7.1) | Sütun metne gevşek kısıt verdi; metin kendi genişliği kadar oldu, ortalayacak boş alan kalmadı |
| `alignment` olmadan gri zemin daraldı (9.2) | `Stack`, konumlandırılmamış çocuklarına **gevşek** kısıt verir; `Container` da çocuğu (simge) kadar küçüldü. `alignment` verilen `Container` ise izin verilen en geniş alanı kaplar |
| Uzun metin satırdan taştı (8.6) | `Row` çocuklarına yatayda sınırsız kısıt verir; metin tek satırda ekrandan geniş oldu |
| `Expanded` taşmayı çözdü | `Expanded`, çocuğuna kalan genişlikte **sıkı** kısıt verir; metin bu genişliğe sığmak için satırlara bölündü |

## 10.4 ❌ Sınırsız kısıtlar ve yanlış yerdeki Expanded

**Tuzak 1:** İç içe iki sütundan **içtekine** `Expanded` çocuk vermek:

```dart
// Dosya: lib/ornek_10_03_tuzak_sinirsiz.dart
// ❌ ÇALIŞMA ZAMANI HATASI
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Text('Başlık'),
            Column(
              children: [
                Expanded(child: Container(color: Colors.blue)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
```

**Çıktı (bir bölümü):**

```text
RenderFlex children have non-zero flex but incoming height constraints are unbounded.
```

**Açıklama:** Dış sütun, çocuklarına dikeyde **sınırsız** yer tanır. İç sütun "Kalan alanı Expanded'a vereyim" der; ama sınırsız bir alanın "kalanı" da sınırsızdır. Flutter sonsuz yükseklikte bir kutu çizemeyeceği için hata verir. *Türkçesi:* "Esnek çocuklar var ama gelen yükseklik kısıtı sınırsız." Çözüm: **iç sütunu** da `Expanded` ile sarmak. Böylece iç sütun, dış sütundaki kalan alanı (sınırlı bir yüksekliği) alır ve kendi `Expanded` çocuğuna onu paylaştırabilir.

**Tuzak 2:** `Expanded`'ı `Row`/`Column` dışında kullanmak:

```dart
// Dosya: lib/ornek_10_04_tuzak_expanded_yeri.dart
// ❌ ÇALIŞMA ZAMANI HATASI
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Expanded(child: Container(color: Colors.green)),
        ),
      ),
    ),
  );
}
```

**Çıktı (bir bölümü):**

```text
Incorrect use of ParentDataWidget.
```

**Açıklama:** `Expanded`, ebeveyni olan `Row`/`Column`'a "bana kalan alanı ver" diye **bilgi taşıyan** özel bir widget'tır (ParentDataWidget). `Center` bu bilgiyi anlamaz. *Türkçesi:* "ParentDataWidget'ın yanlış kullanımı." Hata mesajının devamında Flutter hangi widget'ın içinde kullanıldığını da yazar. Kod derlendiği için hata ancak çalışırken ortaya çıkar.

**Sık görülen kısıt hataları ve çözümleri:**

| Mesajın başı | Ne oldu? | Çözüm |
|---|---|---|
| `A RenderFlex overflowed by ... pixels on the right/bottom.` | Satır/sütunun içeriği sığmadı | `Expanded`, `maxLines` + `ellipsis`, `Wrap`, `SingleChildScrollView` |
| `RenderFlex children have non-zero flex but incoming ... constraints are unbounded.` | Sınırsız alanda `Expanded` kullanıldı | Dıştaki widget'ı da `Expanded` ile sar |
| `Incorrect use of ParentDataWidget.` | `Expanded`/`Flexible`/`Positioned` yanlış ebeveynde | `Expanded` → `Row`/`Column` içinde; `Positioned` → `Stack` içinde |
| `Vertical viewport was given unbounded height.` | Kaydırılabilir bir liste (`ListView`) `Column` içinde sınırsız bırakıldı (gelecek hafta) | Listeyi `Expanded` ile sar |

## 10.5 Duyarlı tasarım: Ekran genişliğine göre düzen

Aynı ekranın telefonda ve tablette farklı yerleşmesi gerekir. `LayoutBuilder`, ebeveynin verdiği **kısıtları** okumamızı sağlar:

```dart
// Dosya: lib/ornek_10_05_duyarli.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: SafeArea(child: OzetKartlari()))));
}

class OzetKartlari extends StatelessWidget {
  const OzetKartlari({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> kartlar = [
      OzetKarti(baslik: 'Derslerim', deger: '6', simge: Icons.menu_book),
      OzetKarti(baslik: 'Ödevler', deger: '2', simge: Icons.assignment),
      OzetKarti(baslik: 'Duyurular', deger: '5', simge: Icons.campaign),
    ];
    return LayoutBuilder(
      builder: (context, kisitlar) {
        if (kisitlar.maxWidth < 600) {
          return const Column(children: kartlar);
        }
        return Row(children: [for (final Widget kart in kartlar) Expanded(child: kart)]);
      },
    );
  }
}

class OzetKarti extends StatelessWidget {
  const OzetKarti({super.key, required this.baslik, required this.deger, required this.simge});

  final String baslik;
  final String deger;
  final IconData simge;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const .all(8),
      child: ListTile(
        leading: Icon(simge),
        title: Text(baslik),
        trailing: Text(deger, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
```

**Ekranda (taslak):**

```text
Telefon (dar):                    Tablet veya yatay ekran (geniş):
┌────────────────────┐            ┌──────────────────────────────────────────────┐
│ [📖 Derslerim    6]│            │ [📖 Derslerim  6] [📋 Ödevler 2] [📢 Duyurular 5]│
│ [📋 Ödevler      2]│            └──────────────────────────────────────────────┘
│ [📢 Duyurular    5]│
└────────────────────┘
```

**Açıklama:**
- `LayoutBuilder(builder: (context, kisitlar) {...})`: Ebeveynin verdiği kısıtları (`kisitlar.maxWidth`) okuyarak farklı ağaç döndürür. 600 birim, Material tasarımda telefon ile tablet arasındaki yaygın sınır değeridir.
- `MediaQuery.sizeOf(context)` (Bölüm 6.5) **ekranın** boyutunu verir; `LayoutBuilder` ise **bu widget'a ayrılan alanın** boyutunu verir. Ekranın yarısını kaplayan bir panelde `LayoutBuilder` daha doğru sonuç verir.
- `IconData`: Bir simgenin **verisi** (`Icons.menu_book` gibi). `Icon` widget'ı bu veriyi çizer.
- Telefonu yatay çevirin: Genişlik 600'ü geçerse kartlar yan yana dizilir.

---

# 11. Hot Reload ve Flutter DevTools

## 11.1 Hot reload ve hot restart

| | Hot reload (`r`, kaydetmek) | Hot restart (`R`) | Tam yeniden başlatma (durdur + çalıştır) |
|---|---|---|---|
| Süre | ~1 saniye | Birkaç saniye | Dakikalar (Android derlemesi) |
| Değişen kod | Yüklenir, `build`'ler yeniden çalışır | Yüklenir, uygulama **baştan** başlar | Her şey baştan derlenir |
| Uygulamanın durumu (sayaç değeri, açık sayfa) | **Korunur** | Sıfırlanır | Sıfırlanır |
| Ne zaman yeterli? | Widget'larda yapılan değişikliklerin çoğu | `main`'deki değişiklikler, global değişkenlerin ilk değerleri, enum/sınıf yapısı değişiklikleri | `pubspec.yaml`'a paket veya asset eklemek, `android/`/`ios/` klasörlerindeki değişiklikler |

**Hot reload neden durumu korur?** Değiştirdiğiniz kod çalışan uygulamanın **içine** yüklenir ve Flutter yalnızca `build` metotlarını yeniden çağırır; mevcut nesneler yerinde kalır. Bu yüzden 10 ekran derindeki bir sayfanın tasarımını değiştirirken her seferinde o sayfaya yeniden gitmeniz gerekmez. Bu, Flutter'ın geliştirme hızının en büyük sırrıdır.

**Hot reload neden bazen "işe yaramaz"?** `main` fonksiyonu ve global değişkenlerin ilk değerleri yalnızca uygulama **başlarken** çalışır. Örneğin `runApp(const KampusApp())` satırını `runApp(const BaskaApp())` yaparsanız hot reload bunu görmez; `R` ile hot restart gerekir. Değişikliğiniz ekrana yansımıyorsa ilk deneyeceğiniz şey hot restart olmalıdır.

## 11.2 Flutter DevTools ve Widget Inspector

**Flutter DevTools**, çalışan uygulamanızı incelemenizi sağlayan bir araçlar setidir. Bu hafta için en önemli parçası **Widget Inspector**'dır (widget denetçisi).

**Açmak için:** Uygulama çalışırken VS Code'da `Ctrl + Shift + P` → **Flutter: Open DevTools** → **Widget Inspector**. (VS Code'un sol kenarındaki Flutter simgesinden de açılabilir.)

| Özellik | Ne işe yarar? |
|---|---|
| **Widget ağacı** | Uygulamanın çalışan widget ağacını gösterir; Bölüm 5'te kâğıda çizdiğimiz ağacın canlısı |
| **Select Widget Mode** | Açıkken cihaz ekranında bir yere dokunun: Ağaçta o widget seçilir ve VS Code onu oluşturan kod satırına gider |
| **Layout Explorer** | Seçili `Row`/`Column`'un kısıtlarını, çocuklarının boyutlarını ve `flex` değerlerini görsel olarak gösterir; hizalamaları oradan değiştirip deneyebilirsiniz |
| **Show Guidelines** | Ekrandaki bütün kutuların sınırlarını, boşluklarını ve hizalama çizgilerini cihaz üzerinde çizer |
| **Performance** | Kare çizim sürelerini gösterir; takılan (janky) animasyonları bulmak için |

**Taşma hatasını DevTools ile çözmek:**
1. Ekranda sarı-siyah şeritleri görün.
2. Widget Inspector'da **Select Widget Mode**'u açın ve şeritlerin olduğu satıra dokunun.
3. Seçilen `Row`'un Layout Explorer görünümünde hangi çocuğun ne kadar yer kapladığına bakın: Taşan çocuk genellikle esnek **olmayan** (Expanded/Flexible ile sarılmamış) uzun bir metindir.
4. VS Code'da o satırda `Ctrl + .` → **Wrap with Expanded**.

> 💡 Bölüm 10'daki kısıt kuralını anlamanın en hızlı yolu, kendi ekranlarınızda Widget Inspector'ı açıp kutulara tıklamaktır. Her kutunun hangi kısıtı aldığını ve hangi boyutu seçtiğini orada görürsünüz.

---

# 12. Hepsini Birleştirelim: Kampüs Uygulaması Ana Sayfası

Bu bölümde haftanın bütün konularını tek bir ekranda birleştiriyoruz: Bir kampüs uygulamasının **ana sayfası.** Ekranda bir karşılama kartı, dört hızlı erişim düğmesi, bugünkü dersler, duyurular ve yemekhane menüsü var. Veriler şimdilik kodun içinde sabit; Hafta 6'daki gibi bir sunucudan gelmesini ilerleyen haftalarda bağlayacağız.

Kodu yazmadan önce ekranı **kutulara bölelim** (Bölüm 13'te bu yöntemi ayrıntılı göreceğiz):

```text
┌──────────────────────────────┐
│ Kampüs                    🔔 │  ← AppBar + eylem düğmesi
├──────────────────────────────┤
│ ╭──────────────────────────╮ │
│ │ Günaydın, Ayşe!       🎓 │ │  ← KarsilamaKarti (Stack)
│ │ Bugün 3 dersin var.      │ │
│ ╰──────────────────────────╯ │
│  📅      📋      🍽      🗺   │  ← HizliErisim (Row + 4 × Expanded)
│ Program Ödevler Yemek Harita │
│ Bugünkü Derslerim            │  ← BolumBasligi
│ 09:00 │ Mobil Cihaz Prog.    │  ← DersSatiri × 3
│       │ D-204                │
│ ...                          │
│ Duyurular                    │
│ ╭ 📢 Vize sonuçları ... ─╮   │  ← DuyuruKarti × 3 (Card + ListTile)
│ ...                          │
│ Bugünün Menüsü               │
│ (Mercimek) (Pilav) (Ayran)   │  ← Wrap + Chip
├──────────────────────────────┤
│  ⌂ Ana sayfa  📅 Program  👤 │  ← NavigationBar
└──────────────────────────────┘
```

```dart
// Dosya: lib/ornek_12_01_kampus_ana_sayfa.dart
import 'package:material_ui/material_ui.dart';

// ---------- Modeller ve örnek veriler ----------
class Ders {
  final String saat;
  final String ad;
  final String derslik;

  const Ders(this.saat, this.ad, this.derslik);
}

class Duyuru {
  final String baslik;
  final String birim;
  final bool acil;

  const Duyuru(this.baslik, this.birim, {this.acil = false});
}

const List<Ders> bugunkuDersler = [
  Ders('09:00', 'Mobil Cihaz Programlama', 'D-204'),
  Ders('13:00', 'Veri Tabanı Sistemleri', 'D-105'),
  Ders('15:00', 'Bilgisayar Ağları (Lab)', 'Lab-2'),
];

const List<Duyuru> duyurular = [
  Duyuru('Vize sonuçları açıklandı', 'Öğrenci İşleri'),
  Duyuru('Yarın Kezer kampüsünde elektrik kesintisi', 'Yapı İşleri', acil: true),
  Duyuru('Kütüphane hafta sonu açık', 'Kütüphane'),
];

const List<String> menu = ['Mercimek çorbası', 'Etli nohut', 'Pilav', 'Ayran'];

// ---------- Uygulama ----------
void main() {
  runApp(const KampusApp());
}

class KampusApp extends StatelessWidget {
  const KampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kampüs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.indigo)),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kampüs'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined))],
      ),
      body: SingleChildScrollView(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            KarsilamaKarti(ad: 'Ayşe', dersSayisi: bugunkuDersler.length),
            const SizedBox(height: 16),
            const HizliErisim(),
            const BolumBasligi(metin: 'Bugünkü Derslerim'),
            for (final Ders ders in bugunkuDersler) DersSatiri(ders: ders),
            const BolumBasligi(metin: 'Duyurular'),
            for (final Duyuru duyuru in duyurular) DuyuruKarti(duyuru: duyuru),
            const BolumBasligi(metin: 'Bugünün Menüsü'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final String yemek in menu) Chip(label: Text(yemek))],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Ana sayfa'),
          NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: 'Program'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}

// ---------- Ekran parçaları ----------
class KarsilamaKarti extends StatelessWidget {
  const KarsilamaKarti({super.key, required this.ad, required this.dersSayisi});

  final String ad;
  final int dersSayisi;

  @override
  Widget build(BuildContext context) {
    ColorScheme renkler = Theme.of(context).colorScheme;
    TextTheme yazilar = Theme.of(context).textTheme;
    return Container(
      height: 110,
      padding: const .all(16),
      decoration: BoxDecoration(color: renkler.primaryContainer, borderRadius: .circular(16)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            children: [
              Text('Günaydın, $ad!', style: yazilar.titleLarge),
              const SizedBox(height: 4),
              Text('Bugün $dersSayisi dersin var.', style: yazilar.bodyMedium),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Icon(Icons.school, size: 40, color: renkler.primary),
          ),
        ],
      ),
    );
  }
}

class HizliErisim extends StatelessWidget {
  const HizliErisim({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: HizliErisimDugmesi(simge: Icons.calendar_today, etiket: 'Program')),
        Expanded(child: HizliErisimDugmesi(simge: Icons.assignment_outlined, etiket: 'Ödevler')),
        Expanded(child: HizliErisimDugmesi(simge: Icons.restaurant_menu, etiket: 'Yemek')),
        Expanded(child: HizliErisimDugmesi(simge: Icons.map_outlined, etiket: 'Harita')),
      ],
    );
  }
}

class HizliErisimDugmesi extends StatelessWidget {
  const HizliErisimDugmesi({super.key, required this.simge, required this.etiket});

  final IconData simge;
  final String etiket;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton.filledTonal(onPressed: () {}, icon: Icon(simge)),
        Text(etiket, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}

class BolumBasligi extends StatelessWidget {
  const BolumBasligi({super.key, required this.metin});

  final String metin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(top: 24, bottom: 8),
      child: Text(metin, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class DersSatiri extends StatelessWidget {
  const DersSatiri({super.key, required this.ders});

  final Ders ders;

  @override
  Widget build(BuildContext context) {
    ColorScheme renkler = Theme.of(context).colorScheme;
    return Padding(
      padding: const .symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 64,
            padding: const .symmetric(vertical: 8),
            alignment: .center,
            decoration: BoxDecoration(color: renkler.secondaryContainer, borderRadius: .circular(8)),
            child: Text(ders.saat, style: const TextStyle(fontWeight: .bold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(ders.ad, maxLines: 1, overflow: .ellipsis),
                Text(ders.derslik, style: TextStyle(color: renkler.outline)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DuyuruKarti extends StatelessWidget {
  const DuyuruKarti({super.key, required this.duyuru});

  final Duyuru duyuru;

  @override
  Widget build(BuildContext context) {
    ColorScheme renkler = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
        leading: Icon(
          duyuru.acil ? Icons.warning_amber : Icons.campaign_outlined,
          color: duyuru.acil ? renkler.error : renkler.primary,
        ),
        title: Text(duyuru.baslik),
        subtitle: Text(duyuru.birim),
        trailing: duyuru.acil ? const Chip(label: Text('Acil')) : null,
      ),
    );
  }
}
```

**Açıklama (yukarıdan aşağıya):**

1. **Veri ve görünüm ayrı:** Ekranda görünen her şey (`bugunkuDersler`, `duyurular`, `menu`) dosyanın başındaki sabit listelerden geliyor. Arayüz kodunda tek bir ders adı bile yazılı değil. Yarın bu listeler internetten gelecek; arayüz kodu neredeyse hiç değişmeyecek.
2. **`AnaSayfa`** yalnızca ekranın **iskeletini** kurar: başlık çubuğu, kaydırılabilir gövde ve alt gezinme çubuğu. Ekranın her bölümü ayrı bir widget sınıfıdır. `AnaSayfa`'nın `build` metodu bu sayede bir **içindekiler tablosu** gibi okunur.
3. **`SingleChildScrollView`:** İçerik ekrandan uzun olduğu için gövdeyi kaydırılabilir yaptık; aksi halde alt kenarda taşma şeritleri görürdük (Bölüm 8.6). Uzun **listeler** için daha verimli olan `ListView`'i gelecek hafta göreceğiz.
4. **`crossAxisAlignment: .stretch`:** Sütundaki her bölüm ekranın tüm genişliğini kaplıyor.
5. **`KarsilamaKarti`:** Renkli, köşeleri yuvarlak bir `Container` içinde `Stack`: Solda metinler, sağ üstte simge. `renkler.primaryContainer` ve `renkler.primary` temadan geliyor; tohum rengini değiştirdiğinizde kart da değişir.
6. **`HizliErisim`:** Dört düğme `Expanded` ile sarıldığı için genişliği **eşit** paylaşırlar; ekran ne kadar geniş olursa olsun hizalı kalırlar. `IconButton.filledTonal`, Material 3'ün yumuşak dolgulu simge düğmesidir.
7. **`for (final Ders ders in bugunkuDersler) DersSatiri(ders: ders)`:** Her ders için bir satır. Ders sayısı değişirse ekran kendiliğinden uyum sağlar.
8. **`DersSatiri`:** Solda **sabit** genişlikte (64) saat kutusu, sağda kalan alanı alan (`Expanded`) ders bilgisi. Uzun ders adları `ellipsis` ile kesilir; satır taşmaz.
9. **`DuyuruKarti`:** `Card` + `ListTile`. Acil duyurularda simge ve rengi değişiyor ve sağda bir "Acil" etiketi çıkıyor. `trailing: duyuru.acil ? const Chip(...) : null`: `null` verilen yerde hiçbir şey çizilmez.
10. **`NavigationBar`:** Material 3'ün alt gezinme çubuğu. Şimdilik sekmeler arasında geçiş yapmıyor; sayfa geçişlerini ilerleyen haftalarda ekleyeceğiz.

**Bu haftanın konuları ekranın neresinde?**

| Konu | Ekrandaki yeri |
|---|---|
| `MaterialApp`, tema, `.fromSeed` | `KampusApp` |
| `Scaffold`, `AppBar`, `NavigationBar` | `AnaSayfa` |
| Kendi `StatelessWidget`'larımız, parametreler, `const` | Bütün ekran parçaları |
| `BuildContext` ile tema renkleri ve yazı stilleri | `KarsilamaKarti`, `DersSatiri`, `DuyuruKarti` |
| `Row` + `Expanded` | `HizliErisim`, `DersSatiri` |
| `Column`, `crossAxisAlignment` | Gövde, `KarsilamaKarti`, `DersSatiri` |
| `Stack` + `Positioned` | `KarsilamaKarti` |
| `Container` + `BoxDecoration` | `KarsilamaKarti`, saat kutusu |
| `Card`, `ListTile`, `Chip`, `Wrap` | Duyurular ve menü |
| Liste içinde `for` | Dersler, duyurular, menü |

> 🔗 **İlerleyen haftalarda:** Bu ekran, Hafta 6'daki `DuyuruDeposu` ve `Stream<EkranDurumu>` ile birleştiğinde gerçek bir uygulamaya dönüşür: Duyurular sunucudan gelir, yüklenirken bir çark döner, hata olursa "Tekrar dene" düğmesi çıkar.

---

# 13. Tasarımdan Koda: Örnek Problem ve Farklı Çözüm Yolları

## 13.1 Bir ekranı koda çevirmenin beş adımı

Bir tasarımcıdan (veya Figma, Google Stitch gibi bir tasarım aracından) bir ekran görseli aldığınızda, koda başlamadan önce şu beş adımı izleyin:

1. **Kutulara böl.** Ekranın üzerine (kâğıtta veya zihninizde) dikdörtgenler çizin. Her dikdörtgen bir widget olacak.
2. **Yönü bul.** Kutular yan yana mı (`Row`), alt alta mı (`Column`), üst üste mi (`Stack`)?
3. **Tekrarları bul.** Aynı görünüm birden çok kez mi tekrar ediyor? O görünüm **kendi widget'ınız** olacak; veriler bir listeden gelecek.
4. **Boyut ve boşlukları belirle.** Hangi kutu sabit boyutlu (avatar, saat kutusu), hangisi kalan alanı alacak (`Expanded`)? Kutular arası boşluklar (`SizedBox`, `Padding`)?
5. **Ağacı çiz, sonra kodla.** Önce widget ağacını kâğıda çizin; ardından koda geçin. Kod bitince ekranı tasarımla yan yana koyup karşılaştırın; farklılıkları Widget Inspector ile bulun.

## 13.2 Örnek problem: Hava durumu kartı

**Problem:** Tasarımcı aşağıdaki hava durumu kartını gönderdi. Kart; şehir adı, anlık sıcaklık, hava durumu, hissedilen sıcaklık ve nem ile beş günlük tahmini gösteriyor. Kodu yazın.

```text
╭──────────────────────────────╮
│ Siirt                     ☀  │
│ 18°  Güneşli                 │
│ Hissedilen 16° · Nem %35     │
│ ──────────────────────────── │
│  Pzt   Sal   Çar   Per   Cum │
│   ☀     ⛅    🌧     ☀     ☀  │
│  19°   17°   12°   16°   20° │
╰──────────────────────────────╯
```

**Adım 1–4: Analiz**

```text
Card
 └─ Padding (16)
     └─ Column (sola yaslı)
         ├─ Row                                ← üst kısım: bilgiler solda, büyük simge sağda
         │   ├─ Expanded → Column
         │   │   ├─ Text "Siirt"
         │   │   ├─ Row: Text "18°" (büyük) + Text "Güneşli"
         │   │   └─ Text "Hissedilen 16° · Nem %35"
         │   └─ Icon (güneş, büyük)
         ├─ Divider
         └─ Row                                ← alt kısım: 5 gün EŞİT genişlikte
             └─ 5 × Expanded → Column: Text gün, Icon, Text derece   ← TEKRAR EDİYOR
```

Aynı problemi üç farklı yolla çözelim.

### Çözüm 1: Hepsi tek yerde

```dart
// Dosya: lib/ornek_13_01_cozum1_tek_yerde.dart
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: SafeArea(child: HavaKarti()))));
}

class HavaKarti extends StatelessWidget {
  const HavaKarti({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: .all(16),
      child: Padding(
        padding: .all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text('Siirt', style: TextStyle(fontSize: 20)),
                      Row(
                        children: [
                          Text('18°', style: TextStyle(fontSize: 40, fontWeight: .bold)),
                          SizedBox(width: 8),
                          Text('Güneşli'),
                        ],
                      ),
                      Text('Hissedilen 16° · Nem %35', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Icon(Icons.wb_sunny, size: 56, color: Colors.orange),
              ],
            ),
            Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [Text('Pzt'), Icon(Icons.wb_sunny, color: Colors.orange), Text('19°')],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [Text('Sal'), Icon(Icons.cloud, color: Colors.blueGrey), Text('17°')],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [Text('Çar'), Icon(Icons.water_drop, color: Colors.blue), Text('12°')],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [Text('Per'), Icon(Icons.wb_sunny, color: Colors.orange), Text('16°')],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [Text('Cum'), Icon(Icons.wb_sunny, color: Colors.orange), Text('20°')],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

**Değerlendirme:** Ekran tasarımla aynı görünür ve kod bütünüyle `const` olduğu için hızlıdır. Ama sorunlar var: (1) Beş günlük sütun **beş kez kopyalandı**; derecelerin stilini değiştirmek beş yerde değişiklik ister. (2) Veriler (şehir, dereceler) arayüz kodunun **içine gömülü**; sunucudan gelen veriyle çalışamaz. (3) Renkler (`Colors.grey`, `Colors.orange`) elle yazıldı; karanlık modda gri metin okunaksız olabilir.

### Çözüm 2: Veriyi ayır, tekrarı widget yap

```dart
// Dosya: lib/ornek_13_02_cozum2_parcala.dart
import 'package:material_ui/material_ui.dart';

class GunlukTahmin {
  final String gun;
  final IconData simge;
  final int derece;

  const GunlukTahmin(this.gun, this.simge, this.derece);
}

const List<GunlukTahmin> tahminler = [
  GunlukTahmin('Pzt', Icons.wb_sunny, 19),
  GunlukTahmin('Sal', Icons.cloud, 17),
  GunlukTahmin('Çar', Icons.water_drop, 12),
  GunlukTahmin('Per', Icons.wb_sunny, 16),
  GunlukTahmin('Cum', Icons.wb_sunny, 20),
];

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: HavaKarti(sehir: 'Siirt', derece: 18, durum: 'Güneşli', hissedilen: 16, nem: 35),
        ),
      ),
    ),
  );
}

class HavaKarti extends StatelessWidget {
  const HavaKarti({
    super.key,
    required this.sehir,
    required this.derece,
    required this.durum,
    required this.hissedilen,
    required this.nem,
  });

  final String sehir;
  final int derece;
  final String durum;
  final int hissedilen;
  final int nem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const .all(16),
      child: Padding(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(sehir, style: const TextStyle(fontSize: 20)),
                      Row(
                        children: [
                          Text('$derece°', style: const TextStyle(fontSize: 40, fontWeight: .bold)),
                          const SizedBox(width: 8),
                          Text(durum),
                        ],
                      ),
                      Text('Hissedilen $hissedilen° · Nem %$nem', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const Icon(Icons.wb_sunny, size: 56, color: Colors.orange),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [for (final GunlukTahmin t in tahminler) Expanded(child: GunSutunu(tahmin: t))],
            ),
          ],
        ),
      ),
    );
  }
}

class GunSutunu extends StatelessWidget {
  const GunSutunu({super.key, required this.tahmin});

  final GunlukTahmin tahmin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(tahmin.gun),
        Icon(tahmin.simge, color: Colors.orange),
        Text('${tahmin.derece}°'),
      ],
    );
  }
}
```

**Değerlendirme:** Tekrar ortadan kalktı: Gün sütunu **bir kez** yazıldı (`GunSutunu`), beş gün bir listeden geliyor. Kartın kendisi de parametre alıyor; başka bir şehir için `HavaKarti(sehir: 'Van', ...)` yazmak yeter. Gün sayısı 7 olsa kod değişmez. Kalan sorun: Renkler ve yazı boyutları hâlâ elle yazılmış; ayrıca bütün simgeler turuncu (bulut ve yağmur da!).

### Çözüm 3: Tema ile uyumlu ve anlamlı renkler

```dart
// Dosya: lib/ornek_13_03_cozum3_tema.dart
import 'package:material_ui/material_ui.dart';

enum HavaDurumu {
  gunesli(Icons.wb_sunny, Colors.orange),
  bulutlu(Icons.cloud, Colors.blueGrey),
  yagmurlu(Icons.water_drop, Colors.blue);

  final IconData simge;
  final Color renk;

  const HavaDurumu(this.simge, this.renk);
}

class GunlukTahmin {
  final String gun;
  final HavaDurumu durum;
  final int derece;

  const GunlukTahmin(this.gun, this.durum, this.derece);
}

const List<GunlukTahmin> tahminler = [
  GunlukTahmin('Pzt', HavaDurumu.gunesli, 19),
  GunlukTahmin('Sal', HavaDurumu.bulutlu, 17),
  GunlukTahmin('Çar', HavaDurumu.yagmurlu, 12),
  GunlukTahmin('Per', HavaDurumu.gunesli, 16),
  GunlukTahmin('Cum', HavaDurumu.gunesli, 20),
];

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.lightBlue)),
      home: const Scaffold(
        body: SafeArea(
          child: HavaKarti(
            sehir: 'Siirt',
            derece: 18,
            durum: HavaDurumu.gunesli,
            hissedilen: 16,
            nem: 35,
            tahminler: tahminler,
          ),
        ),
      ),
    ),
  );
}

class HavaKarti extends StatelessWidget {
  const HavaKarti({
    super.key,
    required this.sehir,
    required this.derece,
    required this.durum,
    required this.hissedilen,
    required this.nem,
    required this.tahminler,
  });

  final String sehir;
  final int derece;
  final HavaDurumu durum;
  final int hissedilen;
  final int nem;
  final List<GunlukTahmin> tahminler;

  @override
  Widget build(BuildContext context) {
    ColorScheme renkler = Theme.of(context).colorScheme;
    TextTheme yazilar = Theme.of(context).textTheme;
    return Card(
      margin: const .all(16),
      child: Padding(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(sehir, style: yazilar.titleLarge),
                      Row(
                        children: [
                          Text('$derece°', style: yazilar.displaySmall?.copyWith(fontWeight: .bold)),
                          const SizedBox(width: 8),
                          Text(durum.name, style: yazilar.titleMedium),
                        ],
                      ),
                      Text(
                        'Hissedilen $hissedilen° · Nem %$nem',
                        style: yazilar.bodyMedium?.copyWith(color: renkler.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                Icon(durum.simge, size: 56, color: durum.renk),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [for (final GunlukTahmin t in tahminler) Expanded(child: GunSutunu(tahmin: t))],
            ),
          ],
        ),
      ),
    );
  }
}

class GunSutunu extends StatelessWidget {
  const GunSutunu({super.key, required this.tahmin});

  final GunlukTahmin tahmin;

  @override
  Widget build(BuildContext context) {
    TextTheme yazilar = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(tahmin.gun, style: yazilar.labelLarge),
        const SizedBox(height: 4),
        Icon(tahmin.durum.simge, color: tahmin.durum.renk),
        const SizedBox(height: 4),
        Text('${tahmin.derece}°', style: yazilar.bodyLarge),
      ],
    );
  }
}
```

**Değerlendirme:**
- **Hafta 5'teki alanlı enum** (`HavaDurumu`) her hava durumunun simgesini ve rengini **bir yerde** tutar. Bulutlu gün artık gri-mavi bulutla, yağmurlu gün mavi damlayla gösteriliyor; yeni bir durum (karlı) eklemek tek bir satır.
- Yazı boyutları elle verilmek yerine **temanın yazı stillerinden** (`titleLarge`, `displaySmall`, `labelLarge`) alınıyor; uygulamanın geri kalanıyla tutarlı.
- İkincil metin rengi `Colors.grey` yerine temanın `onSurfaceVariant` rengi: Açık ve karanlık temada okunaklı kalır.
- Tahmin listesi artık karta **parametre** olarak veriliyor; kart, verinin nereden geldiğini bilmiyor. Gerçek uygulamada bu liste bir hava durumu servisinden gelecek.
- `durum.name` ekrana `gunesli` yazar. Gerçek bir uygulamada enum'a bir `etiket` alanı (`'Güneşli'`) eklenirdi (Ödev 4, Soru 2'deki gibi); bunu size alıştırma olarak bırakıyoruz.

### Karşılaştırma

| | Çözüm 1: Tek yerde | Çözüm 2: Parçala | Çözüm 3: Tema + enum |
|---|---|---|---|
| Kod uzunluğu | Orta (tekrarlı) | Kısa | En uzun |
| Tekrar | 5 kez kopyalanmış sütun | Yok | Yok |
| Veri kaynağı | Kodun içine gömülü | Liste + parametre | Liste + parametre, enum |
| Karanlık mod / tema değişimi | Bozulabilir | Bozulabilir | Uyum sağlar |
| Ne zaman uygun? | Hızlı bir prototip, tasarım denemesi | Çoğu ekran için yeterli | Uzun ömürlü, büyüyecek bir uygulama |

Doğru çözüm, kodun ne kadar yaşayacağına bağlıdır. Bir tasarım fikrini beş dakikada denemek için Çözüm 1 yeterlidir; ama mağazaya çıkacak bir uygulamada Çözüm 3'ün alışkanlıkları zamanla size çok vakit kazandırır.

---

# 14. Yapay Zekâ ile Flutter Ekranı Geliştirmek

## 14.1 AI'dan ekran istemek

Bir ekran görseli veya açıklaması verip AI'dan Flutter kodu istemek, bugün çok yaygın bir çalışma biçimidir. Ama AI'ın ürettiği ekran kodu, Dart kodundan daha zor denetlenir: Kod derlenir, ekran **neredeyse** doğru görünür ve sorunlar ancak küçük bir telefonda, uzun bir metinde veya karanlık modda ortaya çıkar.

Bölüm 13'teki beş adımı AI ile çalışırken de uygulayın: Önce **ağacı** isteyin, ağacı anladıktan sonra **kodu** isteyin.

```text
Flutter 3.50 ile bir hava durumu kartı yazıyorum. Ekteki tasarımda kart;
şehir adı, anlık sıcaklık, durum, hissedilen sıcaklık/nem ve 5 günlük tahmin içeriyor.

Kurallar:
- İçe aktarma: import 'package:material_ui/material_ui.dart';
  (package:flutter/material.dart kullanma.)
- Yalnızca StatelessWidget kullan; veri, karta parametre olarak verilsin.
- Tekrar eden gün sütunu ayrı bir widget sınıfı olsun.
- Renkleri ve yazı stillerini Theme.of(context)'ten al; renk kodu yazma.
- Sabit genişlik (width: 380 gibi) kullanma; 320 birim genişlikte taşma olmamalı.
- withOpacity kullanma (kullanımdan kaldırıldı); gerekirse withValues(alpha: ...).

Önce widget ağacını madde madde çiz; ben onaylayınca kodu yaz.
Kodu yazdıktan sonra her Expanded'ın neden gerekli olduğunu açıkla.
```

İstemdeki kuralların neredeyse hepsi, bu haftanın tuzaklarından ve AI'ın sık yaptığı hatalardan geliyor.

## 14.2 AI'ın Flutter kodunu denetleme listesi

| Kontrol edin | Neden? | Bölüm |
|---|---|---|
| `import 'package:flutter/material.dart'` | Kullanımdan kaldırıldı; `material_ui` kullanılmalı | 3.4 |
| `withOpacity(...)` | Kullanımdan kaldırıldı; `withValues(alpha: ...)` | 7.7 |
| `final` olmayan alanlar | Widget'lar değişmezdir; değişen veri `StatefulWidget` ister | 6.7 |
| Kurucuda `key` parametresi yok | Her widget kurucusu `super.key` almalı | 6.4 |
| Sabit genişlikler (`width: 380`), uzun metinler `Expanded`'sız | Küçük ekranlarda taşma şeritleri | 8.6, 10 |
| Yalnızca boşluk için `Container` | `Padding` / `SizedBox` daha doğru | 7.4 |
| Yüzlerce satırlık tek `build` metodu | Okunmaz; ekran parçalarını widget'lara ayırın | 6.3 |
| Elle yazılmış renk kodları | Tema ve karanlık mod bozulur | 7.7 |
| Eksik `const` | Gereksiz yeniden oluşturma | 6.4 |
| `Expanded`'ın yanlış yerde kullanılması | Çalışma sırasında hata | 10.4 |
| Var olmayan parametre veya widget | AI bazen **uydurur** (halüsinasyon); kod derlenmez | — |

## 14.3 Alıştırma: AI'ın yazdığı bu kartı denetleyin

Bir öğrenci AI'a "Duyuru kartı widget'ı yaz" demiş ve şu kodu almış:

```dart
// Dosya: lib/ornek_14_01_ai_kodu.dart
// ❌ UYARI: Yapay zekânın yazdığı kodu denetleyin.
import 'package:flutter/material.dart';

class DuyuruKarti extends StatelessWidget {
  String baslik;
  String birim;

  DuyuruKarti({required this.baslik, required this.birim});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 380,
        padding: EdgeInsets.all(12),
        color: Colors.blue.withOpacity(0.1),
        child: Row(
          children: [
            Icon(Icons.campaign, color: Colors.blue),
            Container(width: 8),
            Text(baslik, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(' - ' + birim),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: DuyuruKarti(baslik: 'Yarın Kezer kampüsünde elektrik kesintisi', birim: 'Yapı İşleri'),
      ),
    ),
  );
}
```

**Uyarı mesajı (VS Code, Problems paneli, bir bölümü):**

```text
'package:flutter/material.dart' is deprecated and shouldn't be used. Use package:material_ui/material_ui.dart instead.
This class (or a class that this class inherits from) is marked as '@immutable', but one or more of its instance fields aren't final: DuyuruKarti.baslik, DuyuruKarti.birim
Constructors for public widgets should have a named 'key' parameter.
Unnecessary instance of 'Container'.
'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss.
Use 'const' with the constructor to improve performance.
Use interpolation to compose strings and values.
```

Kod derleniyor ve çalışıyor. Problems paneli bu dosya için **dokuz** uyarı ve öneri gösteriyor (`Use 'const'...` satırı üç kez çıkıyor). Bunların yanında panelin **göremediği** iki sorun daha var. Okumaya devam etmeden önce sorunları kendiniz bulmaya çalışın.

**Cevap:**
1. **Eski içe aktarma:** `package:flutter/material.dart` yerine `package:material_ui/material_ui.dart` (Bölüm 3.4).
2. **`final` olmayan alanlar:** `baslik` ve `birim` `final` olmalı (Bölüm 6.7).
3. **`key` parametresi yok ve kurucu `const` değil:** `const DuyuruKarti({super.key, required this.baslik, required this.birim})`.
4. **İç içe gereksiz `Container`:** Dıştaki `Container` hiçbir iş yapmıyor.
5. **`withOpacity`:** Kullanımdan kaldırıldı. Daha da iyisi, renk temadan alınmalı: `renkler.primaryContainer`.
6. **Boşluk için `Container(width: 8)`:** Doğrusu `SizedBox(width: 8)`. Dikkat: Problems paneli bunu bu dosyada **işaretlemedi**. `sized_box_for_whitespace` kuralı yalnızca bazı kalıpları (örneğin hem genişlik hem yükseklik verilmiş, çocuksuz bir `Container`'ı) yakalar. Panelin sessiz kalması, kodun doğru olduğu anlamına gelmez.
7. **Eksik `const`'lar:** `EdgeInsets.all(12)`, `Icon(...)`, `TextStyle(...)` sabit.
8. **Metin birleştirme:** `' - ' + birim` yerine `' - $birim'`.
9. **Problems panelinin göremediği ikinci sorun: taşma.** `width: 380` ve `Expanded`'sız uzun başlık, 360 birim genişliğindeki bir telefonda sağ kenarda **taşma şeritleri** oluşturur. Bu hata yalnızca uygulama **çalışırken** görülür; bu yüzden AI'ın ekran kodunu mutlaka küçük bir ekranda çalıştırarak deneyin.

**Düzeltilmiş hali:**

```dart
// Dosya: lib/ornek_14_02_ai_kodu_duzeltilmis.dart
import 'package:material_ui/material_ui.dart';

class DuyuruKarti extends StatelessWidget {
  const DuyuruKarti({super.key, required this.baslik, required this.birim});

  final String baslik;
  final String birim;

  @override
  Widget build(BuildContext context) {
    ColorScheme renkler = Theme.of(context).colorScheme;
    return Container(
      padding: const .all(12),
      decoration: BoxDecoration(color: renkler.primaryContainer, borderRadius: .circular(12)),
      child: Row(
        children: [
          Icon(Icons.campaign, color: renkler.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(baslik, style: const TextStyle(fontSize: 16, fontWeight: .bold)),
                Text(birim, style: TextStyle(color: renkler.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: .all(16),
            child: DuyuruKarti(baslik: 'Yarın Kezer kampüsünde elektrik kesintisi', birim: 'Yapı İşleri'),
          ),
        ),
      ),
    ),
  );
}
```

**Ekranda (taslak):**

```text
┌──────────────────────────────┐
│ ╭──────────────────────────╮ │
│ │ 📢 **Yarın Kezer         │ │  ← uzun başlık alt satıra geçti, taşma yok
│ │    kampüsünde elektrik   │ │
│ │    kesintisi**           │ │
│ │    Yapı İşleri           │ │
│ ╰──────────────────────────╯ │
└──────────────────────────────┘
```

**Açıklama:** Sabit genişlik kaldırıldı; kart, ebeveyninin verdiği genişliği kullanıyor (Bölüm 10). Metin bloğu `Expanded` içinde; uzun başlık alt satıra geçiyor. Birim bilgisi ayrı bir satıra alındı ve tema renkleri kullanıldı. Problems paneli artık **boş.**

> 💡 **Ders çıkarımı:** Hafta 6'da "çalışıyor ile doğru aynı şey değildir" demiştik. Ekran kodunda buna bir cümle ekleyin: **"Benim telefonumda düzgün görünüyor" ile "her telefonda düzgün görünüyor" da aynı şey değildir.** AI'ın ürettiği ekranları en küçük ekranlı emülatörde, uzun metinlerle ve telefonu yatay çevirerek deneyin.

---

# 15. Özet

| Konu | Sözdizimi / araç | Not |
|---|---|---|
| Flutter | Dart ile yazılan arayüz kütüphanesi | Tek kod, çok platform; pikselleri kendisi çizer |
| Bildirimsel arayüz | Ekran = f(durum) | `build` her çağrıldığında ekranın tarifini döndürür |
| Proje | `flutter create proje_adi` | `lib/` ve `pubspec.yaml` |
| Material paketi | `import 'package:material_ui/material_ui.dart';` | Eski: `package:flutter/material.dart` (kullanımdan kaldırıldı) |
| Nokta kısaltması | `.center`, `.bold`, `.fromSeed(...)`, `.all(16)` | Beklenen tip belliyse tip adı yazılmaz; `Colors.x`, `Icons.x` tam yazılır |
| Uygulama kökü | `runApp(MaterialApp(home: ...))` | Tema, başlık, ilk ekran |
| Ekran iskeleti | `Scaffold(appBar:, body:, floatingActionButton:)` | Metin Material zemin içinde olmalı |
| Widget ağacı | `child:` / `children: [...]` | Kod = ağaç; sarmalama ile özellik ekleme |
| Kendi widget'ınız | `class X extends StatelessWidget` | `const` kurucu, `super.key`, `final` alanlar, `@override build` |
| BuildContext | `Theme.of(context)`, `MediaQuery.sizeOf(context)` | Widget'ın ağaçtaki adresi |
| Metin, simge, resim | `Text`, `Icon`, `Image.asset/network` | `maxLines` + `overflow: .ellipsis` |
| Kutu | `Container(padding:, margin:, decoration: BoxDecoration(...))` | `color` ve `decoration` birlikte verilmez |
| Boşluk, hizalama | `Padding`, `SizedBox`, `Center`, `Align`, `SafeArea` | Container'ı her şey için kullanmayın |
| Hazır bileşenler | `Card`, `ListTile`, `CircleAvatar`, `Chip`, `FilledButton` | `onPressed: null` → pasif düğme |
| Satır ve sütun | `Row`, `Column`, `mainAxisAlignment`, `crossAxisAlignment` | Ana eksen = dizilim yönü |
| Esneklik | `Expanded(flex:)`, `Flexible`, `Spacer` | Yalnızca `Row`/`Column` içinde |
| Alt satıra geçme | `Wrap(spacing:, runSpacing:)` | Etiketler, filtreler |
| Üst üste | `Stack`, `Positioned`, `Positioned.fill` | İlk çocuk en altta |
| Kısıt modeli | Kısıtlar aşağı, boyutlar yukarı, konumu ebeveyn belirler | `width: 100` bir istektir |
| Taşma | `A RenderFlex overflowed by ... pixels` | `Expanded`, `ellipsis`, `Wrap`, kaydırma |
| Duyarlı tasarım | `LayoutBuilder` (`kisitlar.maxWidth`) | 600 birim: telefon / tablet sınırı |
| Geliştirme araçları | Hot reload (`r`), hot restart (`R`), DevTools Widget Inspector | Durum korunur / sıfırlanır |
| Tasarımdan koda | Kutulara böl → yönü bul → tekrarları bul → boyutlar → ağaç → kod | AI'dan önce ağacı isteyin |

---

# 16. Kendinizi Test Edin

**1.** Flutter'ın "bildirimsel" arayüz anlayışını, emredici yaklaşımla karşılaştırarak iki cümleyle açıklayın.

**Cevap:** Emredici yaklaşımda veri değiştiğinde ekranın ilgili parçaları tek tek bulunup değiştirilir. Bildirimsel yaklaşımda ise "durum şuysa ekran böyle görünür" tarifi bir kez yazılır; veri değiştiğinde Flutter tarifi (`build`) yeniden çalıştırır ve ekranı günceller.

**2.** Aşağıdaki kodun widget ağacını çizin.

```text
Scaffold(
  appBar: AppBar(title: Text('Menü')),
  body: Padding(
    padding: .all(16),
    child: Row(children: [Icon(Icons.restaurant), Text('Mercimek çorbası')]),
  ),
)
```

**Cevap:**

```text
Scaffold
 ├─ appBar: AppBar
 │   └─ title: Text("Menü")
 └─ body: Padding (16)
     └─ child: Row
         ├─ Icon(restaurant)
         └─ Text("Mercimek çorbası")
```

**3.** `mainAxisAlignment: .spaceBetween` ifadesinin uzun yazımı nedir? `color: .red` neden derleme hatası verir?

**Cevap:** `mainAxisAlignment: MainAxisAlignment.spaceBetween`. `color` parametresinin tipi `Color`'dır; `red` ise `Color` sınıfının değil `Colors` sınıfının bir üyesidir. Nokta kısaltması yalnızca **beklenen tipin kendi** üyeleri için çalışır; doğrusu `Colors.red`.

**4.** Aşağıdaki widget'ın üç hatasını bulun.

```text
class Etiket extends StatelessWidget {
  Etiket({required this.metin});
  String metin;
  Widget build(BuildContext context) {
    return Text(metin);
  }
}
```

**Cevap:** (1) Kurucuda `super.key` yok ve kurucu `const` değil: `const Etiket({super.key, required this.metin});`. (2) `metin` alanı `final` değil; widget'lar değişmez olmalı. (3) `build` metodunun üstünde `@override` yok.

**5.** `const Center(child: Text(ad))` neden derleme hatası verir? Nasıl düzeltilir?

**Cevap:** `const`, widget'ın derleme sırasında oluşturulmasını ister; ama `ad` bir değişkendir ve değeri ancak çalışma sırasında belli olur ("Invalid constant value."). Düzeltme: `Center(child: Text(ad))`.

**6.** `Container`'ın `padding` ve `margin` parametreleri arasındaki fark nedir?

**Cevap:** `padding` kutunun **içindeki** boşluktur (kenarlık ile içerik arası); `margin` kutunun **dışındaki** boşluktur (kutu ile çevresindeki widget'lar arası). Kutunun rengi padding alanını kaplar, margin alanını kaplamaz.

**7.** Bir `Row` içinde `Icon` ve çok uzun bir `Text` var; ekranın sağında sarı-siyah şeritler çıkıyor. Neden? İki farklı çözüm önerin.

**Cevap:** `Row`, çocuklarına yatayda sınırsız alan tanır; metin tek satırda ekrandan geniş olur ve satır taşar ("A RenderFlex overflowed by ... pixels on the right."). Çözümler: Metni `Expanded` ile sarmak (metin alt satırlara bölünür) veya `Expanded` + `maxLines: 1, overflow: .ellipsis` (metin `...` ile kesilir).

**8.** `Expanded(flex: 3, ...)` ve `Expanded(flex: 1, ...)` aynı satırdaysa ve sabit çocuklardan sonra 200 birim yer kaldıysa her biri kaç birim alır?

**Cevap:** Kalan 200 birim 3 : 1 oranında paylaşılır: 150 ve 50 birim.

**9.** `Stack` içindeki çocukların hangisi en üstte görünür? `Positioned(top: 8, right: 8, ...)` ne anlama gelir?

**Cevap:** Listedeki **son** çocuk en üstte görünür (ilk çocuk en altta). `Positioned(top: 8, right: 8)`: Çocuğu yığının üst kenarından 8, sağ kenarından 8 birim içeride konumlandırır.

**10.** `runApp(Container(width: 100, height: 100, color: Colors.red))` neden ekranın tamamını kırmızı yapar? Kareyi 100 × 100 göstermek için ne yapılmalı?

**Cevap:** Ekran, uygulamanın köküne **sıkı** bir kısıt verir ("tam olarak ekran boyutunda olacaksın"); kutunun 100 × 100 isteği bu kısıta uymadığı için yok sayılır. Kutuyu `Center` ile sarmak gerekir: `Center` çocuğuna gevşek kısıt verir ve 100 × 100 isteği kabul edilir.

**11.** Bir `Column`'un içindeki başka bir `Column`'a `Expanded` çocuk verildiğinde hangi hata alınır? Neden? Çözüm nedir?

**Cevap:** "RenderFlex children have non-zero flex but incoming height constraints are unbounded." Dış sütun çocuklarına dikeyde sınırsız alan verir; iç sütun sınırsız alanın "kalanını" `Expanded`'a paylaştıramaz. Çözüm: İç sütunu da `Expanded` ile sarmak.

**12.** `Center(child: Expanded(child: ...))` neden çalışırken hata verir?

**Cevap:** `Expanded` yalnızca bir `Row`, `Column` veya `Flex`'in doğrudan çocuğu olabilir; ebeveynine "bana kalan alanı ver" bilgisini taşır ve `Center` bu bilgiyi anlamaz. Hata: "Incorrect use of ParentDataWidget."

**13.** `MediaQuery.sizeOf(context)` ile `LayoutBuilder` arasındaki fark nedir?

**Cevap:** `MediaQuery.sizeOf` **ekranın** tamamının boyutunu verir. `LayoutBuilder` ise ebeveynin **bu widget'a** verdiği kısıtları verir. Ekranın yalnızca bir bölümünü kaplayan bir panelin düzenini seçerken `LayoutBuilder` daha doğru sonuç verir.

**14.** Hangi durumda hot reload yetmez, hot restart gerekir? Bir örnek verin.

**Cevap:** `main` fonksiyonundaki ve global değişkenlerin ilk değerlerindeki değişiklikler hot reload ile yeniden çalışmaz. Örneğin `runApp(const KampusApp())` satırını `runApp(const BaskaApp())` yapmak hot restart (`R`) gerektirir. `pubspec.yaml`'a yeni bir asset veya paket eklemek ise uygulamanın tamamen yeniden başlatılmasını gerektirir.

**15.** AI'ın ürettiği bir ekran kodunda Problems paneli boşsa ekranın her telefonda düzgün görüneceğinden emin olabilir miyiz?

**Cevap:** Hayır. Taşma gibi yerleşim hataları yalnızca uygulama **çalışırken** ve belirli ekran boyutlarında ortaya çıkar; analizör bunları göremez. Ekranı küçük bir emülatörde, uzun metinlerle ve yatay konumda deneyip Widget Inspector ile incelemek gerekir.

---

# 17. Ödev 6

> **AI kuralı:** Hafta 6'daki gibi AI'ı eş programcı olarak kullanabilirsiniz; `AI_LOG.md` zorunludur. **Ek kural:** AI kullandığınız her soru için, AI'dan **önce** kendi çizdiğiniz widget ağacını `AI_LOG.md`'ye ekleyin. Ödev çözümleri **8. haftanın ilk 15 dakikasında** sınıfta birlikte yapılacaktır; rastgele seçilen öğrencilerden ekranlarını ve ağaçlarını açıklamaları istenebilir.

**Teslim:**
- `flutter create odev6` ile bir proje oluşturun. Her soru `lib` klasöründe ayrı bir dosya olsun: `odev6_s1.dart`, ..., `odev6_s5.dart`. Her dosyanın kendi `main` fonksiyonu vardır; verilen kodları **aynen** kullanın.
- Her ekranın bir **ekran görüntüsünü** (telefon emülatöründe, dikey konumda) `ekranlar` klasörüne koyun: `s1.png`, ..., `s5.png`. 4. soruda ek olarak yatay konumdaki görüntüyü de ekleyin (`s4_yatay.png`).
- Proje klasörünü (`build` klasörü olmadan) ve `AI_LOG.md` dosyasını Classroom'daki ödev sayfasına yükleyin.

**Bütün sorular için kabul ölçütleri:**
- İçe aktarma: `package:material_ui/material_ui.dart`. Yalnızca `StatelessWidget` kullanılır.
- **Problems paneli boştur** (hata, uyarı ve bilgi notu yok).
- 360 birim genişliğindeki bir telefonda **taşma şeridi yoktur**.
- Renkler mümkün olduğunca temadan (`Theme.of(context).colorScheme`) alınır; yazı stilleri `textTheme`'den alınabilir.
- İstenen widget sınıfları **istenen adlarla ve parametrelerle** yazılır.

> 💡 Taslaklar ekranın **yerleşimini** gösterir; renk, yazı boyutu ve boşluk değerlerini siz seçin. Taslakla aynı yerleşimi kurmanız yeterlidir.

---

### Soru 1 — Kartvizit *(Column, CircleAvatar, Row + Expanded, kendi widget'ınız)*

```text
┌──────────────────────────────┐
│ ╭──────────────────────────╮ │
│ │          (AY)            │ │  ← baş harfler, tema renginde daire
│ │       Ayşe Yılmaz        │ │
│ │ Mobil Uygulama Geliştir..│ │
│ │ ──────────────────────── │ │
│ │ ✉  ayse.yilmaz@ornek.e...│ │  ← IletisimSatiri × 3
│ │ ☎  0484 000 00 00        │ │
│ │ ⌖  Siirt                 │ │
│ ╰──────────────────────────╯ │
└──────────────────────────────┘
```

- **`Kartvizit`**: `ad`, `unvan`, `eposta`, `telefon`, `sehir` (hepsi `required String`). Bir `Card` içinde. Baş harfler `String get basHarfler` getter'ı ile **addan hesaplanır** (`'Ayşe Yılmaz'` → `'AY'`; Hafta 5'teki `split`, `map`, `join`).
- **`IletisimSatiri`**: `required IconData simge`, `required String metin`. Solda simge, sağda metin; uzun metin tek satırda `...` ile kesilir.

```dart
// ŞABLON: Tanımlarınızı bu main'in üstüne yazın.
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.teal)),
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: Kartvizit(
              ad: 'Ayşe Yılmaz',
              unvan: 'Mobil Uygulama Geliştirici',
              eposta: 'ayse.yilmaz@ornek.edu.tr',
              telefon: '0484 000 00 00',
              sehir: 'Siirt',
            ),
          ),
        ),
      ),
    ),
  );
}
```

**Ek görev:** `ad` parametresini `'Mehmet Can Öztürk'` yapın. Baş harfler doğru hesaplanıyor mu? (`'MCÖ'`)

---

### Soru 2 — Ürün Vitrini *(Stack, Positioned, ikili ızgara, koşullu widget'lar)*

```text
┌──────────────────────────────┐
│ Vitrin                       │
├──────────────────────────────┤
│ ╭───────────╮ ╭───────────╮  │
│ │       %25 │ │[YENİ]     │  │  ← etiketler görselin üstünde (Stack)
│ │    🎧     │ │    ⌚     │  │
│ ├───────────┤ ├───────────┤  │
│ │Kablosuz K…│ │Akıllı Saat│  │
│ │749.90 TL  │ │2399.00 TL │  │
│ │9̶9̶9̶.̶9̶0̶ ̶T̶L̶  │ │           │  │  ← eski fiyat üstü çizili (varsa)
│ ╰───────────╯ ╰───────────╯  │
│ ╭───────────╮ ╭───────────╮  │
│ │[YENİ]  %10│ │    📱     │  │
│ ...                          │
│ ╭───────────╮                │  ← tek kalan ürün solda, sağ taraf boş
└──────────────────────────────┘
```

- **`UrunVitrini`**: `required List<Urun> urunler`. Ürünleri **ikişer ikişer** satırlara dizer (her satır bir `Row`, iki `Expanded`). Ürün sayısı tekse son satırın sağı boş kalır. İçerik kaydırılabilir olmalıdır (`SingleChildScrollView`).
- **`UrunKarti`**: `required Urun urun`. Üstte 120 yüksekliğinde bir görsel alanı (`Container` içinde `urun.simge`). Ürün yeniyse **sol üstte** yeşil "YENİ" etiketi; `eskiFiyat` varsa **sağ üstte** kırmızı indirim yüzdesi etiketi (`Stack` + `Positioned`). Altta ad (tek satır), fiyat ve varsa üstü çizili eski fiyat.
- **`Etiket`**: `required String metin`, `required Color renk`. Köşeleri yuvarlak, renkli zemin üzerinde beyaz kalın yazı. Her iki etiket de bu widget ile çizilir.
- İndirim yüzdesi: `((eskiFiyat - fiyat) / eskiFiyat * 100).round()`.

```dart
// ŞABLON: Bu model ve verileri aynen kullanın; widget'larınızı bunların üstüne yazın.
class Urun {
  final String ad;
  final double fiyat;
  final double? eskiFiyat;
  final bool yeni;
  final IconData simge;

  const Urun(this.ad, this.fiyat, {this.eskiFiyat, this.yeni = false, required this.simge});
}

const List<Urun> urunler = [
  Urun('Kablosuz Kulaklık', 749.90, eskiFiyat: 999.90, simge: Icons.headphones),
  Urun('Akıllı Saat', 2399.00, yeni: true, simge: Icons.watch),
  Urun('Hızlı Şarj Aleti 65W', 449.50, eskiFiyat: 499.50, yeni: true, simge: Icons.power),
  Urun('Telefon Kılıfı', 199.00, simge: Icons.phone_android),
  Urun('Bluetooth Hoparlör', 899.00, simge: Icons.speaker),
];

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Vitrin')),
        body: const UrunVitrini(urunler: urunler),
      ),
    ),
  );
}
```

**İpucu:** `eskiFiyat` null olabilen bir alandır (`double?`). `build` içinde onu yerel bir değişkene alıp `if (eski != null)` ile kontrol ettiğinizde Dart tipini `double`'a yükseltir (Hafta 4).

---

### Soru 3 — Ders Programı *(veriden ekran, gruplama, enum ile görünüm)*

```text
┌──────────────────────────────┐
│ Ders Programım               │
├──────────────────────────────┤
│ Pzt                          │
│ ╭──────────────────────────╮ │
│ │09:00 Mobil Cihaz P… [Teorik]│
│ │      D-204               │ │
│ ╰──────────────────────────╯ │
│ ...                          │
│ **Bugün · Sal**              │  ← bugünün başlığı tema renginde ve kalın
│ ╭──────────────────────────╮ │
│ │10:00 Mobil Cihaz P… [Lab]│ │
│ ...                          │
│ Çar                          │
│ ...                [Seçmeli] │
└──────────────────────────────┘
```

- **`DersProgrami`**: `required List<Ders> program`, `required String bugun`. `Scaffold` + `AppBar('Ders Programım')`. Günleri **programda ilk göründükleri sırayla** bulun (Hafta 5: `map` + `toSet`) ve her gün için önce bir `GunBasligi`, ardından o günün `DersKarti`'larını çizin. İçerik kaydırılabilir olmalıdır.
- **`GunBasligi`**: `required String gun`, `required bool bugunMu`. Bugünse metin `'Bugün · Sal'` biçiminde, tema renginde ve kalın; değilse yalnızca gün adı.
- **`DersKarti`**: `required Ders ders`. Solda sabit genişlikte saat, ortada (kalan alan) ders adı (tek satır, `...`) ve derslik, sağda `TurEtiketi`.
- **`TurEtiketi`**: `required DersTuru tur`. Metni ve zemin rengi `switch` ifadesiyle belirlenir: teorik → `'Teorik'`, laboratuvar → `'Lab'`, seçmeli → `'Seçmeli'`; üç tür üç **farklı** tema rengi (`primaryContainer`, `tertiaryContainer`, `secondaryContainer` gibi).

```dart
// ŞABLON: Bu model ve verileri aynen kullanın; widget'larınızı bunların üstüne yazın.
enum DersTuru { teorik, laboratuvar, secmeli }

class Ders {
  final String gun;
  final String saat;
  final String ad;
  final String derslik;
  final DersTuru tur;

  const Ders(this.gun, this.saat, this.ad, this.derslik, this.tur);
}

const List<Ders> program = [
  Ders('Pzt', '09:00', 'Mobil Cihaz Programlama', 'D-204', DersTuru.teorik),
  Ders('Pzt', '13:00', 'Veri Tabanı Sistemleri', 'D-105', DersTuru.teorik),
  Ders('Sal', '10:00', 'Mobil Cihaz Programlama Uygulaması', 'Lab-1', DersTuru.laboratuvar),
  Ders('Sal', '14:00', 'Girişimcilik', 'Amfi-2', DersTuru.secmeli),
  Ders('Çar', '09:00', 'Bilgisayar Ağları', 'D-201', DersTuru.teorik),
  Ders('Çar', '11:00', 'Bilgisayar Ağları Lab', 'Lab-2', DersTuru.laboratuvar),
  Ders('Çar', '15:00', 'Teknik İngilizce', 'D-102', DersTuru.secmeli),
];

const String bugun = 'Sal';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.indigo)),
      home: const DersProgrami(program: program, bugun: bugun),
    ),
  );
}
```

---

### Soru 4 — Günlük Hedef Paneli *(LayoutBuilder, Expanded ile ilerleme çubuğu)*

```text
Telefon (dikey):                      Tablet / yatay (genişlik ≥ 600):
┌──────────────────────────────┐      ┌───────────────────────────────────────────┐
│ Bugün                        │      │ Bugün                                     │
├──────────────────────────────┤      ├───────────────────────────────────────────┤
│ 🚶 Adım                  %74 │      │ 🚶 Adım            %74 │ 💧 Su            %59 │
│    7450 / 10000 adım         │      │ [███████░░░]           │ [██████░░░░]          │
│    [███████░░░]              │      │ 🌙 Uyku            %87 │ 🔥 Kalori       %108 │
│ 💧 Su                    %59 │      │ [████████░░]           │ [██████████] (yeşil)  │
│ ...                          │      └───────────────────────────────────────────┘
│ 🔥 Kalori               %108 │
│    [██████████]   (yeşil)    │
└──────────────────────────────┘
```

- **`OzetPaneli`**: `required List<Hedef> hedefler`. `LayoutBuilder` ile: genişlik 600'den küçükse kartlar **alt alta**; değilse **ikişer ikişer** yan yana (Soru 2'deki ikili satır mantığı). Kaydırılabilir olmalıdır.
- **`HedefKarti`**: `required Hedef hedef`. Solda simge; ortada ad ve sağında yüzde; altında `deger / hedef birim` metni ve `IlerlemeCubugu`. Yüzde: `deger * 100 ~/ hedef`.
- **`IlerlemeCubugu`**: `required int yuzde`. 10 birim yüksekliğinde, köşeleri yuvarlak bir çubuk. Dolu kısım ile boş kısım **iki `Expanded`'ın `flex` oranıyla** çizilir (Bölüm 8.4; Ödev 5'teki `[####------]` çubuğunun widget hali). Yüzde 100'ü geçerse çubuk tamamen dolu ve **yeşil** olur; 100'ün altında tema renginde.

```dart
// ŞABLON: Bu model ve verileri aynen kullanın; widget'larınızı bunların üstüne yazın.
class Hedef {
  final String ad;
  final IconData simge;
  final int deger;
  final int hedef;
  final String birim;

  const Hedef(this.ad, this.simge, this.deger, this.hedef, this.birim);
}

const List<Hedef> hedefler = [
  Hedef('Adım', Icons.directions_walk, 7450, 10000, 'adım'),
  Hedef('Su', Icons.water_drop, 1190, 2000, 'ml'),
  Hedef('Uyku', Icons.bedtime, 7, 8, 'saat'),
  Hedef('Kalori', Icons.local_fire_department, 2170, 2000, 'kcal'),
];

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: Scaffold(
        appBar: AppBar(title: const Text('Bugün')),
        body: const SafeArea(child: OzetPaneli(hedefler: hedefler)),
      ),
    ),
  );
}
```

**İpucu:** `Expanded`'ın `flex` değeri **sıfır olamaz**. Yüzde 0 veya 100 olduğunda iki parçadan birini hiç çizmemek için liste içinde `if` kullanın.

---

### Soru 5 — Tasarımdan Koda: Etkinlik Kartı *(widget ağacı, Stack ile üst üste binen avatarlar)*

Aşağıdaki tasarımı koda çevirin. **Önce** widget ağacını çizin ve dosyanın en başına **yorum satırları** olarak yazın (Bölüm 13.2'deki gibi); sonra kodu yazın.

```text
┌──────────────────────────────┐
│ ╭──────────────────────────╮ │
│ │ ╭────╮                   │ │
│ │ │ 03 │       👥          │ │  ← görsel alanı (140) + sol üstte beyaz tarih rozeti
│ │ │ARA │                   │ │
│ │ ╰────╯                   │ │
│ ├──────────────────────────┤ │
│ │ Flutter ile Mobil Uygula-│ │  ← başlık, en fazla 2 satır
│ │ ma Geliştirme Atölyesi   │ │
│ │ ⌖ Mühendislik Fakültesi,…│ │  ← BilgiSatiri
│ │ 🕑 14:00 - 17:00          │ │  ← BilgiSatiri
│ │ (AY)(MK)(ZA) +24 kişi (Katıl)│  ← avatarlar ÜST ÜSTE biner; düğme en sağda
│ ╰──────────────────────────╯ │
└──────────────────────────────┘
```

- **`EtkinlikKarti`**: `required Etkinlik etkinlik`.
- **`TarihRozeti`**: `required String gun`, `required String ay`.
- **`BilgiSatiri`**: `required IconData simge`, `required String metin` (tek satır, `...`).
- **`KatilimciYigini`**: `required List<String> basHarfler`. Avatarlar **üst üste biner**: Her avatar bir öncekinin 24 birim sağında başlar (`Stack` + `Positioned(left: 24.0 * i)`). Yığının genişliği avatar sayısına göre hesaplanır (32 birimlik avatarlar için: `32 + 24 × (sayı − 1)`).
- "+24 kişi" metni: toplam katılımcı sayısından gösterilen avatar sayısı çıkarılarak **hesaplanır** (27 − 3).

```dart
// ŞABLON: Bu model ve veriyi aynen kullanın; widget ağacınızı (yorum olarak) ve widget'larınızı bunların üstüne yazın.
class Etkinlik {
  final String baslik;
  final String yer;
  final String gun;
  final String ay;
  final String saat;
  final int katilimciSayisi;
  final List<String> katilimciBasHarfleri;

  const Etkinlik({
    required this.baslik,
    required this.yer,
    required this.gun,
    required this.ay,
    required this.saat,
    required this.katilimciSayisi,
    required this.katilimciBasHarfleri,
  });
}

const Etkinlik atolye = Etkinlik(
  baslik: 'Flutter ile Mobil Uygulama Geliştirme Atölyesi',
  yer: 'Mühendislik Fakültesi, D-204',
  gun: '03',
  ay: 'ARA',
  saat: '14:00 - 17:00',
  katilimciSayisi: 27,
  katilimciBasHarfleri: ['AY', 'MK', 'ZA'],
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.orange)),
      home: const Scaffold(body: SafeArea(child: EtkinlikKarti(etkinlik: atolye))),
    ),
  );
}
```

**İpucu:** Avatarların birbirinden ayrışması için her avatarı biraz daha büyük, beyaz bir `CircleAvatar`'ın içine koyabilirsiniz (beyaz kenarlık etkisi). `Spacer`, "Katıl" düğmesini satırın en sağına iter.

---

# 18. Kaynaklar

| Kaynak | Adres | Konu |
|---|---|---|
| Flutter'da yerleşim | [docs.flutter.dev/ui/layout](https://docs.flutter.dev/ui/layout) | Row, Column, Stack, Expanded ve yerleşim örnekleri |
| Kısıtları anlamak | [docs.flutter.dev/ui/layout/constraints](https://docs.flutter.dev/ui/layout/constraints) | "Constraints go down, sizes go up" kuralı ve 29 örnek |
| Widget kataloğu | [docs.flutter.dev/ui/widgets](https://docs.flutter.dev/ui/widgets) | Bütün hazır widget'lar, kategorilere göre |
| material_ui'ye geçiş | [docs.flutter.dev/release/breaking-changes/material-ui-and-cupertino-ui](https://docs.flutter.dev/release/breaking-changes/material-ui-and-cupertino-ui) | Yeni içe aktarma ve `dart fix` komutu |
| Nokta kısaltmaları | [dart.dev/language/dot-shorthands](https://dart.dev/language/dot-shorthands) | `.center`, `.fromSeed(...)` yazımı |
| Hot reload | [docs.flutter.dev/tools/hot-reload](https://docs.flutter.dev/tools/hot-reload) | Hot reload'un çalıştığı ve çalışmadığı durumlar |
| Widget Inspector | [docs.flutter.dev/tools/devtools/inspector](https://docs.flutter.dev/tools/devtools/inspector) | DevTools ile widget ağacını ve kısıtları incelemek |
| Material 3 | [m3.material.io](https://m3.material.io) | Material Design 3 bileşenleri ve renk sistemi |

---

### Gelecek Hafta

**Hafta 8 — Etkileşim ve Durum:** Bu hafta ekranlarımız yalnızca **gösteriyordu**; düğmelere basmak hiçbir şeyi değiştirmiyordu. Gelecek hafta ekranları **canlandırıyoruz**: `StatefulWidget` ve yaşam döngüsü (`initState`, `dispose`), `setState` ile durum yönetimi, `TextField` ile metin girişi ve form doğrulama, uzun listeler için `ListView` ve `GridView`. Hafta 6'daki asenkron konular (`FutureBuilder`, `StreamBuilder`) da ilk kez gerçek ekranlarda karşımıza çıkacak.

**Derse hazırlık:**
- Ödev 6'yı, ekran görüntülerini ve `AI_LOG.md` dosyanızı teslim edin. Çözümler derste ilk 15 dakikada birlikte yapılacak.
- `flutter create` ile gelen varsayılan sayaç uygulamasının `lib/main.dart` dosyasını açın ve `StatefulWidget`, `State` ve `setState` satırlarını bulun; ne yaptıklarını tahmin edip not alın.
- **Dönem projesine hazırlık:** Proje fikrinizin **üç ana ekranını** kâğıda çizin ve her birini bu haftaki yöntemle widget ağacına çevirin. Projenizin hangi BM Sürdürülebilir Kalkınma Amacı (ör. Nitelikli Eğitim, Sağlık ve Kaliteli Yaşam, Sürdürülebilir Şehirler) ile ilişkili olduğunu bir paragrafla yazın. Teslim biçimi ve tarihi Classroom'da duyurulacaktır.

---

*BMH309 Mobil Cihaz Programlama · Hafta 7 Ders Notu*
