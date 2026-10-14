# <font color='blue'>**Hafta 5 · Nesne Yönelimli Programlama II ve Fonksiyonel Programlama**</font>

---
**Ders:** BMH309 Mobil Cihaz Programlama
**Konular:** Ödev 3 çözümleri · Soyut sınıflar · Arayüzler (`implements`) · `mixin` · `extension` · `enum` · `sealed` sınıflar · Fonksiyonlar birer değerdir · İsimsiz fonksiyonlar · Liste ve Map için fonksiyonel metotlar (`where`, `map`, `fold`, `sort`...)
**Yazar:** Dr. Öğr. Üyesi Fesih Keskin

---

# Giriş

Geçen hafta sınıfları, kalıtımı ve polimorfizmi öğrendik. Haftayı bitirirken üç soru açık kalmıştı:

1. Bölüm 10'daki ödeme örneğinde `Odeme` sınıfı hem bir **kalıp** hem de Cep Cüzdan ödemesi olarak kullanılıyordu. Kendi başına hiçbir anlamı olmayan, yalnızca alt sınıflara kalıp olan bir sınıf nasıl yazılır?
2. Tip desenleriyle yazılan çözümde yeni bir ödeme türü eklenip `switch` güncellenmeyi unutulursa, hata **sessizce** geçiyordu. Bunu bir derleme hatasına çevirebilir miyiz?
3. Hafta 3'te listeleri filtrelemek, dönüştürmek ve toplamak için her seferinde 5–6 satırlık döngüler yazdık. Bunun daha kısa bir yolu yok mu?

Bu hafta bu soruların hepsini cevaplıyoruz. Haftanın ilk yarısında Dart'ın sınıflarla ilgili kalan araçlarını (`abstract`, `implements`, `mixin`, `extension`, `enum`, `sealed`), ikinci yarısında ise **fonksiyonel programlamayı** öğreneceğiz.

Bu haftanın konuları Flutter kodunun **her satırında** karşınıza çıkar:

| Bu hafta öğreneceğiniz | Flutter'da karşınıza çıkacağı yer |
|---|---|
| Soyut sınıf | `StatelessWidget` soyut bir sınıftır; `build` metodunu yazmak zorundasınız |
| `mixin` ve `with` | `with SingleTickerProviderStateMixin` (animasyonlar), `with ChangeNotifier` (durum yönetimi) |
| `enum` | `MainAxisAlignment.center`, `TextAlign.center`, `ThemeMode.dark` |
| `sealed` sınıflar | Ekranın "yükleniyor / veri geldi / hata" durumları |
| İsimsiz fonksiyonlar | `onPressed: () { ... }`, `onChanged: (metin) { ... }` |
| `map` ve `toList` | `children: urunler.map((u) => UrunKarti(u)).toList()` |

### Bu Haftanın Hedefleri

Bu haftanın sonunda şunları yapabiliyor olmalısınız:

1. Soyut sınıf ve soyut metot yazmak; soyut sınıfın neden nesnesinin oluşturulamadığını açıklamak.
2. `implements` ile bir sınıfa sözleşme (arayüz) uygulatmak; `extends` ile `implements` arasındaki farkı açıklamak.
3. `mixin` ile ortak davranışları birbiriyle ilgisiz sınıflara eklemek.
4. `extension` ile hazır tiplere (`String`, `double`, `int`) yeni yetenekler eklemek.
5. Sabit seçenek kümelerini `enum` ile tanımlamak; alan ve metot içeren gelişmiş enum'lar yazmak.
6. `sealed` sınıflarla eksiksiz (`_` gerektirmeyen) `switch` ifadeleri yazmak.
7. Fonksiyonları değişkene atamak, parametre olarak göndermek ve fonksiyondan fonksiyon döndürmek.
8. Listelerde `where`, `map`, `any`, `every`, `firstWhere`, `fold`, `reduce` ve `sort` kullanmak; Map'lerde `forEach`, `update`, `removeWhere` ve `putIfAbsent` kullanmak.

### Bu Haftanın AI Kuralı

> **Hafta 1–5: "AI açıklar, siz yazarsınız."** Bu kuralın geçerli olduğu **son hafta** bu hafta.
> - AI'ı kavram sormak, hata mesajlarını açıklatmak ve kodunuzu okutmak için kullanabilirsiniz.
> - AI'a kod yazdırmak veya dosyalarınızı değiştirtmek **yasaktır**. Claude Code'u plan modunda kullanınız.
> - Sınıf içi mini görevler AI kapalı yapılır.
> - 6. haftadan itibaren AI'ı **eş programcı** olarak kullanmaya başlayacağız. Bunun için bu haftanın konularını (özellikle fonksiyonel metotları) AI'sız gerçekten anlamış olmanız gerekir; aksi halde AI'ın yazdığı kodu okuyup denetleyemezsiniz.

### Başlamadan Önce

- Bu hafta için `C:\dev\bmh309\hafta5` klasörünü oluşturup VS Code'da açın.
- Her kod bloğu tek başına çalışan tam bir programdır ve ilk satırında önerilen dosya adı yazar (`// Dosya: ...`). Bölüm 9'daki örnekler aynı ürün kataloğunu kullanır; her dosya bu kataloğu kendi içinde yeniden tanımlar, böylece her biri tek başına çalışır.
- Bu haftanın örnekleri klavyeden veri almaz; VS Code'daki **Run** düğmesiyle çalıştırabilirsiniz.
- ❌ işaretli bloklar bilerek hatalıdır; hata mesajını görmeniz için verilmiştir.
- Bu hafta birçok yeni **söz dizimi** (syntax) göreceksiniz. Her örneği yazarken önce satırı yüksek sesle "Türkçe" okumayı deneyin: `urunler.where((u) => u.stoktaVar)` → "ürünlerden, stokta olanları seç". Okuyabildiğiniz kodu yazabilirsiniz.

---

# İçindekiler

1. [Ödev 3 Çözümleri](#1-ödev-3-çözümleri)
2. [Soyut Sınıflar](#2-soyut-sınıflar)
3. [Arayüzler: implements](#3-arayüzler-implements)
4. [Mixin: Ortak Davranışları Paylaşmak](#4-mixin-ortak-davranışları-paylaşmak)
5. [Extension: Hazır Tiplere Yeni Yetenekler](#5-extension-hazır-tiplere-yeni-yetenekler)
6. [Enum: Sabit Seçenekler](#6-enum-sabit-seçenekler)
7. [Sealed Sınıflar: Eksiksiz Durumlar](#7-sealed-sınıflar-eksiksiz-durumlar)
8. [Fonksiyonlar Birer Değerdir](#8-fonksiyonlar-birer-değerdir)
9. [Listeler İçin Fonksiyonel Metotlar](#9-listeler-için-fonksiyonel-metotlar)
10. [Map İçin Fonksiyonel Metotlar](#10-map-için-fonksiyonel-metotlar)
11. [Hepsini Birleştirelim: Katalog Ekranının Mantığı](#11-hepsini-birleştirelim-katalog-ekranının-mantığı)
12. [Örnek Problem ve Farklı Çözüm Yolları](#12-örnek-problem-ve-farklı-çözüm-yolları)
13. [Özet](#13-özet)
14. [Kendinizi Test Edin](#14-kendinizi-test-edin)
15. [Ödev 4](#15-ödev-4)
16. [Kaynaklar](#16-kaynaklar)

---

# 1. Ödev 3 Çözümleri

Bu bölümde geçen haftanın ödev sorularının birer örnek çözümünü veriyoruz. **Sizin çözümünüz farklı olabilir.** Verilen `main` fonksiyonuyla çıktınız beklenen çıktıyla birebir aynıysa ve override ettiğiniz metotlarda `@override` kullandıysanız çözümünüz doğrudur.

## Soru 1 — Akıllı Ampul

**Çözümün mantığı:** Parlaklık ve açık/kapalı durumu **private** alanlarda tutulur; dışarıdan yalnızca getter'lar ve kurallı bir setter ile erişilir. Setter hem değeri 0–100 aralığına sabitler hem de ampulün açık olup olmadığını günceller.

```dart
// Dosya: 01_s1_akilli_ampul.dart
class AkilliAmpul {
  final String oda;
  bool _acik = false;
  int _parlaklik;

  AkilliAmpul(this.oda, {int parlaklik = 70}) : _parlaklik = parlaklik;

  bool get acikMi => _acik;
  int get parlaklik => _parlaklik;

  set parlaklik(int deger) {
    if (deger < 0) {
      _parlaklik = 0;
    } else if (deger > 100) {
      _parlaklik = 100;
    } else {
      _parlaklik = deger;
    }
    _acik = _parlaklik > 0;
  }

  void ac() {
    if (_parlaklik == 0) {
      _parlaklik = 70;
    }
    _acik = true;
  }

  void kapat() {
    _acik = false;
  }

  String get durum => _acik ? '$oda: Açık (%$_parlaklik)' : '$oda: Kapalı';
}

void main() {
  AkilliAmpul salon = AkilliAmpul('Salon');
  AkilliAmpul mutfak = AkilliAmpul('Mutfak', parlaklik: 40);

  print(salon.durum);
  salon.ac();
  print(salon.durum);
  salon.parlaklik = 150;
  print(salon.durum);
  salon.parlaklik = 0;
  print(salon.durum);

  mutfak.ac();
  print(mutfak.durum);
  mutfak.parlaklik = -20;
  print(mutfak.durum);
  print('Açık ampul var mı? ${salon.acikMi || mutfak.acikMi}');
}
```

**Çıktı:**

```text
Salon: Kapalı
Salon: Açık (%70)
Salon: Açık (%100)
Salon: Kapalı
Mutfak: Açık (%40)
Mutfak: Kapalı
Açık ampul var mı? false
```

**Açıklama:**
- Kurucudaki `{int parlaklik = 70}` isimlendirilmiş parametresi, **başlatıcı listesiyle** private alana aktarıldı: `: _parlaklik = parlaklik`.
- `_acik = _parlaklik > 0;` satırı bir karşılaştırmanın sonucunu (`true`/`false`) doğrudan alana atar. `if (_parlaklik > 0) { _acik = true; } else { _acik = false; }` yazmanın kısa yoludur.

## Soru 2 — Kullanıcı Profilleri

```dart
// Dosya: 01_s2_kullanici_profilleri.dart
class Kullanici {
  final String kullaniciAdi;
  final String eposta;
  final String rol;

  Kullanici(this.kullaniciAdi, this.eposta, {this.rol = 'üye'});

  Kullanici.misafir()
      : kullaniciAdi = 'misafir',
        eposta = '-',
        rol = 'misafir';

  factory Kullanici.epostadan(String eposta) {
    String temiz = eposta.trim().toLowerCase();
    if (!temiz.contains('@')) {
      return Kullanici.misafir();
    }
    return Kullanici(temiz.split('@')[0], temiz);
  }

  Kullanici.fromMap(Map<String, dynamic> veri)
      : kullaniciAdi = veri['kullaniciAdi'] as String,
        eposta = veri['eposta'] as String,
        rol = (veri['rol'] as String?) ?? 'üye';

  @override
  String toString() => '@$kullaniciAdi <$eposta> [$rol]';
}

void main() {
  List<Kullanici> kullanicilar = [
    Kullanici('ayse', 'ayse@ornek.com', rol: 'yönetici'),
    Kullanici.misafir(),
    Kullanici.epostadan('  Mert.Kaya@Ornek.com '),
    Kullanici.epostadan('gecersiz-adres'),
    Kullanici.fromMap({'kullaniciAdi': 'zeynep', 'eposta': 'zeynep@ornek.com'}),
  ];

  for (Kullanici k in kullanicilar) {
    print(k);
  }
}
```

**Çıktı:**

```text
@ayse <ayse@ornek.com> [yönetici]
@misafir <-> [misafir]
@mert.kaya <mert.kaya@ornek.com> [üye]
@misafir <-> [misafir]
@zeynep <zeynep@ornek.com> [üye]
```

**Açıklama:**
- `factory` kurucu, gelen veriye göre **farklı kurucuları** çağırabiliyor: geçersiz adreste `Kullanici.misafir()`, geçerli adreste ana kurucu.
- `(veri['rol'] as String?) ?? 'üye'`: Map'te `'rol'` anahtarı yoksa `veri['rol']` `null` döner; `as String?` "bu bir String ya da null" der, `??` ise null durumunda varsayılan değeri verir.

## Soru 3 — Ulaşım Uygulaması

```dart
// Dosya: 01_s3_ulasim.dart
class Yolculuk {
  final double km;

  Yolculuk(this.km);

  String get tur => 'Yolculuk';
  double ucret() => 0;

  String ozet() => '${tur.padRight(8)} ${km.toStringAsFixed(1)} km → ${ucret().toStringAsFixed(2)} TL';
}

class Taksi extends Yolculuk {
  final bool gece;

  Taksi(super.km, {this.gece = false});

  @override
  String get tur => 'Taksi';

  @override
  double ucret() {
    double tutar = 45 + km * 25;
    return gece ? tutar * 1.5 : tutar;
  }

  @override
  String ozet() => gece ? '${super.ozet()} (gece)' : super.ozet();
}

class Scooter extends Yolculuk {
  final int dakika;

  Scooter(super.km, this.dakika);

  @override
  String get tur => 'Scooter';

  @override
  double ucret() => 10 + dakika * 4.5;

  @override
  String ozet() => '${super.ozet()} ($dakika dk)';
}

class Otobus extends Yolculuk {
  final bool ogrenci;

  Otobus(super.km, {this.ogrenci = false});

  @override
  String get tur => 'Otobüs';

  @override
  double ucret() => ogrenci ? 10.0 : 20.0;
}

Yolculuk enPahali(List<Yolculuk> liste) {
  Yolculuk secilen = liste[0];
  for (Yolculuk y in liste) {
    if (y.ucret() > secilen.ucret()) {
      secilen = y;
    }
  }
  return secilen;
}

void main() {
  List<Yolculuk> gunluk = [
    Otobus(12.5, ogrenci: true),
    Scooter(2.3, 11),
    Taksi(8.4),
    Taksi(6.0, gece: true),
    Otobus(12.5),
  ];

  double toplam = 0;
  for (Yolculuk y in gunluk) {
    print(y.ozet());
    toplam += y.ucret();
  }
  print('Günlük toplam: ${toplam.toStringAsFixed(2)} TL');

  Yolculuk enPahaliYolculuk = enPahali(gunluk);
  print('En pahalı yolculuk: ${enPahaliYolculuk.tur} ${enPahaliYolculuk.km.toStringAsFixed(1)} km '
      '(${enPahaliYolculuk.ucret().toStringAsFixed(2)} TL)');
}
```

**Çıktı:**

```text
Otobüs   12.5 km → 10.00 TL
Scooter  2.3 km → 59.50 TL (11 dk)
Taksi    8.4 km → 255.00 TL
Taksi    6.0 km → 292.50 TL (gece)
Otobüs   12.5 km → 20.00 TL
Günlük toplam: 637.00 TL
En pahalı yolculuk: Taksi 6.0 km (292.50 TL)
```

**Açıklama:**
- `ozet()` metodu **üst sınıfta** bir kez yazıldı ve içinde `tur` ile `ucret()` kullanılıyor. Alt sınıflar bu ikisini override ettiği için aynı `ozet()` her nesnede farklı sonuç veriyor. Bu yapının adı **şablon metot**tur ve bu hafta Bölüm 2'de soyut sınıflarla birlikte göreceğiz.
- `Taksi` ve `Scooter`, `super.ozet()` ile üst sınıfın metnini alıp sonuna kendi bilgilerini ekliyor.

## Soru 4 — Medya Kitaplığı

```dart
// Dosya: 01_s4_medya_kitapligi.dart
class Medya {
  final String baslik;
  final int sure;

  Medya(this.baslik, this.sure);

  String etiket() => baslik;
}

class Sarki extends Medya {
  final String sanatci;

  Sarki(super.baslik, super.sure, this.sanatci);

  @override
  String etiket() => '[Şarkı] $sanatci - $baslik';
}

class Podcast extends Medya {
  final int bolum;

  Podcast(super.baslik, super.sure, this.bolum);

  @override
  String etiket() => '[Podcast] $baslik #$bolum';
}

class Video extends Medya {
  final bool hd;

  Video(super.baslik, super.sure, {this.hd = false});

  @override
  String etiket() => hd ? '[Video] $baslik (HD)' : '[Video] $baslik';
}

String sureMetni(int saniye) => '${saniye ~/ 60}:${(saniye % 60).toString().padLeft(2, '0')}';

int toplamSure(List<Medya> liste) {
  int toplam = 0;
  for (Medya m in liste) {
    toplam += m.sure;
  }
  return toplam;
}

Map<String, int> turSayilari(List<Medya> liste) {
  Map<String, int> sayac = {};
  for (Medya m in liste) {
    String tur;
    if (m is Sarki) {
      tur = 'Şarkı';
    } else if (m is Podcast) {
      tur = 'Podcast';
    } else if (m is Video) {
      tur = 'Video';
    } else {
      tur = 'Diğer';
    }
    sayac[tur] = (sayac[tur] ?? 0) + 1;
  }
  return sayac;
}

List<String> hdVideolar(List<Medya> liste) {
  List<String> sonuc = [];
  for (Medya m in liste) {
    if (m is Video && m.hd) {
      sonuc.add(m.baslik);
    }
  }
  return sonuc;
}

void main() {
  List<Medya> kitaplik = [
    Sarki('Mavi Gökyüzü', 252, 'Deniz Ekin'),
    Podcast('Kod Sohbetleri', 2285, 42),
    Video("Flutter'a Giriş", 750, hd: true),
    Sarki('Yağmur Sonrası', 347, 'Ege Tuna'),
    Video('Dart İpuçları', 428),
  ];

  for (int i = 0; i < kitaplik.length; i++) {
    print('${i + 1}. ${kitaplik[i].etiket()} (${sureMetni(kitaplik[i].sure)})');
  }
  print('Tür sayıları : ${turSayilari(kitaplik)}');
  print('Toplam süre  : ${sureMetni(toplamSure(kitaplik))}');
  print('HD videolar  : ${hdVideolar(kitaplik)}');
}
```

**Çıktı:**

```text
1. [Şarkı] Deniz Ekin - Mavi Gökyüzü (4:12)
2. [Podcast] Kod Sohbetleri #42 (38:05)
3. [Video] Flutter'a Giriş (HD) (12:30)
4. [Şarkı] Ege Tuna - Yağmur Sonrası (5:47)
5. [Video] Dart İpuçları (7:08)
Tür sayıları : {Şarkı: 2, Podcast: 1, Video: 2}
Toplam süre  : 67:42
HD videolar  : [Flutter'a Giriş]
```

**Açıklama:**
- `m is Video && m.hd`: `&&`'nin sağ tarafı yalnızca sol taraf doğruysa çalıştığı için (kısa devre), orada `m` zaten `Video` olarak yükseltilmiştir; `m.hd` yazılabilir.
- `toplamSure`, `turSayilari` ve `hdVideolar` fonksiyonlarının her biri 6–15 satır sürdü. Bu haftanın Bölüm 9'unu bitirdiğinizde bu üç fonksiyonun **her birini tek satırda** yazabileceksiniz. Bölüm 9.8'de bunu birlikte yapacağız.

## Soru 5 — Spor Salonu Üyelikleri

```dart
// Dosya: 01_s5_spor_salonu.dart
class Uyelik {
  final String adSoyad;
  int _kalanGun;

  Uyelik(this.adSoyad, this._kalanGun);

  factory Uyelik.fromMap(Map<String, dynamic> veri) {
    String adSoyad = veri['adSoyad'] as String;
    int kalanGun = veri['kalanGun'] as int;
    return switch (veri['tur']) {
      'aylik' => Aylik(adSoyad, kalanGun),
      'yillik' => Yillik(adSoyad, kalanGun),
      'ogrenci' => OgrenciUyelik(adSoyad, kalanGun),
      _ => Uyelik(adSoyad, kalanGun),
    };
  }

  int get kalanGun => _kalanGun;
  String get tur => 'Üyelik';
  double aylikUcret() => 0;
  bool get bitiyorMu => _kalanGun <= 7;

  void gunGecir(int gun) {
    _kalanGun -= gun;
    if (_kalanGun < 0) {
      _kalanGun = 0;
    }
  }

  @override
  String toString() => '${tur.padRight(8)} $adSoyad (kalan $kalanGun gün)';
}

class Aylik extends Uyelik {
  Aylik(super.adSoyad, super.kalanGun);

  @override
  String get tur => 'Aylık';

  @override
  double aylikUcret() => 900;
}

class Yillik extends Uyelik {
  Yillik(super.adSoyad, super.kalanGun);

  @override
  String get tur => 'Yıllık';

  @override
  double aylikUcret() => 8400 / 12;
}

class OgrenciUyelik extends Aylik {
  OgrenciUyelik(super.adSoyad, super.kalanGun);

  @override
  String get tur => 'Öğrenci';

  @override
  double aylikUcret() => super.aylikUcret() * 0.6;
}

double aylikGelir(List<Uyelik> liste) {
  double toplam = 0;
  for (Uyelik u in liste) {
    toplam += u.aylikUcret();
  }
  return toplam;
}

List<String> bitenler(List<Uyelik> liste) {
  List<String> sonuc = [];
  for (Uyelik u in liste) {
    if (u.bitiyorMu) {
      sonuc.add(u.adSoyad);
    }
  }
  return sonuc;
}

void main() {
  List<Map<String, dynamic>> veriler = [
    {'tur': 'aylik', 'adSoyad': 'Ayşe Yılmaz', 'kalanGun': 12},
    {'tur': 'yillik', 'adSoyad': 'Mert Kaya', 'kalanGun': 200},
    {'tur': 'ogrenci', 'adSoyad': 'Zeynep Ak', 'kalanGun': 5},
    {'tur': 'aylik', 'adSoyad': 'Can Demir', 'kalanGun': 3},
  ];

  List<Uyelik> uyeler = [for (var v in veriler) Uyelik.fromMap(v)];

  for (Uyelik u in uyeler) {
    print(u);
  }
  print('Aylık gelir: ${aylikGelir(uyeler).toStringAsFixed(2)} TL');

  for (Uyelik u in uyeler) {
    u.gunGecir(5);
  }
  print('5 gün sonra süresi bitmek üzere olanlar: ${bitenler(uyeler)}');
}
```

**Çıktı:**

```text
Aylık    Ayşe Yılmaz (kalan 12 gün)
Yıllık   Mert Kaya (kalan 200 gün)
Öğrenci  Zeynep Ak (kalan 5 gün)
Aylık    Can Demir (kalan 3 gün)
Aylık gelir: 3040.00 TL
5 gün sonra süresi bitmek üzere olanlar: [Ayşe Yılmaz, Zeynep Ak, Can Demir]
```

**Açıklama:**
- `OgrenciUyelik` içindeki `super.aylikUcret()`, bir üstteki `Aylik` sınıfının sürümünü (900) çağırır. Aylık üyelik ücreti değişirse öğrenci ücreti de kendiliğinden değişir.
- `Uyelik` sınıfından doğrudan bir nesne oluşturmanın (`_ => Uyelik(...)` kolu) bir anlamı var mı? "Türü belirsiz bir üyelik" gerçek hayatta yoktur. Bu, bu haftanın ilk konusuna, **soyut sınıflara** güzel bir giriş.

---

# 2. Soyut Sınıflar

## 2.1 Sorun: Kendi başına anlamı olmayan sınıflar

Geçen hafta ödeme yöntemlerini kalıtımla modellemiştik. Kodu biraz değiştirip iki sorunu görelim:

```dart
// Dosya: 02_01_soyut_sorun.dart
// ❌ TASARIM SORUNU: Odeme hem kalıp hem de gerçek bir ödeme gibi kullanılabiliyor.
class Odeme {
  final double tutar;

  Odeme(this.tutar);

  String get ad => 'Ödeme';
  double ucret() => 0;
}

class Havale extends Odeme {
  Havale(super.tutar);

  @override
  String get ad => 'Havale/EFT';

  @override
  double ucret() => 5;
}

class KapidaOdeme extends Odeme {
  KapidaOdeme(super.tutar);

  @override
  String get ad => 'Kapıda Ödeme';

  // ucret() metodunu override etmek UNUTULDU! (25 TL olmalıydı)
}

void main() {
  List<Odeme> odemeler = [Havale(800), KapidaOdeme(320), Odeme(150)];
  for (Odeme o in odemeler) {
    print('${o.ad}: ${o.ucret()} TL ücret');
  }
}
```

**Çıktı:**

```text
Havale/EFT: 5.0 TL ücret
Kapıda Ödeme: 0.0 TL ücret
Ödeme: 0.0 TL ücret
```

**Açıklama:** Program hatasız çalıştı ama iki ciddi sorun var:

1. **Anlamsız nesne:** `Odeme(150)` diye bir nesne oluşturabildik. Ama "türü belirsiz bir ödeme" gerçek hayatta yoktur; her ödeme ya havaledir, ya kapıda ödemedir, ya da başka bir şeydir. `Odeme` sınıfı yalnızca bir **kalıp** olmalıydı.
2. **Sessiz hata:** `KapidaOdeme` sınıfında `ucret()` override edilmeyi unutuldu. Üst sınıftaki `0` döndüren sürüm devreye girdi ve kapıda ödemeler **ücretsiz** görünmeye başladı. Derleyici hiçbir uyarı vermedi.

İkisinin de çözümü **soyut sınıftır**.

## 2.2 abstract ile soyut sınıf

**Soyut sınıf** (abstract class), nesnesi **oluşturulamayan**, yalnızca alt sınıflara kalıp olan bir sınıftır. Gövdesi olmayan **soyut metotlar** içerebilir. Soyut metot şunu söyler: "Her alt sınıf bu metodu **kendisi yazmak zorundadır**."

> **Benzetme:** Bir mobil uygulamanın tasarım dokümanında "Her ekranın bir başlığı ve bir içeriği olmalıdır" yazdığını düşünün. Bu kural tek başına bir ekran değildir; ama yazılacak her ekran bu kurala uymak zorundadır. Soyut sınıf işte bu kuraldır.

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
abstract class SinifAdi {
  DonusTipi metotAdi();       // soyut metot: gövdesi yok, sonunda ; var
  Tip get getterAdi;          // soyut getter

  DonusTipi somutMetot() {    // normal (somut) metot: gövdesi var
    // soyut üyeleri kullanabilir
  }
}
```

```dart
// Dosya: 02_02_abstract.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

abstract class Odeme {
  final double tutar;

  Odeme(this.tutar);

  String get ad;      // soyut getter: her alt sınıf kendi adını vermek ZORUNDA
  double ucret();     // soyut metot: her alt sınıf kendi ücretini hesaplamak ZORUNDA

  // Somut metot: Soyut üyeleri kullanabilir; çalıştığında alt sınıfın sürümleri devreye girer
  String ozet() => '${ad.padRight(13)}: ${tl(tutar)} + ${tl(ucret())} = ${tl(tutar + ucret())}';
}

class Havale extends Odeme {
  Havale(super.tutar);

  @override
  String get ad => 'Havale/EFT';

  @override
  double ucret() => 5;
}

class KapidaOdeme extends Odeme {
  KapidaOdeme(super.tutar);

  @override
  String get ad => 'Kapıda Ödeme';

  @override
  double ucret() => 25;
}

class CepCuzdan extends Odeme {
  CepCuzdan(super.tutar);

  @override
  String get ad => 'Cep Cüzdan';

  @override
  double ucret() => 0;
}

void main() {
  List<Odeme> odemeler = [Havale(800), KapidaOdeme(320), CepCuzdan(150)];
  for (Odeme o in odemeler) {
    print(o.ozet());
  }
}
```

**Çıktı:**

```text
Havale/EFT   : 800.00 TL + 5.00 TL = 805.00 TL
Kapıda Ödeme : 320.00 TL + 25.00 TL = 345.00 TL
Cep Cüzdan   : 150.00 TL + 0.00 TL = 150.00 TL
```

**Açıklama:**
- `abstract class Odeme` → Bu sınıftan doğrudan nesne oluşturulamaz.
- `double ucret();` → Gövdesi olmayan, sonunda noktalı virgül bulunan bir **soyut metot**. "Ücret hesaplanacak ama nasıl hesaplanacağını her alt sınıf kendisi bilir" demektir.
- `ozet()` ise **somut** (gövdesi olan) bir metot. İçinde soyut `ad` ve `ucret()` kullanılıyor. `ozet()` çalıştığında hangi alt sınıfın nesnesiyse onun `ad` ve `ucret()` sürümleri devreye girer. Ortak kural (çıktının biçimi) bir yerde, değişen ayrıntılar (ad, ücret) alt sınıflarda durur. Bu yapıya **şablon metot** (template method) denir.
- Cep Cüzdan için artık ayrı bir alt sınıf var; `Odeme` sınıfı yalnızca bir kalıp.

### ❌ Soyut sınıftan nesne oluşturmak

```dart
// Dosya: 02_03_tuzak_soyut_nesne.dart
// ❌ DERLEME HATASI
abstract class Odeme {
  final double tutar;

  Odeme(this.tutar);

  double ucret();
}

void main() {
  Odeme o = Odeme(150);
  print(o.ucret());
}
```

**Hata mesajı:**

```text
Abstract classes can't be instantiated.
```

*Türkçesi: "Soyut sınıflardan nesne oluşturulamaz."* Bu, geçen haftaki 1. sorunun çözümüdür: Anlamsız bir `Odeme` nesnesi artık oluşturulamaz.

> **Dikkat:** Soyut sınıfın bir **kurucusu** olabilir (`Odeme(this.tutar)`). Bu kurucu doğrudan çağrılamaz ama alt sınıfların `super.tutar` ile ortak alanları kurması için gereklidir.

### ❌ Soyut metodu yazmayı unutmak

```dart
// Dosya: 02_04_tuzak_eksik_uygulama.dart
// ❌ DERLEME HATASI
abstract class Odeme {
  final double tutar;

  Odeme(this.tutar);

  String get ad;
  double ucret();
}

class KapidaOdeme extends Odeme {
  KapidaOdeme(super.tutar);

  @override
  String get ad => 'Kapıda Ödeme';
}

void main() {
  print(KapidaOdeme(320).ad);
}
```

**Hata mesajı:**

```text
Missing concrete implementation of 'Odeme.ucret'.
```

*Türkçesi: "'Odeme.ucret' metodunun somut (gövdeli) bir uygulaması eksik."* Bu da geçen haftaki 2. sorunun çözümüdür: `ucret()` yazılmayı unutulursa program **derlenmez**. Hata artık müşteriye değil, size ulaşıyor.

## 2.3 Soyut sınıf ile ekran kalıbı

Soyut sınıfların Flutter'daki karşılığını küçük bir benzetmeyle görelim. Her "ekran" bir başlık çizer ve **kendi içeriğini** üretir; çizme işini ortak bir metot yapar:

```dart
// Dosya: 02_05_soyut_ekran.dart
abstract class Ekran {
  final String baslik;

  Ekran(this.baslik);

  List<String> icerik(); // Her ekran kendi içeriğini üretmek ZORUNDA

  void ciz() {
    print('==== $baslik ====');
    for (String satir in icerik()) {
      print('  $satir');
    }
  }
}

class GirisEkrani extends Ekran {
  GirisEkrani() : super('Giriş');

  @override
  List<String> icerik() => ['[ E-posta      ]', '[ Şifre        ]', '( Giriş yap )'];
}

class ProfilEkrani extends Ekran {
  final String ad;
  final int siparisSayisi;

  ProfilEkrani(this.ad, this.siparisSayisi) : super('Profil');

  @override
  List<String> icerik() => ['Merhaba, $ad!', 'Siparişlerim ($siparisSayisi)', 'Ayarlar', 'Çıkış yap'];
}

void main() {
  List<Ekran> ekranlar = [GirisEkrani(), ProfilEkrani('Ayşe', 3)];
  for (Ekran e in ekranlar) {
    e.ciz();
  }
}
```

**Çıktı:**

```text
==== Giriş ====
  [ E-posta      ]
  [ Şifre        ]
  ( Giriş yap )
==== Profil ====
  Merhaba, Ayşe!
  Siparişlerim (3)
  Ayarlar
  Çıkış yap
```

**Açıklama:** `GirisEkrani() : super('Giriş')` kurucusu hiç parametre almaz; başlığı sabit olarak üst sınıfa iletir. `ciz()` metodunu hiçbir alt sınıf yazmadı; ama her ekran, kendi `icerik()` sürümüyle farklı çizildi.

> 🔗 **Flutter'da:** `StatelessWidget` tam olarak böyle **soyut** bir sınıftır ve `build` adında soyut bir metodu vardır. Siz `build`'i yazarsınız (bu örnekteki `icerik()` gibi); ekranı ne zaman ve nasıl çizeceğine ise Flutter karar verir (bu örnekteki `ciz()` gibi). `build`'i yazmayı unutursanız, Bölüm 2.2'deki "Missing concrete implementation" hata mesajının aynısını alırsınız.

---

# 3. Arayüzler: implements

## 3.1 "Bir ...'dur" değil, "... yapabilir"

Kalıtım (`extends`) bir **"... bir ...'dur"** ilişkisi kurar: "Havale bir ödemedir." Ama bazen birbiriyle hiç ilgisi olmayan sınıfların **aynı yeteneğe** sahip olmasını isteriz.

Örneğin bir mobil uygulamada "Paylaş" düğmesi olsun. Bir ürün paylaşılabilir, bir konum paylaşılabilir, bir spor başarısı paylaşılabilir. Ama ürün bir konum değildir, konum da bir başarı değildir. Bunların ortak bir **atası** yok; yalnızca ortak bir **yeteneği** var. Bu yetenek bir **sözleşme** ile tanımlanır: "Paylaşılabilir olan her şey bir paylaşım metni üretebilmelidir."

Dart'ta bu sözleşmeye **arayüz** (interface) denir ve sınıfa `implements` ile uygulatılır.

> **Benzetme:** Telefonunuzu şarj ederken kablonun hangi markadan olduğu önemli değildir; USB-C standardına uyması yeter. USB-C bir **arayüzdür**: "Şu şekilde bağlanır, şu kadar akım verir." Her üretici bu sözleşmeyi kendi yöntemiyle uygular.

```dart
// Dosya: 03_01_implements.dart
abstract class Paylasilabilir {
  String paylasimMetni();
}

class Urun implements Paylasilabilir {
  final String ad;
  final double fiyat;

  Urun(this.ad, this.fiyat);

  @override
  String paylasimMetni() => '$ad sadece ${fiyat.toStringAsFixed(2)} TL! Cep Market\'te.';
}

class Konum implements Paylasilabilir {
  final String ad;
  final double enlem;
  final double boylam;

  Konum(this.ad, this.enlem, this.boylam);

  @override
  String paylasimMetni() => 'Buradayım: $ad ($enlem, $boylam)';
}

class Basari implements Paylasilabilir {
  final int adim;

  Basari(this.adim);

  @override
  String paylasimMetni() => 'Bugün $adim adım attım!';
}

void paylas(Paylasilabilir icerik) {
  print('[Paylaş] ${icerik.paylasimMetni()}');
}

void main() {
  paylas(Urun('Kulaklık', 749.9));
  paylas(Konum('Siirt Merkez', 37.93, 41.94));
  paylas(Basari(12100));
}
```

**Çıktı:**

```text
[Paylaş] Kulaklık sadece 749.90 TL! Cep Market'te.
[Paylaş] Buradayım: Siirt Merkez (37.93, 41.94)
[Paylaş] Bugün 12100 adım attım!
```

**Açıklama:**
- `abstract class Paylasilabilir` yalnızca bir soyut metot içeriyor; yani saf bir **sözleşme**.
- `class Urun implements Paylasilabilir` → "Urun, Paylasilabilir sözleşmesine uyar." Sözleşmedeki her üyeyi (burada `paylasimMetni`) `Urun` kendisi yazmak **zorundadır**.
- `paylas` fonksiyonu parametre olarak `Paylasilabilir` alıyor. Gönderilen nesnenin ürün mü, konum mu olduğunu bilmiyor ve bilmesine gerek yok. Tek bildiği, nesnenin bir paylaşım metni üretebileceğidir. Bu da Hafta 4'te gördüğümüz **polimorfizmdir**; bu sefer kalıtım olmadan.

## 3.2 Birden fazla arayüz

Bir sınıf yalnızca **bir** sınıfı `extends` edebilir; ama **istediği kadar** arayüzü `implements` edebilir.

```dart
// Dosya: 03_02_coklu_arayuz.dart
abstract class Paylasilabilir {
  String paylasimMetni();
}

abstract class Kaydedilebilir {
  Map<String, dynamic> toMap();
}

class Gorev implements Paylasilabilir, Kaydedilebilir {
  final String baslik;
  bool tamamlandi;

  Gorev(this.baslik, {this.tamamlandi = false});

  @override
  String paylasimMetni() => tamamlandi ? 'Tamamlandı: $baslik' : 'Yapılacak: $baslik';

  @override
  Map<String, dynamic> toMap() => {'baslik': baslik, 'tamamlandi': tamamlandi};
}

void main() {
  Gorev g = Gorev('Flutter ödevini bitir');
  print(g.paylasimMetni());
  g.tamamlandi = true;
  print(g.paylasimMetni());
  print(g.toMap());

  Paylasilabilir p = g;
  print(p is Kaydedilebilir);
}
```

**Çıktı:**

```text
Yapılacak: Flutter ödevini bitir
Tamamlandı: Flutter ödevini bitir
{baslik: Flutter ödevini bitir, tamamlandi: true}
true
```

**Açıklama:** Bir yapılacaklar uygulamasındaki görev hem paylaşılabilir hem de telefona kaydedilebilir. `Gorev` iki sözleşmeye de uyuyor. `p` değişkeninin tipi `Paylasilabilir` olsa da gösterdiği nesne aynı zamanda `Kaydedilebilir`'dir; `is` bunu doğruluyor.

### ❌ Sözleşmeyi eksik uygulamak

```dart
// Dosya: 03_03_tuzak_implements.dart
// ❌ DERLEME HATASI
abstract class Paylasilabilir {
  String paylasimMetni();
}

class Fotograf implements Paylasilabilir {
  final String dosya;

  Fotograf(this.dosya);
}

void main() {
  print(Fotograf('tatil.jpg').dosya);
}
```

**Hata mesajı:**

```text
Missing concrete implementation of 'Paylasilabilir.paylasimMetni'.
```

**Açıklama:** `implements` bir sözdür; söz verilen metot yazılmazsa program derlenmez.

## 3.3 Hazır bir arayüz: Comparable

Dart'ın kendi içinde de arayüzler vardır. `Comparable` arayüzü "bu nesneler birbiriyle karşılaştırılabilir" der ve tek bir metot ister: `compareTo`. Bir sınıf `Comparable`'ı uygularsa, o sınıfın nesnelerinden oluşan listeler `sort()` ile doğrudan sıralanabilir.

```dart
// Dosya: 03_04_comparable.dart
class Urun implements Comparable<Urun> {
  final String ad;
  final double fiyat;

  Urun(this.ad, this.fiyat);

  @override
  int compareTo(Urun diger) => fiyat.compareTo(diger.fiyat);

  @override
  String toString() => '$ad (${fiyat.toStringAsFixed(2)})';
}

void main() {
  List<Urun> urunler = [
    Urun('Kulaklık', 749.9),
    Urun('Kablo', 129.9),
    Urun('Saat', 2400),
    Urun('Kılıf', 199),
  ];
  urunler.sort();
  print(urunler);
}
```

**Çıktı:**

```text
[Kablo (129.90), Kılıf (199.00), Kulaklık (749.90), Saat (2400.00)]
```

**Açıklama:** `compareTo` metodu şu kurala uyar: Bu nesne diğerinden **önce** gelmeliyse negatif, **sonra** gelmeliyse pozitif, **eşitse** 0 döndürür. `fiyat.compareTo(diger.fiyat)` bu kuralı sayılar için zaten uygular. `Comparable<Urun>` yazımındaki `<Urun>`, `List<Urun>`'daki gibi bir **tip parametresidir**: "Urun'larla karşılaştırılabilir". Tip parametrelerini (generic) gelecek hafta ayrıntılı göreceğiz.

## 3.4 extends mi, implements mi?

| | `extends` (kalıtım) | `implements` (arayüz) |
|---|---|---|
| İlişki | "... **bir** ...'dur" (Havale bir ödemedir) | "... **yapabilir**" (Ürün paylaşılabilir) |
| Kod miras alınır mı? | Evet: alanlar ve gövdeli metotlar gelir | **Hayır:** Her üye yeniden yazılır |
| Kaç tane? | Yalnızca **bir** | **İstediğiniz kadar** |
| `super` kullanılabilir mi? | Evet | Hayır |

> 🔗 **Flutter'da:** Büyük uygulamalarda veriye erişen kod bir arayüzün arkasına saklanır: `abstract class UrunDeposu { List<Urun> tumUrunler(); }`. Uygulama gerçek veriyi internetten çeken bir `FirebaseUrunDeposu` kullanırken, testler sahte veri döndüren bir `SahteUrunDeposu` kullanır. Ekranlar yalnızca `UrunDeposu` arayüzünü tanıdığı için hangisinin kullanıldığını bilmez. Bu yaklaşımı dönemin ilerleyen haftalarında **repository deseni** adıyla göreceğiz.

---

# 4. Mixin: Ortak Davranışları Paylaşmak

## 4.1 Sorun: Kod tekrarı, ama ortak ata yok

Bir sosyal medya uygulamasında gönderiler, ürünler ve yorumlar **beğenilebilir** olsun. Beğeni sayısını tutan, artıran ve geri alan kod üçünde de aynıdır. Kalıtım kullanamayız: Bir ürün bir gönderi değildir. Arayüz de işe yaramaz: `implements` kodu taşımaz, her sınıf beğeni kodunu yeniden yazmak zorunda kalır.

İhtiyacımız olan şey, **gövdeli kodu** (alanları ve metotları) birbiriyle ilgisiz sınıflara "takabilmek"tir. Bunun adı **mixin**'dir.

> **Benzetme:** Telefon kılıfına takılan bir kart cüzdanı düşünün. Kart cüzdanı tek başına bir telefon değildir; ama hangi telefona takarsanız o telefona "kart taşıma" yeteneği kazandırır. Aynı cüzdanı farklı telefonlara takabilirsiniz. Mixin de sınıflara takılan böyle bir yetenek paketidir.

```dart
// Dosya: 04_01_mixin.dart
mixin Begenilebilir {
  int _begeniSayisi = 0;

  int get begeniSayisi => _begeniSayisi;

  void begen() {
    _begeniSayisi++;
  }

  void begeniyiGeriAl() {
    if (_begeniSayisi > 0) {
      _begeniSayisi--;
    }
  }
}

mixin Yorumlanabilir {
  final List<String> _yorumlar = [];

  List<String> get yorumlar => List.of(_yorumlar);

  void yorumYap(String kullanici, String metin) {
    _yorumlar.add('$kullanici: $metin');
  }
}

class Gonderi with Begenilebilir, Yorumlanabilir {
  final String yazar;
  final String metin;

  Gonderi(this.yazar, this.metin);
}

class Urun with Begenilebilir {
  final String ad;

  Urun(this.ad);
}

void main() {
  Gonderi g = Gonderi('ayse', 'Yeni projem yayında!');
  g.begen();
  g.begen();
  g.yorumYap('mert', 'Tebrikler!');
  g.yorumYap('zeynep', 'Harika görünüyor.');

  print('${g.yazar}: ${g.metin}');
  print('Beğeni: ${g.begeniSayisi}, yorum: ${g.yorumlar.length}');
  for (String y in g.yorumlar) {
    print('  - $y');
  }

  Urun u = Urun('Kulaklık');
  u.begen();
  u.begen();
  u.begen();
  u.begeniyiGeriAl();
  print('${u.ad} beğeni: ${u.begeniSayisi}');
}
```

**Çıktı:**

```text
ayse: Yeni projem yayında!
Beğeni: 2, yorum: 2
  - mert: Tebrikler!
  - zeynep: Harika görünüyor.
Kulaklık beğeni: 2
```

**Açıklama:**
- `mixin Begenilebilir { ... }` bir yetenek paketi tanımlar: bir alan (`_begeniSayisi`), bir getter ve iki metot.
- `class Gonderi with Begenilebilir, Yorumlanabilir` → "Gönderi sınıfına beğenilme ve yorumlanma yeteneklerini **ekle**." Mixin'in tüm kodu sınıfa kopyalanmış gibi davranır; `g.begen()` doğrudan çağrılabilir.
- `Urun` yalnızca `Begenilebilir`'i aldı; yorum yapılamıyor.
- `yorumlar` getter'ı private listenin **kopyasını** döndürüyor (`List.of`); dışarıdaki kod listeyi değiştiremez (Hafta 3'teki referans tuzağına karşı önlem).

## 4.2 extends, with ve implements birlikte

Bir sınıf aynı anda bir sınıfı genişletip, mixin'ler alıp, arayüzler uygulayabilir. Yazım sırası her zaman şöyledir: **`extends` → `with` → `implements`**.

```dart
// Dosya: 04_02_extends_with.dart
mixin Loglayici {
  final List<String> _kayitlar = [];

  void log(String mesaj) {
    _kayitlar.add(mesaj);
  }

  void kayitlariYazdir() {
    for (int i = 0; i < _kayitlar.length; i++) {
      print('${i + 1}) ${_kayitlar[i]}');
    }
  }
}

abstract class Medya {
  final String baslik;

  Medya(this.baslik);

  void oynat();
}

class Video extends Medya with Loglayici {
  Video(super.baslik);

  @override
  void oynat() {
    log('$baslik oynatıldı');
  }

  void durdur() {
    log('$baslik durduruldu');
  }
}

void main() {
  Video v = Video("Flutter'a Giriş");
  v.oynat();
  v.durdur();
  v.oynat();
  v.kayitlariYazdir();
}
```

**Çıktı:**

```text
1) Flutter'a Giriş oynatıldı
2) Flutter'a Giriş durduruldu
3) Flutter'a Giriş oynatıldı
```

**Açıklama:** `Video` bir `Medya`'dır (`extends`) ve kayıt tutma yeteneğine sahiptir (`with Loglayici`). Uygulamanın başka yerlerindeki sınıflar da (ör. bir `Sepet`) aynı `Loglayici` mixin'ini alabilir.

### ❌ Mixin'in kurucusu olamaz

```dart
// Dosya: 04_03_tuzak_mixin_kurucu.dart
// ❌ DERLEME HATASI
mixin Begenilebilir {
  int begeniSayisi = 0;

  Begenilebilir(this.begeniSayisi);
}

class Urun with Begenilebilir {}

void main() {
  print(Urun().begeniSayisi);
}
```

**Hata mesajı:**

```text
Mixins can't declare constructors.
```

**Açıklama:** Mixin bir sınıf değil, bir **eklentidir**; tek başına nesnesi oluşturulamaz. Bu yüzden kurucusu da olamaz. Mixin'deki alanlara başlangıç değeri doğrudan verilir (`int _begeniSayisi = 0;`).

## 4.3 extends, implements, with: Hangisi ne zaman?

| | `extends` | `implements` | `with` |
|---|---|---|---|
| Anlamı | "... bir ...'dur" | "... yapabilir" (sözleşme) | "... yeteneğine sahiptir" (hazır kod) |
| Kod gelir mi? | Evet | **Hayır** | **Evet** |
| Kaç tane? | 1 | Sınırsız | Sınırsız |
| Örnek | `Havale extends Odeme` | `Urun implements Paylasilabilir` | `Gonderi with Begenilebilir` |

> **Kısa kural:** Ortak **ata** varsa `extends`. Ortak **söz** (ama her sınıf kendi yöntemiyle yerine getirecek) varsa `implements`. Ortak **kod** (birebir aynı davranış) varsa `with`.

> 🔗 **Flutter'da:** Mixin'leri ilk olarak animasyonlarda göreceksiniz: `class _YuklemeState extends State<Yukleme> with SingleTickerProviderStateMixin`. Bu satır, "bu ekran durumu, animasyonlara zaman sinyali verebilme yeteneğine sahip" demektir. Durum yönetiminde de `class SepetModeli with ChangeNotifier` sık kullanılır: "Sepet değişince ekranları haberdar edebilme" yeteneği.

---

# 5. Extension: Hazır Tiplere Yeni Yetenekler

## 5.1 Sorun: Kodunu değiştiremediğimiz sınıflar

Fiyatları her yerde `'${fiyat.toStringAsFixed(2)} TL'` diye biçimlendiriyoruz. Bunun için Hafta 3'te bir `tl(fiyat)` fonksiyonu yazmıştık. Ama `fiyat.tl` diye yazabilmek, yani `double` tipinin kendisine bir `tl` yeteneği eklemek daha okunur olmaz mıydı? `double` sınıfı Dart'ın içinde; onun kodunu değiştiremeyiz.

**Extension** (uzantı), var olan bir tipe, o tipin koduna dokunmadan yeni metotlar ve getter'lar eklemenin yoludur.

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
extension UzantiAdi on HedefTip {
  // HedefTip'teki her değer bu üyeleri kullanabilir.
  // İçeride "this", üzerinde çalışılan değerdir.
}
```

```dart
// Dosya: 05_01_extension.dart
extension ParaBicimi on double {
  String get tl => '${toStringAsFixed(2)} TL';

  double kdvEkle([double oran = 0.20]) => this * (1 + oran);
}

extension SureBicimi on int {
  String get dakikaSaniye => '${this ~/ 60}:${(this % 60).toString().padLeft(2, '0')}';
}

extension MetinKontrol on String {
  bool get gecerliEpostaMi => contains('@') && contains('.') && !contains(' ');

  String get kisalt => length <= 12 ? this : '${substring(0, 12)}...';
}

void main() {
  double fiyat = 749.9;
  print(fiyat.tl);
  print(fiyat.kdvEkle().tl);
  print(fiyat.kdvEkle(0.01).tl);

  print(252.dakikaSaniye);

  print('ayse@ornek.com'.gecerliEpostaMi);
  print('ayse ornek.com'.gecerliEpostaMi);
  print('Kablosuz Kulaklık Pro Max'.kisalt);
}
```

**Çıktı:**

```text
749.90 TL
899.88 TL
757.40 TL
4:12
true
false
Kablosuz Kul...
```

**Açıklama:**
- `extension ParaBicimi on double` → "double tipine şu yetenekleri ekle." Artık her `double` değerin bir `tl` getter'ı var.
- Extension'ın içinde `this`, üzerinde çalışılan değerdir: `fiyat.kdvEkle()` çağrısında `this` = 749.9. `toStringAsFixed(2)` yazarken başına `this.` koymaya gerek yok.
- `252.dakikaSaniye`: Bir sayı **değerinin** üzerinde bile extension getter'ı çağrılabilir.
- `fiyat.kdvEkle().tl`: Önce KDV eklendi (yeni bir `double`), sonra o değerin `tl` getter'ı çalıştı. Okunuşu: "fiyata KDV ekle, TL olarak göster."
- `'Kablosuz Kulaklık Pro Max'.kisalt`: Uzun ürün adlarının mobil ekranda tek satıra sığması için kısaltılması çok yaygın bir ihtiyaçtır.

## 5.2 Uygulama: Türkçe büyük-küçük harf sorunu

Hafta 1'den beri bir sorunu not ediyoruz: Dart'ın `toUpperCase()` ve `toLowerCase()` metotları Türkçedeki **i/İ** ve **ı/I** harflerini doğru dönüştürmez. Bir extension ile bu sorunu bir kez çözüp her yerde kullanabiliriz:

```dart
// Dosya: 05_02_turkce_harfler.dart
extension TurkceMetin on String {
  String get trBuyuk => replaceAll('i', 'İ').replaceAll('ı', 'I').toUpperCase();

  String get trKucuk => replaceAll('I', 'ı').replaceAll('İ', 'i').toLowerCase();
}

void main() {
  String sehir = 'istanbul';
  print(sehir.toUpperCase());
  print(sehir.trBuyuk);

  print('IĞDIR'.toLowerCase());
  print('IĞDIR'.trKucuk);
  print('Işık İzmir'.trKucuk);
}
```

**Çıktı:**

```text
ISTANBUL
İSTANBUL
iğdir
ığdır
ışık izmir
```

**Açıklama:**
- `toUpperCase()`, `i` harfini İngilizcedeki gibi `I` yapar; Türkçede doğrusu `İ`'dir. `trBuyuk` önce Türkçeye özgü iki harfi kendisi dönüştürür, geri kalanını `toUpperCase()`'e bırakır.
- `trKucuk` aynı mantığı ters yönde uygular.
- Bir mobil uygulamada arama kutusuna "IĞDIR" yazan kullanıcının "Iğdır" sonucunu bulabilmesi için arama yapılan metin ve aranan kelime **aynı** dönüşümden geçirilmelidir. Bölüm 9'da bu extension'ı aramada kullanacağız.

### ❌ Extension'a alan eklenemez

```dart
// Dosya: 05_03_tuzak_extension_alan.dart
// ❌ DERLEME HATASI
extension Sayac on String {
  int okunmaSayisi = 0;
}

void main() {
  print('merhaba'.length);
}
```

**Hata mesajı:**

```text
Extensions can't declare instance fields.
```

**Açıklama:** Extension yeni **davranış** (metot, getter) ekler; yeni **veri** (alan) ekleyemez. Bir `String`'in içine yeni bir sayaç saklanamaz. Veri eklemek gerekiyorsa sınıf veya mixin kullanılır.

> 🔗 **Flutter'da:** Ekranlarda sık sık `Theme.of(context).colorScheme.primary` gibi uzun ifadeler yazılır. Birçok proje `BuildContext` tipine bir extension ekleyip bunu `context.renkler.primary` gibi kısaltır. Fiyat biçimlendirme (`fiyat.tl`), tarih biçimlendirme (`tarih.gunAy`) ve doğrulama (`eposta.gecerliEpostaMi`) da en yaygın extension kullanımlarıdır.

---

# 6. Enum: Sabit Seçenekler

## 6.1 Sorun: Durumları metinle tutmak

Bir siparişin durumu yalnızca birkaç değerden biri olabilir: hazırlanıyor, kargoda, teslim edildi, iptal. Şimdiye kadar bu tür değerleri metin olarak tuttuk:

```dart
// Dosya: 06_01_metin_durum_sorunu.dart
// ❌ MANTIK HATASI: Durumlar metin olarak tutulunca yazım hatası yakalanmaz.
String durumMesaji(String durum) => switch (durum) {
      'hazirlaniyor' => 'Siparişiniz hazırlanıyor.',
      'kargoda' => 'Siparişiniz yolda!',
      'teslimEdildi' => 'Siparişiniz teslim edildi.',
      _ => 'Bilinmeyen durum',
    };

void main() {
  print(durumMesaji('kargoda'));
  print(durumMesaji('Kargoda'));
  print(durumMesaji('teslim_edildi'));
}
```

**Çıktı:**

```text
Siparişiniz yolda!
Bilinmeyen durum
Bilinmeyen durum
```

**Açıklama:** `'Kargoda'` (büyük K) ve `'teslim_edildi'` (alt çizgili) yazım hataları derleyici tarafından yakalanmadı; kullanıcı "Bilinmeyen durum" mesajı gördü. Ayrıca "iptal" durumu `switch`'e hiç eklenmemiş ama bunu da kimse fark etmedi. Bir metin değişkeni **herhangi bir** metni alabilir; oysa sipariş durumu yalnızca **dört** değerden biri olabilir.

## 6.2 enum ile sabit seçenekler

**Enum** (enumeration, sayım), alabileceği değerler önceden belli olan bir tiptir. Değerleri tek tek **sayarak** tanımlarız.

```dart
// Dosya: 06_02_enum_temel.dart
enum SiparisDurumu { hazirlaniyor, kargoda, teslimEdildi, iptal }

String durumMesaji(SiparisDurumu durum) => switch (durum) {
      SiparisDurumu.hazirlaniyor => 'Siparişiniz hazırlanıyor.',
      SiparisDurumu.kargoda => 'Siparişiniz yolda!',
      SiparisDurumu.teslimEdildi => 'Siparişiniz teslim edildi.',
      SiparisDurumu.iptal => 'Siparişiniz iptal edildi.',
    };

void main() {
  SiparisDurumu durum = SiparisDurumu.kargoda;
  print(durum);
  print(durum.name);
  print(durum.index);
  print(durumMesaji(durum));
  print(SiparisDurumu.values);

  for (SiparisDurumu d in SiparisDurumu.values) {
    print('${d.index}: ${durumMesaji(d)}');
  }
}
```

**Çıktı:**

```text
SiparisDurumu.kargoda
kargoda
1
Siparişiniz yolda!
[SiparisDurumu.hazirlaniyor, SiparisDurumu.kargoda, SiparisDurumu.teslimEdildi, SiparisDurumu.iptal]
0: Siparişiniz hazırlanıyor.
1: Siparişiniz yolda!
2: Siparişiniz teslim edildi.
3: Siparişiniz iptal edildi.
```

**Açıklama:**
- `enum SiparisDurumu { ... }` yeni bir **tip** tanımlar. Bu tipte bir değişken yalnızca bu dört değerden birini alabilir.
- Değerlere `SiparisDurumu.kargoda` biçiminde erişilir. `SiparisDurumu.Kargoda` yazarsanız program **derlenmez**: 6.1'deki yazım hatası sorunu tamamen ortadan kalktı.
- Her enum değerinin hazır özellikleri vardır: `name` (değerin adı, metin olarak), `index` (0'dan başlayan sıra numarası). `SiparisDurumu.values` tüm değerlerin listesidir.
- `switch` ifadesinde `_` kolu **yok**. Dart, enum'un dört değerinin de ele alındığını bildiği için `_` gerekmez.
- Enum değerlerinin adlarında da Türkçe karakter kullanılmaz (`teslimEdildi`); kullanıcıya gösterilecek Türkçe metinler ayrıca yazılır.

### ❌ Bir değeri unutmak artık derleme hatası

```dart
// Dosya: 06_03_tuzak_eksik_durum.dart
// ❌ DERLEME HATASI
enum SiparisDurumu { hazirlaniyor, kargoda, teslimEdildi, iptal }

String durumMesaji(SiparisDurumu durum) => switch (durum) {
      SiparisDurumu.hazirlaniyor => 'Hazırlanıyor',
      SiparisDurumu.kargoda => 'Yolda',
      SiparisDurumu.teslimEdildi => 'Teslim edildi',
    };

void main() {
  print(durumMesaji(SiparisDurumu.iptal));
}
```

**Hata mesajı:**

```text
The type 'SiparisDurumu' isn't exhaustively matched by the switch cases since it doesn't match 'SiparisDurumu.iptal'.
```

*Türkçesi: "SiparisDurumu tipinin tüm değerleri ele alınmadı: 'SiparisDurumu.iptal' eksik."* Uygulamaya yarın yeni bir durum (ör. `iadeEdildi`) eklendiğinde, o durumu ele almayan **her** `switch` derleme hatası verir. Hiçbir ekran unutulmaz.

> **İpucu:** Enum üzerindeki `switch` ifadelerinde `_` kolu kullanmayın. `_` kullanırsanız Dart yeni eklenen değerlerin de `_`'ye düştüğünü varsayar ve sizi uyarmaz.

## 6.3 Gelişmiş enum: Alanlar ve metotlar

Enum değerleri kendi **verilerini** ve **davranışlarını** taşıyabilir. Geçen haftaki ödeme yöntemlerini bir enum ile yazalım:

```dart
// Dosya: 06_04_gelismis_enum.dart
enum OdemeYontemi {
  krediKarti('Kredi Kartı', 0.02, 0),
  havale('Havale/EFT', 0, 5),
  kapidaOdeme('Kapıda Ödeme', 0, 25),
  cepCuzdan('Cep Cüzdan', 0, 0);

  const OdemeYontemi(this.ad, this.oran, this.sabitUcret);

  final String ad;
  final double oran;
  final double sabitUcret;

  double ucret(double tutar) => tutar * oran + sabitUcret;

  bool get ucretsizMi => oran == 0 && sabitUcret == 0;
}

void main() {
  double tutar = 450;
  for (OdemeYontemi y in OdemeYontemi.values) {
    String not = y.ucretsizMi ? ' (ücretsiz)' : '';
    print('${y.ad.padRight(13)}: ${y.ucret(tutar).toStringAsFixed(2)} TL$not');
  }
}
```

**Çıktı:**

```text
Kredi Kartı  : 9.00 TL
Havale/EFT   : 5.00 TL
Kapıda Ödeme : 25.00 TL
Cep Cüzdan   : 0.00 TL (ücretsiz)
```

**Açıklama:**
- Her değerin yanındaki parantez, o değer için kurucuya gönderilen **argümanlardır**: `havale('Havale/EFT', 0, 5)` → ad = 'Havale/EFT', oran = 0, sabit ücret = 5.
- Değer listesi **noktalı virgülle** (`;`) biter; ardından kurucu, alanlar ve metotlar yazılır.
- Enum'un kurucusu `const` olmalı, alanları `final` olmalıdır: Enum değerleri program boyunca hiç değişmez.
- Ekranda gösterilecek Türkçe ad (`'Kredi Kartı'`) artık değerin kendisinde. `switch` yazmadan `y.ad` ile alınabiliyor.

### Ne zaman enum, ne zaman sınıf?

| Enum | Sınıf hiyerarşisi |
|---|---|
| Seçenekler **sabit** ve **az sayıda** (durumlar, kategoriler, ödeme yöntemleri) | Her nesnenin **kendine özgü verisi** var (her kredi kartı ödemesinin farklı taksit sayısı) |
| Her seçenekten **tek bir tane** var | Her türden **istediğiniz kadar** nesne oluşturulur |
| `SiparisDurumu.kargoda` | `KrediKarti(1200, taksit: 3)` |

## 6.4 Map'ten enum'a: byName

Sunucudan veya telefonun hafızasından gelen veriler metin olarak gelir. Bir metni enum değerine çevirmek için `values.byName` kullanılır; ters yönde ise `name`:

```dart
// Dosya: 06_05_enum_byname.dart
enum SiparisDurumu { hazirlaniyor, kargoda, teslimEdildi, iptal }

class Siparis {
  final String no;
  final SiparisDurumu durum;

  Siparis(this.no, this.durum);

  Siparis.fromMap(Map<String, dynamic> veri)
      : no = veri['no'] as String,
        durum = SiparisDurumu.values.byName(veri['durum'] as String);

  Map<String, dynamic> toMap() => {'no': no, 'durum': durum.name};
}

void main() {
  Siparis s = Siparis.fromMap({'no': 'SP-1024', 'durum': 'kargoda'});
  print('${s.no}: ${s.durum}');
  print(s.durum == SiparisDurumu.kargoda);
  print(s.toMap());
}
```

**Çıktı:**

```text
SP-1024: SiparisDurumu.kargoda
true
{no: SP-1024, durum: kargoda}
```

**Açıklama:** `byName('kargoda')` metni enum değerine çevirir; `durum.name` ise enum değerini tekrar metne çevirir. Gelen metin hiçbir değerle eşleşmezse (ör. `'kargo'`) program çalışırken hata verir. Bu tür hataları yakalamayı gelecek hafta **istisnalar** konusunda göreceğiz.

> 🔗 **Flutter'da:** Flutter'ın kendisi enum'larla doludur: `MainAxisAlignment.center` (elemanları ortala), `TextAlign.right` (metni sağa yasla), `ThemeMode.dark` (karanlık tema), `Brightness.light`. Bunların her biri sınırlı sayıda seçeneği olan bir ayardır; enum sayesinde yanlış bir değer yazmanız imkânsızdır.

---

# 7. Sealed Sınıflar: Eksiksiz Durumlar

## 7.1 Bir ekranın durumları

Bir mobil uygulamada ürün listesi ekranı açıldığında ekran şu durumlardan **birinde** olur:

- **Yükleniyor:** Veriler henüz gelmedi; bir dönen çember gösterilir.
- **Başarılı:** Veriler geldi; ürünler listelenir. (Liste boş da olabilir.)
- **Hata:** İnternet yok veya sunucu cevap vermedi; bir hata mesajı ve "Tekrar dene" düğmesi gösterilir.

Bu durumları bir enum ile tutamayız: "Başarılı" durumu bir **ürün listesi**, "Hata" durumu bir **hata mesajı** taşımalıdır; her durumun kendine özgü verisi var. Sınıf hiyerarşisi gerekiyor. Ama aynı zamanda enum'daki gibi "durumların hepsi ele alındı mı?" kontrolünü de istiyoruz. Bu iki ihtiyacı birlikte karşılayan yapı **sealed** (mühürlü) sınıftır.

```dart
// Dosya: 07_01_sealed.dart
sealed class EkranDurumu {}

class Yukleniyor extends EkranDurumu {}

class Basarili extends EkranDurumu {
  final List<String> urunler;

  Basarili(this.urunler);
}

class Hata extends EkranDurumu {
  final String mesaj;

  Hata(this.mesaj);
}

String ekraniCiz(EkranDurumu durum) => switch (durum) {
      Yukleniyor _ => 'Yükleniyor...',
      Basarili b when b.urunler.isEmpty => 'Henüz ürün yok.',
      Basarili b => 'Ürünler: ${b.urunler.join(', ')}',
      Hata h => 'Hata: ${h.mesaj} (Tekrar dene)',
    };

void main() {
  List<EkranDurumu> durumlar = [
    Yukleniyor(),
    Basarili([]),
    Basarili(['Süt', 'Ekmek', 'Peynir']),
    Hata('İnternet bağlantısı yok'),
  ];

  for (EkranDurumu d in durumlar) {
    print(ekraniCiz(d));
  }
}
```

**Çıktı:**

```text
Yükleniyor...
Henüz ürün yok.
Ürünler: Süt, Ekmek, Peynir
Hata: İnternet bağlantısı yok (Tekrar dene)
```

**Açıklama:**
- `sealed class EkranDurumu {}` → "Bu sınıfın alt sınıfları **yalnızca bu dosyada** tanımlanabilir ve listesi kapalıdır." Dart, `EkranDurumu`'nun tam olarak üç alt sınıfı olduğunu bilir.
- Sealed sınıf otomatik olarak **soyuttur**; `EkranDurumu()` diye nesne oluşturulamaz.
- `switch` ifadesinde `_` kolu yok; üç alt sınıf da ele alındığı için Dart bunun eksiksiz olduğunu kendisi doğrular.
- `Yukleniyor _`: "Yükleniyor türündeyse eşleştir, ama değeri bir isimle almaya gerek yok."
- `Basarili b when b.urunler.isEmpty`: Hafta 2'de gördüğümüz `when` koruması. Başarılı ama listesi boşsa bu kol, doluysa bir sonraki kol çalışır.

### ❌ Bir durumu unutmak

```dart
// Dosya: 07_02_tuzak_sealed_eksik.dart
// ❌ DERLEME HATASI
sealed class EkranDurumu {}

class Yukleniyor extends EkranDurumu {}

class Basarili extends EkranDurumu {
  final List<String> urunler;

  Basarili(this.urunler);
}

class Hata extends EkranDurumu {
  final String mesaj;

  Hata(this.mesaj);
}

String ekraniCiz(EkranDurumu durum) => switch (durum) {
      Yukleniyor _ => 'Yükleniyor...',
      Basarili b => 'Ürünler: ${b.urunler.join(', ')}',
    };

void main() {
  print(ekraniCiz(Hata('Sunucu yanıt vermedi')));
}
```

**Hata mesajı:**

```text
The type 'EkranDurumu' isn't exhaustively matched by the switch cases since it doesn't match 'Hata()'.
```

**Açıklama:** Hata durumu ekranda ele alınmamış; kullanıcı internetsiz kaldığında ekran ne gösterecekti? Dart bu soruyu **program çalışmadan önce** soruyor. Mobil uygulamalarda en sık yaşanan hatalardan biri "hata durumunun unutulmasıdır"; sealed sınıflar bunu imkânsız hale getirir.

## 7.2 Geçen haftanın sorusunun cevabı

Hafta 4, Bölüm 10'daki 3. çözümün zayıf noktası şuydu: Yeni bir ödeme türü eklenip `switch` güncellenmezse, tür sessizce `_` koluna düşüyor ve ücretsiz geçiyordu. `Odeme` sınıfını `sealed` yapıp `_` kolunu kaldırınca:

```dart
// Dosya: 07_03_sealed_odeme.dart
sealed class Odeme {
  final double tutar;

  Odeme(this.tutar);
}

class KrediKarti extends Odeme {
  final int taksit;

  KrediKarti(super.tutar, {this.taksit = 1});
}

class Havale extends Odeme {
  Havale(super.tutar);
}

class CepCuzdan extends Odeme {
  CepCuzdan(super.tutar);
}

double ucret(Odeme o) => switch (o) {
      KrediKarti k => k.tutar * 0.02 + (k.taksit > 1 ? k.tutar * 0.03 : 0.0),
      Havale _ => 5.0,
      CepCuzdan _ => 0.0,
    };

void main() {
  List<Odeme> odemeler = [KrediKarti(1200, taksit: 3), Havale(800), CepCuzdan(150)];
  for (Odeme o in odemeler) {
    print('${o.runtimeType}: ${ucret(o).toStringAsFixed(2)} TL');
  }
}
```

**Çıktı:**

```text
KrediKarti: 60.00 TL
Havale: 5.00 TL
CepCuzdan: 0.00 TL
```

**Açıklama:** Şimdi dosyaya `class Kripto extends Odeme { Kripto(super.tutar); }` ekleyin. `ucret` fonksiyonu anında derleme hatası verir: "Kripto ele alınmadı." Geçen haftaki karşılaştırma tablosunda 3. çözümün tek zayıf noktası buydu; `sealed` ile o da kapandı.

## 7.3 abstract, sealed ve enum karşılaştırması

| | `abstract class` | `sealed class` | `enum` |
|---|---|---|---|
| Nesnesi oluşturulur mu? | Hayır | Hayır | Değerler sabit, yenisi oluşturulmaz |
| Alt sınıflar nerede olabilir? | **Her yerde** (başka dosyalarda, başka paketlerde) | **Yalnızca aynı dosyada** | (Alt sınıf yok) |
| Her alt tür kendi verisini taşır mı? | Evet | Evet | Hayır; tüm değerler aynı alanlara sahip |
| `switch` eksiksizlik kontrolü | Yok, `_` gerekir | **Var** | **Var** |
| Tipik kullanım | Genişletilmeye açık kalıplar (`StatelessWidget`) | Kapalı durum kümeleri (Yükleniyor / Veri / Hata) | Sabit seçenekler (sipariş durumu, tema) |

> 🔗 **Flutter'da:** "Yükleniyor / veri geldi / hata" üçlüsü mobil uygulama geliştirmenin en temel kalıbıdır. Dönemin ilerleyen haftalarında göreceğimiz durum yönetimi kütüphanelerinde (Riverpod) bu üçlü `AsyncValue` adıyla hazır gelir ve aynı mantıkla kullanılır: Ekran, durumun her hâli için ne göstereceğini **eksiksiz** söylemek zorundadır.

---

# 8. Fonksiyonlar Birer Değerdir

Bu bölümle birlikte haftanın ikinci yarısına, **fonksiyonel programlamaya** geçiyoruz. Bütün konunun dayandığı fikir şudur: Dart'ta fonksiyonlar da `int`, `String` veya bir liste gibi **birer değerdir**. Bir değişkene atanabilir, bir listeye konabilir, başka bir fonksiyona parametre olarak gönderilebilir ve bir fonksiyondan döndürülebilir.

## 8.1 Fonksiyonu değişkene atamak

```dart
// Dosya: 08_01_fonksiyon_deger.dart
double kdvEkle(double fiyat) => fiyat * 1.20;
double indirimUygula(double fiyat) => fiyat * 0.90;

void main() {
  double Function(double) islem = kdvEkle;
  print(islem(100).toStringAsFixed(2));

  islem = indirimUygula;
  print(islem(100).toStringAsFixed(2));

  List<double Function(double)> adimlar = [indirimUygula, kdvEkle];
  double fiyat = 250;
  for (var adim in adimlar) {
    fiyat = adim(fiyat);
  }
  print('Önce %10 indirim, sonra KDV: ${fiyat.toStringAsFixed(2)} TL');
}
```

**Çıktı:**

```text
120.00
90.00
Önce %10 indirim, sonra KDV: 270.00 TL
```

**Açıklama:**
- **En önemli ayrım:** `kdvEkle` (parantezsiz) **fonksiyonun kendisidir**; `kdvEkle(100)` (parantezli) ise fonksiyonun **çalıştırılmasıyla elde edilen sonuçtur** (120.0).
- `double Function(double) islem` → "`double` alıp `double` döndüren bir fonksiyon tutan değişken." Bu, bir **fonksiyon tipidir**.
- `islem` değişkenine önce `kdvEkle`, sonra `indirimUygula` atandı. Aynı `islem(100)` çağrısı farklı sonuçlar verdi.
- `adimlar` listesi iki fonksiyon tutuyor; döngü bunları sırayla uyguluyor: 250 → 225 (indirim) → 270 (KDV). Bir kampanya ekranında "hangi kurallar hangi sırayla uygulanacak" bilgisi böyle bir listeyle tutulabilir.

## 8.2 İsimsiz fonksiyonlar (lambda)

Bir fonksiyonu yalnızca bir kez, bir yere vermek için kullanacaksak ona **isim vermemize gerek yoktur**. İsimsiz fonksiyona **anonim fonksiyon** veya **lambda** da denir.

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
(parametreler) { gövde }       // uzun yazım
(parametreler) => ifade        // kısa yazım (tek ifade)
```

```dart
// Dosya: 08_02_isimsiz_fonksiyon.dart
void main() {
  // Uzun yazım
  var karesi = (int x) {
    return x * x;
  };

  // Kısa yazım
  var kupu = (int x) => x * x * x;

  print(karesi(4));
  print(kupu(3));

  var selamla = (String ad, {String selam = 'Merhaba'}) => '$selam $ad!';
  print(selamla('Ayşe'));
  print(selamla('Mert', selam: 'Günaydın'));
}
```

**Çıktı:**

```text
16
27
Merhaba Ayşe!
Günaydın Mert!
```

**Açıklama:** Normal bir fonksiyon tanımından tek farkı, **dönüş tipinin ve adın yazılmamasıdır**. `(int x) => x * x * x` → "int bir x al, x'in küpünü döndür." Parametre listesi, isimlendirilmiş parametreler ve `=>` kısa gösterimi Hafta 3'te öğrendiğimiz gibidir. İsimsiz fonksiyonlar asıl gücünü bir sonraki bölümde, **başka bir fonksiyona gönderildiklerinde** gösterir.

## 8.3 Fonksiyonu parametre olarak göndermek (geri çağırma)

Parametre olarak fonksiyon alan fonksiyonlara **yüksek dereceli fonksiyon** (higher-order function) denir. Parametre olarak gönderilen fonksiyona ise **geri çağırma fonksiyonu** (callback) denir: "Şu olay olduğunda **beni geri çağır** ve bu kodu çalıştır."

```dart
// Dosya: 08_03_fonksiyon_parametre.dart
void dugmeOlustur(String etiket, void Function() tiklaninca) {
  print('[ $etiket ] düğmesi çizildi.');
  print('Kullanıcı "$etiket" düğmesine dokundu...');
  tiklaninca();
}

double fiyatHesapla(double fiyat, double Function(double) kampanya) {
  return kampanya(fiyat);
}

void main() {
  int sepetAdedi = 0;

  dugmeOlustur('Sepete ekle', () {
    sepetAdedi++;
    print('Sepette $sepetAdedi ürün var.');
  });

  dugmeOlustur('Favorilere ekle', () => print('Favorilere eklendi.'));

  print(fiyatHesapla(200, (f) => f * 0.8).toStringAsFixed(2));
  print(fiyatHesapla(200, (f) => f > 150 ? f - 50 : f).toStringAsFixed(2));
}
```

**Çıktı:**

```text
[ Sepete ekle ] düğmesi çizildi.
Kullanıcı "Sepete ekle" düğmesine dokundu...
Sepette 1 ürün var.
[ Favorilere ekle ] düğmesi çizildi.
Kullanıcı "Favorilere ekle" düğmesine dokundu...
Favorilere eklendi.
160.00
150.00
```

**Açıklama:**
- `dugmeOlustur` fonksiyonu düğmeyi "çiziyor" ama düğmeye dokunulunca **ne olacağını bilmiyor**; bunu, çağıran kod bir fonksiyon göndererek söylüyor. Aynı `dugmeOlustur` fonksiyonu, farklı fonksiyonlarla farklı düğmeler oluşturdu.
- `void Function() tiklaninca` → "parametre almayan ve değer döndürmeyen bir fonksiyon."
- İlk çağrıdaki isimsiz fonksiyon, dışarıdaki `sepetAdedi` değişkenini **görebiliyor ve değiştirebiliyor**. Bu özelliğin adı bir sonraki bölümde.
- `fiyatHesapla(200, (f) => f * 0.8)` çağrısında `f`'nin tipini yazmadık. Dart, `fiyatHesapla`'nın bir `double Function(double)` beklediğini bildiği için `f`'nin `double` olduğunu kendisi çıkardı.

> 🔗 **Flutter'da:** Bu örnek, Flutter'daki düğmelerin **birebir** çalışma şeklidir:
> ```dart
> ElevatedButton(
>   onPressed: () {
>     sepeteEkle(urun);
>   },
>   child: const Text('Sepete ekle'),
> )
> ```
> `onPressed` bir geri çağırma fonksiyonudur. Flutter düğmeyi çizer; kullanıcı dokunduğunda sizin gönderdiğiniz fonksiyonu çağırır. Metin kutusundaki `onChanged: (metin) { ... }` de aynı mantıkla, kullanıcı her harf yazdığında çağrılır.

## 8.4 Fonksiyondan fonksiyon döndürmek ve kapanışlar (closure)

```dart
// Dosya: 08_04_kapanis.dart
double Function(double) indirimOlustur(int yuzde) {
  return (double fiyat) => fiyat * (100 - yuzde) / 100;
}

int Function() sayacOlustur() {
  int sayi = 0;
  return () {
    sayi++;
    return sayi;
  };
}

void main() {
  var yuzde10 = indirimOlustur(10);
  var yuzde25 = indirimOlustur(25);
  print(yuzde10(400).toStringAsFixed(2));
  print(yuzde25(400).toStringAsFixed(2));

  var bildirimSayaci = sayacOlustur();
  var mesajSayaci = sayacOlustur();
  bildirimSayaci();
  bildirimSayaci();
  print('Bildirim: ${bildirimSayaci()}');
  print('Mesaj: ${mesajSayaci()}');
}
```

**Çıktı:**

```text
360.00
300.00
Bildirim: 3
Mesaj: 1
```

**Açıklama:**
- `indirimOlustur(10)` bir **sayı** değil, bir **fonksiyon** döndürür: "fiyatın %10 indirimli halini hesaplayan fonksiyon". Bu fonksiyon `yuzde` değişkeninin değerini (10) **hatırlar**; `indirimOlustur` çoktan bitmiş olsa bile.
- Bir fonksiyonun, tanımlandığı yerdeki değişkenleri hatırlayıp kullanmaya devam etmesine **kapanış** (closure) denir.
- `sayacOlustur` her çağrıldığında **kendi** `sayi` değişkenine sahip yeni bir sayaç fonksiyonu üretir. `bildirimSayaci` ile `mesajSayaci` birbirinden bağımsızdır: Biri 3'e çıkarken diğeri 1'de.

## 8.5 typedef: Fonksiyon tiplerine isim vermek

`double Function(double)` gibi fonksiyon tipleri uzun ve okunması zordur. `typedef` ile onlara anlamlı bir isim verilir:

```dart
// Dosya: 08_05_typedef.dart
typedef FiyatKurali = double Function(double fiyat);

class Kampanya {
  final String ad;
  final FiyatKurali kural;

  Kampanya(this.ad, this.kural);
}

void main() {
  List<Kampanya> kampanyalar = [
    Kampanya('%20 indirim', (f) => f * 0.80),
    Kampanya('100 TL üzeri 30 TL indirim', (f) => f >= 100 ? f - 30 : f),
    Kampanya('Kampanya yok', (f) => f),
  ];

  double sepet = 180;
  for (Kampanya k in kampanyalar) {
    print('${k.ad.padRight(27)}: ${k.kural(sepet).toStringAsFixed(2)} TL');
  }
}
```

**Çıktı:**

```text
%20 indirim                : 144.00 TL
100 TL üzeri 30 TL indirim : 150.00 TL
Kampanya yok               : 180.00 TL
```

**Açıklama:** `typedef FiyatKurali = double Function(double fiyat);` satırından sonra `FiyatKurali` yazmak, `double Function(double)` yazmakla aynıdır. Sınıfın bir **alanı** bile fonksiyon olabilir: Her kampanya nesnesi kendi hesaplama kuralını taşıyor ve `k.kural(sepet)` ile çağrılıyor.

> 🔗 **Flutter'da:** Flutter'ın kendi kodunda da `typedef` çok kullanılır. Örneğin `onPressed` parametresinin tipi `VoidCallback`'tir ve Flutter'da şöyle tanımlanmıştır: `typedef VoidCallback = void Function();`

---

# 9. Listeler İçin Fonksiyonel Metotlar

Hafta 3'te listelerle yapılan en yaygın işleri (filtreleme, dönüştürme, sayma, toplama) döngülerle yazmıştık. Bu bölümde aynı işleri, bir önceki bölümde öğrendiğimiz **isimsiz fonksiyonları** liste metotlarına göndererek tek satırda yapacağız.

Bölüm boyunca bir alışveriş uygulamasının ürün kataloğunu kullanacağız. Her örnek dosyası bu kataloğu kendi içinde tanımlar:

| Ürün | Kategori | Fiyat (TL) | Stok | Puan |
|---|---|---|---|---|
| Kulaklık | Elektronik | 749.90 | 5 | 4.6 |
| Şarj Kablosu | Elektronik | 129.90 | 0 | 4.1 |
| Akıllı Saat | Elektronik | 2400.00 | 2 | 4.8 |
| Süt | Gıda | 32.50 | 20 | 4.3 |
| Peynir | Gıda | 145.00 | 0 | 4.7 |
| Defter | Kırtasiye | 45.00 | 30 | 3.9 |
| Kalem | Kırtasiye | 12.00 | 100 | 4.0 |

## 9.1 forEach ve where: Her biri için, seçilenler

```dart
// Dosya: 09_01_foreach_where.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  bool get stoktaVar => stok > 0;

  @override
  String toString() => ad;
}

final List<Urun> katalog = [
  Urun('Kulaklık', 'Elektronik', 749.90, 5, 4.6),
  Urun('Şarj Kablosu', 'Elektronik', 129.90, 0, 4.1),
  Urun('Akıllı Saat', 'Elektronik', 2400.00, 2, 4.8),
  Urun('Süt', 'Gıda', 32.50, 20, 4.3),
  Urun('Peynir', 'Gıda', 145.00, 0, 4.7),
  Urun('Defter', 'Kırtasiye', 45.00, 30, 3.9),
  Urun('Kalem', 'Kırtasiye', 12.00, 100, 4.0),
];

void main() {
  print('--- forEach: tüm ürünler ---');
  katalog.forEach(print);

  print('--- where: stokta olanlar ---');
  List<Urun> stokta = katalog.where((u) => u.stoktaVar).toList();
  print(stokta);

  print('--- where: 1000 TL altı elektronik ---');
  var uygun = katalog.where((u) => u.kategori == 'Elektronik' && u.fiyat < 1000);
  print(uygun);
  print('${uygun.length} ürün');
}
```

**Çıktı:**

```text
--- forEach: tüm ürünler ---
Kulaklık
Şarj Kablosu
Akıllı Saat
Süt
Peynir
Defter
Kalem
--- where: stokta olanlar ---
[Kulaklık, Akıllı Saat, Süt, Defter, Kalem]
--- where: 1000 TL altı elektronik ---
(Kulaklık, Şarj Kablosu)
2 ürün
```

**Açıklama:**
- **`forEach(fonksiyon)`**: Listedeki her eleman için verilen fonksiyonu çağırır. `katalog.forEach(print)` yazarken `print`'i **parantezsiz** gönderdik: Bölüm 8.1'deki gibi fonksiyonun kendisini veriyoruz; `forEach` onu her ürün için çağırıyor.
- **`where(koşul)`**: Koşulu sağlayan elemanları **seçer**. `(u) => u.stoktaVar` şöyle okunur: "Her ürün `u` için: stokta mı?" `true` dönenler seçilir. Koşul döndüren bu tür fonksiyonlara **yüklem** (predicate) denir.
- `where` bir `List` değil, bir **`Iterable`** döndürür. Yazdırıldığında köşeli yerine normal parantez görünmesinin nedeni budur. Sonucu liste olarak saklamak için sonuna `.toList()` eklenir. `length` ise Iterable'da da çalışır.
- Hafta 3'te aynı filtrelemeyi boş bir liste oluşturup `for` ve `if` ile doldurarak yapmıştık. Şimdi tek satır.

> ⚠️ **forEach mi, for-in mi?** İçinde birden fazla iş yapan uzun bir isimsiz fonksiyon yazacaksanız `for-in` döngüsü daha okunurdur. Flutter projelerinde VS Code, `forEach`'e uzun isimsiz fonksiyon verildiğinde `for-in` kullanmayı önerebilir. `forEach`, `katalog.forEach(print)` gibi hazır bir fonksiyonu göndereceğiniz durumlarda en temiz sonucu verir.

## 9.2 map: Her elemanı dönüştürmek

```dart
// Dosya: 09_02_map.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  bool get stoktaVar => stok > 0;

  @override
  String toString() => ad;
}

final List<Urun> katalog = [
  Urun('Kulaklık', 'Elektronik', 749.90, 5, 4.6),
  Urun('Şarj Kablosu', 'Elektronik', 129.90, 0, 4.1),
  Urun('Akıllı Saat', 'Elektronik', 2400.00, 2, 4.8),
  Urun('Süt', 'Gıda', 32.50, 20, 4.3),
  Urun('Peynir', 'Gıda', 145.00, 0, 4.7),
  Urun('Defter', 'Kırtasiye', 45.00, 30, 3.9),
  Urun('Kalem', 'Kırtasiye', 12.00, 100, 4.0),
];

void main() {
  List<String> adlar = katalog.map((u) => u.ad).toList();
  print(adlar);

  List<String> etiketler = katalog
      .where((u) => u.kategori == 'Elektronik')
      .map((u) => '${u.ad}: ${(u.fiyat * 1.20).toStringAsFixed(2)} TL')
      .toList();
  print(etiketler);

  List<String> kartlar = katalog.map((u) => u.stoktaVar ? '[ ${u.ad} ]' : '[ ${u.ad} - TÜKENDİ ]').toList();
  kartlar.forEach(print);
}
```

**Çıktı:**

```text
[Kulaklık, Şarj Kablosu, Akıllı Saat, Süt, Peynir, Defter, Kalem]
[Kulaklık: 899.88 TL, Şarj Kablosu: 155.88 TL, Akıllı Saat: 2880.00 TL]
[ Kulaklık ]
[ Şarj Kablosu - TÜKENDİ ]
[ Akıllı Saat ]
[ Süt ]
[ Peynir - TÜKENDİ ]
[ Defter ]
[ Kalem ]
```

**Açıklama:**
- **`map(fonksiyon)`**: Her elemanı verilen fonksiyondan geçirip **yeni bir değer** üretir. Eleman sayısı değişmez; elemanların kendisi değişir: 7 ürün → 7 metin.
- `(u) => u.ad` → "Her ürün `u` için: adını ver."
- İkinci örnekte iki metot **zincirlendi**: Önce `where` ile elektronikler seçildi, sonra `map` ile her birinden bir etiket üretildi, en sonda `toList()` ile listeye çevrildi. Uzun zincirleri yukarıdaki gibi her metodu ayrı satıra yazarak okunur kılın.
- ⚠️ Bu `map` metodu, Hafta 3'te gördüğümüz **`Map` veri yapısıyla aynı şey değildir**. Buradaki `map`, "eşlemek, dönüştürmek" anlamında bir metottur.

> 🔗 **Flutter'da:** Bu bölümün Flutter'daki en önemli karşılığı budur. Bir ürün listesini ekranda kartlar halinde göstermek için:
> ```dart
> Column(
>   children: urunler.map((u) => UrunKarti(urun: u)).toList(),
> )
> ```
> Her ürün nesnesi `map` ile bir ekran parçasına (widget) dönüştürülür. Bu örnekteki `kartlar` listesi, bu kodun konsoldaki karşılığıdır.

## 9.3 any, every ve firstWhere: Sorular sormak

```dart
// Dosya: 09_03_any_every_firstwhere.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  bool get stoktaVar => stok > 0;

  @override
  String toString() => ad;
}

final List<Urun> katalog = [
  Urun('Kulaklık', 'Elektronik', 749.90, 5, 4.6),
  Urun('Şarj Kablosu', 'Elektronik', 129.90, 0, 4.1),
  Urun('Akıllı Saat', 'Elektronik', 2400.00, 2, 4.8),
  Urun('Süt', 'Gıda', 32.50, 20, 4.3),
  Urun('Peynir', 'Gıda', 145.00, 0, 4.7),
  Urun('Defter', 'Kırtasiye', 45.00, 30, 3.9),
  Urun('Kalem', 'Kırtasiye', 12.00, 100, 4.0),
];

void main() {
  print('Tükenen ürün var mı?        : ${katalog.any((u) => !u.stoktaVar)}');
  print('Hepsinin puanı 4+ mı?       : ${katalog.every((u) => u.puan >= 4.0)}');
  print('Hepsinin fiyatı pozitif mi? : ${katalog.every((u) => u.fiyat > 0)}');

  Urun ilkGida = katalog.firstWhere((u) => u.kategori == 'Gıda');
  print('İlk gıda ürünü: $ilkGida');

  Urun? oyuncak = katalog.where((u) => u.kategori == 'Oyuncak').firstOrNull;
  print(oyuncak?.ad ?? 'Oyuncak kategorisinde ürün yok.');

  int sira = katalog.indexWhere((u) => u.ad == 'Peynir');
  print('Peynir listede $sira. indekste.');
}
```

**Çıktı:**

```text
Tükenen ürün var mı?        : true
Hepsinin puanı 4+ mı?       : false
Hepsinin fiyatı pozitif mi? : true
İlk gıda ürünü: Süt
Oyuncak kategorisinde ürün yok.
Peynir listede 4. indekste.
```

**Açıklama:**

| Metot | Sorduğu soru | Döndürdüğü |
|---|---|---|
| `any(koşul)` | **En az biri** koşulu sağlıyor mu? | `bool` |
| `every(koşul)` | **Hepsi** koşulu sağlıyor mu? | `bool` |
| `firstWhere(koşul)` | Koşulu sağlayan **ilk** eleman hangisi? | Eleman (bulamazsa hata) |
| `where(koşul).firstOrNull` | Koşulu sağlayan ilk eleman, yoksa `null` | Eleman veya `null` |
| `indexWhere(koşul)` | Koşulu sağlayan ilk elemanın indeksi | `int` (bulamazsa `-1`) |

- Defter'in puanı 3.9 olduğu için `every((u) => u.puan >= 4.0)` sonucu `false`.
- `any` ilk `true` bulduğunda, `every` ilk `false` bulduğunda durur; listenin geri kalanına bakmaz. Hafta 2'deki kısa devre mantığının aynısı.

### ❌ firstWhere bir şey bulamazsa

```dart
// Dosya: 09_04_tuzak_firstwhere.dart
// ❌ ÇALIŞMA ZAMANI HATASI
void main() {
  List<String> kategoriler = ['Elektronik', 'Gıda', 'Kırtasiye'];
  String k = kategoriler.firstWhere((x) => x == 'Oyuncak');
  print(k);
}
```

**Çıktı (bir bölümü):**

```text
Unhandled exception:
Bad state: No element
```

**Açıklama:** `firstWhere` koşulu sağlayan bir eleman bulamazsa program çöker. Bulunamama ihtimali varsa iki güvenli yol var:
- `kategoriler.where((x) => x == 'Oyuncak').firstOrNull` → bulamazsa `null`.
- `kategoriler.firstWhere((x) => x == 'Oyuncak', orElse: () => 'Diğer')` → bulamazsa `orElse` fonksiyonunun döndürdüğü değer.

## 9.4 fold ve reduce: Hepsini tek bir değerde toplamak

```dart
// Dosya: 09_05_fold_reduce.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  bool get stoktaVar => stok > 0;

  @override
  String toString() => ad;
}

final List<Urun> katalog = [
  Urun('Kulaklık', 'Elektronik', 749.90, 5, 4.6),
  Urun('Şarj Kablosu', 'Elektronik', 129.90, 0, 4.1),
  Urun('Akıllı Saat', 'Elektronik', 2400.00, 2, 4.8),
  Urun('Süt', 'Gıda', 32.50, 20, 4.3),
  Urun('Peynir', 'Gıda', 145.00, 0, 4.7),
  Urun('Defter', 'Kırtasiye', 45.00, 30, 3.9),
  Urun('Kalem', 'Kırtasiye', 12.00, 100, 4.0),
];

void main() {
  double stokDegeri = katalog.fold(0.0, (toplam, u) => toplam + u.fiyat * u.stok);
  print('Toplam stok değeri: ${stokDegeri.toStringAsFixed(2)} TL');

  int toplamAdet = katalog.fold(0, (toplam, u) => toplam + u.stok);
  print('Toplam stok: $toplamAdet adet');

  double ortalamaPuan = katalog.map((u) => u.puan).reduce((a, b) => a + b) / katalog.length;
  print('Ortalama puan: ${ortalamaPuan.toStringAsFixed(2)}');

  Urun enPahali = katalog.reduce((a, b) => a.fiyat >= b.fiyat ? a : b);
  print('En pahalı ürün: $enPahali');

  Urun enUcuzStokta = katalog.where((u) => u.stoktaVar).reduce((a, b) => a.fiyat <= b.fiyat ? a : b);
  print('Stoktaki en ucuz ürün: $enUcuzStokta');
}
```

**Çıktı:**

```text
Toplam stok değeri: 11749.50 TL
Toplam stok: 157 adet
Ortalama puan: 4.34
En pahalı ürün: Akıllı Saat
Stoktaki en ucuz ürün: Kalem
```

**Açıklama:** Bu iki metot ilk bakışta en zor olanlardır; adım adım inceleyelim.

**`fold(başlangıç, birleştir)`** bir "toplayıcı" (biriktirici) ile çalışır. Başlangıç değeriyle başlar; her elemanda, toplayıcının o anki değeri ve eleman `birleştir` fonksiyonuna verilir, dönen değer yeni toplayıcı olur. `katalog.fold(0, (toplam, u) => toplam + u.stok)` çağrısı şöyle ilerler:

| Adım | `toplam` (önce) | `u` | `u.stok` | Dönen değer = yeni `toplam` |
|---|---|---|---|---|
| Başlangıç | | | | 0 |
| 1 | 0 | Kulaklık | 5 | 5 |
| 2 | 5 | Şarj Kablosu | 0 | 5 |
| 3 | 5 | Akıllı Saat | 2 | 7 |
| 4 | 7 | Süt | 20 | 27 |
| 5 | 27 | Peynir | 0 | 27 |
| 6 | 27 | Defter | 30 | 57 |
| 7 | 57 | Kalem | 100 | **157** |

Bu, Hafta 3'teki `int toplam = 0; for (...) { toplam += ...; }` kalıbının **birebir aynısıdır**: Başlangıç değeri `0`, döngü gövdesi ise `birleştir` fonksiyonu.

**`reduce(birleştir)`** ise başlangıç değeri almaz; **ilk elemanı** başlangıç kabul eder ve her adımda iki değeri bire indirir. `reduce((a, b) => a.fiyat >= b.fiyat ? a : b)` → "İkisinden pahalı olanı tut." Sonunda tek bir ürün kalır: en pahalısı.

| | `fold` | `reduce` |
|---|---|---|
| Başlangıç değeri | Siz verirsiniz | İlk eleman |
| Sonucun tipi | Elemanlardan **farklı** olabilir (ürünler → `double`) | Elemanlarla **aynı** tip olmalı |
| Boş listede | Başlangıç değerini döndürür | **Hata verir** (`Bad state: No element`) |

> ⚠️ **fold'un başlangıç değerine dikkat:** Ondalıklı bir toplam için başlangıç değeri `0.0` yazılmalıdır. Sonucu tipi belirtilmemiş bir değişkene (`var t = ...`) atarken `fold(0, ...)` yazarsanız Dart toplamın `int` olduğunu varsayar ve ondalıklı toplamada derleme hatası verir.

## 9.5 sort: Kendi kuralınızla sıralamak

Hafta 3'te `sort()`'u parametresiz kullanmıştık; sayılar ve metinler kendi doğal sıralarıyla sıralanıyordu. Ürünler gibi kendi sınıflarımızı **hangi ölçüte göre** sıralayacağımızı ise bir **karşılaştırma fonksiyonu** ile söyleriz.

```dart
// Dosya: 09_06_siralama.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  bool get stoktaVar => stok > 0;

  @override
  String toString() => ad;
}

final List<Urun> katalog = [
  Urun('Kulaklık', 'Elektronik', 749.90, 5, 4.6),
  Urun('Şarj Kablosu', 'Elektronik', 129.90, 0, 4.1),
  Urun('Akıllı Saat', 'Elektronik', 2400.00, 2, 4.8),
  Urun('Süt', 'Gıda', 32.50, 20, 4.3),
  Urun('Peynir', 'Gıda', 145.00, 0, 4.7),
  Urun('Defter', 'Kırtasiye', 45.00, 30, 3.9),
  Urun('Kalem', 'Kırtasiye', 12.00, 100, 4.0),
];

const String trAlfabe = 'abcçdefgğhıijklmnoöprsştuüvyz';

String trKucuk(String metin) => metin.replaceAll('I', 'ı').replaceAll('İ', 'i').toLowerCase();

int trKarsilastir(String a, String b) {
  String x = trKucuk(a);
  String y = trKucuk(b);
  int kisaUzunluk = x.length < y.length ? x.length : y.length;
  for (int i = 0; i < kisaUzunluk; i++) {
    int sx = trAlfabe.indexOf(x[i]);
    int sy = trAlfabe.indexOf(y[i]);
    if (sx != sy) {
      return sx.compareTo(sy);
    }
  }
  return x.length.compareTo(y.length);
}

void main() {
  List<Urun> liste = List.of(katalog);

  liste.sort((a, b) => a.fiyat.compareTo(b.fiyat));
  print('Fiyat artan : $liste');

  liste.sort((a, b) => b.fiyat.compareTo(a.fiyat));
  print('Fiyat azalan: $liste');

  liste.sort((a, b) => b.puan.compareTo(a.puan));
  print('Puan        : $liste');

  List<String> meyveler = ['Üzüm', 'elma', 'Çilek', 'Ayva', 'incir', 'Ihlamur', 'Ceviz', 'şeftali', 'Dut'];
  meyveler.sort();
  print('sort()      : $meyveler');
  meyveler.sort(trKarsilastir);
  print('Türkçe      : $meyveler');
}
```

**Çıktı:**

```text
Fiyat artan : [Kalem, Süt, Defter, Şarj Kablosu, Peynir, Kulaklık, Akıllı Saat]
Fiyat azalan: [Akıllı Saat, Kulaklık, Peynir, Şarj Kablosu, Defter, Süt, Kalem]
Puan        : [Akıllı Saat, Peynir, Kulaklık, Süt, Şarj Kablosu, Kalem, Defter]
sort()      : [Ayva, Ceviz, Dut, Ihlamur, elma, incir, Çilek, Üzüm, şeftali]
Türkçe      : [Ayva, Ceviz, Çilek, Dut, elma, Ihlamur, incir, şeftali, Üzüm]
```

**Açıklama:**
- Karşılaştırma fonksiyonu iki eleman (`a` ve `b`) alır ve bir `int` döndürür: **negatif** → `a` önce gelsin, **pozitif** → `b` önce gelsin, **0** → eşitler. Bölüm 3.3'teki `compareTo` kuralının aynısı.
- `(a, b) => a.fiyat.compareTo(b.fiyat)` → artan sıra. `a` ile `b`'nin **yerini değiştirmek** sırayı tersine çevirir: `(a, b) => b.fiyat.compareTo(a.fiyat)` → azalan sıra.
- `sort` listeyi **yerinde** değiştirdiği için önce `List.of` ile kopya aldık; `katalog` bozulmadı (Hafta 3, Bölüm 7.5).
- **Türkçe sıralama (Hafta 3'teki söz):** Parametresiz `sort()`, harfleri karakter kodlarına göre sıralar: Önce büyük harfler, sonra küçük harfler, en sonda Türkçe harfler gelir. `trKarsilastir` fonksiyonu harfleri Türk alfabesindeki **sıralarına** göre karşılaştırır. Önce iki metin de Türkçe kurallarla küçük harfe çevrilir (`Ihlamur` → `ıhlamur`); sonra her harfin `trAlfabe` içindeki sırası bulunur ve ilk farklı harfte karar verilir.
- `meyveler.sort(trKarsilastir)`: İsimli bir fonksiyon da parantezsiz gönderilebilir; `sort` onu her karşılaştırmada çağırır.

## 9.6 Zincirleme: Bir arama ekranı

Gerçek bir uygulamada kullanıcı bir arama kutusuna yazı yazar, "yalnızca stoktakiler" kutucuğunu işaretler ve sonuçlar sıralanmış olarak listelenir. Bütün bunlar tek bir zincirle yapılabilir:

```dart
// Dosya: 09_07_zincirleme.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  bool get stoktaVar => stok > 0;

  @override
  String toString() => ad;
}

final List<Urun> katalog = [
  Urun('Kulaklık', 'Elektronik', 749.90, 5, 4.6),
  Urun('Şarj Kablosu', 'Elektronik', 129.90, 0, 4.1),
  Urun('Akıllı Saat', 'Elektronik', 2400.00, 2, 4.8),
  Urun('Süt', 'Gıda', 32.50, 20, 4.3),
  Urun('Peynir', 'Gıda', 145.00, 0, 4.7),
  Urun('Defter', 'Kırtasiye', 45.00, 30, 3.9),
  Urun('Kalem', 'Kırtasiye', 12.00, 100, 4.0),
];

List<String> ara(List<Urun> urunler, String aranan, {bool yalnizcaStokta = false}) {
  String kucukAranan = aranan.toLowerCase();
  return urunler
      .where((u) => u.ad.toLowerCase().contains(kucukAranan))
      .where((u) => !yalnizcaStokta || u.stoktaVar)
      .map((u) => '${u.ad} (${u.fiyat.toStringAsFixed(2)} TL)')
      .toList();
}

void main() {
  print(ara(katalog, 'ka'));
  print(ara(katalog, 'KA', yalnizcaStokta: true));
  print(ara(katalog, 'tablet'));

  List<Urun> stoktakiler = katalog.where((u) => u.stoktaVar).toList();
  stoktakiler.sort((a, b) => b.puan.compareTo(a.puan));
  List<String> enIyi3 = stoktakiler.take(3).map((u) => u.ad).toList();
  print('Stoktaki en yüksek puanlı 3 ürün: $enIyi3');
}
```

**Çıktı:**

```text
[Şarj Kablosu (129.90 TL), Kalem (12.00 TL)]
[Kalem (12.00 TL)]
[]
Stoktaki en yüksek puanlı 3 ürün: [Akıllı Saat, Kulaklık, Süt]
```

**Açıklama:**
- Zinciri yukarıdan aşağıya okuyun: "Ürünlerden adında aranan metin geçenleri seç → (istenirse) stoktakileri seç → her birini bir metne dönüştür → listeye çevir."
- `!yalnizcaStokta || u.stoktaVar` koşulu şöyle çalışır: Kutucuk işaretli değilse (`yalnizcaStokta` false) sol taraf `true` olur ve her ürün geçer; işaretliyse yalnızca stoktakiler geçer.
- Hem metin hem aranan küçük harfe çevrildiği için `'KA'` araması da aynı sonuçları buldu. Türkçe harfler içeren aramalarda `toLowerCase()` yerine Bölüm 5.2'deki `trKucuk` uzantısını kullanın.
- `take(3)` ilk 3 elemanı alır; `skip(3)` ise ilk 3'ü atlayıp gerisini verir. Sayfa sayfa yüklenen listelerde (ilk 20 ürün, sonraki 20 ürün) bu ikisi birlikte kullanılır.

## 9.7 ❌ toList()'i unutmak

```dart
// Dosya: 09_08_tuzak_tolist.dart
// ❌ DERLEME HATASI
void main() {
  List<int> fiyatlar = [120, 45, 300];
  List<int> ucuzlar = fiyatlar.where((f) => f < 100);
  print(ucuzlar);
}
```

**Hata mesajı:**

```text
A value of type 'Iterable<int>' can't be assigned to a variable of type 'List<int>'.
```

**Açıklama:** `where` ve `map` bir `Iterable` döndürür; `List` tipindeki bir değişkene atamak için sonuna `.toList()` eklenmelidir. Iterable'lar **tembeldir** (lazy): `where` yazıldığı anda hiçbir eleman kontrol edilmez; sonuç kullanıldığında (yazdırıldığında, `toList()` çağrıldığında, dolaşıldığında) hesaplanır. Bu, uzun zincirlerde gereksiz ara listeler oluşturulmasını önler.

## 9.8 Ödev 3'teki fonksiyonlar, tek satırda

Bölüm 1'deki Ödev 3, Soru 4 çözümünde `toplamSure`, `turSayilari` ve `hdVideolar` fonksiyonları 6–15 satır sürmüştü. Aynı fonksiyonlar bu bölümün araçlarıyla:

```dart
// Dosya: 09_09_odev3_tek_satir.dart
class Medya {
  final String baslik;
  final int sure;

  Medya(this.baslik, this.sure);
}

class Sarki extends Medya {
  final String sanatci;

  Sarki(super.baslik, super.sure, this.sanatci);
}

class Podcast extends Medya {
  final int bolum;

  Podcast(super.baslik, super.sure, this.bolum);
}

class Video extends Medya {
  final bool hd;

  Video(super.baslik, super.sure, {this.hd = false});
}

int toplamSure(List<Medya> liste) => liste.fold(0, (toplam, m) => toplam + m.sure);

List<String> hdVideolar(List<Medya> liste) =>
    liste.whereType<Video>().where((v) => v.hd).map((v) => v.baslik).toList();

Map<String, int> turSayilari(List<Medya> liste) => {
      'Şarkı': liste.whereType<Sarki>().length,
      'Podcast': liste.whereType<Podcast>().length,
      'Video': liste.whereType<Video>().length,
    };

void main() {
  List<Medya> kitaplik = [
    Sarki('Mavi Gökyüzü', 252, 'Deniz Ekin'),
    Podcast('Kod Sohbetleri', 2285, 42),
    Video("Flutter'a Giriş", 750, hd: true),
    Sarki('Yağmur Sonrası', 347, 'Ege Tuna'),
    Video('Dart İpuçları', 428),
  ];

  print('Toplam süre (sn): ${toplamSure(kitaplik)}');
  print('Tür sayıları    : ${turSayilari(kitaplik)}');
  print('HD videolar     : ${hdVideolar(kitaplik)}');
}
```

**Çıktı:**

```text
Toplam süre (sn): 4062
Tür sayıları    : {Şarkı: 2, Podcast: 1, Video: 2}
HD videolar     : [Flutter'a Giriş]
```

**Açıklama:** `whereType<Video>()` yeni bir metot: Listedeki elemanlardan yalnızca `Video` **tipinde** olanları seçer ve sonucu `Video` tipinde verir. Bu yüzden ardından gelen `where((v) => v.hd)` içinde `v.hd` doğrudan yazılabildi. `is` kontrolü ve tip yükseltmenin kısa yolu gibi düşünebilirsiniz.

## 9.9 Döngüden metoda: Karşılaştırma tablosu

| İş | Hafta 3 (döngü) | Bu hafta (fonksiyonel metot) |
|---|---|---|
| Filtreleme | Boş liste + `for` + `if` + `add` | `liste.where((x) => kosul).toList()` |
| Dönüştürme | Boş liste + `for` + `add(f(x))` | `liste.map((x) => f(x)).toList()` |
| Sayma | `int n = 0;` + `for` + `if` + `n++` | `liste.where((x) => kosul).length` |
| Toplama | `double t = 0;` + `for` + `t += x` | `liste.fold(0.0, (t, x) => t + x)` |
| En büyük | `m = liste[0];` + `for` + `if (x > m)` | `liste.reduce((a, b) => a > b ? a : b)` |
| En az biri mi? | `bool var = false;` + `for` + `if` + `break` | `liste.any((x) => kosul)` |
| Hepsi mi? | `bool hepsi = true;` + `for` + `if` + `break` | `liste.every((x) => kosul)` |
| İlk eşleşen | `for` + `if` + `return` | `liste.firstWhere((x) => kosul)` |
| Ölçüte göre sıralama | (yoktu) | `liste.sort((a, b) => a.f.compareTo(b.f))` |

> **Hangisini kullanmalı?** İkisi de doğrudur. Fonksiyonel metotlar **ne** yapıldığını anlatır ("stoktakileri seç"); döngüler ise **nasıl** yapıldığını ("boş bir liste aç, her ürüne bak, stoktaysa ekle"). Flutter kodlarında ve AI'ın üreteceği kodlarda fonksiyonel metotları çok sık göreceksiniz; bu yüzden ikisini de rahatça okuyabilmelisiniz. Döngü içinde `break`, birden fazla değişkeni birlikte güncellemek gibi karmaşık işler varsa döngü daha anlaşılır olabilir.

---

# 10. Map İçin Fonksiyonel Metotlar

## 10.1 forEach, update, removeWhere ve map

```dart
// Dosya: 10_01_map_metotlari.dart
void main() {
  Map<String, int> stok = {'Süt': 20, 'Ekmek': 0, 'Peynir': 4, 'Zeytin': 0, 'Yumurta': 12};

  stok.forEach((urun, adet) => print('$urun: $adet'));

  stok.update('Süt', (adet) => adet - 2);
  stok.update('Çay', (adet) => adet + 10, ifAbsent: () => 10);
  print(stok);

  stok.removeWhere((urun, adet) => adet == 0);
  print(stok);

  Map<String, String> etiketler = stok.map((urun, adet) => MapEntry(urun, adet < 5 ? 'Son $adet!' : 'Stokta'));
  print(etiketler);

  List<String> azalanlar = stok.entries.where((e) => e.value < 15).map((e) => e.key).toList();
  print('15 adetin altındakiler: $azalanlar');
}
```

**Çıktı:**

```text
Süt: 20
Ekmek: 0
Peynir: 4
Zeytin: 0
Yumurta: 12
{Süt: 18, Ekmek: 0, Peynir: 4, Zeytin: 0, Yumurta: 12, Çay: 10}
{Süt: 18, Peynir: 4, Yumurta: 12, Çay: 10}
{Süt: Stokta, Peynir: Son 4!, Yumurta: Stokta, Çay: Stokta}
15 adetin altındakiler: [Peynir, Yumurta, Çay]
```

**Açıklama:**
- **`forEach((anahtar, değer) => ...)`**: Map'teki her çift için fonksiyonu çağırır. Listedeki `forEach`'ten farkı, fonksiyonun **iki** parametre almasıdır.
- **`update(anahtar, (eski) => yeni)`**: Bir anahtarın değerini, eski değerden hesaplanan yeni değerle değiştirir. Anahtar yoksa ve `ifAbsent` verilmişse, anahtar `ifAbsent`'in döndürdüğü değerle **eklenir** (Çay örneği).
- **`removeWhere((anahtar, değer) => koşul)`**: Koşulu sağlayan tüm çiftleri siler. Stoğu 0 olan ürünler tek satırda temizlendi.
- **`map((anahtar, değer) => MapEntry(yeniAnahtar, yeniDeğer))`**: Her çifti dönüştürüp **yeni bir Map** oluşturur. `MapEntry` bir anahtar–değer çiftidir; Hafta 3'te `entries` ile dolaşırken gördüğümüz `kayit.key` ve `kayit.value` aslında birer `MapEntry`'ydi.
- `stok.entries` bir Iterable olduğu için Bölüm 9'daki tüm metotlar (`where`, `map`...) onunla da çalışır.

## 10.2 Sayma kalıbının yeni hali ve en popülerler

Hafta 3'teki sayma kalıbı `sayac[k] = (sayac[k] ?? 0) + 1;` idi. `update` ile aynı iş daha açık yazılır:

```dart
// Dosya: 10_02_arama_istatistigi.dart
void main() {
  List<String> aramalar = [
    'kulaklık', 'kılıf', 'kulaklık', 'şarj', 'kılıf',
    'kulaklık', 'saat', 'şarj', 'kulaklık', 'şarj',
  ];

  Map<String, int> sayac = {};
  for (String a in aramalar) {
    sayac.update(a, (n) => n + 1, ifAbsent: () => 1);
  }
  print(sayac);

  List<MapEntry<String, int>> sirali = sayac.entries.toList();
  sirali.sort((a, b) => b.value.compareTo(a.value));

  print('Popüler aramalar:');
  for (var e in sirali.take(3)) {
    print('  ${e.key} (${e.value})');
  }
}
```

**Çıktı:**

```text
{kulaklık: 4, kılıf: 2, şarj: 3, saat: 1}
Popüler aramalar:
  kulaklık (4)
  şarj (3)
  kılıf (2)
```

**Açıklama:** `update(a, (n) => n + 1, ifAbsent: () => 1)` → "Varsa bir artır, yoksa 1 ile ekle." Map'ler kendileri sıralanamaz; bu yüzden `entries` önce bir listeye çevrildi, sonra **değere göre** azalan sırada sıralandı. Bir alışveriş uygulamasının arama kutusunun altındaki "Popüler aramalar" bölümü tam olarak böyle hesaplanır.

## 10.3 Gruplama: Kategorilere göre ürünler

Mobil uygulamalarda listeler genellikle başlıklar altında gruplanarak gösterilir ("Elektronik", "Gıda"...). Bir listeyi gruplara ayırmak için `putIfAbsent` kullanılır:

```dart
// Dosya: 10_03_gruplama.dart
class Urun {
  final String ad;
  final String kategori;
  final double fiyat;

  Urun(this.ad, this.kategori, this.fiyat);
}

void main() {
  List<Urun> katalog = [
    Urun('Kulaklık', 'Elektronik', 749.90),
    Urun('Şarj Kablosu', 'Elektronik', 129.90),
    Urun('Akıllı Saat', 'Elektronik', 2400.00),
    Urun('Süt', 'Gıda', 32.50),
    Urun('Peynir', 'Gıda', 145.00),
    Urun('Defter', 'Kırtasiye', 45.00),
    Urun('Kalem', 'Kırtasiye', 12.00),
  ];

  Map<String, List<String>> gruplar = {};
  for (Urun u in katalog) {
    gruplar.putIfAbsent(u.kategori, () => []).add(u.ad);
  }
  gruplar.forEach((kategori, urunler) => print('$kategori (${urunler.length}): ${urunler.join(', ')}'));

  Map<String, double> kategoriToplami = katalog.fold({}, (toplam, u) {
    toplam[u.kategori] = (toplam[u.kategori] ?? 0.0) + u.fiyat;
    return toplam;
  });
  kategoriToplami.forEach((kategori, tutar) => print('$kategori toplamı: ${tutar.toStringAsFixed(2)} TL'));
}
```

**Çıktı:**

```text
Elektronik (3): Kulaklık, Şarj Kablosu, Akıllı Saat
Gıda (2): Süt, Peynir
Kırtasiye (2): Defter, Kalem
Elektronik toplamı: 3279.80 TL
Gıda toplamı: 177.50 TL
Kırtasiye toplamı: 57.00 TL
```

**Açıklama:**
- `putIfAbsent(anahtar, () => [])`: Anahtar yoksa verilen fonksiyonun ürettiği değeri (boş bir liste) ekler. Her durumda o anahtarın değerini **döndürür**. Dönen listeye hemen `.add(u.ad)` uygulandı. Okunuşu: "Bu kategorinin listesi yoksa oluştur; sonra ürünü o listeye ekle."
- İkinci örnekte `fold`'un toplayıcısı bir sayı değil, bir **Map**. Başlangıç değeri boş Map (`{}`); her üründe o ürünün kategorisinin toplamı güncellenip Map geri döndürülüyor. `fold`'un sonucu elemanlardan farklı bir tipte olabilir demiştik; bu da onun bir örneği.
- `(toplam[u.kategori] ?? 0.0)`: Burada `0` değil `0.0` yazılmalı; aksi halde ifadenin tipi `double` değil `num` olur ve Map'e atanamaz.

## 10.4 Map metotlarının özeti

| Metot | Ne yapar? |
|---|---|
| `forEach((k, v) => ...)` | Her çift için bir iş yapar |
| `update(k, (v) => yeni, ifAbsent: () => ilk)` | Değeri günceller; yoksa (istenirse) ekler |
| `putIfAbsent(k, () => deger)` | Yoksa ekler; her durumda değeri döndürür |
| `removeWhere((k, v) => kosul)` | Koşulu sağlayan çiftleri siler |
| `map((k, v) => MapEntry(k2, v2))` | Her çifti dönüştürüp yeni Map oluşturur |
| `entries`, `keys`, `values` | Iterable olarak verir; Bölüm 9'daki tüm metotlar uygulanabilir |
| `containsKey(k)`, `containsValue(v)` | Var mı? (Hafta 3) |

---

# 11. Hepsini Birleştirelim: Katalog Ekranının Mantığı

Bir alışveriş uygulamasının ürün listesi ekranını düşünün: Üstte kategori seçimi, bir arama kutusu, "yalnızca stoktakiler" kutucuğu ve bir sıralama menüsü var. Kullanıcı her seçim yaptığında liste yeniden hesaplanıyor. Ekran ya yükleniyor, ya ürünleri gösteriyor, ya "sonuç bulunamadı" diyor, ya da bir hata mesajı gösteriyor.

Bu programda o ekranın **mantığını** (ekranın kendisini değil, arkasındaki hesaplamayı) yazıyoruz. Haftanın neredeyse tüm konuları bu programda var.

```dart
// Dosya: 11_01_katalog_ekrani.dart
extension ParaBicimi on double {
  String get tl => '${toStringAsFixed(2)} TL';
}

enum Kategori {
  elektronik('Elektronik', 0.20),
  gida('Gıda', 0.01),
  kirtasiye('Kırtasiye', 0.20);

  const Kategori(this.ad, this.kdvOrani);

  final String ad;
  final double kdvOrani;
}

enum Siralama { onerilen, fiyatArtan, fiyatAzalan, puan }

mixin Begenilebilir {
  int _begeni = 0;

  int get begeni => _begeni;

  void begen() {
    _begeni++;
  }
}

class Urun with Begenilebilir {
  final String ad;
  final Kategori kategori;
  final double fiyat;
  final int stok;
  final double puan;

  Urun(this.ad, this.kategori, this.fiyat, this.stok, this.puan);

  double get kdvliFiyat => fiyat * (1 + kategori.kdvOrani);
  bool get stoktaVar => stok > 0;
}

sealed class EkranDurumu {}

class Yukleniyor extends EkranDurumu {}

class Bos extends EkranDurumu {
  final String mesaj;

  Bos(this.mesaj);
}

class Liste extends EkranDurumu {
  final List<Urun> urunler;

  Liste(this.urunler);
}

class Hata extends EkranDurumu {
  final String mesaj;

  Hata(this.mesaj);
}

typedef Karsilastirici = int Function(Urun a, Urun b);

Karsilastirici siralamaKurali(Siralama siralama) => switch (siralama) {
      Siralama.onerilen => (Urun a, Urun b) => b.begeni.compareTo(a.begeni),
      Siralama.fiyatArtan => (Urun a, Urun b) => a.fiyat.compareTo(b.fiyat),
      Siralama.fiyatAzalan => (Urun a, Urun b) => b.fiyat.compareTo(a.fiyat),
      Siralama.puan => (Urun a, Urun b) => b.puan.compareTo(a.puan),
    };

EkranDurumu katalogGetir(
  List<Urun> katalog, {
  bool baglantiVar = true,
  Kategori? kategori,
  String arama = '',
  bool yalnizcaStokta = false,
  Siralama siralama = Siralama.onerilen,
}) {
  if (!baglantiVar) {
    return Hata('İnternet bağlantısı yok.');
  }

  Iterable<Urun> sonuc = katalog;
  if (kategori != null) {
    sonuc = sonuc.where((u) => u.kategori == kategori);
  }
  if (arama.isNotEmpty) {
    sonuc = sonuc.where((u) => u.ad.toLowerCase().contains(arama.toLowerCase()));
  }
  if (yalnizcaStokta) {
    sonuc = sonuc.where((u) => u.stoktaVar);
  }

  List<Urun> liste = sonuc.toList();
  if (liste.isEmpty) {
    return Bos(arama.isNotEmpty ? '"$arama" için sonuç bulunamadı.' : 'Bu kategoride ürün yok.');
  }
  liste.sort(siralamaKurali(siralama));
  return Liste(liste);
}

String urunKarti(Urun u) {
  String durum = u.stoktaVar ? '' : '  (tükendi)';
  return '${u.ad.padRight(13)}${u.kdvliFiyat.tl.padLeft(11)}  puan ${u.puan}$durum';
}

String ekraniCiz(EkranDurumu durum) => switch (durum) {
      Yukleniyor _ => 'Yükleniyor...',
      Bos b => b.mesaj,
      Liste l => l.urunler.map(urunKarti).join('\n'),
      Hata h => '${h.mesaj} [Tekrar dene]',
    };

void main() {
  List<Urun> katalog = [
    Urun('Kulaklık', Kategori.elektronik, 749.90, 5, 4.6),
    Urun('Şarj Kablosu', Kategori.elektronik, 129.90, 0, 4.1),
    Urun('Akıllı Saat', Kategori.elektronik, 2400.00, 2, 4.8),
    Urun('Süt', Kategori.gida, 32.50, 20, 4.3),
    Urun('Peynir', Kategori.gida, 145.00, 0, 4.7),
    Urun('Defter', Kategori.kirtasiye, 45.00, 30, 3.9),
    Urun('Kalem', Kategori.kirtasiye, 12.00, 100, 4.0),
  ];

  // Kullanıcıların ürünlere verdiği beğeniler
  List<int> begeniler = [5, 4, 3, 8, 6, 2, 1];
  for (int i = 0; i < katalog.length; i++) {
    for (int j = 0; j < begeniler[i]; j++) {
      katalog[i].begen();
    }
  }

  print('--- Açılış ---');
  print(ekraniCiz(Yukleniyor()));

  print('--- Elektronik, fiyata göre artan ---');
  print(ekraniCiz(katalogGetir(katalog, kategori: Kategori.elektronik, siralama: Siralama.fiyatArtan)));

  print('--- Stoktakiler, önerilen sıra ---');
  print(ekraniCiz(katalogGetir(katalog, yalnizcaStokta: true)));

  print('--- "tablet" araması ---');
  print(ekraniCiz(katalogGetir(katalog, arama: 'tablet')));

  print('--- Bağlantı yokken ---');
  print(ekraniCiz(katalogGetir(katalog, baglantiVar: false)));

  print('--- Özet ---');
  double stokDegeri = katalog.fold(0.0, (toplam, u) => toplam + u.fiyat * u.stok);
  Map<String, int> kategoriSayilari = {};
  for (Urun u in katalog) {
    kategoriSayilari.update(u.kategori.ad, (n) => n + 1, ifAbsent: () => 1);
  }
  Urun enBegenilen = katalog.reduce((a, b) => a.begeni >= b.begeni ? a : b);

  print('Stok değeri    : ${stokDegeri.tl}');
  print('Tükenen var mı : ${katalog.any((u) => !u.stoktaVar) ? 'Evet' : 'Hayır'}');
  print('Kategoriler    : $kategoriSayilari');
  print('En beğenilen   : ${enBegenilen.ad} (${enBegenilen.begeni} beğeni)');
}
```

**Çıktı:**

```text
--- Açılış ---
Yükleniyor...
--- Elektronik, fiyata göre artan ---
Şarj Kablosu   155.88 TL  puan 4.1  (tükendi)
Kulaklık       899.88 TL  puan 4.6
Akıllı Saat   2880.00 TL  puan 4.8
--- Stoktakiler, önerilen sıra ---
Süt             32.83 TL  puan 4.3
Kulaklık       899.88 TL  puan 4.6
Akıllı Saat   2880.00 TL  puan 4.8
Defter          54.00 TL  puan 3.9
Kalem           14.40 TL  puan 4.0
--- "tablet" araması ---
"tablet" için sonuç bulunamadı.
--- Bağlantı yokken ---
İnternet bağlantısı yok. [Tekrar dene]
--- Özet ---
Stok değeri    : 11749.50 TL
Tükenen var mı : Evet
Kategoriler    : {Elektronik: 3, Gıda: 2, Kırtasiye: 2}
En beğenilen   : Süt (8 beğeni)
```

**Programda hangi konu nerede?**

| Kod parçası | Konu | Bölüm |
|---|---|---|
| `extension ParaBicimi on double` → `u.kdvliFiyat.tl` | Extension | 5 |
| `enum Kategori { elektronik('Elektronik', 0.20), ... }` | Gelişmiş enum: Her kategori kendi KDV oranını taşıyor | 6.3 |
| `enum Siralama { ... }` + `switch` (`_` yok) | Enum ve eksiksiz switch | 6.2 |
| `mixin Begenilebilir` → `class Urun with Begenilebilir` | Mixin | 4 |
| `sealed class EkranDurumu` + 4 alt sınıf | Sealed sınıf: Ekranın dört durumu | 7 |
| `ekraniCiz`: `switch` içinde `_` yok | Eksiksiz durum kontrolü | 7.1 |
| `typedef Karsilastirici` | Fonksiyon tipine isim vermek | 8.5 |
| `siralamaKurali`: Bir **fonksiyon döndüren** fonksiyon | Fonksiyonlar birer değerdir | 8.4 |
| `liste.sort(siralamaKurali(siralama))` | Karşılaştırma fonksiyonuyla sıralama | 9.5 |
| `sonuc = sonuc.where(...)` (koşullu zincir) | where, Iterable | 9.1 |
| `l.urunler.map(urunKarti).join('\n')` | map'e isimli fonksiyon göndermek | 9.2 |
| `fold`, `reduce`, `any` | Toplama, en büyük, "var mı?" | 9.3, 9.4 |
| `kategoriSayilari.update(..., ifAbsent: ...)` | Map ile sayma | 10.2 |

**Açıklama:**
- **Filtrelerin koşullu zincirlenmesi:** `sonuc` önce tüm katalog; her filtre seçiliyse ona bir `where` daha eklenir. Kullanıcı hiçbir filtre seçmediyse liste olduğu gibi kalır. Iterable tembel olduğu için `toList()` çağrılana kadar hiçbir ürün kontrol edilmez.
- **Sıralama bir enum'la seçiliyor:** `siralamaKurali`, kullanıcının seçtiği `Siralama` değerine göre **bir karşılaştırma fonksiyonu döndürüyor**; `sort` bu fonksiyonla çalışıyor. Yeni bir sıralama seçeneği (ör. "en yeni") enum'a eklendiğinde, `switch` eksik kalırsa program derlenmez.
- **"Önerilen" sıralama mixin'den geliyor:** Beğeni sayısı `Begenilebilir` mixin'inden. Stoktakilerde en çok beğenilen Süt (8) en üstte.
- **Ekranın dört durumu sealed sınıfla:** `ekraniCiz` fonksiyonu `Hata` durumunu ele almayı unutsaydı program derlenmezdi.
- **KDV kategoriden geliyor:** Süt'ün KDV dahil fiyatı %1 (gıda), Kulaklık'ınki %20 (elektronik) ile hesaplandı. Hiçbir yerde `if (kategori == ...)` yazılmadı; oran, enum değerinin içinde.

> **Deneyin:**
> 1. `Siralama` enum'una `adAZ` değerini ekleyin. Program derlenmeyecek; `siralamaKurali` içine eksik kolu (`(Urun a, Urun b) => a.ad.compareTo(b.ad)`) ekleyip düzeltin.
> 2. Arama için `toLowerCase()` yerine Bölüm 5.2'deki `trKucuk` uzantısını kullanın ve `'IŞIK'` gibi bir aramayı deneyin.
> 3. `EkranDurumu`'na `class Bakimda extends EkranDurumu {}` ekleyin. Hangi fonksiyon hata verdi? Neden?

> 🔗 **Flutter'da:** Bu programın `katalogGetir` ve `ekraniCiz` fonksiyonları, bir Flutter ekranının iki yarısına karşılık gelir. `katalogGetir` **durumu hesaplar** (ileride bu iş durum yönetimi katmanında yapılacak). `ekraniCiz` ise durumu **görüntüye çevirir**. Flutter'da `ekraniCiz`'in yerini bir `build` metodu alır ve `switch` ifadesi metin yerine widget döndürür: `Yukleniyor _ => const CircularProgressIndicator()`, `Liste l => ListView(children: l.urunler.map((u) => UrunKarti(u)).toList())`. Yapı birebir aynıdır.

---

# 12. Örnek Problem ve Farklı Çözüm Yolları

### **Problem:** Sipariş Geçmişi Raporu

Bir alışveriş uygulamasının "Siparişlerim" ekranının altında bir özet gösterilecek. Siparişler aşağıda verilmiştir. Sipariş durumları bir enum'dur ve her durumun ekranda görünecek bir etiketi vardır.

```dart
// ŞABLON: Üç çözümün de başında bulunan ortak tanımlar.
enum SiparisDurumu {
  hazirlaniyor('Hazırlanıyor'),
  kargoda('Kargoda'),
  teslimEdildi('Teslim edildi'),
  iptal('İptal');

  const SiparisDurumu(this.etiket);

  final String etiket;
}

class Siparis {
  final int no;
  final double tutar;
  final SiparisDurumu durum;

  Siparis(this.no, this.tutar, this.durum);
}

final List<Siparis> siparisler = [
  Siparis(1001, 249.90, SiparisDurumu.teslimEdildi),
  Siparis(1002, 89.50, SiparisDurumu.iptal),
  Siparis(1003, 749.90, SiparisDurumu.teslimEdildi),
  Siparis(1004, 1205.00, SiparisDurumu.kargoda),
  Siparis(1005, 312.40, SiparisDurumu.teslimEdildi),
  Siparis(1006, 59.90, SiparisDurumu.iptal),
  Siparis(1007, 512.20, SiparisDurumu.teslimEdildi),
  Siparis(1008, 145.00, SiparisDurumu.kargoda),
];
```

Hesaplanacaklar: Teslim edilen sipariş sayısı ve toplam tutarı, teslim edilenlerin ortalama tutarı, en yüksek tutarlı teslim edilmiş sipariş, iptal oranı (iptal sayısı / tüm siparişler) ve her durumdaki sipariş sayısı (enum'daki sırayla, hiç olmayan durumlar dahil).

**Beklenen ekran çıktısı:**

```text
Teslim edilen sipariş: 4
Teslim edilen toplam : 1824.40 TL
Ortalama sepet       : 456.10 TL
En yüksek teslim     : #1003 (749.90 TL)
İptal oranı          : %25.0
Durumlara göre       : Hazırlanıyor 0, Kargoda 2, Teslim edildi 4, İptal 2
```

> **Önce kendiniz deneyin.** Çözümlere bakmadan önce en az 15 dakika kendi çözümünüz üzerinde çalışın.

### Çözüm Şekilleri

**1. Klasik döngü (Hafta 3 yaklaşımı)**

```dart
// Dosya: 12_01_rapor_dongu.dart
enum SiparisDurumu {
  hazirlaniyor('Hazırlanıyor'),
  kargoda('Kargoda'),
  teslimEdildi('Teslim edildi'),
  iptal('İptal');

  const SiparisDurumu(this.etiket);

  final String etiket;
}

class Siparis {
  final int no;
  final double tutar;
  final SiparisDurumu durum;

  Siparis(this.no, this.tutar, this.durum);
}

final List<Siparis> siparisler = [
  Siparis(1001, 249.90, SiparisDurumu.teslimEdildi),
  Siparis(1002, 89.50, SiparisDurumu.iptal),
  Siparis(1003, 749.90, SiparisDurumu.teslimEdildi),
  Siparis(1004, 1205.00, SiparisDurumu.kargoda),
  Siparis(1005, 312.40, SiparisDurumu.teslimEdildi),
  Siparis(1006, 59.90, SiparisDurumu.iptal),
  Siparis(1007, 512.20, SiparisDurumu.teslimEdildi),
  Siparis(1008, 145.00, SiparisDurumu.kargoda),
];

void main() {
  int teslimSayisi = 0;
  double teslimToplam = 0;
  int iptalSayisi = 0;
  Siparis? enYuksek;
  Map<SiparisDurumu, int> sayac = {};

  for (Siparis s in siparisler) {
    sayac[s.durum] = (sayac[s.durum] ?? 0) + 1;
    if (s.durum == SiparisDurumu.teslimEdildi) {
      teslimSayisi++;
      teslimToplam += s.tutar;
      if (enYuksek == null || s.tutar > enYuksek.tutar) {
        enYuksek = s;
      }
    } else if (s.durum == SiparisDurumu.iptal) {
      iptalSayisi++;
    }
  }

  String durumlar = '';
  for (SiparisDurumu d in SiparisDurumu.values) {
    if (durumlar.isNotEmpty) {
      durumlar += ', ';
    }
    durumlar += '${d.etiket} ${sayac[d] ?? 0}';
  }

  print('Teslim edilen sipariş: $teslimSayisi');
  print('Teslim edilen toplam : ${teslimToplam.toStringAsFixed(2)} TL');
  print('Ortalama sepet       : ${(teslimToplam / teslimSayisi).toStringAsFixed(2)} TL');
  if (enYuksek != null) {
    print('En yüksek teslim     : #${enYuksek.no} (${enYuksek.tutar.toStringAsFixed(2)} TL)');
  }
  print('İptal oranı          : %${(iptalSayisi / siparisler.length * 100).toStringAsFixed(1)}');
  print('Durumlara göre       : $durumlar');
}
```

**Açıklama:** Liste **tek bir kez** dolaşılıyor ve tüm değerler aynı döngüde biriktiriliyor; en verimli çözüm. Ancak beş ayrı değişken birlikte güncelleniyor ve hangi satırın hangi istatistiğe ait olduğunu anlamak için kodun tamamını okumak gerekiyor. `Siparis? enYuksek` başlangıçta `null`; döngü bittiğinde de `null` olabilir (hiç teslim edilmiş sipariş yoksa). Bu yüzden yazdırmadan önce kontrol edildi.

**2. Fonksiyonel zincirler**

```dart
// Dosya: 12_02_rapor_fonksiyonel.dart
enum SiparisDurumu {
  hazirlaniyor('Hazırlanıyor'),
  kargoda('Kargoda'),
  teslimEdildi('Teslim edildi'),
  iptal('İptal');

  const SiparisDurumu(this.etiket);

  final String etiket;
}

class Siparis {
  final int no;
  final double tutar;
  final SiparisDurumu durum;

  Siparis(this.no, this.tutar, this.durum);
}

final List<Siparis> siparisler = [
  Siparis(1001, 249.90, SiparisDurumu.teslimEdildi),
  Siparis(1002, 89.50, SiparisDurumu.iptal),
  Siparis(1003, 749.90, SiparisDurumu.teslimEdildi),
  Siparis(1004, 1205.00, SiparisDurumu.kargoda),
  Siparis(1005, 312.40, SiparisDurumu.teslimEdildi),
  Siparis(1006, 59.90, SiparisDurumu.iptal),
  Siparis(1007, 512.20, SiparisDurumu.teslimEdildi),
  Siparis(1008, 145.00, SiparisDurumu.kargoda),
];

void main() {
  List<Siparis> teslimler = siparisler.where((s) => s.durum == SiparisDurumu.teslimEdildi).toList();
  double teslimToplam = teslimler.fold(0.0, (toplam, s) => toplam + s.tutar);
  Siparis enYuksek = teslimler.reduce((a, b) => a.tutar >= b.tutar ? a : b);
  int iptalSayisi = siparisler.where((s) => s.durum == SiparisDurumu.iptal).length;
  String durumlar = SiparisDurumu.values
      .map((d) => '${d.etiket} ${siparisler.where((s) => s.durum == d).length}')
      .join(', ');

  print('Teslim edilen sipariş: ${teslimler.length}');
  print('Teslim edilen toplam : ${teslimToplam.toStringAsFixed(2)} TL');
  print('Ortalama sepet       : ${(teslimToplam / teslimler.length).toStringAsFixed(2)} TL');
  print('En yüksek teslim     : #${enYuksek.no} (${enYuksek.tutar.toStringAsFixed(2)} TL)');
  print('İptal oranı          : %${(iptalSayisi / siparisler.length * 100).toStringAsFixed(1)}');
  print('Durumlara göre       : $durumlar');
}
```

**Açıklama:** Her istatistik **kendi satırında** ve satırın kendisi ne hesaplandığını anlatıyor: "Teslimleri seç, tutarlarını topla, en yükseğini bul..." Liste birkaç kez dolaşılıyor; 8 sipariş için bu fark hissedilmez, ama on binlerce kayıtta 1. çözüm daha hızlı olur. `reduce` boş listede hata verdiği için, hiç teslim edilmiş sipariş yoksa bu çözüm çöker; gerçek bir uygulamada `teslimler.isEmpty` kontrolü eklenmelidir.

**3. Önce grupla, sonra hesapla**

```dart
// Dosya: 12_03_rapor_gruplama.dart
enum SiparisDurumu {
  hazirlaniyor('Hazırlanıyor'),
  kargoda('Kargoda'),
  teslimEdildi('Teslim edildi'),
  iptal('İptal');

  const SiparisDurumu(this.etiket);

  final String etiket;
}

class Siparis {
  final int no;
  final double tutar;
  final SiparisDurumu durum;

  Siparis(this.no, this.tutar, this.durum);
}

final List<Siparis> siparisler = [
  Siparis(1001, 249.90, SiparisDurumu.teslimEdildi),
  Siparis(1002, 89.50, SiparisDurumu.iptal),
  Siparis(1003, 749.90, SiparisDurumu.teslimEdildi),
  Siparis(1004, 1205.00, SiparisDurumu.kargoda),
  Siparis(1005, 312.40, SiparisDurumu.teslimEdildi),
  Siparis(1006, 59.90, SiparisDurumu.iptal),
  Siparis(1007, 512.20, SiparisDurumu.teslimEdildi),
  Siparis(1008, 145.00, SiparisDurumu.kargoda),
];

void main() {
  Map<SiparisDurumu, List<Siparis>> gruplar = {};
  for (Siparis s in siparisler) {
    gruplar.putIfAbsent(s.durum, () => []).add(s);
  }

  List<Siparis> teslimler = gruplar[SiparisDurumu.teslimEdildi] ?? [];
  List<Siparis> iptaller = gruplar[SiparisDurumu.iptal] ?? [];
  double teslimToplam = teslimler.fold(0.0, (toplam, s) => toplam + s.tutar);
  Siparis enYuksek = teslimler.reduce((a, b) => a.tutar >= b.tutar ? a : b);
  String durumlar = SiparisDurumu.values.map((d) => '${d.etiket} ${gruplar[d]?.length ?? 0}').join(', ');

  print('Teslim edilen sipariş: ${teslimler.length}');
  print('Teslim edilen toplam : ${teslimToplam.toStringAsFixed(2)} TL');
  print('Ortalama sepet       : ${(teslimToplam / teslimler.length).toStringAsFixed(2)} TL');
  print('En yüksek teslim     : #${enYuksek.no} (${enYuksek.tutar.toStringAsFixed(2)} TL)');
  print('İptal oranı          : %${(iptaller.length / siparisler.length * 100).toStringAsFixed(1)}');
  print('Durumlara göre       : $durumlar');
}
```

**Açıklama:** Siparişler önce durumlarına göre **gruplandı** (`Map<SiparisDurumu, List<Siparis>>`); sonra her istatistik ilgili grubun üzerinde hesaplandı. Liste yalnızca bir kez gruplanıyor; sonrasında "teslim edilenler" veya "iptaller" doğrudan Map'ten alınıyor. "Siparişlerim" ekranında siparişler zaten durumlarına göre sekmelerde ("Kargoda", "Teslim edildi"...) gösterileceği için, bu gruplama ekranın kendisi için de kullanılabilir. `gruplar[d]?.length ?? 0`: O durumda hiç sipariş yoksa (Hazırlanıyor) Map'te anahtar bulunmaz; `?.` null döndürür, `??` ise 0 yapar.

**Hangisini seçmeli?**

| Ölçüt | 1. Döngü | 2. Fonksiyonel | 3. Gruplama |
|---|---|---|---|
| Listeyi kaç kez dolaşır? | **Bir kez** | Her istatistik için bir kez | Gruplama için bir kez + gruplar |
| Okunabilirlik | Değişkenler iç içe | **Her satır tek bir iş** | İyi |
| Yeni istatistik eklemek | Döngünün içine eklenir | **Yeni bir satır** | Yeni bir satır |
| Ekranda başka bir işe yarar mı? | Hayır | Hayır | **Evet:** Gruplar sekmelerde kullanılabilir |

Üç çözüm de aynı çıktıyı üretir. Az sayıda veri için 2. çözümün okunabilirliği öne çıkar; veri aynı zamanda ekranda gruplu gösterilecekse 3. çözüm iki işi birden görür; çok büyük verilerde ise 1. çözüm en hızlısıdır.

---

# 13. Özet

| Konu | Sözdizimi | Not |
|---|---|---|
| Soyut sınıf | `abstract class Odeme { double ucret(); }` | Nesnesi oluşturulamaz; soyut metotlar alt sınıflarda **zorunlu** |
| Şablon metot | Soyut sınıfta, soyut üyeleri kullanan somut metot | Ortak kural bir yerde, ayrıntılar alt sınıflarda |
| Arayüz | `class Urun implements Paylasilabilir` | "... yapabilir"; kod taşımaz; sınırsız sayıda |
| Comparable | `implements Comparable<Urun>` + `compareTo` | `liste.sort()` parametresiz çalışır |
| Mixin | `mixin Begenilebilir { ... }` · `class Gonderi with Begenilebilir` | Hazır kodu ilgisiz sınıflara ekler; kurucusu olmaz |
| Sıralama | `extends` → `with` → `implements` | |
| Extension | `extension ParaBicimi on double { String get tl => ...; }` | Var olan tipe yetenek ekler; alan ekleyemez |
| Enum | `enum SiparisDurumu { hazirlaniyor, kargoda }` | `name`, `index`, `values`, `values.byName(...)` |
| Gelişmiş enum | `krediKarti('Kredi Kartı', 0.02);` + `const` kurucu + `final` alanlar | Her değer kendi verisini taşır |
| Sealed sınıf | `sealed class EkranDurumu {}` | Alt sınıflar aynı dosyada; `switch`'te `_` gerekmez |
| Fonksiyon tipi | `double Function(double)` · `typedef FiyatKurali = ...;` | `kdvEkle` fonksiyondur, `kdvEkle(1)` sonuçtur |
| İsimsiz fonksiyon | `(x) => x * 2` · `() { ... }` | Geri çağırma: `onPressed: () { ... }` |
| Kapanış | Fonksiyon, tanımlandığı yerdeki değişkenleri hatırlar | `indirimOlustur(10)` |
| where / map | `l.where((x) => kosul)` · `l.map((x) => f(x))` | Iterable döner; `.toList()` |
| any / every | `l.any((x) => kosul)` · `l.every((x) => kosul)` | `bool` |
| firstWhere | `l.firstWhere(...)` · `l.where(...).firstOrNull` | Bulamazsa hata / `null` |
| fold / reduce | `l.fold(0.0, (t, x) => t + x)` · `l.reduce((a, b) => ...)` | `reduce` boş listede hata |
| sort | `l.sort((a, b) => a.f.compareTo(b.f))` | Negatif: `a` önce |
| whereType | `l.whereType<Video>()` | Tipe göre süzer |
| Map metotları | `forEach`, `update`, `putIfAbsent`, `removeWhere`, `map` | `MapEntry(k, v)` |

---

# 14. Kendinizi Test Edin

Sorulardaki kod parçaları tam program değildir; denemek için sınıfları ve fonksiyonları dosyanın üst düzeyine, kodu `void main() { ... }` içine yazın.

**1.** Soyut sınıftan neden nesne oluşturulamaz? Soyut sınıfın kurucusu ne işe yarar?

**Cevap:** Soyut sınıf kendi başına anlamı olmayan bir kalıptır ve gövdesiz (soyut) metotlar içerebilir; bu metotlar çağrılsaydı çalıştırılacak bir kod olmazdı. Kurucusu ise alt sınıfların `super` ile ortak alanları kurması içindir.

**2.** Aşağıdaki kod neden derlenmez?
```dart
abstract class Sekil {
  double alan();
}
class Kare extends Sekil {
  double kenar;
  Kare(this.kenar);
}
```

**Cevap:** `Kare`, soyut `alan()` metodunu yazmamış: "Missing concrete implementation of 'Sekil.alan'." Düzeltme: `@override double alan() => kenar * kenar;`

**3.** `extends`, `implements` ve `with` arasındaki farkı birer cümleyle açıklayın.

**Cevap:** `extends` bir "... bir ...'dur" ilişkisi kurar ve üst sınıfın kodunu miras alır (yalnızca bir tane). `implements` bir sözleşme uygulatır; kod gelmez, her üye yeniden yazılır (sınırsız). `with` bir mixin'in hazır kodunu sınıfa ekler (sınırsız).

**4.** Aşağıdaki extension'la `print(3.5.yuvarla);` ne yazar?
```dart
extension Yuvarlama on double {
  int get yuvarla => round();
}
```

**Cevap:** `4`. `round()` en yakın tam sayıya yuvarlar; .5 durumunda sıfırdan uzağa yuvarlar.

**5.** Enum üzerindeki bir `switch` ifadesinde neden `_` kolu kullanmamak önerilir?

**Cevap:** `_` kullanılmazsa, enum'a yeni bir değer eklendiğinde onu ele almayan her `switch` derleme hatası verir. `_` kullanılırsa yeni değer sessizce `_` koluna düşer ve unutulduğu fark edilmez.

**6.** `enum Renk { kirmizi, yesil, mavi }` için `Renk.mavi.index` ve `Renk.values.byName('yesil')` neyi verir?

**Cevap:** `2` ve `Renk.yesil`.

**7.** Bir ekranın "yükleniyor / veri / hata" durumları için neden enum değil de sealed sınıf kullanılır?

**Cevap:** Durumların her biri farklı veri taşır (veri durumu bir liste, hata durumu bir mesaj). Enum değerleri aynı alanlara sahip sabit değerlerdir. Sealed sınıf hem her duruma kendi verisini verir hem de `switch`'te eksiksizlik kontrolü sağlar.

**8.** Çıktı nedir?
```dart
int Function(int) carpanOlustur(int carpan) => (x) => x * carpan;
// main içinde:
var ikiKat = carpanOlustur(2);
var ucKat = carpanOlustur(3);
print(ikiKat(5) + ucKat(5));
```

**Cevap:** `25` (10 + 15). Her döndürülen fonksiyon kendi `carpan` değerini hatırlar (kapanış).

**9.** Çıktı nedir?
```dart
List<int> l = [3, 8, 1, 6];
print(l.where((x) => x > 2).map((x) => x * 10).toList());
print(l.fold(0, (t, x) => t + x));
print(l.any((x) => x > 7));
print(l.every((x) => x > 0));
```

**Cevap:** `[30, 80, 60]`, `18`, `true`, `true`.

**10.** `List<String> adlar = urunler.map((u) => u.ad);` neden derlenmez?

**Cevap:** `map` bir `Iterable<String>` döndürür; `List<String>` değişkenine atamak için sonuna `.toList()` eklenmelidir.

**11.** `l.sort((a, b) => b.compareTo(a));` listeyi hangi sırada sıralar?

**Cevap:** Azalan sırada. `a` ile `b`'nin yeri değiştirildiği için karşılaştırmanın işareti tersine döner.

**12.** `fold` ile `reduce` arasındaki iki fark nedir?

**Cevap:** `fold` bir başlangıç değeri alır ve sonucu elemanlardan farklı bir tipte olabilir; boş listede başlangıç değerini döndürür. `reduce` ilk elemanla başlar, sonucu elemanlarla aynı tiptedir ve boş listede hata verir.

---

# 15. Ödev 4

> **AI kuralı:** AI'ı kavram sormak ve hata mesajlarını açıklatmak için kullanabilirsiniz; **kod yazdırmak yasaktır.** Bu kuralın geçerli olduğu son ödev budur. Ödev çözümleri **6. haftanın ilk 15 dakikasında** sınıfta birlikte yapılacaktır. Derste rastgele seçilen öğrencilerden çözümlerini kısaca açıklamaları istenebilir.

**Teslim:**
- Her soru ayrı bir dosya: `odev4_s1.dart`, `odev4_s2.dart`, ...
- Her soruda verilen `main` fonksiyonunu **aynen** kullanın; diğer her şeyi siz yazın. Çıktınız beklenen çıktıyla birebir aynı olmalıdır.
- Teslimden önce `Shift + Alt + F` ile biçimlendirin; **Problems** panelinde hata ve uyarı kalmasın. Override ettiğiniz her metotta `@override` kullanın.
- Teslim tarihi ve yöntemi Classroom'daki ödev sayfasındadır.

---

### Soru 1 — Akıllı Ev Cihazları *(soyut sınıf, şablon metot, fold)*

- **`Cihaz`** (soyut): `final String oda`; `bool acik = false`; soyut getter `String get tur`; soyut metot `double anlikWatt()` (cihaz açıksa harcadığı güç, kapalıysa 0); somut metot `String durum()` → `'${tur.padRight(5)} - ${oda.padRight(8)}: ${(acik ? 'açık' : 'kapalı').padRight(6)} ${anlikWatt().toStringAsFixed(0).padLeft(5)} W'`
- **`Ampul`**: İsimli parametre `{int parlaklik = 100}`; açıkken `parlaklik × 0.1` W harcar.
- **`Klima`**: Konumsal parametre `int hedefSicaklik`; açıkken `900 + |24 − hedefSicaklik| × 50` W harcar. (Mutlak değer için `.abs()`)
- **`Priz`**: Konumsal parametre `double bagliCihazWatt`; açıkken bu değeri harcar.
- **`double toplamWatt(List<Cihaz> liste)`**: `fold` ile yazın.
- **`List<String> aciklar(List<Cihaz> liste)`**: Açık cihazları `'Ampul (Salon)'` biçiminde; `where` ve `map` ile yazın.

```dart
// ŞABLON: Sınıflarınızı ve fonksiyonlarınızı bu main'in üstüne yazın.
void main() {
  List<Cihaz> cihazlar = [
    Ampul('Salon', parlaklik: 60),
    Ampul('Mutfak'),
    Klima('Salon', 20),
    Priz('Çalışma', 150),
  ];
  cihazlar[0].acik = true;
  cihazlar[2].acik = true;
  cihazlar[3].acik = true;

  for (Cihaz c in cihazlar) {
    print(c.durum());
  }
  print('Toplam: ${toplamWatt(cihazlar).toStringAsFixed(0)} W');
  print('Açık cihazlar: ${aciklar(cihazlar)}');
}
```

**Beklenen ekran çıktısı:**

```text
Ampul - Salon   : açık       6 W
Ampul - Mutfak  : kapalı     0 W
Klima - Salon   : açık    1100 W
Priz  - Çalışma : açık     150 W
Toplam: 1256 W
Açık cihazlar: [Ampul (Salon), Klima (Salon), Priz (Çalışma)]
```

**Ek görev:** `main`'in sonuna `Cihaz c = Cihaz('Banyo');` satırını ekleyin. Aldığınız hata mesajını bu satırın üstüne yorum olarak yazın ve satırı yorum haline getirin.

---

### Soru 2 — Sipariş Takip Ekranı *(gelişmiş enum, sealed sınıf, eksiksiz switch)*

- **`enum SiparisDurumu`**: Değerleri `alindi`, `hazirlaniyor`, `kargoda`, `teslimEdildi`. Her değerin bir `etiket`'i (`'Sipariş alındı'`, `'Hazırlanıyor'`, `'Kargoda'`, `'Teslim edildi'`) ve bir `ilerleme` yüzdesi (10, 40, 75, 100) olsun. Ayrıca `String get cubuk` getter'ı yazın: 10 karakterlik bir ilerleme çubuğu; her %10 için bir `#`, kalanı `-`: `[#######---]`
- **`sealed class TakipSonucu`** ve üç alt sınıfı: `Bulundu` (`no`, `durum`), `Bulunamadi` (`no`), `GecersizNumara` (`girilen`).
- **`TakipSonucu siparisAra(Map<String, SiparisDurumu> kayitlar, String girilen)`**: Girilen metni temizleyip büyük harfe çevirir. `SP-` ile başlamıyorsa veya uzunluğu 7 değilse `GecersizNumara`; kayıtlarda varsa `Bulundu`; yoksa `Bulunamadi` döndürür.
- **`String ekran(TakipSonucu sonuc)`**: **`_` kolu olmayan** bir switch ifadesiyle yazın.

```dart
// ŞABLON: Tanımlarınızı bu main'in üstüne yazın.
void main() {
  Map<String, SiparisDurumu> kayitlar = {
    'SP-1024': SiparisDurumu.kargoda,
    'SP-1025': SiparisDurumu.alindi,
    'SP-1019': SiparisDurumu.teslimEdildi,
  };

  for (String girilen in ['SP-1024', ' sp-1025 ', 'SP-1019', 'SP-9999', '1024']) {
    print(ekran(siparisAra(kayitlar, girilen)));
  }

  List<String> aktifler = kayitlar.entries
      .where((e) => e.value != SiparisDurumu.teslimEdildi)
      .map((e) => e.key)
      .toList();
  print('Aktif siparişler: $aktifler');
}
```

**Beklenen ekran çıktısı:**

```text
SP-1024: Kargoda [#######---] %75
SP-1025: Sipariş alındı [#---------] %10
SP-1019: Teslim edildi [##########] %100
SP-9999 numaralı sipariş bulunamadı.
"1024" geçerli bir sipariş numarası değil.
Aktif siparişler: [SP-1024, SP-1025]
```

---

### Soru 3 — Sosyal Akış *(arayüz, mixin, soyut sınıf, whereType)*

- **`abstract class Paylasilabilir`**: soyut `String paylasimMetni()`.
- **`mixin Begenilebilir`**: private beğeni sayacı, `int get begeni`, `void begen([int kez = 1])`.
- **`abstract class SosyalIcerik with Begenilebilir implements Paylasilabilir`**: `final String yazar` alanı ve kurucusu.
- **`Gonderi extends SosyalIcerik`** (`metin`): paylaşım metni `'@ayse: Flutter projem bitti!'`
- **`Fotograf extends SosyalIcerik`** (`dosya`): paylaşım metni `'@mert bir fotoğraf paylaştı: kampus.jpg'`
- **`Reklam implements Paylasilabilir`** (`marka`): paylaşım metni `'[Sponsorlu] Cep Market'`. Reklamlar **beğenilemez**.
- **`int toplamBegeni(List<Paylasilabilir> akis)`**: `whereType` ve `fold` ile.
- **`List<String> populerler(List<Paylasilabilir> akis, {int enAz = 10})`**: En az `enAz` beğenisi olan içeriklerin paylaşım metinleri; `whereType`, `where` ve `map` ile.

```dart
// ŞABLON: Tanımlarınızı bu main'in üstüne yazın.
void main() {
  Gonderi g1 = Gonderi('ayse', 'Flutter projem bitti!');
  Fotograf f1 = Fotograf('mert', 'kampus.jpg');
  Reklam r1 = Reklam('Cep Market');
  Gonderi g2 = Gonderi('zeynep', 'Dart çok keyifli.');

  g1.begen(12);
  f1.begen(25);
  g2.begen(3);
  g2.begen();

  List<Paylasilabilir> akis = [g1, f1, r1, g2];
  for (Paylasilabilir p in akis) {
    String begeniMetni = p is SosyalIcerik ? ' (${p.begeni} beğeni)' : '';
    print('${p.paylasimMetni()}$begeniMetni');
  }
  print('Toplam beğeni: ${toplamBegeni(akis)}');
  print('Popüler (10+): ${populerler(akis)}');
}
```

**Beklenen ekran çıktısı:**

```text
@ayse: Flutter projem bitti! (12 beğeni)
@mert bir fotoğraf paylaştı: kampus.jpg (25 beğeni)
[Sponsorlu] Cep Market
@zeynep: Dart çok keyifli. (4 beğeni)
Toplam beğeni: 41
Popüler (10+): [@ayse: Flutter projem bitti!, @mert bir fotoğraf paylaştı: kampus.jpg]
```

**İpucu:** `SosyalIcerik`, `Paylasilabilir`'in bir alt tipidir; bu yüzden `p is SosyalIcerik` kontrolünden sonra `p.begeni` yazılabilir.

---

### Soru 4 — Uzantılar *(extension)*

Aşağıdaki uzantıları yazın:

| Uzantı | Üye | Görevi |
|---|---|---|
| `on String` | `String get baslikHali` | Her kelimenin ilk harfini **Türkçe kurallarla** büyük, kalanını küçük yapar |
| `on String` | `int get kelimeSayisi` | Boşluklarla ayrılmış (boş olmayan) kelime sayısı |
| `on String` | `bool get gecerliTelefonMu` | Boşluklar silindikten sonra yalnızca rakamlardan oluşuyor ve 10 veya 11 haneliyse `true` |
| `on int` | `String get binlikli` | Binlik ayracıyla yazar: `12100` → `12.100` |
| `on int` | `String get sureMetni` | Dakikayı yazıya çevirir: `45` → `45 dk`, `125` → `2 sa 5 dk` |
| `on List<double>` | `double get toplam` · `double get ortalama` | `fold` ile |

```dart
// ŞABLON: Uzantılarınızı bu main'in üstüne yazın.
void main() {
  print('ali veli KIRK dokuz'.baslikHali);
  print('ışık ilkokulu'.baslikHali);
  print('Flutter ile mobil uygulama geliştirme'.kelimeSayisi);
  print('0532 111 22 33'.gecerliTelefonMu);
  print('0532-111'.gecerliTelefonMu);
  print(12100.binlikli);
  print(1250000.binlikli);
  print(987.binlikli);
  print(45.sureMetni);
  print(125.sureMetni);

  List<double> notlar = [72, 85.5, 90];
  print(notlar.toplam);
  print(notlar.ortalama.toStringAsFixed(2));
}
```

**Beklenen ekran çıktısı:**

```text
Ali Veli Kırk Dokuz
Işık İlkokulu
5
true
false
12.100
1.250.000
987
45 dk
2 sa 5 dk
247.5
82.50
```

**İpucu:** `baslikHali` için Bölüm 5.2'deki `trBuyuk` ve `trKucuk` uzantılarını aynı dosyaya ekleyip kullanabilirsiniz. Bir kelimenin ilk harfi `kelime[0]`, geri kalanı `kelime.substring(1)`'dir.

---

### Soru 5 — Fitness Uygulaması *(fonksiyonel metotlar)*

Bir fitness uygulamasının haftalık antrenman kayıtlarını analiz edin.

```dart
// ŞABLON: Kullanılacak sınıf ve veri.
class Antrenman {
  final String gun;
  final String tur;
  final int dakika;
  final int kalori;

  Antrenman(this.gun, this.tur, this.dakika, this.kalori);
}

final List<Antrenman> hafta = [
  Antrenman('Pzt', 'Koşu', 30, 320),
  Antrenman('Pzt', 'Yürüyüş', 20, 90),
  Antrenman('Sal', 'Bisiklet', 45, 410),
  Antrenman('Çar', 'Koşu', 25, 270),
  Antrenman('Per', 'Yoga', 40, 150),
  Antrenman('Cum', 'Koşu', 35, 380),
  Antrenman('Cmt', 'Yürüyüş', 60, 260),
  Antrenman('Cmt', 'Bisiklet', 30, 290),
];
```

Aşağıdaki fonksiyonları yazın. **Kural:** Fonksiyonların içinde `for` ve `while` döngüsü **kullanmayın**; yalnızca Bölüm 9 ve 10'daki metotları kullanın.

| Fonksiyon | Görevi |
|---|---|
| `int toplamKalori(List<Antrenman> l)` | Toplam kalori |
| `int turDakikasi(List<Antrenman> l, String tur)` | Bir türün toplam dakikası |
| `Antrenman enUzun(List<Antrenman> l)` | En uzun süren antrenman |
| `List<String> kaloriUstu(List<Antrenman> l, int esik)` | Eşikten fazla kalori yakılan antrenmanlar: `'Pzt Koşu'` |
| `Map<String, int> gunlereGoreKalori(List<Antrenman> l)` | Her günün toplam kalorisi |
| `Set<String> turler(List<Antrenman> l)` | Farklı antrenman türleri |
| `List<String> enCokKalori(List<Antrenman> l, int adet)` | En çok kalori yakılan `adet` antrenman: `'Sal Bisiklet (410)'`. Orijinal liste değişmemeli. |

```dart
// ŞABLON: Fonksiyonlarınızı bu main'in üstüne yazın.
void main() {
  Antrenman uzun = enUzun(hafta);
  print('Toplam kalori      : ${toplamKalori(hafta)} kcal');
  print('Koşu süresi        : ${turDakikasi(hafta, 'Koşu')} dk');
  print('En uzun antrenman  : ${uzun.gun} ${uzun.tur} (${uzun.dakika} dk)');
  print('300+ kalori        : ${kaloriUstu(hafta, 300)}');
  print('Günlere göre kalori: ${gunlereGoreKalori(hafta)}');
  print('Hepsi 20+ dk mı?   : ${hafta.every((a) => a.dakika >= 20)}');
  print('Pazar antrenmanı?  : ${hafta.any((a) => a.gun == 'Paz')}');
  print('Antrenman türleri  : ${turler(hafta)}');
  print('En çok kalori (3)  : ${enCokKalori(hafta, 3)}');
}
```

**Beklenen ekran çıktısı:**

```text
Toplam kalori      : 2170 kcal
Koşu süresi        : 90 dk
En uzun antrenman  : Cmt Yürüyüş (60 dk)
300+ kalori        : [Pzt Koşu, Sal Bisiklet, Cum Koşu]
Günlere göre kalori: {Pzt: 410, Sal: 410, Çar: 270, Per: 150, Cum: 380, Cmt: 550}
Hepsi 20+ dk mı?   : true
Pazar antrenmanı?  : false
Antrenman türleri  : {Koşu, Yürüyüş, Bisiklet, Yoga}
En çok kalori (3)  : [Sal Bisiklet (410), Cum Koşu (380), Pzt Koşu (320)]
```

---

# 16. Kaynaklar

| Kaynak | Adres | Konu |
|---|---|---|
| Sınıf değiştiricileri | [dart.dev/language/class-modifiers](https://dart.dev/language/class-modifiers) | `abstract`, `sealed`, `interface`, `final`, `base` |
| Mixin'ler | [dart.dev/language/mixins](https://dart.dev/language/mixins) | `mixin`, `with`, `on` |
| Extension metotlar | [dart.dev/language/extension-methods](https://dart.dev/language/extension-methods) | Hazır tiplere yetenek eklemek |
| Enum'lar | [dart.dev/language/enums](https://dart.dev/language/enums) | Basit ve gelişmiş enum'lar |
| Fonksiyonlar | [dart.dev/language/functions](https://dart.dev/language/functions) | İsimsiz fonksiyonlar, kapanışlar, `typedef` |
| Iterable koleksiyonlar | [dart.dev/libraries/collections/iterables](https://dart.dev/libraries/collections/iterables) | `where`, `map`, `any`, `every`, `firstWhere`, `fold` |
| Desenler | [dart.dev/language/patterns](https://dart.dev/language/patterns) | Sealed sınıflarla eksiksiz switch |

---

### Gelecek Hafta

**Hafta 6 — İstisnalar, Generic Tipler ve Asenkron Programlama:** Hataları yakalamak (`try`, `catch`, `finally`, `throw`); kendi istisna sınıflarımız; `List<T>` gibi generic tipleri kendimiz yazmak; `Future`, `async` ve `await` ile beklemek; `Stream` ile sürekli gelen veriler. Mobil uygulamalarda internetten veri çekmenin temeli bu konulardır.

**AI kuralı değişiyor:** 6. haftadan itibaren AI'ı **eş programcı** olarak kullanmaya başlayacağız. Kod yazdırmak serbest olacak; ama AI'ın yazdığı her satırı okuyup açıklayabilmeniz, doğrulamanız ve kullanımını `AI_LOG.md` dosyasında belgelemeniz gerekecek.

**Derse hazırlık:**
- Ödev 4'ü teslim edin. Çözümler derse ilk 15 dakikada birlikte yapılacak.
- Bu nottaki "Kendinizi Test Edin" sorularını çözün.
- Bölüm 6.4'te `SiparisDurumu.values.byName('kargo')` yazılırsa program **çöküyordu**. Bir uygulamanın çökmeden bu tür hatalarla nasıl başa çıkabileceğini düşünün. Gelecek haftanın ilk konusu bu.

---

*BMH309 Mobil Cihaz Programlama · Hafta 5 Ders Notu*
