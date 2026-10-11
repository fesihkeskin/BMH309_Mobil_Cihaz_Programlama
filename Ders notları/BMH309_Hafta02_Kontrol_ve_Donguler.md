# <font color='blue'>**Hafta 2 · Kontrol ve Döngü Yapıları**</font>

---
**Ders:** BMH309 Mobil Cihaz Programlama
**Konular:** if / else if / else · Üçlü operatör (ternary) · switch · Operatörler · for / while / do-while · break / continue / label · Kullanıcıdan veri alma
**Yazar:** Dr. Öğr. Üyesi Fesih Keskin

---

# Giriş

Geçen hafta yazdığımız programlar yukarıdan aşağıya, satır satır çalışıp bitiyordu. Gerçek bir uygulama ise sürekli **karar verir** ve bazı işleri **tekrar eder**:

- Pil %20'nin altına düştüyse uyarı göster. *(karar)*
- Kullanıcı şifreyi yanlış girdiyse tekrar sor, ama en fazla 3 kez. *(karar + tekrar)*
- Sunucu 404 döndürdüyse "İçerik bulunamadı" yaz. *(karar)*
- Listedeki her bildirimi ekrana bas. *(tekrar)*

Bu hafta programlarımıza bu iki yeteneği kazandıracağız. Burada öğrendiğiniz her yapıyı Flutter'da, ekranda neyin görüneceğine karar verirken ve listeleri ekrana dökerken kullanacaksınız.

### Bu Haftanın Hedefleri

Bu haftanın sonunda şunları yapabiliyor olmalısınız:

1. `if`, `else if`, `else` ile karar yapıları kurmak; koşulların sırasının neden önemli olduğunu açıklamak.
2. Üçlü operatör (`koşul ? a : b`) ile tek satırda değer seçmek.
3. `switch` deyimi ve Dart 3'ün `switch` ifadesi ile çok seçenekli kararlar yazmak.
4. Aritmetik, atama, karşılaştırma, mantıksal ve diğer operatörleri doğru öncelikle kullanmak.
5. `for`, `for-in`, `while` ve `do-while` döngülerini yazmak; hangisinin ne zaman kullanılacağına karar vermek.
6. `break`, `continue` ve etiketlerle (label) döngü akışını yönetmek.
7. Klavyeden veri alıp güvenli şekilde sayıya çevirmek ve doğrulamak.

### Bu Haftanın AI Kuralı

> **Seviye 0 — AI yok.** Bu nottaki örnekleri ve ödevi yapay zekâ araçları kullanmadan, kodları kendiniz yazarak çalışın. VS Code'da Copilot veya benzeri otomatik tamamlama açıksa kapatın. Kopyala-yapıştır serbest; ama her örneği yapıştırdıktan sonra **değerleri değiştirip** tekrar çalıştırın ve sonucu önceden tahmin etmeye çalışın.

---

# 0. Başlamadan Önce: Bu Notu VS Code'da Nasıl Kullanacaksınız?

### 0.1 Çalışma klasörü

Bilgisayarınızda bu hafta için bir klasör oluşturun ve VS Code'da açın (**File → Open Folder**):

```text
bmh309/
└── hafta2/
    ├── 03_01_if_temel.dart
    ├── 03_02_tek_satir_if.dart
    └── ...
```

Bu nottaki **her kod bloğu tek başına çalışan tam bir programdır.** Her bloğun ilk satırında önerilen dosya adı yazar. Örneğin:

```text
// Dosya: 03_01_if_temel.dart
```

Yapmanız gereken: VS Code'da **yeni bir dosya** oluşturun, adını bu şekilde verin (uzantısı mutlaka `.dart` olsun), kod bloğunun **tamamını** kopyalayıp yapıştırın ve kaydedin.

> **İsterseniz proje olarak da çalışabilirsiniz:** Terminalde `dart create hafta2` komutuyla bir proje oluşturup dosyaları `bin/` klasörüne koyabilirsiniz. Bu durumda çalıştırma komutu `dart run bin/03_01_if_temel.dart` olur. Tek dosyalarla çalışmak da tamamen yeterlidir.

### 0.2 Çalıştırma

İki yol vardır:

| Yol | Nasıl? | Çıktı nerede görünür? |
|---|---|---|
| **Run düğmesi** | `void main()` satırının hemen üstünde beliren **Run** yazısına tıklayın veya `F5` tuşuna basın. | VS Code'un alt panelindeki **Debug Console** |
| **Terminal** | `Ctrl` + `` ` `` ile terminali açın ve yazın: `dart run 03_01_if_temel.dart` | Terminal |

### 0.3 ⚠️ Klavyeden veri alan programlar için özel ayar

Bölüm 12, 13 ve 14'teki programlar sizden klavyeden veri ister. **Debug Console klavyeden veri kabul etmez**; program sizden bir şey bekler ama siz yazamazsınız. İki çözüm var:

1. Bu programları **terminalden** çalıştırın: `dart run 12_01_ilk_girdi.dart`
2. Ya da VS Code ayarlarında (`Ctrl + ,`) `dart.cliConsole` ayarını aratıp değerini **`terminal`** yapın. Bundan sonra Run düğmesi programı terminalde çalıştırır. Ayarlar JSON dosyasında karşılığı şudur:

```json
"dart.cliConsole": "terminal"
```

### 0.4 Hatalı örnekler (❌)

Notta **❌ işaretli bloklar bilerek hatalı yazılmıştır.** Amaç, hata mesajını görmeniz ve okumayı öğrenmenizdir. Bu blokları yapıştırdığınızda:

- **Derleme hatası** varsa VS Code ilgili satırın altını kırmızıyla çizer. Hata mesajını görmek için fareyi üzerine getirin veya **Problems** panelini açın (`Ctrl + Shift + M`). Program çalışmaz.
- **Çalışma zamanı hatası** varsa program çalışmaya başlar ve hatalı satıra gelince durur; hata mesajı çıktıda görünür.
- **Mantık hatası** varsa program hiç hata vermeden çalışır ama **yanlış sonuç** üretir. En tehlikeli hata türü budur.

### 0.5 Faydalı kısayollar

| İşlem | Kısayol |
|---|---|
| Kodu otomatik biçimlendir (`dart format`) | `Shift + Alt + F` (macOS: `Shift + Option + F`) |
| Problems paneli | `Ctrl + Shift + M` |
| Çalışan programı durdur | Terminalde `Ctrl + C` · VS Code'da kırmızı kare (Stop) |

> **Windows'ta Türkçe karakterler bozuk görünürse** (`ÅŸ` gibi): Terminalde bir kez `chcp 65001` yazın veya VS Code'un kendi terminalini kullanın.

---

# İçindekiler

1. [Program Akışı: Sıra, Karar, Tekrar](#1-program-akışı-sıra-karar-tekrar)
2. [Ön Bilgi: Karşılaştırma ve Mantıksal Operatörler](#2-ön-bilgi-karşılaştırma-ve-mantıksal-operatörler)
3. [if, else if ve else](#3-if-else-if-ve-else)
4. [Üçlü Operatör (Ternary)](#4-üçlü-operatör-ternary)
5. [switch Deyimi ve switch İfadesi](#5-switch-deyimi-ve-switch-ifadesi)
6. [Operatörler — Bölüm 1](#6-operatörler--bölüm-1)
7. [Operatörler — Bölüm 2](#7-operatörler--bölüm-2)
8. [for Döngüsü](#8-for-döngüsü)
9. [while Döngüsü](#9-while-döngüsü)
10. [do-while Döngüsü](#10-do-while-döngüsü)
11. [break, continue ve Etiketler (Label)](#11-break-continue-ve-etiketler-label)
12. [Kullanıcıdan Veri Alma](#12-kullanıcıdan-veri-alma)
13. [Hepsini Birleştirelim: Cep Cüzdan Uygulaması](#13-hepsini-birleştirelim-cep-cüzdan-uygulaması)
14. [Örnek Problem ve Farklı Çözüm Yolları](#14-örnek-problem-ve-farklı-çözüm-yolları)
15. [Özet](#15-özet)
16. [Kendinizi Test Edin](#16-kendinizi-test-edin)
17. [Ödev 1](#17-ödev-1)
18. [Kaynaklar](#18-kaynaklar)

---

# 1. Program Akışı: Sıra, Karar, Tekrar

Bir programın akışı üç temel yapıdan oluşur:

| Yapı | Anlamı | Dart'taki karşılığı |
|---|---|---|
| **Sıra** | Satırlar yukarıdan aşağıya sırayla çalışır. | Geçen haftaki tüm programlar |
| **Karar (seçim)** | Bir koşula göre bazı satırlar çalışır, bazıları atlanır. | `if`, `else`, üçlü operatör, `switch` |
| **Tekrar (döngü)** | Bazı satırlar birden çok kez çalışır. | `for`, `while`, `do-while` |

```text
   SIRA              KARAR                  TEKRAR
    │                  │                      │
 [işlem 1]        ┌─<koşul?>─┐           ┌─>[işlem]
    │           evet│        │hayır      │     │
 [işlem 2]      [A işlemi] [B işlemi]    │  <devam mı?>─evet─┘
    │               └───┬────┘           │     │hayır
 [işlem 3]              │                      ▼
```

> 🔗 **Flutter'da:** Bir ekranda yükleme göstergesi mi, ürün listesi mi, hata mesajı mı görüneceği bir **karardır**. Bir listedeki her ürün için bir kart çizmek bir **tekrardır**.

---

# 2. Ön Bilgi: Karşılaştırma ve Mantıksal Operatörler

`if` yapısını kullanabilmek için bir koşul yazabilmemiz gerekir. Koşullar genellikle **karşılaştırma** ve **mantıksal** operatörlerle kurulur. Bu operatörlerin tamamını Bölüm 6 ve 7'de ayrıntılı göreceğiz; şimdilik bu kadarını bilmeniz yeterli:

| Operatör | Anlamı | Örnek | Sonuç (`pil = 18` iken) |
|---|---|---|---|
| `==` | eşit mi? | `pil == 100` | `false` |
| `!=` | eşit değil mi? | `pil != 100` | `true` |
| `>` / `<` | büyük mü? / küçük mü? | `pil < 20` | `true` |
| `>=` / `<=` | büyük veya eşit mi? / küçük veya eşit mi? | `pil >= 18` | `true` |
| `&&` | VE: iki koşul da doğru mu? | `pil < 20 && !sarjda` | |
| `\|\|` | VEYA: koşullardan en az biri doğru mu? | `pil < 20 \|\| sarjda` | |
| `!` | DEĞİL: sonucu tersine çevir | `!sarjda` | |

Bu operatörlerin hepsi bir **`bool`** değer (`true` veya `false`) üretir.

**Örnek:**

```dart
// Dosya: 02_01_on_bilgi.dart
void main() {
  int pil = 18;
  bool sarjda = false;

  print(pil < 20);
  print(pil == 100);
  print(pil != 100);
  print(pil < 20 && !sarjda);
  print(pil < 20 || sarjda);
}
```

**Çıktı:**

```text
true
false
true
true
true
```

**Açıklama:** `pil < 20 && !sarjda` ifadesi "pil 20'den küçük **ve** şarjda **değil**" demektir. `pil < 20` doğru, `!sarjda` da doğru (çünkü `sarjda` yanlış); iki taraf da doğru olduğu için sonuç `true` olur.

> ⚠️ `=` ile `==` farklıdır. `=` **atama** yapar (`pil = 50` → pil'e 50 değerini ver), `==` **karşılaştırma** yapar (`pil == 50` → pil 50'ye eşit mi?).

---

# 3. if, else if ve else

## 3.1 if Yapısı

`if`, "**eğer** koşul doğruysa şu kodu çalıştır" demektir. Koşul **yanlışsa** süslü parantezin içi tamamen atlanır ve program bir sonraki satırdan devam eder.

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz, yalnızca yapıyı gösterir.
if (kosul) {
  // kosul true ise çalışacak kodlar
}
```

- Koşul mutlaka **normal parantez** `( )` içinde yazılır.
- Çalışacak kodlar **süslü parantez** `{ }` içinde yazılır. Bu bölgeye **blok** denir.
- Koşul bir `bool` değer üretmelidir.

**Örnek:**

```dart
// Dosya: 03_01_if_temel.dart
void main() {
  int pilSeviyesi = 15;

  if (pilSeviyesi < 20) {
    print('Pil seviyesi düşük, şarj cihazını takın.');
  }

  print('Program bitti.');
}
```

**Çıktı:**

```text
Pil seviyesi düşük, şarj cihazını takın.
Program bitti.
```

**Açıklama:** `pilSeviyesi < 20` ifadesi `15 < 20` yani `true` olduğu için blok çalıştı. `print('Program bitti.')` satırı `if` bloğunun **dışında** olduğu için koşuldan bağımsız olarak her durumda çalışır.

> **Deneyin:** `pilSeviyesi` değerini `50` yapıp tekrar çalıştırın. Bu kez yalnızca `Program bitti.` yazmalı.

## 3.2 Bloklar: Süslü Parantez ve Girinti

Python'da hangi satırların `if`'e ait olduğunu **girinti** belirler. Dart'ta bunu **süslü parantezler** belirler. Girinti Dart için zorunlu değildir, ama kodun okunabilmesi için şarttır. Kodunuzu `Shift + Alt + F` ile biçimlendirdiğinizde girinti otomatik olarak düzeltilir.

Blokta **tek bir satır** varsa süslü parantez yazılmayabilir:

**Örnek:**

```dart
// Dosya: 03_02_tek_satir_if.dart
void main() {
  int bildirim = 3;

  if (bildirim > 0) print('$bildirim yeni bildiriminiz var.');
}
```

**Çıktı:**

```text
3 yeni bildiriminiz var.
```

### ❌ Tuzak 1: Süslü parantezi unutmak

```dart
// Dosya: 03_03_tuzak_parantez.dart
// ❌ MANTIK HATASI: Program çalışır ama yanlış sonuç üretir.
void main() {
  int bildirim = 0;

  if (bildirim > 0)
    print('Yeni bildiriminiz var.');
    print('Bildirim simgesi gösterildi.'); // DİKKAT: Bu satır if'e ait DEĞİL!
}
```

**Çıktı:**

```text
Bildirim simgesi gösterildi.
```

**Açıklama:** Bildirim sayısı 0 olmasına rağmen ikinci mesaj yazıldı. Süslü parantez olmadığı için `if`'e **yalnızca ilk satır** aittir. İkinci satırın girintili olması hiçbir şey ifade etmez; Dart girintiye bakmaz. Bu kodu `Shift + Alt + F` ile biçimlendirirseniz VS Code ikinci satırı sola kaydırarak gerçeği gösterir.

> **Kural:** Blokta birden fazla satır varsa (veya ileride olabilecekse) **her zaman süslü parantez kullanın.** Tek satırlık kısa `if`'leri ise aynı satıra yazın.

### ❌ Tuzak 2: if'ten sonra noktalı virgül

```dart
// Dosya: 03_04_tuzak_noktali_virgul.dart
// ❌ MANTIK HATASI: Koşul yanlış olduğu halde blok çalışır.
void main() {
  int pil = 80;

  if (pil < 20); {
    print('Pil düşük!');
  }
}
```

**Çıktı:**

```text
Pil düşük!
```

**Açıklama:** `if (pil < 20);` satırındaki noktalı virgül, `if`'in **boş bir işlemle** bittiği anlamına gelir. Altındaki süslü parantez artık `if`'e ait değildir; bağımsız bir bloktur ve her zaman çalışır. `if (...)` satırının sonuna asla noktalı virgül koymayın.

## 3.3 Koşul Mutlaka bool Olmalıdır

Python ve JavaScript'te `if 3:` veya `if (liste)` gibi yazımlar mümkündür; sıfır olmayan sayılar ve dolu listeler "doğru" kabul edilir. **Dart'ta böyle bir kural yoktur.** Koşul mutlaka `true` ya da `false` üreten bir ifade olmalıdır.

```dart
// Dosya: 03_05_tuzak_bool.dart
// ❌ DERLEME HATASI
void main() {
  int bildirim = 3;

  if (bildirim) {
    print('Bildirim var');
  }
}
```

**Hata mesajı:**

```text
Conditions must have a static type of 'bool'.
```

*Türkçesi: "Koşulların statik tipi 'bool' olmalıdır."*

**Doğrusu:**

```dart
// Dosya: 03_06_bool_dogru.dart
void main() {
  int bildirim = 3;
  String mesaj = '';

  if (bildirim > 0) {
    print('Bildirim var');
  }

  if (mesaj.isEmpty) {
    print('Mesaj kutusu boş');
  }
}
```

**Çıktı:**

```text
Bildirim var
Mesaj kutusu boş
```

## 3.4 else

`else`, "**aksi halde**" demektir. `if` koşulu yanlış olduğunda çalışacak bloğu tanımlar. `if` ve `else` bloklarından **her zaman yalnızca biri** çalışır.

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
if (kosul) {
  // kosul true ise
} else {
  // kosul false ise
}
```

**Örnek:**

```dart
// Dosya: 03_07_else.dart
void main() {
  bool internetVar = false;

  if (internetVar) {
    print('Veriler sunucudan yükleniyor...');
  } else {
    print('İnternet bağlantısı yok. Çevrimdışı moddasınız.');
  }
}
```

**Çıktı:**

```text
İnternet bağlantısı yok. Çevrimdışı moddasınız.
```

**Açıklama:** `internetVar` zaten bir `bool` olduğu için `if (internetVar == true)` yazmamıza gerek yoktur; `if (internetVar)` yeterlidir ve daha okunurdur.

## 3.5 else if

İkiden fazla durum varsa `else if` kullanılır. Koşullar **yukarıdan aşağıya** sırayla denenir; **ilk doğru olan** koşulun bloğu çalışır ve geri kalanlara **hiç bakılmaz**. Hiçbiri doğru değilse varsa `else` bloğu çalışır.

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
if (kosul1) {
  // kosul1 true ise
} else if (kosul2) {
  // kosul1 false, kosul2 true ise
} else if (kosul3) {
  // kosul1 ve kosul2 false, kosul3 true ise
} else {
  // hiçbiri true değilse
}
```

**Örnek: Durum çubuğundaki pil göstergesi**

```dart
// Dosya: 03_08_else_if.dart
void main() {
  int pilSeviyesi = 18;
  bool sarjOluyor = false;

  if (sarjOluyor) {
    print('Şarj oluyor (%$pilSeviyesi)');
  } else if (pilSeviyesi <= 5) {
    print('KRİTİK! Cihaz kapanmak üzere.');
  } else if (pilSeviyesi <= 20) {
    print('Düşük pil: Güç tasarrufu modu önerilir.');
  } else {
    print('Pil durumu iyi (%$pilSeviyesi)');
  }
}
```

**Çıktı:**

```text
Düşük pil: Güç tasarrufu modu önerilir.
```

**Farklı değerlerle ne olur?**

| `pilSeviyesi` | `sarjOluyor` | Çalışan blok | Çıktı |
|---|---|---|---|
| 18 | false | 3. (`<= 20`) | Düşük pil: Güç tasarrufu modu önerilir. |
| 3 | false | 2. (`<= 5`) | KRİTİK! Cihaz kapanmak üzere. |
| 80 | false | `else` | Pil durumu iyi (%80) |
| 3 | true | 1. (`sarjOluyor`) | Şarj oluyor (%3) |

> **Deneyin:** Tablodaki değerleri tek tek kodda değiştirip sonuçları doğrulayın.

### ❌ Tuzak 3: Koşulların sırası

```dart
// Dosya: 03_09_tuzak_sira.dart
// ❌ MANTIK HATASI: Kritik pil uyarısına asla ulaşılamaz.
void main() {
  int pilSeviyesi = 3;

  if (pilSeviyesi <= 20) {
    print('Düşük pil');
  } else if (pilSeviyesi <= 5) {
    print('KRİTİK pil!');
  } else {
    print('Pil iyi');
  }
}
```

**Çıktı:**

```text
Düşük pil
```

**Açıklama:** Pil %3 olduğu halde "KRİTİK" yazmadı. Çünkü %3, ilk koşul olan `<= 20`'yi de sağlar ve ilk doğru koşulun bloğu çalıştıktan sonra diğerlerine bakılmaz. 5 ve altındaki her değer zaten 20 ve altındadır; bu yüzden ikinci kola **hiçbir zaman** ulaşılamaz. Derleyici bu hatayı fark etmez.

> **Kural:** `else if` zincirlerinde koşulları **özelden genele** sıralayın: önce dar aralık (`<= 5`), sonra geniş aralık (`<= 20`).

### Ayrı if'ler ile else if zinciri arasındaki fark

```dart
// Dosya: 03_10_ayri_if_zincir.dart
void main() {
  int puan = 95;

  print('--- Ayrı if blokları ---');
  if (puan >= 90) print('Harika!');
  if (puan >= 70) print('İyi!');
  if (puan >= 50) print('Geçti.');

  print('--- else if zinciri ---');
  if (puan >= 90) {
    print('Harika!');
  } else if (puan >= 70) {
    print('İyi!');
  } else if (puan >= 50) {
    print('Geçti.');
  }
}
```

**Çıktı:**

```text
--- Ayrı if blokları ---
Harika!
İyi!
Geçti.
--- else if zinciri ---
Harika!
```

**Açıklama:** Ayrı `if`'lerin **her biri bağımsız** olarak kontrol edilir; 95 üçünü de sağladığı için üç mesaj da yazıldı. `else if` zincirinde ise ilk doğru koşuldan sonra zincir biter. Durumlar birbirini dışlıyorsa (bir not ya "Harika" ya "İyi" olur, ikisi birden olmaz) `else if` kullanın.

## 3.6 Birleşik Koşullar: &&, ||, !

Birden fazla koşulu `&&` (VE), `||` (VEYA) ve `!` (DEĞİL) ile birleştirebiliriz.

**Örnek: Giriş ekranı doğrulaması**

```dart
// Dosya: 03_11_giris_dogrulama.dart
void main() {
  String eposta = 'ayse@ornek.com';
  String sifre = '12345';

  if (eposta.isEmpty || sifre.isEmpty) {
    print('Lütfen tüm alanları doldurun.');
  } else if (!eposta.contains('@')) {
    print('Geçerli bir e-posta adresi girin.');
  } else if (sifre.length < 8) {
    print('Şifre en az 8 karakter olmalı.');
  } else {
    print('Giriş yapılıyor...');
  }
}
```

**Çıktı:**

```text
Şifre en az 8 karakter olmalı.
```

**Açıklama:**
- `eposta.isEmpty || sifre.isEmpty`: Alanlardan **en az biri** boşsa uyarı verir.
- `!eposta.contains('@')`: E-postada `@` **yoksa** uyarı verir. `!` sonucu tersine çevirir.
- Sıralama bilinçlidir: Önce boş alan, sonra biçim, sonra uzunluk kontrol edilir. Kullanıcıya her seferinde en temel sorun gösterilir.

| `eposta` | `sifre` | Çıktı |
|---|---|---|
| `''` | `'12345'` | Lütfen tüm alanları doldurun. |
| `'ayse'` | `'12345678'` | Geçerli bir e-posta adresi girin. |
| `'ayse@ornek.com'` | `'12345'` | Şifre en az 8 karakter olmalı. |
| `'ayse@ornek.com'` | `'gizli2026'` | Giriş yapılıyor... |

> 🔗 **Flutter'da:** Form alanlarının doğrulanması (`validator`) tam olarak bu mantıkla yazılır. 3. haftada bu kodu bir fonksiyona dönüştüreceğiz.

## 3.7 İç İçe if (Nested if)

Bir `if` bloğunun içine başka bir `if` yazılabilir.

**Örnek: Kargo ücreti kontrolü**

```dart
// Dosya: 03_12_ic_ice_if.dart
void main() {
  bool girisYapti = true;
  bool premiumUye = false;
  double sepetTutari = 120.0;

  if (girisYapti) {
    print('Hoş geldiniz!');
    if (premiumUye) {
      print('Premium üyelere kargo ücretsiz.');
    } else {
      if (sepetTutari >= 150) {
        print('150 TL üzeri siparişte kargo ücretsiz.');
      } else {
        double eksik = 150 - sepetTutari;
        print('Ücretsiz kargo için ${eksik.toStringAsFixed(2)} TL daha ekleyin.');
      }
    }
  } else {
    print('Sipariş vermek için giriş yapmalısınız.');
  }
}
```

**Çıktı:**

```text
Hoş geldiniz!
Ücretsiz kargo için 30.00 TL daha ekleyin.
```

İç içe `if`'ler derinleştikçe kodu okumak zorlaşır. Aynı mantık `else if` ve `||` ile daha düz yazılabilir:

```dart
// Dosya: 03_13_ic_ice_sadelestirme.dart
void main() {
  bool girisYapti = true;
  bool premiumUye = false;
  double sepetTutari = 120.0;

  if (!girisYapti) {
    print('Sipariş vermek için giriş yapmalısınız.');
  } else if (premiumUye || sepetTutari >= 150) {
    print('Kargo ücretsiz.');
  } else {
    double eksik = 150 - sepetTutari;
    print('Ücretsiz kargo için ${eksik.toStringAsFixed(2)} TL daha ekleyin.');
  }
}
```

**Çıktı:**

```text
Ücretsiz kargo için 30.00 TL daha ekleyin.
```

**Açıklama:** İlk koşulu tersine çevirerek (`!girisYapti`) olumsuz durumu en başta ele aldık. Böylece kod iç içe geçmeden, düz bir zincir halinde okunuyor.

## 3.8 Erken Çıkış (return)

`main` fonksiyonunun içinde `return;` yazıldığında program o noktada biter ve altındaki satırlar çalışmaz. Bu yöntemle önce **hatalı durumlar** ele alınır, her şey yolundaysa asıl işe geçilir. Bu kalıba **erken çıkış** (guard clause) denir.

**Örnek:**

```dart
// Dosya: 03_14_erken_cikis.dart
void main() {
  String kullaniciAdi = 'mert';
  int yas = 15;

  if (kullaniciAdi.isEmpty) {
    print('Kullanıcı adı boş olamaz.');
    return;
  }

  if (yas < 18) {
    print('Bu uygulamayı kullanmak için 18 yaşından büyük olmalısınız.');
    return;
  }

  print('Kayıt başarılı: $kullaniciAdi');
}
```

**Çıktı:**

```text
Bu uygulamayı kullanmak için 18 yaşından büyük olmalısınız.
```

> **Deneyin:** `yas` değerini `20` yapın: `Kayıt başarılı: mert` yazmalı. Sonra `kullaniciAdi` değerini `''` yapın.

## 3.9 Boş Blok (Python'daki pass)

Python'da boş bir `if` bloğu hata verir ve `pass` yazmak gerekir. Dart'ta boş süslü parantez `{ }` geçerlidir; `pass` gibi bir anahtar kelimeye gerek yoktur. Yine de boş bloğa neden boş bırakıldığını anlatan bir yorum yazmak iyi bir alışkanlıktır.

```dart
// Dosya: 03_15_bos_blok.dart
void main() {
  int stok = 5;

  if (stok > 0) {
    // TODO: Stok varken yapılacak işlem daha sonra yazılacak.
  } else {
    print('Ürün tükendi.');
  }

  print('Stok kontrolü tamamlandı.');
}
```

**Çıktı:**

```text
Stok kontrolü tamamlandı.
```

## 3.10 Değişkenlerin Kapsamı (Scope)

Bir blok **içinde** tanımlanan değişken yalnızca o blok içinde geçerlidir. Blok bittiğinde değişken de yok olur.

```dart
// Dosya: 03_16_tuzak_kapsam.dart
// ❌ DERLEME HATASI
void main() {
  int puan = 85;

  if (puan >= 50) {
    String sonuc = 'Geçti';
  }

  print(sonuc);
}
```

**Hata mesajı:**

```text
Undefined name 'sonuc'.
```

*Türkçesi: "'sonuc' adında bir şey tanımlı değil."*

**Doğrusu:** Değişkeni bloğun **dışında**, önce tanımlayın; değerini blokların içinde verin.

```dart
// Dosya: 03_17_kapsam_dogru.dart
void main() {
  int puan = 85;
  String sonuc;

  if (puan >= 50) {
    sonuc = 'Geçti';
  } else {
    sonuc = 'Kaldı';
  }

  print(sonuc);
}
```

**Çıktı:**

```text
Geçti
```

**Açıklama:** `String sonuc;` satırında değişkene henüz değer verilmedi. Dart, `if` ve `else` kollarının **ikisinde de** değer atandığını görür ve `print(sonuc)` satırına izin verir. `else` kolunu silerseniz şu hatayı alırsınız: *"The non-nullable local variable 'sonuc' must be assigned before it can be used."* Yani "puan 50'nin altındaysa `sonuc`'un değeri ne olacak?" diye sorar.

## 3.11 Null Kontrolü ile if

Geçen hafta `?` ile işaretlenen tiplerin `null` olabileceğini görmüştük. Nullable bir değişkeni kullanmadan önce `if` ile null olup olmadığını kontrol ettiğimizde, Dart o bloğun içinde değişkeni artık null olmayan tip olarak kabul eder. Buna **tip yükseltme** (type promotion) denir.

```dart
// Dosya: 03_18_null_kontrol.dart
void main() {
  bool kuponGirildi = true;
  String? kuponKodu = kuponGirildi ? 'OGRENCI10' : null;

  if (kuponKodu != null) {
    print('Kupon uygulandı: $kuponKodu (${kuponKodu.length} karakter)');
  } else {
    print('Kupon girilmedi.');
  }
}
```

**Çıktı:**

```text
Kupon uygulandı: OGRENCI10 (9 karakter)
```

**Açıklama:** `kuponKodu` değişkeninin tipi `String?`'dir; yani null olabilir. Normalde `kuponKodu.length` yazamazdık. Ama `if (kuponKodu != null)` bloğunun içinde Dart, değişkenin null olmadığından emindir ve `.length`'e izin verir. İkinci satırdaki `? :` yapısını Bölüm 4'te göreceğiz.

> **Deneyin:** `kuponGirildi` değerini `false` yapın: `Kupon girilmedi.` yazmalı.

---

# 4. Üçlü Operatör (Ternary)

## 4.1 Yapısı

Üçlü operatör, kısa bir `if / else`'in **tek satırda** yazılmış halidir. Üç parçadan oluştuğu için bu adı alır: koşul, doğruysa değer, yanlışsa değer.

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
kosul ? dogruysaDeger : yanlissaDeger
```

**Örnek:**

```dart
// Dosya: 04_01_ternary.dart
void main() {
  bool karanlikMod = true;

  String tema = karanlikMod ? 'Koyu tema' : 'Açık tema';
  print(tema);

  // Aynı işin if / else ile yazılmış hali:
  String tema2;
  if (karanlikMod) {
    tema2 = 'Koyu tema';
  } else {
    tema2 = 'Açık tema';
  }
  print(tema2);
}
```

**Çıktı:**

```text
Koyu tema
Koyu tema
```

**Açıklama:** Altı satırlık `if / else` bloğu, üçlü operatörle tek satıra indi. Okunuşu: "`karanlikMod` doğru mu? **Evetse** `'Koyu tema'`, **değilse** `'Açık tema'`."

## 4.2 Üçlü Operatör Bir Değer Üretir

`if` bir **deyimdir** (statement): Bir iş yapar ama kendisi bir değer değildir. Üçlü operatör ise bir **ifadedir** (expression): Bir değer üretir. Bu yüzden değer beklenen her yere yazılabilir: bir değişkene atamaya, `print`'in içine, metnin içine.

**Örnek:**

```dart
// Dosya: 04_02_ternary_ifade.dart
void main() {
  int okunmamis = 0;
  int sepetAdedi = 3;

  print(okunmamis > 0 ? '$okunmamis yeni mesaj' : 'Yeni mesaj yok');

  print('Sepetinizde $sepetAdedi ürün var${sepetAdedi >= 3 ? ' (kargo ücretsiz!)' : ''}.');

  int adet = 1;
  print('$adet ${adet == 1 ? 'ürün' : 'ürünler'} seçildi');
}
```

**Çıktı:**

```text
Yeni mesaj yok
Sepetinizde 3 ürün var (kargo ücretsiz!).
1 ürün seçildi
```

**Açıklama:** İkinci satırda üçlü operatör metnin **içinde**, `${ }` arasında kullanıldı. Koşul doğruysa ek bir metin, yanlışsa boş metin (`''`) eklenir.

`if`'i değer yerine kullanmaya çalışmak hata verir:

```dart
// Dosya: 04_03_tuzak_if_deger.dart
// ❌ DERLEME HATASI: if bir değer üretmez.
void main() {
  bool karanlikMod = true;
  String tema = if (karanlikMod) 'Koyu' else 'Açık';
  print(tema);
}
```

VS Code bu satırda bir sözdizimi hatası gösterir. Değer gereken yerde üçlü operatör kullanılmalıdır.

### Python'daki gibi kullanım

Python notunda gördüğümüz `print("A") if a > b else print("B")` yazımının Dart karşılığı da mümkündür:

```dart
// Dosya: 04_04_ternary_print.dart
void main() {
  int a = 100;
  int b = 15;

  a > b ? print('A') : print('B'); // Çalışır ama önerilmez

  print(a > b ? 'A' : 'B');        // Önerilen yazım
}
```

**Çıktı:**

```text
A
A
```

**Açıklama:** İlk yazım çalışır, ancak üçlü operatörün asıl amacı **değer seçmektir**. İki farklı **işlem** yapılacaksa `if / else` kullanın; iki farklı **değerden** biri seçilecekse üçlü operatör kullanın.

## 4.3 İç İçe Üçlü Operatör

Üçlü operatörler iç içe yazılabilir:

```dart
// Dosya: 04_05_ic_ice_ternary.dart
void main() {
  int pil = 15;

  String durum = pil <= 5 ? 'Kritik' : pil <= 20 ? 'Düşük' : 'Normal';
  print(durum);
}
```

**Çıktı:**

```text
Düşük
```

**Açıklama:** Okunuşu: "Pil 5 veya altındaysa `Kritik`; değilse, pil 20 veya altındaysa `Düşük`; değilse `Normal`." Çalışır, ama koşul sayısı arttıkça okumak zorlaşır. **İkiden fazla durum varsa `if / else if` veya `switch` ifadesi (Bölüm 5) tercih edin.**

## 4.4 Null İçin Kısa Yol: ??

"Değer null değilse onu, null ise başka bir değeri kullan" durumu çok sık yaşanır. Bunun için üçlü operatörün kısa hali olan `??` operatörü kullanılır:

```dart
// Dosya: 04_06_null_ternary.dart
void main() {
  bool takmaAdVar = false;
  String? takmaAd = takmaAdVar ? 'Ayşo' : null;
  String ad = 'Ayşe';

  String gosterilecek1 = takmaAd != null ? takmaAd : ad;
  String gosterilecek2 = takmaAd ?? ad;

  print(gosterilecek1);
  print(gosterilecek2);
}
```

**Çıktı:**

```text
Ayşe
Ayşe
```

**Açıklama:** İki satır aynı işi yapar. `takmaAd ?? ad`, "takmaAd null değilse takmaAd'ı, null ise ad'ı kullan" demektir. VS Code ilk yazım için "`??` kullanabilirsiniz" önerisinde bulunabilir.

> 🔗 **Flutter'da:** Üçlü operatör Flutter'ın en çok kullanılan operatörlerinden biridir, çünkü ekran tasarımı iç içe **ifadelerle** kurulur ve oraya `if` bloğu yazılamaz:
> ```dart
> Text(karanlikMod ? 'Koyu tema' : 'Açık tema')
> Icon(favori ? Icons.favorite : Icons.favorite_border)
> ```

---

# 5. switch Deyimi ve switch İfadesi

Bir değişkenin **birçok farklı değerine** göre farklı işlem yapılacaksa, uzun bir `else if` zinciri yerine `switch` kullanılır. Dart'ta iki çeşit switch vardır:

| | **switch deyimi** (statement) | **switch ifadesi** (expression) |
|---|---|---|
| Ne yapar? | Duruma göre bir **iş yapar** | Duruma göre bir **değer üretir** |
| Kol yazımı | `case deger:` | `deger => sonuc,` |
| Varsayılan kol | `default:` | `_ =>` |
| Nerede kullanılır? | Bağımsız bir satır olarak | Değişkene atamada, `print` içinde, değer gereken her yerde |

## 5.1 switch Deyimi

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
switch (degisken) {
  case deger1:
    // degisken == deger1 ise
  case deger2:
    // degisken == deger2 ise
  default:
    // hiçbiri eşleşmezse
}
```

**Örnek:**

```dart
// Dosya: 05_01_switch_temel.dart
void main() {
  int gun = 3;

  switch (gun) {
    case 1:
      print('Pazartesi');
    case 2:
      print('Salı');
    case 3:
      print('Çarşamba');
    case 4:
      print('Perşembe');
    case 5:
      print('Cuma');
    case 6:
      print('Cumartesi');
    case 7:
      print('Pazar');
    default:
      print('Geçersiz gün numarası');
  }
}
```

**Çıktı:**

```text
Çarşamba
```

**Açıklama:** `gun` değeri sırayla `case` değerleriyle karşılaştırılır. `3` ile eşleşen kolun kodu çalışır ve switch'ten çıkılır. Hiçbir `case` eşleşmeseydi `default` kolu çalışırdı.

> ⚠️ **`break` gerekmez.** C, C++, Java veya eski Dart kodlarında her `case`'in sonunda `break;` görürsünüz. **Dart 3 ve sonrasında** içinde kod bulunan bir `case` bittiğinde switch'ten otomatik olarak çıkılır. `break` yazarsanız da kod çalışır, ama gereksizdir:
> ```dart
>     case 1:
>       print('Pazartesi');
>       break; // Dart 3'te gereksiz, ama hata değil
> ```

## 5.2 Birden Fazla Değer İçin Aynı Kol

Birden fazla değer aynı işi yapacaksa `||` ile birleştirilir:

```dart
// Dosya: 05_02_switch_coklu.dart
void main() {
  int gun = 6;

  switch (gun) {
    case 1 || 2 || 3 || 4 || 5:
      print('Hafta içi: Bildirimler mesai saatlerinde gönderilir.');
    case 6 || 7:
      print('Hafta sonu: Bildirimler sessize alındı.');
    default:
      print('Geçersiz gün numarası');
  }
}
```

**Çıktı:**

```text
Hafta sonu: Bildirimler sessize alındı.
```

Aynı işi yapmanın eski yolu, içi **boş** `case`'leri art arda yazmaktır. İçi boş bir `case`, bir sonraki `case`'in koduna "düşer":

```dart
// Dosya: 05_03_switch_bos_case.dart
void main() {
  int gun = 7;

  switch (gun) {
    case 6:
    case 7:
      print('Hafta sonu');
    default:
      print('Hafta içi veya geçersiz');
  }
}
```

**Çıktı:**

```text
Hafta sonu
```

## 5.3 String ile switch

```dart
// Dosya: 05_04_switch_string.dart
void main() {
  String siparisDurumu = 'kargoda';

  switch (siparisDurumu) {
    case 'hazirlaniyor':
      print('Siparişiniz hazırlanıyor.');
    case 'kargoda':
      print('Siparişiniz yolda.');
      print('Tahmini teslimat: 2 gün.');
    case 'teslim':
      print('Siparişiniz teslim edildi.');
    case 'iptal' || 'iade':
      print('Bu sipariş kapatıldı.');
    default:
      print('Bilinmeyen durum: $siparisDurumu');
  }
}
```

**Çıktı:**

```text
Siparişiniz yolda.
Tahmini teslimat: 2 gün.
```

**Açıklama:** Bir `case` içine birden fazla satır yazılabilir; süslü parantez gerekmez.

> ⚠️ **Büyük-küçük harf duyarlılığı:** `'Kargoda'` ile `'kargoda'` farklı metinlerdir. `siparisDurumu` değerini `'Kargoda'` yapıp çalıştırırsanız `default` kolu çalışır. Kullanıcıdan gelen metinlerde switch'ten önce `.toLowerCase()` kullanmak güvenlidir.

## 5.4 switch İfadesi

Dart 3 ile gelen **switch ifadesi**, duruma göre bir **değer üretir**. Mobil uygulama kodunda switch deyiminden çok daha sık kullanılır.

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
var sonuc = switch (degisken) {
  deger1 => sonuc1,
  deger2 || deger3 => sonuc2,
  _ => varsayilanSonuc,
};
```

**Örnek: Sunucu yanıt kodları**

```dart
// Dosya: 05_05_switch_ifadesi.dart
void main() {
  int durumKodu = 404;

  String mesaj = switch (durumKodu) {
    200 => 'İşlem başarılı.',
    401 || 403 => 'Yetkiniz yok, lütfen tekrar giriş yapın.',
    404 => 'Aradığınız içerik bulunamadı.',
    500 => 'Sunucu hatası, daha sonra tekrar deneyin.',
    _ => 'Beklenmeyen durum: $durumKodu',
  };

  print(mesaj);
}
```

**Çıktı:**

```text
Aradığınız içerik bulunamadı.
```

**Açıklama:**
- `case` ve `:` yerine `=>` kullanılır. Okunuşu: "Değer 404 **ise** sonuç şudur."
- Kollar **virgülle** ayrılır. Noktalı virgül yalnızca en sonda, kapanan süslü parantezden sonra gelir: `};`
- `_` (alt çizgi), "geri kalan her şey" anlamına gelir; `default`'un karşılığıdır.

| `durumKodu` | Çıktı |
|---|---|
| 200 | İşlem başarılı. |
| 403 | Yetkiniz yok, lütfen tekrar giriş yapın. |
| 500 | Sunucu hatası, daha sonra tekrar deneyin. |
| 302 | Beklenmeyen durum: 302 |

### ❌ Tuzak: Eksik durum

Switch ifadesi **tüm olası değerleri** karşılamak zorundadır. Çünkü her durumda bir değer üretmesi gerekir.

```dart
// Dosya: 05_06_tuzak_eksik_durum.dart
// ❌ DERLEME HATASI
void main() {
  int durumKodu = 302;

  String mesaj = switch (durumKodu) {
    200 => 'İşlem başarılı.',
    404 => 'Bulunamadı.',
  };

  print(mesaj);
}
```

**Hata mesajı:**

```text
The type 'int' isn't exhaustively matched by the switch cases since it doesn't match 'int()'.
```

*Türkçesi: "'int' tipi switch kollarıyla eksiksiz karşılanmamış."* Dart, "302 gelirse `mesaj` ne olacak?" diye soruyor. Çözüm: `_ => ...` kolunu eklemek.

> ⚠️ **Sık yapılan sözdizimi hatası:** Kolların sonuna virgül yerine noktalı virgül koymak. `200 => 'Başarılı';` yazarsanız VS Code hata gösterir.

### bool ile switch ifadesi

`bool` tipinin yalnızca iki değeri vardır. İkisini de yazarsanız `_` gerekmez:

```dart
// Dosya: 05_07_switch_bool.dart
void main() {
  bool sarjda = true;
  int pil = 64;

  String gosterge = switch (sarjda) {
    true => 'Şarj oluyor (%$pil)',
    false => 'Pil: %$pil',
  };

  print(gosterge);
}
```

**Çıktı:**

```text
Şarj oluyor (%64)
```

## 5.5 Aralıklarla switch: İlişkisel Desenler

Switch ifadesinde yalnızca tam değerler değil, **aralıklar** da yazılabilir. `>= 90`, `< 600` gibi kollara **ilişkisel desen** (relational pattern) denir. Kollar yine **yukarıdan aşağıya** denenir ve **ilk eşleşen** kol seçilir.

**Örnek: Harf notu**

```dart
// Dosya: 05_08_iliskisel_desen.dart
void main() {
  int puan = 78;

  String harf = switch (puan) {
    < 0 || > 100 => 'Geçersiz puan',
    >= 90 => 'AA',
    >= 85 => 'BA',
    >= 80 => 'BB',
    >= 75 => 'CB',
    >= 70 => 'CC',
    >= 60 => 'DC',
    >= 50 => 'DD',
    _ => 'FF',
  };

  print('Puan: $puan → Harf notu: $harf');
}
```

**Çıktı:**

```text
Puan: 78 → Harf notu: CB
```

**Açıklama:**
- İlk kol `< 0 || > 100`, geçersiz değerleri **en başta** yakalar. Bu kol en sona yazılsaydı, örneğin 105 puan `>= 90` koluna düşer ve `AA` alırdı.
- 78 puan `>= 90`, `>= 85` ve `>= 80` kollarını geçemez; ilk eşleştiği kol `>= 75` olur.

> Bu ölçek örnek amaçlıdır; üniversitenizin harf notu tablosu farklı olabilir.

**Örnek: Ekran genişliğine göre tasarım (`&&` ile aralık)**

```dart
// Dosya: 05_09_ekran_genisligi.dart
void main() {
  double genislik = 700;

  String duzen = switch (genislik) {
    <= 0 => 'Geçersiz genişlik',
    > 0 && < 600 => 'Kompakt: telefon (tek sütun)',
    >= 600 && < 840 => 'Orta: tablet veya katlanabilir (iki sütun)',
    _ => 'Geniş: yatay tablet veya masaüstü (yan menü)',
  };

  print('$genislik dp → $duzen');
}
```

**Çıktı:**

```text
700.0 dp → Orta: tablet veya katlanabilir (iki sütun)
```

**Açıklama:** `>= 600 && < 840`, "600 veya büyük **ve** 840'tan küçük" demektir. Genişlik `double` olduğu için çıktıda `700.0` yazdı. Material Design ekranları bu sınırlara göre kompakt, orta ve geniş olarak sınıflandırır.

> 🔗 **Flutter'da:** Ekran genişliği `MediaQuery.sizeOf(context).width` ile alınır ve tam olarak bu switch ile, telefonda tek sütunlu, tablette iki sütunlu düzen seçilir.

## 5.6 Koruma Koşulu: when *(ileri, isteğe bağlı)*

Bir kola ek bir koşul eklemek için `when` kullanılır:

```dart
// Dosya: 05_10_when.dart
void main() {
  int sepetTutari = 120;
  bool premium = true;

  String kargo = switch (sepetTutari) {
    _ when premium => 'Ücretsiz (Premium üye)',
    >= 150 => 'Ücretsiz',
    > 0 => '39,90 TL',
    _ => 'Sepet boş',
  };

  print('Kargo: $kargo');
}
```

**Çıktı:**

```text
Kargo: Ücretsiz (Premium üye)
```

**Açıklama:** İlk kol "değer ne olursa olsun (`_`), **eğer** `premium` doğruysa" demektir. `premium` değerini `false` yaparsanız `39,90 TL` yazar.

## 5.7 if mi, switch mi?

| Durum | Tercih |
|---|---|
| Bir veya iki koşul | `if / else` |
| Farklı değişkenlere bakan birleşik koşullar (`girisYapti && sepetTutari > 0`) | `if / else if` |
| **Tek bir değişkenin** birçok farklı değeri veya aralığı | `switch` |
| Duruma göre bir **değer** seçmek | switch **ifadesi** veya üçlü operatör |

---

# 6. Operatörler — Bölüm 1

Operatörler, değerler üzerinde işlem yapan sembollerdir. `a + b` ifadesinde `+` operatör, `a` ve `b` ise **işlenenlerdir** (operand). Bu bölümde aritmetik, atama, artırma/azaltma ve karşılaştırma operatörlerini; Bölüm 7'de mantıksal ve diğer operatörleri göreceğiz.

## 6.1 Aritmetik Operatörler

| Operatör | Anlamı | Örnek (`a = 17`, `b = 5`) | Sonuç |
|---|---|---|---|
| `+` | Toplama | `a + b` | `22` |
| `-` | Çıkarma | `a - b` | `12` |
| `*` | Çarpma | `a * b` | `85` |
| `/` | Bölme (sonuç **her zaman** `double`) | `a / b` | `3.4` |
| `~/` | Tam sayı bölmesi (ondalık kısım atılır) | `a ~/ b` | `3` |
| `%` | Mod (bölümden kalan) | `a % b` | `2` |
| `-` (tekli) | İşaret değiştirme | `-a` | `-17` |

**Örnek:**

```dart
// Dosya: 06_01_aritmetik.dart
void main() {
  int a = 17;
  int b = 5;

  print('a + b  = ${a + b}');
  print('a - b  = ${a - b}');
  print('a * b  = ${a * b}');
  print('a / b  = ${a / b}');
  print('a ~/ b = ${a ~/ b}');
  print('a % b  = ${a % b}');
  print('-a     = ${-a}');
}
```

**Çıktı:**

```text
a + b  = 22
a - b  = 12
a * b  = 85
a / b  = 3.4
a ~/ b = 3
a % b  = 2
-a     = -17
```

**Açıklama:** Python'da tam sayı bölmesi `//` ile yapılır; Dart'ta `~/` ile yapılır. Dart'ta `//` yorum satırı başlatır.

### Sonucun tipi

```dart
// Dosya: 06_02_sonuc_tipleri.dart
void main() {
  int adet = 3;
  double birimFiyat = 49.5;

  var toplam = adet * birimFiyat;
  var ortalama = 10 / 4;
  var tamBolum = 10 ~/ 4;

  print(toplam);
  print(ortalama);
  print(tamBolum);
  print(toplam.runtimeType);
  print(tamBolum.runtimeType);
}
```

**Çıktı:**

```text
148.5
2.5
2
double
int
```

**Açıklama:**
- `int` ile `double` arasındaki işlemin sonucu `double` olur.
- `/` iki tam sayıyla bile kullanılsa sonuç `double` olur: `10 / 4` → `2.5`.
- `~/` her zaman `int` verir.
- `runtimeType`, bir değerin çalışma anındaki tipini gösterir.

### ~/ ve % ile pratik hesaplar

```dart
// Dosya: 06_03_bolme_kalan.dart
void main() {
  // Müzik çalar: saniyeyi dakika ve saniyeye çevir
  int toplamSaniye = 227;
  int dakika = toplamSaniye ~/ 60;
  int saniye = toplamSaniye % 60;
  print('Şarkı süresi: $dakika dk $saniye sn');

  // Tek mi, çift mi?
  int sayi = 7;
  print('$sayi ${sayi % 2 == 0 ? 'çift' : 'tek'} sayıdır.');

  // Sayfalama: 23 ürün, sayfa başına 10 ürün → kaç sayfa?
  int toplamUrun = 23;
  int sayfaBasina = 10;
  int sayfaSayisi = (toplamUrun + sayfaBasina - 1) ~/ sayfaBasina;
  print('$toplamUrun ürün, sayfa başına $sayfaBasina → $sayfaSayisi sayfa');
}
```

**Çıktı:**

```text
Şarkı süresi: 3 dk 47 sn
7 tek sayıdır.
23 ürün, sayfa başına 10 → 3 sayfa
```

**Açıklama:**
- `227 ~/ 60` = 3 (tam dakika), `227 % 60` = 47 (kalan saniye).
- Bir sayının 2'ye bölümünden kalan 0 ise sayı çifttir.
- Sayfalama formülü: `23 ~/ 10` bize 2 verirdi ama son 3 ürün için bir sayfa daha gerekir. Bölünene `sayfaBasina - 1` eklemek, bölümü yukarı yuvarlar: `(23 + 9) ~/ 10` = `32 ~/ 10` = 3.

> 🔗 **Flutter'da:** Uzun listelerde sayfa sayfa veri yüklerken ve ızgara (grid) görünümlerinde satır/sütun hesaplarken `~/` ve `%` sürekli kullanılır.

### Sıfıra bölme

```dart
// Dosya: 06_04_sifira_bolme.dart
void main() {
  print(10 / 0);
  print(-10 / 0);
  print(0 / 0);
  // print(10 ~/ 0); // Bu satırın başındaki // işaretini kaldırırsanız program HATA ile durur.
}
```

**Çıktı:**

```text
Infinity
-Infinity
NaN
```

**Açıklama:** `double` bölmede sıfıra bölme program çökmesine yol açmaz; sonuç sonsuz (`Infinity`) veya "sayı değil" (`NaN`, *Not a Number*) olur. Tam sayı bölmesi `~/` ise sıfıra bölmede **çalışma zamanı hatası** verir. Kullanıcıdan gelen bir sayıyla bölme yapmadan önce sıfır olup olmadığını kontrol edin.

## 6.2 Metinlerle + ve * Operatörleri

```dart
// Dosya: 06_05_string_operatorleri.dart
void main() {
  String ad = 'Cep';
  String soyad = 'Market';

  print(ad + ' ' + soyad);
  print('$ad $soyad');
  print('-' * 20);
  print('Değerlendirme: ' + '*' * 4);
}
```

**Çıktı:**

```text
Cep Market
Cep Market
--------------------
Değerlendirme: ****
```

**Açıklama:**
- `+` iki metni birleştirir. Ancak Dart'ta önerilen yol interpolation'dır: `'$ad $soyad'`.
- `metin * sayi`, metni o kadar kez tekrarlar. Ayraç çizgileri ve basit grafikler için kullanışlıdır.
- Son satırda `*` işlemi `+`'dan önce yapılır (işlem önceliği, Bölüm 7.6).

### ❌ Tuzak: Metin ile sayıyı + ile birleştirmek

```dart
// Dosya: 06_06_tuzak_string_sayi.dart
// ❌ DERLEME HATASI
void main() {
  int yas = 25;
  print('Yaş: ' + yas);
}
```

**Hata mesajı:**

```text
The argument type 'int' can't be assigned to the parameter type 'String'.
```

**Doğrusu:** `print('Yaş: $yas');` veya `print('Yaş: ' + yas.toString());`

## 6.3 Atama ve Bileşik Atama Operatörleri

| Operatör | Örnek | Eşdeğeri |
|---|---|---|
| `=` | `a = 5` | `a`'ya 5 değerini ver |
| `+=` | `a += 3` | `a = a + 3` |
| `-=` | `a -= 3` | `a = a - 3` |
| `*=` | `a *= 3` | `a = a * 3` |
| `/=` | `a /= 3` | `a = a / 3` (yalnızca `double` değişkenlerde) |
| `~/=` | `a ~/= 3` | `a = a ~/ 3` |
| `%=` | `a %= 3` | `a = a % 3` |

**Örnek:**

```dart
// Dosya: 06_07_atama.dart
void main() {
  int puan = 100;
  print('Başlangıç : $puan');

  puan += 20;
  print('+= 20     : $puan');

  puan -= 30;
  print('-= 30     : $puan');

  puan *= 2;
  print('*= 2      : $puan');

  puan ~/= 3;
  print('~/= 3     : $puan');

  puan %= 7;
  print('%= 7      : $puan');

  double bakiye = 100;
  bakiye /= 4;
  print('bakiye /= 4 → $bakiye');
}
```

**Çıktı:**

```text
Başlangıç : 100
+= 20     : 120
-= 30     : 90
*= 2      : 180
~/= 3     : 60
%= 7      : 4
bakiye /= 4 → 25.0
```

**Açıklama:** `60 % 7` = 4 (60 = 7 × 8 + 4).

> ⚠️ `int` bir değişkende `/=` kullanılamaz: `puan /= 2;` yazarsanız *"A value of type 'double' can't be assigned to a variable of type 'int'."* hatası alırsınız. Çünkü `/` her zaman `double` üretir. Tam sayı değişkende `~/=` kullanın.

## 6.4 Artırma ve Azaltma: ++ ve --

`sayac++`, `sayac += 1` ile aynıdır; `sayac--` ise `sayac -= 1` ile. Döngülerde çok sık kullanılır.

İki yazımı vardır ve bir ifadenin **içinde** kullanıldıklarında farklı davranırlar:

| Yazım | Adı | Davranış |
|---|---|---|
| `a++` | Sonek (postfix) | Önce `a`'nın **mevcut** değerini kullan, **sonra** artır |
| `++a` | Önek (prefix) | **Önce** artır, sonra **yeni** değeri kullan |

**Örnek:**

```dart
// Dosya: 06_08_artirma_azaltma.dart
void main() {
  int sayac = 5;
  sayac++;
  print(sayac);
  sayac--;
  print(sayac);

  int a = 5;
  int b = a++; // Önce b'ye 5 atanır, sonra a 6 olur
  print('a = $a, b = $b');

  int c = 5;
  int d = ++c; // Önce c 6 olur, sonra d'ye 6 atanır
  print('c = $c, d = $d');
}
```

**Çıktı:**

```text
6
5
a = 6, b = 5
c = 6, d = 6
```

**Açıklama:** Tek başına bir satırda (`sayac++;`) kullanıldığında iki yazım arasında fark yoktur. Fark yalnızca `int b = a++;` gibi bir ifadenin içinde ortaya çıkar. Okunabilirlik için `++` ve `--`'yi genellikle tek başına kullanın.

## 6.5 Karşılaştırma Operatörleri

| Operatör | Anlamı |
|---|---|
| `==` | Eşit mi? |
| `!=` | Eşit değil mi? |
| `>` | Büyük mü? |
| `<` | Küçük mü? |
| `>=` | Büyük veya eşit mi? |
| `<=` | Küçük veya eşit mi? |

**Örnek:**

```dart
// Dosya: 06_09_karsilastirma.dart
void main() {
  int x = 10;
  double y = 10.0;
  String s1 = 'flutter';
  String s2 = 'Flutter';

  print(x == y);
  print(x != 3);
  print(x >= 10);
  print(s1 == s2);
  print(s1 == s2.toLowerCase());
  print('elma'.compareTo('armut') > 0);
}
```

**Çıktı:**

```text
true
true
true
false
true
true
```

**Açıklama:**
- `10` (int) ile `10.0` (double) sayısal olarak eşittir.
- Dart'ta `==`, metinlerin **içeriğini** karşılaştırır (Java'daki gibi `equals` gerekmez). Ancak büyük-küçük harfe duyarlıdır.
- Metinlerde `<` ve `>` kullanılamaz. Alfabetik sıralama için `compareTo` kullanılır: İlk metin alfabede **sonra** geliyorsa pozitif, **önce** geliyorsa negatif, eşitse 0 döner. `'elma'`, `'armut'`tan sonra gelir.

```dart
// Dosya: 06_10_tuzak_metin_karsilastirma.dart
// ❌ DERLEME HATASI
void main() {
  print('elma' < 'armut');
}
```

**Hata mesajı:**

```text
The operator '<' isn't defined for the type 'String'.
```

---

# 7. Operatörler — Bölüm 2

## 7.1 Mantıksal Operatörler

| `A` | `B` | `A && B` (VE) | `A \|\| B` (VEYA) | `!A` (DEĞİL) |
|---|---|---|---|---|
| true | true | **true** | **true** | false |
| true | false | false | **true** | false |
| false | true | false | **true** | **true** |
| false | false | false | false | **true** |

- `&&`: **Her iki** taraf da doğruysa doğru.
- `||`: **En az bir** taraf doğruysa doğru.
- `!`: Sonucu tersine çevirir.

**Örnek: Ödeme butonu ne zaman aktif olur?**

```dart
// Dosya: 07_01_mantiksal.dart
void main() {
  bool girisYapti = true;
  bool sepetBos = false;
  bool adresVar = true;
  bool kampanyaAktif = false;
  bool premium = true;

  bool odemeAktif = girisYapti && !sepetBos && adresVar;
  bool indirimVar = kampanyaAktif || premium;

  print('Ödeme butonu aktif mi? $odemeAktif');
  print('İndirim uygulanacak mı? $indirimVar');
}
```

**Çıktı:**

```text
Ödeme butonu aktif mi? true
İndirim uygulanacak mı? true
```

**Açıklama:** Ödeme butonunun aktif olması için üç şartın **hepsi** sağlanmalı: giriş yapılmış, sepet boş **değil**, adres var. İndirim için kampanya **veya** premium üyelikten biri yeterli.

> **Deneyin:** `sepetBos` değerini `true` yapın; ödeme butonu `false` olmalı.

## 7.2 Kısa Devre Değerlendirme

`&&` ve `||` operatörleri soldan sağa çalışır ve sonuç **sol taraftan belli oluyorsa sağ tarafa hiç bakmaz**:
- `false && ...` → Sağ ne olursa olsun sonuç `false`; sağ taraf çalıştırılmaz.
- `true || ...` → Sağ ne olursa olsun sonuç `true`; sağ taraf çalıştırılmaz.

Bu davranış, null kontrolünü güvenli hale getirir:

```dart
// Dosya: 07_02_kisa_devre.dart
void main() {
  bool kullaniciVar = false;
  String? kullaniciAdi = kullaniciVar ? 'ayse' : null;

  if (kullaniciAdi != null && kullaniciAdi.length > 3) {
    print('Kullanıcı adı geçerli.');
  } else {
    print('Kullanıcı adı yok veya çok kısa.');
  }

  if (kullaniciAdi == null || kullaniciAdi.isEmpty) {
    print('Lütfen bir kullanıcı adı girin.');
  }
}
```

**Çıktı:**

```text
Kullanıcı adı yok veya çok kısa.
Lütfen bir kullanıcı adı girin.
```

**Açıklama:** `kullaniciAdi` null olduğu için `kullaniciAdi != null` false'tur ve `kullaniciAdi.length` **hiç çalıştırılmaz**. Kısa devre olmasaydı null bir değerin uzunluğu istenecekti. Dart da bunu bilir: `&&`'nin sağ tarafında `kullaniciAdi`'nı null olmayan tip olarak kabul eder.

> **Kural:** Null kontrolünü her zaman **sola** yazın: `x != null && x.length > 3` ✓ — `x.length > 3 && x != null` ✗

## 7.3 Tip Test Operatörleri: is, is!, as

| Operatör | Anlamı |
|---|---|
| `is` | Bu değer şu tipte mi? |
| `is!` | Bu değer şu tipte **değil** mi? |
| `as` | Bu değeri şu tip olarak kullan (yanlışsa çalışma zamanı hatası) |

```dart
// Dosya: 07_03_tip_test.dart
void main() {
  Object gelenVeri = 42; // Örneğin sunucudan gelen ve tipi bilinmeyen bir veri

  if (gelenVeri is int) {
    print('Tam sayı geldi: ${gelenVeri + 1}');
  }

  if (gelenVeri is! String) {
    print('Gelen veri bir metin değil.');
  }

  Object metin = 'Merhaba';
  String s = metin as String;
  print(s.toUpperCase());
}
```

**Çıktı:**

```text
Tam sayı geldi: 43
Gelen veri bir metin değil.
MERHABA
```

**Açıklama:** `Object` her türlü değeri tutabilen genel bir tiptir. `is int` kontrolünden sonra Dart, `if` bloğunun içinde `gelenVeri`'yi `int` kabul eder ve `+ 1` işlemine izin verir. `as` ise "bunun bir String olduğundan eminim" demektir; yanılırsanız program çöker. Bu nedenle mümkün olduğunda `is` ile kontrol etmek daha güvenlidir.

> 🔗 **Flutter'da:** İnternetten gelen JSON verisinde her alanın tipi `dynamic`'tir; `is` ve `as` ile tip kontrolü yapılır. Bunu internetten veri çekme haftasında göreceksiniz.

## 7.4 Null Operatörleri (Hatırlatma)

Geçen hafta tanıştığımız null operatörleri:

| Operatör | Anlamı |
|---|---|
| `??` | Soldaki null ise sağdakini kullan |
| `??=` | Değişken null ise bu değeri ata |
| `?.` | Nesne null ise dur ve null döndür; değilse eriş |

```dart
// Dosya: 07_04_null_operatorleri.dart
void main() {
  bool fotoYuklendi = false;
  String? profilFoto = fotoYuklendi ? 'ayse.jpg' : null;

  print(profilFoto ?? 'varsayilan_avatar.png');
  print(profilFoto?.length);

  profilFoto ??= 'varsayilan_avatar.png';
  print(profilFoto);
}
```

**Çıktı:**

```text
varsayilan_avatar.png
null
varsayilan_avatar.png
```

## 7.5 Bit Düzeyi Operatörler *(bilgi amaçlı)*

Bu operatörler sayıların ikilik (binary) karşılıkları üzerinde çalışır. Mobil uygulama geliştirmede nadiren kullanılır; tanımanız yeterlidir.

| Operatör | Anlamı |
|---|---|
| `&` | Bit düzeyi VE |
| `\|` | Bit düzeyi VEYA |
| `^` | Bit düzeyi ÖZEL VEYA (XOR) |
| `<<` / `>>` | Bitleri sola / sağa kaydır |

```dart
// Dosya: 07_05_bit_operatorleri.dart
void main() {
  int a = 6; // ikilik: 110
  int b = 3; // ikilik: 011

  print(a & b);
  print(a | b);
  print(a ^ b);
  print(a << 1);
  print(a >> 1);
  print(a.toRadixString(2));
}
```

**Çıktı:**

```text
2
7
5
12
3
110
```

**Açıklama:** `110 & 011` = `010` (2), `110 | 011` = `111` (7), `110 ^ 011` = `101` (5). Sola bir bit kaydırmak 2 ile çarpmak, sağa kaydırmak 2'ye tam bölmek demektir. `toRadixString(2)` bir sayıyı ikilik tabanda metne çevirir.

## 7.6 İşlem Önceliği

Bir ifadede birden fazla operatör varsa, hangisinin önce yapılacağını **öncelik** belirler. Matematikteki gibi çarpma toplamadan önce yapılır.

| Öncelik (yüksekten düşüğe) | Operatörler |
|---|---|
| 1. Sonek | `a++` `a--` `a.b` `a?.b` `a!` `a()` |
| 2. Önek | `-a` `!a` `++a` `--a` |
| 3. Çarpımsal | `*` `/` `~/` `%` |
| 4. Toplamsal | `+` `-` |
| 5. Kaydırma | `<<` `>>` |
| 6. Bit düzeyi | `&`, sonra `^`, sonra `\|` |
| 7. İlişkisel ve tip | `<` `>` `<=` `>=` `is` `is!` `as` |
| 8. Eşitlik | `==` `!=` |
| 9. Mantıksal VE | `&&` |
| 10. Mantıksal VEYA | `\|\|` |
| 11. If-null | `??` |
| 12. Koşul | `? :` |
| 13. Atama | `=` `+=` `-=` ... |

**Örnek:**

```dart
// Dosya: 07_06_oncelik.dart
void main() {
  print(2 + 3 * 4);
  print((2 + 3) * 4);
  print(10 - 4 - 3);
  print(-2 * -3);

  bool a = true;
  bool b = false;
  bool c = false;

  print(a || b && c);
  print((a || b) && c);
}
```

**Çıktı:**

```text
14
20
3
6
true
false
```

**Açıklama:**
- `2 + 3 * 4` → önce `3 * 4 = 12`, sonra `2 + 12 = 14`.
- `10 - 4 - 3` → aynı öncelikteki işlemler soldan sağa: `(10 - 4) - 3 = 3`.
- `a || b && c` → `&&` önce: `a || (b && c)` = `true || false` = `true`.
- `(a || b) && c` → parantez önce: `true && false` = `false`.

> **Kural:** Öncelikten emin değilseniz **parantez kullanın**. `(a && b) || c` yazmak, kodu okuyan herkesin işini kolaylaştırır.

---

# 8. for Döngüsü

## 8.1 Neden Döngü?

Üç bildirim göndermek için üç satır yazabiliriz. Peki 300 bildirim için? Döngüler, bir kod bloğunu **istediğimiz kadar tekrar** çalıştırmamızı sağlar.

```dart
// Dosya: 08_01_neden_dongu.dart
void main() {
  // Döngü olmadan:
  print('Bildirim 1 gönderildi');
  print('Bildirim 2 gönderildi');
  print('Bildirim 3 gönderildi');

  print('---');

  // Döngü ile:
  for (int i = 1; i <= 3; i++) {
    print('Bildirim $i gönderildi');
  }
}
```

**Çıktı:**

```text
Bildirim 1 gönderildi
Bildirim 2 gönderildi
Bildirim 3 gönderildi
---
Bildirim 1 gönderildi
Bildirim 2 gönderildi
Bildirim 3 gönderildi
```

**Açıklama:** Döngülü versiyonda `3` sayısını `300` yapmak yeterlidir; satır sayısı değişmez.

## 8.2 for Döngüsünün Yapısı

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
for (baslangic; kosul; artis) {
  // koşul true olduğu sürece tekrar eden kodlar
}
```

| Parça | Ne zaman çalışır? | Örnek |
|---|---|---|
| **Başlangıç** | Döngü başlamadan önce **bir kez** | `int i = 0` |
| **Koşul** | **Her turdan önce** kontrol edilir; `false` ise döngü biter | `i < 4` |
| **Artış** | **Her turun sonunda** çalışır | `i++` |

**Örnek:**

```dart
// Dosya: 08_02_for_yapisi.dart
void main() {
  for (int i = 0; i < 4; i++) {
    print('i = $i');
  }
  print('Döngü bitti.');
}
```

**Çıktı:**

```text
i = 0
i = 1
i = 2
i = 3
Döngü bitti.
```

**Adım adım izleme:**

| Adım | `i` | `i < 4` | Ne olur? |
|---|---|---|---|
| Başlangıç | 0 | | `i` oluşturulur |
| 1. tur | 0 | true | `i = 0` yazılır, `i++` → 1 |
| 2. tur | 1 | true | `i = 1` yazılır, `i++` → 2 |
| 3. tur | 2 | true | `i = 2` yazılır, `i++` → 3 |
| 4. tur | 3 | true | `i = 3` yazılır, `i++` → 4 |
| Kontrol | 4 | **false** | Döngü biter, `Döngü bitti.` yazılır |

> **Kural:** `for (int i = 0; i < n; i++)` döngüsü tam olarak **n kez** döner ve `i` değeri 0'dan n-1'e kadar gider. Bu kalıbı ezberleyin; listelerle çalışırken sürekli kullanacaksınız.

## 8.3 Farklı for Kalıpları

### Geri sayım

```dart
// Dosya: 08_03_geri_sayim.dart
void main() {
  for (int saniye = 5; saniye >= 1; saniye--) {
    print('Doğrulama kodunun kalan süresi: $saniye sn');
  }
  print('Kodun süresi doldu. Yeni kod isteyin.');
}
```

**Çıktı:**

```text
Doğrulama kodunun kalan süresi: 5 sn
Doğrulama kodunun kalan süresi: 4 sn
Doğrulama kodunun kalan süresi: 3 sn
Doğrulama kodunun kalan süresi: 2 sn
Doğrulama kodunun kalan süresi: 1 sn
Kodun süresi doldu. Yeni kod isteyin.
```

### Farklı adım büyüklüğü

```dart
// Dosya: 08_04_adim.dart
void main() {
  for (int yuzde = 0; yuzde <= 100; yuzde += 25) {
    print('Yükleniyor... %$yuzde');
  }
}
```

**Çıktı:**

```text
Yükleniyor... %0
Yükleniyor... %25
Yükleniyor... %50
Yükleniyor... %75
Yükleniyor... %100
```

### Değer biriktirme

Bir döngüde değer biriktirmek için döngüden **önce** bir değişken tanımlanır ve her turda üzerine eklenir.

```dart
// Dosya: 08_05_toplam.dart
void main() {
  int toplamAdim = 0;

  for (int gun = 1; gun <= 7; gun++) {
    int gunlukAdim = 5000 + gun * 500; // Örnek veri
    toplamAdim += gunlukAdim;
    print('Gün $gun: $gunlukAdim adım');
  }

  print('Haftalık toplam: $toplamAdim adım');
  print('Günlük ortalama: ${toplamAdim ~/ 7} adım');
}
```

**Çıktı:**

```text
Gün 1: 5500 adım
Gün 2: 6000 adım
Gün 3: 6500 adım
Gün 4: 7000 adım
Gün 5: 7500 adım
Gün 6: 8000 adım
Gün 7: 8500 adım
Haftalık toplam: 49000 adım
Günlük ortalama: 7000 adım
```

**Açıklama:** `toplamAdim` döngünün **dışında** tanımlandı. Döngünün içinde tanımlansaydı her turda sıfırlanırdı ve döngüden sonra erişilemezdi.

### İlerleme çubuğu

```dart
// Dosya: 08_06_ilerleme_cubugu.dart
void main() {
  int toplamAdim = 10;

  for (int adim = 0; adim <= toplamAdim; adim += 2) {
    String dolu = '#' * adim;
    String bos = '-' * (toplamAdim - adim);
    int yuzde = adim * 100 ~/ toplamAdim;
    print('[$dolu$bos] %$yuzde');
  }
}
```

**Çıktı:**

```text
[----------] %0
[##--------] %20
[####------] %40
[######----] %60
[########--] %80
[##########] %100
```

## 8.4 İç İçe for Döngüleri

Bir döngünün içine başka bir döngü yazılabilir. Dıştaki döngünün **her turu** için içteki döngü **baştan sona** çalışır.

**Örnek: Telefon ana ekranındaki simge ızgarası**

```dart
// Dosya: 08_07_ic_ice_for.dart
void main() {
  int satirSayisi = 3;
  int sutunSayisi = 4;

  for (int satir = 0; satir < satirSayisi; satir++) {
    String satirMetni = '';
    for (int sutun = 0; sutun < sutunSayisi; sutun++) {
      int indeks = satir * sutunSayisi + sutun;
      satirMetni += '[${indeks.toString().padLeft(2)}] ';
    }
    print(satirMetni);
  }
}
```

**Çıktı:**

```text
[ 0] [ 1] [ 2] [ 3] 
[ 4] [ 5] [ 6] [ 7] 
[ 8] [ 9] [10] [11] 
```

**Açıklama:**
- Dış döngü 3 kez (satırlar), iç döngü her satır için 4 kez (sütunlar) döner: toplam 3 × 4 = 12 tur.
- `indeks = satir * sutunSayisi + sutun` formülü, ızgaradaki bir hücrenin **sıra numarasını** verir. Örneğin satır 1, sütun 2 → 1 × 4 + 2 = 6.
- `padLeft(2)`, tek basamaklı sayıların başına boşluk ekleyerek hizalar.

> 🔗 **Flutter'da:** Ürünleri ızgara şeklinde gösteren `GridView`, her hücre için size bir **indeks** verir. Satır ve sütunu bulmak için bu formülün tersini kullanırsınız: `satir = indeks ~/ sutunSayisi`, `sutun = indeks % sutunSayisi`.

## 8.5 for-in Döngüsü

Bir **topluluğun** (liste gibi) her elemanını sırayla dolaşmak için `for-in` kullanılır. Sayaç, koşul ve artış yazmanıza gerek yoktur.

> **Liste önizlemesi:** Listeleri 3. haftada ayrıntılı göreceğiz. Şimdilik bilmeniz gereken: Köşeli parantez içinde virgülle ayrılmış değerler bir **liste** oluşturur: `['a', 'b', 'c']`

**Örnek:**

```dart
// Dosya: 08_08_for_in.dart
void main() {
  var bildirimler = ['Kargonuz yola çıktı', 'Yeni kampanya!', 'Şifreniz değiştirildi'];

  for (var bildirim in bildirimler) {
    print('- $bildirim');
  }

  print('---');

  int sira = 0;
  for (var bildirim in bildirimler) {
    sira++;
    print('$sira. $bildirim (${bildirim.length} karakter)');
  }
}
```

**Çıktı:**

```text
- Kargonuz yola çıktı
- Yeni kampanya!
- Şifreniz değiştirildi
---
1. Kargonuz yola çıktı (19 karakter)
2. Yeni kampanya! (14 karakter)
3. Şifreniz değiştirildi (21 karakter)
```

**Açıklama:** Okunuşu: "`bildirimler` içindeki **her** `bildirim` için..." Her turda `bildirim` değişkeni listenin sıradaki elemanını alır.

### Metnin karakterlerini dolaşmak

Bir metni `split('')` ile karakterlerine ayırıp `for-in` ile dolaşabiliriz:

```dart
// Dosya: 08_09_for_in_metin.dart
void main() {
  String sifre = 'Flutter2026';
  int rakamSayisi = 0;

  for (var karakter in sifre.split('')) {
    if ('0123456789'.contains(karakter)) {
      rakamSayisi++;
    }
  }

  print('"$sifre" içinde $rakamSayisi rakam var.');
}
```

**Çıktı:**

```text
"Flutter2026" içinde 4 rakam var.
```

**Açıklama:** `'0123456789'.contains(karakter)`, karakterin bir rakam olup olmadığını kontrol etmenin basit bir yoludur. Aynı işi indeksle de yapabilirdik: `for (int i = 0; i < sifre.length; i++)` ve her turda `sifre[i]`.

## 8.6 ❌ Döngü Değişkeninin Kapsamı

```dart
// Dosya: 08_10_tuzak_dongu_kapsam.dart
// ❌ DERLEME HATASI
void main() {
  for (int i = 0; i < 3; i++) {
    print(i);
  }
  print(i);
}
```

**Hata mesajı:**

```text
Undefined name 'i'.
```

**Açıklama:** `for` satırında tanımlanan `i` yalnızca döngünün içinde geçerlidir. Döngüden sonra da bir değere ihtiyacınız varsa, değişkeni döngüden **önce** tanımlayın (8.3'teki `toplamAdim` gibi).

---

# 9. while Döngüsü

## 9.1 Yapısı

`while`, "koşul doğru **olduğu sürece** tekrar et" demektir. Döngünün **kaç kez** döneceği baştan bilinmiyorsa `for` yerine `while` kullanılır.

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
while (kosul) {
  // koşul true olduğu sürece tekrar eden kodlar
  // DİKKAT: Burada koşulu bir gün false yapacak bir değişiklik olmalı!
}
```

Koşul **her turdan önce** kontrol edilir. Koşul en başta `false` ise gövde **hiç** çalışmaz.

**Örnek: Birikim hedefi**

```dart
// Dosya: 09_01_while_temel.dart
void main() {
  double birikim = 0;
  double aylikTasarruf = 750;
  double hedef = 5000;
  int ay = 0;

  while (birikim < hedef) {
    ay++;
    birikim += aylikTasarruf;
    print('$ay. ay sonunda birikim: ${birikim.toStringAsFixed(2)} TL');
  }

  print('Hedefe $ay ayda ulaşıldı.');
}
```

**Çıktı:**

```text
1. ay sonunda birikim: 750.00 TL
2. ay sonunda birikim: 1500.00 TL
3. ay sonunda birikim: 2250.00 TL
4. ay sonunda birikim: 3000.00 TL
5. ay sonunda birikim: 3750.00 TL
6. ay sonunda birikim: 4500.00 TL
7. ay sonunda birikim: 5250.00 TL
Hedefe 7 ayda ulaşıldı.
```

**Açıklama:** Kaç ay gerektiğini baştan bilmiyoruz; programın bulmasını istiyoruz. Döngü, `birikim < hedef` koşulu `false` olana kadar döner.

> **Deneyin:** `aylikTasarruf` değerini `1000` yapın. Kaç ay sürer? Önce tahmin edin, sonra çalıştırın.

## 9.2 Örnek: Bağlantıyı Yeniden Deneme

```dart
// Dosya: 09_02_yeniden_deneme.dart
void main() {
  int deneme = 0;
  int maksimumDeneme = 5;
  bool baglandi = false;

  while (!baglandi && deneme < maksimumDeneme) {
    deneme++;
    print('Sunucuya bağlanılıyor... (deneme $deneme/$maksimumDeneme)');

    // Simülasyon: 3. denemede bağlantı kuruluyor
    if (deneme == 3) {
      baglandi = true;
    }
  }

  if (baglandi) {
    print('Bağlantı kuruldu.');
  } else {
    print('Bağlantı kurulamadı. İnternet bağlantınızı kontrol edin.');
  }
}
```

**Çıktı:**

```text
Sunucuya bağlanılıyor... (deneme 1/5)
Sunucuya bağlanılıyor... (deneme 2/5)
Sunucuya bağlanılıyor... (deneme 3/5)
Bağlantı kuruldu.
```

**Açıklama:** Koşul iki parçalı: "bağlanmadığı **ve** deneme hakkı bittiği sürece". `deneme < maksimumDeneme` bir **güvenlik sınırıdır**; bağlantı hiç kurulmasa bile döngünün sonsuza kadar dönmesini engeller.

> **Deneyin:** Simülasyon satırındaki `3`'ü `8` yapın. 5 denemeden sonra `Bağlantı kurulamadı.` yazmalı.

## 9.3 Örnek: Bir Sayının Basamakları

```dart
// Dosya: 09_03_basamaklar.dart
void main() {
  int kod = 482915;
  int sayi = kod;
  int basamakSayisi = 0;
  int basamakToplami = 0;

  while (sayi > 0) {
    int sonBasamak = sayi % 10;
    basamakToplami += sonBasamak;
    basamakSayisi++;
    sayi ~/= 10;
  }

  print('Kod: $kod');
  print('Basamak sayısı: $basamakSayisi');
  print('Basamak toplamı: $basamakToplami');
}
```

**Çıktı:**

```text
Kod: 482915
Basamak sayısı: 6
Basamak toplamı: 29
```

**Adım adım izleme (ilk üç tur):**

| Tur | `sayi` (başta) | `sayi % 10` | `basamakToplami` | `sayi ~/= 10` sonrası |
|---|---|---|---|---|
| 1 | 482915 | 5 | 5 | 48291 |
| 2 | 48291 | 1 | 6 | 4829 |
| 3 | 4829 | 9 | 15 | 482 |
| ... | ... | ... | ... | ... |

**Açıklama:** `% 10` bir sayının **son basamağını** verir, `~/ 10` ise son basamağı **siler**. Sayı 0 olana kadar bu iki işlem tekrarlanır. Orijinal değeri kaybetmemek için işlemleri `kod`'un bir kopyası olan `sayi` üzerinde yaptık.

## 9.4 ❌ Sonsuz Döngü

```dart
// Dosya: 09_04_tuzak_sonsuz_dongu.dart
// ❌ MANTIK HATASI: Bu program kendiliğinden hiç bitmez!
// Durdurmak için: terminalde Ctrl + C, VS Code'da kırmızı kare (Stop) düğmesi.
void main() {
  int sayac = 1;

  while (sayac <= 5) {
    print('Sayaç: $sayac');
    // sayac++; satırı unutuldu!
  }
}
```

**Açıklama:** `sayac` hiç artmadığı için `sayac <= 5` koşulu hep `true` kalır ve ekrana sonsuza kadar `Sayaç: 1` yazılır. Bir `while` yazdığınızda her zaman kendinize sorun: **"Bu döngü nasıl bitecek?"**

> 🔗 **Flutter'da:** Bir mobil uygulamada sonsuz döngü, arayüzün tamamen **donmasına** yol açar; kullanıcı hiçbir şeye dokunamaz.

---

# 10. do-while Döngüsü

## 10.1 Yapısı

`do-while`, `while`'ın tersine, gövdeyi **önce çalıştırır**, koşulu **sonra** kontrol eder. Bu yüzden gövde **en az bir kez** çalışır.

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
do {
  // en az bir kez çalışacak kodlar
} while (kosul); // Sondaki noktalı virgül ZORUNLUDUR
```

**Örnek: Tanıtım ekranları**

```dart
// Dosya: 10_01_do_while.dart
void main() {
  int ekran = 1;
  int toplamEkran = 3;

  do {
    print('Tanıtım ekranı $ekran/$toplamEkran');
    ekran++;
  } while (ekran <= toplamEkran);

  print('Ana sayfaya geçiliyor...');
}
```

**Çıktı:**

```text
Tanıtım ekranı 1/3
Tanıtım ekranı 2/3
Tanıtım ekranı 3/3
Ana sayfaya geçiliyor...
```

## 10.2 while ile do-while Arasındaki Fark

```dart
// Dosya: 10_02_while_vs_do_while.dart
void main() {
  int a = 10;
  while (a < 5) {
    print('while gövdesi çalıştı');
  }

  int b = 10;
  do {
    print('do-while gövdesi çalıştı');
  } while (b < 5);
}
```

**Çıktı:**

```text
do-while gövdesi çalıştı
```

**Açıklama:** İki döngünün koşulu da en baştan `false`. `while` koşula **önce** baktığı için hiç çalışmadı. `do-while` ise gövdeyi **önce** çalıştırdı, koşula sonra baktı ve durdu.

| | `while` | `do-while` |
|---|---|---|
| Koşul ne zaman kontrol edilir? | Gövdeden **önce** | Gövdeden **sonra** |
| Gövde en az kaç kez çalışır? | **0** | **1** |
| Tipik kullanım | Koşul baştan anlamlıysa | Önce bir şey yapıp sonra karar verilecekse (menü göster → seçime bak, girdi al → doğru mu bak) |

## 10.3 Örnek: PIN Girişi (simülasyon)

Kullanıcıdan PIN istemek tam bir `do-while` durumudur: PIN'i **en az bir kez** sormak zorundayız, sonra doğru olup olmadığına bakarız. Klavyeden gerçek girişi Bölüm 12'de göreceğiz; şimdilik kullanıcının girdiği değerleri simüle ediyoruz.

```dart
// Dosya: 10_03_pin_simulasyon.dart
void main() {
  String dogruPin = '2580';
  int deneme = 0;
  String girilen;

  do {
    deneme++;
    // Simülasyon: Kullanıcının sırasıyla girdiği PIN'ler
    girilen = deneme == 1 ? '1111' : deneme == 2 ? '1234' : '2580';
    print('Deneme $deneme: $girilen');
  } while (girilen != dogruPin && deneme < 3);

  print(girilen == dogruPin ? 'Kilit açıldı.' : 'Çok fazla hatalı deneme!');
}
```

**Çıktı:**

```text
Deneme 1: 1111
Deneme 2: 1234
Deneme 3: 2580
Kilit açıldı.
```

**Açıklama:** Döngü iki durumda biter: PIN doğru girildiğinde **veya** 3 deneme dolduğunda. Döngüden sonra hangisinin gerçekleştiğini `girilen == dogruPin` ile kontrol ettik.

> **Deneyin:** Simülasyondaki son `'2580'`'i `'0000'` yapın: `Çok fazla hatalı deneme!` yazmalı.

> ⚠️ `do-while`'ın sonundaki `while (kosul);` satırında **noktalı virgül zorunludur**. Unutursanız VS Code hata gösterir. Bu, `while` döngüsünden farklıdır: Normal `while (kosul)` satırının sonuna noktalı virgül **konmaz**.

---

# 11. break, continue ve Etiketler (Label)

Döngülerin akışını iki anahtar kelimeyle değiştirebiliriz:

| Anahtar kelime | Ne yapar? |
|---|---|
| `break` | Döngüden **tamamen çıkar**. Döngüden sonraki satırdan devam edilir. |
| `continue` | O turun **geri kalanını atlar** ve bir sonraki tura geçer. |

## 11.1 break

**Örnek:** Bir alışveriş uygulamasında her 7. siparişe indirim kuponu, her 11. siparişe hediye veriliyor. İkisini birden kazanan **ilk** sipariş numarası hangisi?

```dart
// Dosya: 11_01_break.dart
void main() {
  for (int siparisNo = 1; siparisNo <= 1000; siparisNo++) {
    if (siparisNo % 7 == 0 && siparisNo % 11 == 0) {
      print('İkisini birden kazanan ilk sipariş: $siparisNo');
      break;
    }
  }
  print('Arama bitti.');
}
```

**Çıktı:**

```text
İkisini birden kazanan ilk sipariş: 77
Arama bitti.
```

**Açıklama:** Döngü 1000'e kadar gidecek şekilde yazıldı, ama 77 bulunduğu anda `break` döngüyü bitirdi. Aradığımızı bulduktan sonra 923 tur daha dönmenin anlamı yoktu.

## 11.2 continue

**Örnek:** Gün boyunca 3 saatte bir su içme hatırlatması gönderilecek, ama gece 23:00 ile sabah 07:00 arası sessiz saatler.

```dart
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
```

**Çıktı:**

```text
00:00 → sessiz saat, atlandı
03:00 → sessiz saat, atlandı
06:00 → sessiz saat, atlandı
09:00 → su içme hatırlatması gönderildi
12:00 → su içme hatırlatması gönderildi
15:00 → su içme hatırlatması gönderildi
18:00 → su içme hatırlatması gönderildi
21:00 → su içme hatırlatması gönderildi
```

**Açıklama:** Sessiz saatlerde `continue` çalışır ve döngü, alttaki "gönderildi" satırına **hiç ulaşmadan** bir sonraki saate geçer. `padLeft(2, '0')`, tek basamaklı saatlerin başına sıfır ekler (`9` → `09`).

## 11.3 Sonsuz Döngü + break: while (true)

Döngünün nerede biteceği, gövdenin **ortasında** belli oluyorsa `while (true)` ile sonsuz bir döngü kurulur ve çıkış `break` ile yapılır.

```dart
// Dosya: 11_03_while_true.dart
void main() {
  int indirilen = 0;
  int dosyaBoyutu = 100;

  while (true) {
    indirilen += 30;

    if (indirilen >= dosyaBoyutu) {
      print('İndirme tamamlandı (%100).');
      break;
    }

    print('İndiriliyor... %$indirilen');
  }
}
```

**Çıktı:**

```text
İndiriliyor... %30
İndiriliyor... %60
İndiriliyor... %90
İndirme tamamlandı (%100).
```

> ⚠️ `while (true)` kullandığınızda, döngünün içinde **mutlaka** ulaşılabilir bir `break` olduğundan emin olun.

## 11.4 İç İçe Döngülerde break Yalnızca İçteki Döngüden Çıkar

```dart
// Dosya: 11_04_ic_ice_break.dart
void main() {
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (j == 2) {
        break; // Yalnızca İÇ döngüden çıkar
      }
      print('i = $i, j = $j');
    }
  }
}
```

**Çıktı:**

```text
i = 1, j = 1
i = 2, j = 1
i = 3, j = 1
```

**Açıklama:** `j == 2` olduğunda `break` yalnızca **içteki** `j` döngüsünü bitirdi. Dış döngü kaldığı yerden devam etti ve `i` değeri 2 ve 3 için de çalıştı. Peki iki döngüden **birden** çıkmak istersek? Etiketler tam bunun için vardır.

## 11.5 Etiketli break (Label)

Bir döngünün önüne `etiketAdi:` yazarak ona bir **etiket** (label) verebiliriz. `break etiketAdi;` yazıldığında, iç döngüde bile olsak **etiketlenen döngüden** çıkılır.

**Örnek: Ana ekranda bir uygulama simgesini aramak**

```dart
// Dosya: 11_05_label_break.dart
void main() {
  int satirSayisi = 3;
  int sutunSayisi = 4;
  int arananIndeks = 6; // Ana ekrandaki 7. simge

  arama:
  for (int satir = 0; satir < satirSayisi; satir++) {
    for (int sutun = 0; sutun < sutunSayisi; sutun++) {
      int indeks = satir * sutunSayisi + sutun;
      print('Kontrol: satır $satir, sütun $sutun (indeks $indeks)');

      if (indeks == arananIndeks) {
        print('Bulundu! Simge $satir. satır, $sutun. sütunda.');
        break arama; // DIŞ döngüden de çıkar
      }
    }
  }

  print('Arama tamamlandı.');
}
```

**Çıktı:**

```text
Kontrol: satır 0, sütun 0 (indeks 0)
Kontrol: satır 0, sütun 1 (indeks 1)
Kontrol: satır 0, sütun 2 (indeks 2)
Kontrol: satır 0, sütun 3 (indeks 3)
Kontrol: satır 1, sütun 0 (indeks 4)
Kontrol: satır 1, sütun 1 (indeks 5)
Kontrol: satır 1, sütun 2 (indeks 6)
Bulundu! Simge 1. satır, 2. sütunda.
Arama tamamlandı.
```

**Açıklama:** `arama:` etiketi dış `for` döngüsüne verildi. `break arama;` çalıştığında hem iç hem dış döngü bitti ve program `Arama tamamlandı.` satırına atladı. Etiket olmadan sadece `break;` yazsaydık iç döngü biter, ama dış döngü 2. satırı da tarardı.

> **Deneyin:** `break arama;` satırını `break;` yapın ve çıktının nasıl uzadığına bakın.

## 11.6 Etiketli continue

`continue etiketAdi;`, etiketlenen döngünün **bir sonraki turuna** geçer.

**Örnek:** Üç gün boyunca 09:00–12:00 arası saatlik hatırlatma gönderiliyor. 2. gün saat 10:00'da kullanıcı "Bugün için kapat" dedi.

```dart
// Dosya: 11_06_label_continue.dart
void main() {
  gunler:
  for (int gun = 1; gun <= 3; gun++) {
    for (int saat = 9; saat <= 12; saat++) {
      if (gun == 2 && saat == 10) {
        print('Gün $gun: Hatırlatmalar bugün için kapatıldı.');
        continue gunler; // Bir sonraki güne geç
      }
      print('Gün $gun, $saat:00 → hatırlatma');
    }
  }
}
```

**Çıktı:**

```text
Gün 1, 9:00 → hatırlatma
Gün 1, 10:00 → hatırlatma
Gün 1, 11:00 → hatırlatma
Gün 1, 12:00 → hatırlatma
Gün 2, 9:00 → hatırlatma
Gün 2: Hatırlatmalar bugün için kapatıldı.
Gün 3, 9:00 → hatırlatma
Gün 3, 10:00 → hatırlatma
Gün 3, 11:00 → hatırlatma
Gün 3, 12:00 → hatırlatma
```

**Açıklama:** `continue gunler;` 2. günün kalan saatlerini (11:00, 12:00) atladı ve doğrudan 3. güne geçti. Etiketsiz `continue;` yazsaydık yalnızca 10:00 atlanır, 11:00 ve 12:00 hatırlatmaları yine gönderilirdi.

## 11.7 ❌ Önemli Tuzak: Döngü İçindeki switch'te break

Konsol menüleri genellikle bir döngü ve içinde bir `switch` ile yazılır. Burada çok sık yapılan bir hata vardır:

```dart
// Dosya: 11_07_tuzak_switch_break.dart
// ❌ MANTIK HATASI: "Çıkış" seçildiği halde döngü bitmez.
void main() {
  int adim = 0;

  while (true) {
    adim++;
    // Simülasyon: Kullanıcının menüde sırasıyla yaptığı seçimler
    String secim = adim == 1 ? '1' : adim == 2 ? '2' : '0';

    switch (secim) {
      case '1':
        print('Profil gösteriliyor');
      case '2':
        print('Ayarlar gösteriliyor');
      case '0':
        print('Çıkış seçildi');
        break; // DİKKAT: Bu break yalnızca switch'ten çıkar, döngüden DEĞİL!
    }

    if (adim >= 5) {
      print('(Güvenlik sınırı: döngü zorla durduruldu)');
      break;
    }
  }
}
```

**Çıktı:**

```text
Profil gösteriliyor
Ayarlar gösteriliyor
Çıkış seçildi
Çıkış seçildi
Çıkış seçildi
(Güvenlik sınırı: döngü zorla durduruldu)
```

**Açıklama:** Bir `switch`'in içindeki `break`, **en yakın switch'ten** çıkar; `while` döngüsü ise devam eder. Programa bir güvenlik sınırı koymasaydık "Çıkış" seçildiği halde menü sonsuza kadar dönerdi.

**Çözüm 1: Etiketli break**

```dart
// Dosya: 11_08_label_menu.dart
void main() {
  int adim = 0;

  menu:
  while (true) {
    adim++;
    String secim = adim == 1 ? '1' : adim == 2 ? '2' : '0';

    switch (secim) {
      case '1':
        print('Profil gösteriliyor');
      case '2':
        print('Ayarlar gösteriliyor');
      case '0':
        print('Çıkış seçildi. Güle güle!');
        break menu; // Etiketli break: while döngüsünden çıkar
      default:
        print('Geçersiz seçim');
    }
  }

  print('Program sonlandı.');
}
```

**Çıktı:**

```text
Profil gösteriliyor
Ayarlar gösteriliyor
Çıkış seçildi. Güle güle!
Program sonlandı.
```

**Çözüm 2: Bayrak (flag) değişkeni**

```dart
// Dosya: 11_09_bayrak_menu.dart
void main() {
  int adim = 0;
  bool devam = true;

  while (devam) {
    adim++;
    String secim = adim == 1 ? '1' : adim == 2 ? '2' : '0';

    switch (secim) {
      case '1':
        print('Profil gösteriliyor');
      case '2':
        print('Ayarlar gösteriliyor');
      case '0':
        print('Çıkış seçildi. Güle güle!');
        devam = false; // Döngü bir sonraki kontrolde biter
      default:
        print('Geçersiz seçim');
    }
  }

  print('Program sonlandı.');
}
```

**Çıktı:**

```text
Profil gösteriliyor
Ayarlar gösteriliyor
Çıkış seçildi. Güle güle!
Program sonlandı.
```

**Açıklama:** `devam` değişkenine **bayrak** denir: Döngünün devam edip etmeyeceğini taşır. İki çözüm de doğrudur. Etiket daha kısadır; bayrak ise etiketleri yabancı bulanlar için daha tanıdıktır.

---

# 12. Kullanıcıdan Veri Alma

> ⚠️ **Bu bölümdeki programları Debug Console'da çalıştıramazsınız**, çünkü Debug Console klavyeden veri kabul etmez. Terminalden `dart run dosya_adi.dart` ile çalıştırın veya `dart.cliConsole` ayarını `terminal` yapın (bkz. Bölüm 0.3).

> 🔗 **Flutter'da** kullanıcı girdisi klavyeden değil, ekrandaki metin kutularından (`TextField`) alınır. Ancak gelen değer yine bir **metindir** ve onu sayıya çevirme, boş olup olmadığını kontrol etme, geçersizse tekrar isteme mantığı bu bölümdekiyle **birebir aynıdır.**

## 12.1 İlk Program: stdin ve stdout

```dart
// Dosya: 12_01_ilk_girdi.dart
import 'dart:io';

void main() {
  stdout.write('Adınız: ');
  String? ad = stdin.readLineSync();

  print('Merhaba, $ad!');
}
```

**Örnek çalışma:**

```text
Adınız: Ayşe
Merhaba, Ayşe!
```

**Açıklama:**

| Kod | Anlamı |
|---|---|
| `import 'dart:io';` | Giriş/çıkış işlemleri için gereken kütüphaneyi programa ekler. **Dosyanın en üstünde**, `main`'den önce yazılır. |
| `stdout.write('Adınız: ')` | Ekrana yazar ama **alt satıra geçmez**. Böylece kullanıcı cevabı aynı satıra yazar. `print` ise her zaman alt satıra geçer. |
| `stdin.readLineSync()` | Kullanıcı bir şey yazıp **Enter**'a basana kadar bekler ve yazılanı **metin** olarak döndürür. |
| `String?` | `readLineSync()` bir `String?` döndürür; yani sonuç **null olabilir**. |

**Neden null olabilir?** Giriş akışı kapanırsa (örneğin kullanıcı Windows'ta `Ctrl + Z` ve Enter, macOS/Linux'ta `Ctrl + D` tuşlarına basarsa) okunacak bir satır kalmaz ve `null` döner. Dart bu ihtimali gözden kaçırmamamız için tipi `String?` yapar.

> **Deneyin:** Programı çalıştırın ve ad yerine `Ctrl + D` (Windows'ta `Ctrl + Z` ve Enter) yapın. Ekranda `Merhaba, null!` göreceksiniz.

## 12.2 null ve Boşluklarla Başa Çıkmak

```dart
// Dosya: 12_02_null_ve_trim.dart
import 'dart:io';

void main() {
  stdout.write('Kullanıcı adınız: ');
  String girdi = stdin.readLineSync() ?? '';
  String kullaniciAdi = girdi.trim();

  if (kullaniciAdi.isEmpty) {
    print('Kullanıcı adı boş bırakılamaz.');
  } else {
    print('Hoş geldin, $kullaniciAdi! (${kullaniciAdi.length} karakter)');
  }
}
```

**Örnek çalışma 1:**

```text
Kullanıcı adınız:    mert   
Hoş geldin, mert! (4 karakter)
```

**Örnek çalışma 2** (yalnızca boşluk yazıp Enter'a basıldı):

```text
Kullanıcı adınız:    
Kullanıcı adı boş bırakılamaz.
```

**Açıklama:**
- `stdin.readLineSync() ?? ''`: Sonuç null ise boş metin kullan. Böylece `girdi` değişkeninin tipi `String?` değil `String` olur ve rahatça kullanılır.
- `.trim()`: Baştaki ve sondaki boşlukları siler. Kullanıcılar farkında olmadan boşluk yazar; neredeyse her girdide kullanılmalıdır.

> ⚠️ İnternette `stdin.readLineSync()!` yazımını da göreceksiniz. Sondaki `!`, "bunun null olmadığına eminim" demektir; yanılırsanız program çöker. `?? ''` daha güvenlidir.

## 12.3 Sayı Almak: int.parse ve int.tryParse

Klavyeden gelen her şey **metindir**. Kullanıcı `3` yazsa bile elimizdeki değer `'3'` metnidir. Hesap yapabilmek için sayıya çevirmemiz gerekir.

### ❌ int.parse: Hatalı girdide program çöker

```dart
// Dosya: 12_03_int_parse.dart
// ❌ ÇALIŞMA ZAMANI HATASI riski: Sayı dışında bir şey girilirse program çöker.
import 'dart:io';

void main() {
  stdout.write('Kaç adet almak istiyorsunuz? ');
  String girdi = (stdin.readLineSync() ?? '').trim();
  int adet = int.parse(girdi);
  print('Sepete $adet adet eklendi.');
}
```

**Örnek çalışma 1:**

```text
Kaç adet almak istiyorsunuz? 3
Sepete 3 adet eklendi.
```

**Örnek çalışma 2:**

```text
Kaç adet almak istiyorsunuz? üç
Unhandled exception:
FormatException: Invalid radix-10 number (at character 1)
...
```

**Açıklama:** `int.parse`, sayıya çeviremediği bir metinle karşılaşınca `FormatException` hatası fırlatır ve program durur. Bir mobil uygulamada bu, uygulamanın kullanıcının elinde **kapanması** demektir.

### ✅ int.tryParse: Güvenli yol

```dart
// Dosya: 12_04_int_tryparse.dart
import 'dart:io';

void main() {
  stdout.write('Kaç adet almak istiyorsunuz? ');
  String girdi = (stdin.readLineSync() ?? '').trim();
  int? adet = int.tryParse(girdi);

  if (adet == null) {
    print('"$girdi" geçerli bir sayı değil.');
  } else if (adet <= 0) {
    print('Adet en az 1 olmalı.');
  } else if (adet > 10) {
    print('Tek seferde en fazla 10 adet alınabilir.');
  } else {
    print('Sepete $adet adet eklendi.');
  }
}
```

**Örnek çalışmalar:**

| Girilen | Çıktı |
|---|---|
| `3` | Sepete 3 adet eklendi. |
| `üç` | "üç" geçerli bir sayı değil. |
| `0` | Adet en az 1 olmalı. |
| `25` | Tek seferde en fazla 10 adet alınabilir. |
| `2.5` | "2.5" geçerli bir sayı değil. |

**Açıklama:**
- `int.tryParse` çeviremezse çökmez, **`null` döndürür**. Bu yüzden sonucun tipi `int?`'dir.
- İlk kontrol `adet == null`. Bu koldan geçildikten sonra Dart, sonraki kollarda `adet`'in null olmadığını bilir ve `adet <= 0` gibi karşılaştırmalara izin verir (tip yükseltme).
- `(stdin.readLineSync() ?? '').trim()`: Okuma, null kontrolü ve boşluk temizleme tek satırda. Parantez gereklidir; önce `??` yapılır, sonra `.trim()`.

> **Kural:** Kullanıcıdan gelen veride **her zaman** `tryParse` kullanın.

## 12.4 Ondalık Sayı Almak ve Virgül Sorunu

```dart
// Dosya: 12_05_double_virgul.dart
import 'dart:io';

void main() {
  stdout.write('Ürün fiyatı (TL): ');
  String girdi = (stdin.readLineSync() ?? '').trim();

  // Türkçede ondalık ayırıcı virgüldür ("49,90"); Dart ise nokta bekler ("49.90").
  String duzeltilmis = girdi.replaceAll(',', '.');
  double? fiyat = double.tryParse(duzeltilmis);

  if (fiyat == null || fiyat < 0) {
    print('Geçerli bir fiyat girin.');
  } else {
    double kdvli = fiyat * 1.20;
    print('KDV dahil fiyat: ${kdvli.toStringAsFixed(2)} TL');
  }
}
```

**Örnek çalışmalar:**

| Girilen | Çıktı |
|---|---|
| `49,90` | KDV dahil fiyat: 59.88 TL |
| `100` | KDV dahil fiyat: 120.00 TL |
| `-5` | Geçerli bir fiyat girin. |
| `abc` | Geçerli bir fiyat girin. |

**Açıklama:** Türkçe klavye kullanan biri doğal olarak `49,90` yazar ve `double.tryParse('49,90')` bunu çeviremez, `null` döndürür. `replaceAll(',', '.')` ile virgülü noktaya çevirmek, kullanıcının iki yazımı da kullanabilmesini sağlar. `fiyat == null || fiyat < 0` koşulunda kısa devre sayesinde, `fiyat` null ise `fiyat < 0` hiç değerlendirilmez.

## 12.5 Geçerli Girdi Gelene Kadar Tekrar Sormak

Kullanıcı hatalı bir şey girdiğinde programı bitirmek yerine **tekrar sormak** daha iyi bir deneyimdir. Bu tam bir döngü işidir.

**Yol 1: do-while**

```dart
// Dosya: 12_06_dogrulama_do_while.dart
import 'dart:io';

void main() {
  int? yas;

  do {
    stdout.write('Yaşınız (13-120): ');
    String girdi = (stdin.readLineSync() ?? '').trim();
    yas = int.tryParse(girdi);

    if (yas == null) {
      print('Lütfen yalnızca rakam girin.');
    } else if (yas < 13 || yas > 120) {
      print('Yaş 13 ile 120 arasında olmalı.');
      yas = null; // Geçersiz kabul et, döngü devam etsin
    }
  } while (yas == null);

  print('Kayıt tamamlandı. Yaşınız: $yas');
}
```

**Örnek çalışma:**

```text
Yaşınız (13-120): on sekiz
Lütfen yalnızca rakam girin.
Yaşınız (13-120): 8
Yaş 13 ile 120 arasında olmalı.
Yaşınız (13-120): 19
Kayıt tamamlandı. Yaşınız: 19
```

**Açıklama:** Soru **en az bir kez** sorulmak zorunda olduğu için `do-while` doğal bir seçimdir. Aralık dışı bir değer geldiğinde `yas`'ı tekrar `null` yaparak döngünün devam etmesini sağladık.

**Yol 2: while (true) ve break**

```dart
// Dosya: 12_07_dogrulama_while_true.dart
import 'dart:io';

void main() {
  int adet;

  while (true) {
    stdout.write('Adet (1-10): ');
    int? girilen = int.tryParse((stdin.readLineSync() ?? '').trim());

    if (girilen != null && girilen >= 1 && girilen <= 10) {
      adet = girilen;
      break;
    }

    print('Geçersiz giriş, tekrar deneyin.');
  }

  print('Sepete $adet adet eklendi.');
}
```

**Örnek çalışma:**

```text
Adet (1-10): 15
Geçersiz giriş, tekrar deneyin.
Adet (1-10): 4
Sepete 4 adet eklendi.
```

**Açıklama:** Geçerli değer gelince `adet`'e atanıp `break` ile çıkılır. Dart, döngüden çıkmanın **tek yolunun** bu `break` olduğunu ve öncesinde `adet`'e değer verildiğini anlar; bu yüzden `int adet;` satırında başlangıç değeri vermemiz gerekmez.

## 12.6 Evet / Hayır Soruları

```dart
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
```

**Örnek çalışmalar:**

| Girilen | Çıktı |
|---|---|
| `E` | Bildirimler açıldı. |
| `evet` | Bildirimler açıldı. |
| `HAYIR` | Bildirimler kapalı. Ayarlardan daha sonra açabilirsiniz. |
| `belki` | Cevap anlaşılamadı; bildirimler kapalı bırakıldı. |

**Açıklama:** `.toLowerCase()` sayesinde `E`, `e`, `Evet`, `EVET` hepsi aynı kola düşer. `'hayir'` kolunun neden eklendiğine dikkat edin: Dart'ın `toLowerCase()` metodu dilden bağımsız çalışır ve `'HAYIR'`ı `'hayır'` değil **`'hayir'`** yapar (büyük `I`, noktalı küçük `i` olur). Türkçe metinlerle çalışırken bu davranışı hesaba katın.

## 12.7 Birden Fazla Değer Almak

```dart
// Dosya: 12_09_iki_sayi.dart
import 'dart:io';

void main() {
  stdout.write('Birinci sayı: ');
  double? a = double.tryParse((stdin.readLineSync() ?? '').trim().replaceAll(',', '.'));

  stdout.write('İkinci sayı: ');
  double? b = double.tryParse((stdin.readLineSync() ?? '').trim().replaceAll(',', '.'));

  if (a == null || b == null) {
    print('Geçerli iki sayı girmelisiniz.');
    return;
  }

  print('Toplam : ${a + b}');
  print('Fark   : ${a - b}');
  print('Çarpım : ${a * b}');
  print(b == 0 ? 'Bölüm  : Tanımsız (sıfıra bölme)' : 'Bölüm  : ${(a / b).toStringAsFixed(2)}');
}
```

**Örnek çalışma:**

```text
Birinci sayı: 7
İkinci sayı: 2
Toplam : 9.0
Fark   : 5.0
Çarpım : 14.0
Bölüm  : 3.50
```

**Açıklama:** `if (a == null || b == null) { ...; return; }` satırından sonra Dart, iki değişkenin de null olmadığını bilir ve aşağıdaki işlemlere izin verir. Bölmeden önce sıfır kontrolü yapıldı.

## 12.8 Windows'ta Türkçe Karakter Girişi

Windows terminalinde Türkçe karakterli girdiler (`ş`, `ğ`, `ı` gibi) bozuk okunabilir. Böyle bir sorun yaşarsanız:

1. Terminalde bir kez `chcp 65001` komutunu çalıştırın.
2. Okumayı UTF-8 ile yapın:

```dart
// Dosya: 12_10_utf8_girdi.dart
import 'dart:convert';
import 'dart:io';

void main() {
  stdout.write('Şehriniz: ');
  String sehir = (stdin.readLineSync(encoding: utf8) ?? '').trim();
  print('Seçilen şehir: $sehir');
}
```

**Örnek çalışma:**

```text
Şehriniz: Eskişehir
Seçilen şehir: Eskişehir
```

---

# 13. Hepsini Birleştirelim: Cep Cüzdan Uygulaması

Bu bölümde haftanın tüm konularını tek bir programda birleştiriyoruz: Bir mobil cüzdan uygulamasının konsol versiyonu. Program önce PIN ister (en fazla 3 deneme), sonra kullanıcı çıkış yapana kadar bir menü gösterir.

> ⚠️ Bu program klavyeden veri alır; **terminalden** çalıştırın: `dart run 13_01_cep_cuzdan.dart`

```dart
// Dosya: 13_01_cep_cuzdan.dart
import 'dart:io';

void main() {
  const String dogruPin = '2580';
  const int maksimumDeneme = 3;
  double bakiye = 1250.0;
  int islemSayisi = 0;

  print('==============================');
  print('   CEP CÜZDAN · Hoş geldiniz');
  print('==============================');

  // 1) PIN doğrulama: en fazla 3 deneme
  int deneme = 0;
  bool girisBasarili = false;

  while (deneme < maksimumDeneme) {
    deneme++;
    stdout.write('PIN kodunuz ($deneme/$maksimumDeneme): ');
    String pin = (stdin.readLineSync() ?? '').trim();

    if (pin == dogruPin) {
      girisBasarili = true;
      break;
    }

    int kalanHak = maksimumDeneme - deneme;
    print(kalanHak > 0 ? 'Hatalı PIN. Kalan hak: $kalanHak' : 'Hatalı PIN.');
  }

  if (!girisBasarili) {
    print('Çok fazla hatalı deneme. Hesabınız geçici olarak kilitlendi.');
    return;
  }

  print('Giriş başarılı.');

  // 2) Ana menü döngüsü
  menu:
  while (true) {
    print('');
    print('--- ANA MENÜ ---');
    print('1) Bakiye görüntüle');
    print('2) Para yatır');
    print('3) Para çek');
    print('0) Çıkış');
    stdout.write('Seçiminiz: ');
    String secim = (stdin.readLineSync() ?? '').trim();

    switch (secim) {
      case '1':
        print('Bakiyeniz: ${bakiye.toStringAsFixed(2)} TL');

      case '2':
        stdout.write('Yatırılacak tutar: ');
        String yatirmaGirdisi = (stdin.readLineSync() ?? '').trim().replaceAll(',', '.');
        double? yatirilan = double.tryParse(yatirmaGirdisi);

        if (yatirilan == null || yatirilan <= 0) {
          print('Geçersiz tutar.');
        } else {
          bakiye += yatirilan;
          islemSayisi++;
          print('${yatirilan.toStringAsFixed(2)} TL yatırıldı. '
              'Yeni bakiye: ${bakiye.toStringAsFixed(2)} TL');
        }

      case '3':
        stdout.write('Çekilecek tutar: ');
        String cekmeGirdisi = (stdin.readLineSync() ?? '').trim().replaceAll(',', '.');
        double? cekilen = double.tryParse(cekmeGirdisi);

        if (cekilen == null || cekilen <= 0) {
          print('Geçersiz tutar.');
        } else if (cekilen > bakiye) {
          print('Yetersiz bakiye. Mevcut: ${bakiye.toStringAsFixed(2)} TL');
        } else {
          bakiye -= cekilen;
          islemSayisi++;
          print('${cekilen.toStringAsFixed(2)} TL çekildi. '
              'Yeni bakiye: ${bakiye.toStringAsFixed(2)} TL');
        }

      case '0':
        print('Bu oturumda $islemSayisi işlem yaptınız. Güle güle!');
        break menu;

      default:
        print('Geçersiz seçim: "$secim"');
    }
  }
}
```

**Örnek çalışma:**

```text
==============================
   CEP CÜZDAN · Hoş geldiniz
==============================
PIN kodunuz (1/3): 1111
Hatalı PIN. Kalan hak: 2
PIN kodunuz (2/3): 2580
Giriş başarılı.

--- ANA MENÜ ---
1) Bakiye görüntüle
2) Para yatır
3) Para çek
0) Çıkış
Seçiminiz: 1
Bakiyeniz: 1250.00 TL

--- ANA MENÜ ---
1) Bakiye görüntüle
2) Para yatır
3) Para çek
0) Çıkış
Seçiminiz: 2
Yatırılacak tutar: 250
250.00 TL yatırıldı. Yeni bakiye: 1500.00 TL

--- ANA MENÜ ---
1) Bakiye görüntüle
2) Para yatır
3) Para çek
0) Çıkış
Seçiminiz: 3
Çekilecek tutar: 2000
Yetersiz bakiye. Mevcut: 1500.00 TL

--- ANA MENÜ ---
1) Bakiye görüntüle
2) Para yatır
3) Para çek
0) Çıkış
Seçiminiz: 3
Çekilecek tutar: 99,90
99.90 TL çekildi. Yeni bakiye: 1400.10 TL

--- ANA MENÜ ---
1) Bakiye görüntüle
2) Para yatır
3) Para çek
0) Çıkış
Seçiminiz: 5
Geçersiz seçim: "5"

--- ANA MENÜ ---
1) Bakiye görüntüle
2) Para yatır
3) Para çek
0) Çıkış
Seçiminiz: 0
Bu oturumda 2 işlem yaptınız. Güle güle!
```

**Programda hangi konu nerede?**

| Kod parçası | Konu | Bölüm |
|---|---|---|
| `const String dogruPin = '2580';` | Sabit değer | Hafta 1 |
| `while (deneme < maksimumDeneme)` | Sınırlı tekrar | 9 |
| `if (pin == dogruPin) { ...; break; }` | Karar + döngüden erken çıkış | 3, 11.1 |
| `kalanHak > 0 ? '...' : '...'` | Üçlü operatör | 4 |
| `if (!girisBasarili) { ...; return; }` | Mantıksal DEĞİL + erken çıkış | 3.8, 7.1 |
| `menu: while (true)` | Etiketli sonsuz döngü | 11.3, 11.5 |
| `switch (secim) { case '1': ... }` | Çok seçenekli karar | 5 |
| `(stdin.readLineSync() ?? '').trim()` | Güvenli girdi okuma | 12.2 |
| `.replaceAll(',', '.')` + `double.tryParse` | Ondalık sayı ve virgül | 12.4 |
| `yatirilan == null \|\| yatirilan <= 0` | Kısa devre + null kontrolü | 7.2 |
| `bakiye += yatirilan;` `islemSayisi++;` | Bileşik atama, artırma | 6.3, 6.4 |
| `break menu;` | Switch içinden döngüyü bitirmek | 11.7 |

**Açıklama:**
- Uzun bir metni iki satıra bölmek için yan yana iki metin yazdık: `'... ' 'Yeni bakiye: ...'`. Dart, yan yana yazılan metinleri otomatik olarak birleştirir.
- `case '2'` ve `case '3'` içinde farklı değişken adları (`yatirilan`, `cekilen`) kullandık; her kolun kendi verisi olduğunu okuyana açıkça gösterir.

> 🔗 **Flutter'da:** Bu programın Flutter versiyonunda menü yerine butonlar, `stdin` yerine metin kutuları, `print` yerine ekrandaki yazılar olacak. Ancak **karar mantığı**, yani PIN kontrolü, tutar doğrulaması, yetersiz bakiye kontrolü **aynen** kullanılacak.

> **Deneyin:** Programa `4) Para transferi` seçeneği ekleyin: Alıcı adı ve tutar istesin; bakiye yetersizse uyarsın, yeterliyse bakiyeden düşüp `"Ayşe adlı kişiye 50.00 TL gönderildi."` yazsın.

---

# 14. Örnek Problem ve Farklı Çözüm Yolları

### **Problem:** Ders Notu ve Harf Notu Hesaplama

Kullanıcıdan bir dersin **vize** ve **final** notlarını (0–100 arası tam sayı) alın. Ortalamayı **vizenin %40'ı + finalin %60'ı** olarak hesaplayın. Harf notunu aşağıdaki tabloya göre belirleyin ve öğrencinin geçip geçmediğini yazdırın.

| Ortalama | Harf |
|---|---|
| 90 ve üzeri | AA |
| 85 – 89,99 | BA |
| 80 – 84,99 | BB |
| 75 – 79,99 | CB |
| 70 – 74,99 | CC |
| 60 – 69,99 | DC |
| 50 – 59,99 | DD |
| 50'nin altı | FF |

**Ek kural (final barajı):** Final notu 50'nin altındaysa ortalama ne olursa olsun harf notu **FF** olur.

**İpuçları:**
1. `dart:io` kütüphanesini ekleyin; `stdout.write` ve `stdin.readLineSync()` ile notları alın.
2. Notları `int.tryParse` ile sayıya çevirin; geçersiz veya 0–100 dışındaysa uyarıp programı bitirin.
3. `final` Dart'ta bir anahtar kelimedir; değişken adı olarak kullanılamaz. `finalNotu` gibi bir ad seçin.
4. Ortalamayı hesaplarken ondalık hata riskini azaltmak için tam sayılarla çalışıp en sonda bölün: `(vize * 40 + finalNotu * 60) / 100`.
5. Harf notu `FF` değilse **GEÇTİ**, `FF` ise **KALDI** yazdırın.

**Beklenen ekran çıktısı:**

```text
Vize notu (0-100): 70
Final notu (0-100): 80
Ortalama: 76.00
Harf notu: CB → GEÇTİ
```

```text
Vize notu (0-100): 95
Final notu (0-100): 45
Ortalama: 65.00
Harf notu: FF → KALDI (final barajı)
```

```text
Vize notu (0-100): 100
Final notu (0-100): 90
Ortalama: 94.00
Harf notu: AA → GEÇTİ
```

```text
Vize notu (0-100): yetmiş
Final notu (0-100): 80
Notlar 0 ile 100 arasında tam sayı olmalı.
```

> **Önce kendiniz deneyin.** Çözümlere bakmadan önce en az 15 dakika kendi çözümünüz üzerinde çalışın.

### Çözüm Şekilleri

**1. if / else if zinciri ile**

```dart
// Dosya: 14_01_not_if.dart
import 'dart:io';

void main() {
  stdout.write('Vize notu (0-100): ');
  int? vize = int.tryParse((stdin.readLineSync() ?? '').trim());

  stdout.write('Final notu (0-100): ');
  int? finalNotu = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (vize == null || finalNotu == null) {
    print('Notlar 0 ile 100 arasında tam sayı olmalı.');
    return;
  }

  if (vize < 0 || vize > 100 || finalNotu < 0 || finalNotu > 100) {
    print('Notlar 0 ile 100 arasında tam sayı olmalı.');
    return;
  }

  double ortalama = (vize * 40 + finalNotu * 60) / 100;
  String harf;

  if (finalNotu < 50) {
    harf = 'FF';
  } else if (ortalama >= 90) {
    harf = 'AA';
  } else if (ortalama >= 85) {
    harf = 'BA';
  } else if (ortalama >= 80) {
    harf = 'BB';
  } else if (ortalama >= 75) {
    harf = 'CB';
  } else if (ortalama >= 70) {
    harf = 'CC';
  } else if (ortalama >= 60) {
    harf = 'DC';
  } else if (ortalama >= 50) {
    harf = 'DD';
  } else {
    harf = 'FF';
  }

  print('Ortalama: ${ortalama.toStringAsFixed(2)}');

  if (harf == 'FF') {
    if (finalNotu < 50) {
      print('Harf notu: $harf → KALDI (final barajı)');
    } else {
      print('Harf notu: $harf → KALDI');
    }
  } else {
    print('Harf notu: $harf → GEÇTİ');
  }
}
```

**Açıklama:** En açık ve adım adım okunan çözümdür. Önce girdiler doğrulanır ve hatalıysa `return` ile program bitirilir (erken çıkış). İlk doğrulamadan sonra Dart, `vize` ve `finalNotu`'nun null olmadığını bilir; bu yüzden ikinci `if`'te karşılaştırma yapabiliriz. Harf notu zincirinde final barajı **en başta** kontrol edilir, çünkü diğer tüm kurallardan önce gelir. `String harf;` satırında değer verilmedi; Dart, zincirin her kolunda değer atandığını görür.

**2. switch ifadesi ve ilişkisel desenlerle**

```dart
// Dosya: 14_02_not_switch.dart
import 'dart:io';

void main() {
  stdout.write('Vize notu (0-100): ');
  int? vize = int.tryParse((stdin.readLineSync() ?? '').trim());

  stdout.write('Final notu (0-100): ');
  int? finalNotu = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (vize == null || finalNotu == null ||
      vize < 0 || vize > 100 || finalNotu < 0 || finalNotu > 100) {
    print('Notlar 0 ile 100 arasında tam sayı olmalı.');
    return;
  }

  double ortalama = (vize * 40 + finalNotu * 60) / 100;

  String harf = switch (ortalama) {
    >= 90 => 'AA',
    >= 85 => 'BA',
    >= 80 => 'BB',
    >= 75 => 'CB',
    >= 70 => 'CC',
    >= 60 => 'DC',
    >= 50 => 'DD',
    _ => 'FF',
  };

  if (finalNotu < 50) {
    harf = 'FF';
  }

  String sonuc = harf == 'FF' ? 'KALDI' : 'GEÇTİ';
  String ek = finalNotu < 50 ? ' (final barajı)' : '';

  print('Ortalama: ${ortalama.toStringAsFixed(2)}');
  print('Harf notu: $harf → $sonuc$ek');
}
```

**Açıklama:** İki doğrulama tek bir `if`'te birleştirildi. Kısa devre sayesinde `vize == null` doğruysa sağdaki karşılaştırmalara hiç geçilmez; bu yüzden null bir değerle `vize < 0` hesaplanmaya çalışılmaz. Harf tablosu switch ifadesiyle tablo gibi okunur hale geldi. Final barajı ayrı bir `if` ile en sonda uygulandı. Sonuç metni üçlü operatörlerle üretildi.

**3. switch ifadesinde when koruması ile**

```dart
// Dosya: 14_03_not_when.dart
import 'dart:io';

void main() {
  stdout.write('Vize notu (0-100): ');
  int? vize = int.tryParse((stdin.readLineSync() ?? '').trim());

  stdout.write('Final notu (0-100): ');
  int? finalNotu = int.tryParse((stdin.readLineSync() ?? '').trim());

  if (vize == null || finalNotu == null ||
      vize < 0 || vize > 100 || finalNotu < 0 || finalNotu > 100) {
    print('Notlar 0 ile 100 arasında tam sayı olmalı.');
    return;
  }

  double ortalama = (vize * 40 + finalNotu * 60) / 100;
  bool barajAltinda = finalNotu < 50;

  String harf = switch (ortalama) {
    _ when barajAltinda => 'FF',
    >= 90 => 'AA',
    >= 85 => 'BA',
    >= 80 => 'BB',
    >= 75 => 'CB',
    >= 70 => 'CC',
    >= 60 => 'DC',
    >= 50 => 'DD',
    _ => 'FF',
  };

  print('Ortalama: ${ortalama.toStringAsFixed(2)}');
  print('Harf notu: $harf → ${harf == 'FF' ? 'KALDI' : 'GEÇTİ'}'
      '${barajAltinda ? ' (final barajı)' : ''}');
}
```

**Açıklama:** Final barajı da switch'in **ilk kolu** oldu: "Değer ne olursa olsun (`_`), baraj altındaysa FF." Böylece harfi belirleyen tüm kurallar tek bir yerde toplandı. Son satırda üçlü operatörler doğrudan metnin içinde kullanıldı. En kısa çözümdür, ama okuyabilmek için switch ifadesine ve `when`'e alışmış olmak gerekir.

**Hangisini seçmeli?** Üçü de doğru sonuç verir. Kural sayısı az ve basitse 1. çözüm; tablo halinde birçok aralık varsa 2. veya 3. çözüm daha okunurdur. **Önemli olan, seçtiğiniz yolu tutarlı ve okunur biçimde uygulamaktır.**

---

# 15. Özet

| Konu | Sözdizimi | Ne zaman? |
|---|---|---|
| if | `if (kosul) { ... }` | Koşul doğruysa bir şey yap |
| if / else | `if (k) { ... } else { ... }` | İki durumdan biri |
| else if | `if (k1) {...} else if (k2) {...} else {...}` | İkiden fazla durum; **özelden genele** sırala |
| Erken çıkış | `if (hata) { print(...); return; }` | Hatalı durumları önce ele al |
| Üçlü operatör | `kosul ? a : b` | İki **değerden** birini seç |
| If-null | `deger ?? yedek` | Null ise yedek değer |
| switch deyimi | `switch (x) { case 1: ... default: ... }` | Tek değişkenin çok değerine göre **iş yap** (Dart 3'te `break` gerekmez) |
| switch ifadesi | `var s = switch (x) { 1 => 'a', _ => 'b' };` | Tek değişkenin çok değerine göre **değer üret** |
| Desenler | `1 \|\| 2` · `>= 90` · `> 0 && < 600` · `_ when k` | switch kollarında VEYA, aralık, koruma |
| Aritmetik | `+ - * / ~/ %` | `/` → double, `~/` → int |
| Bileşik atama | `+= -= *= /= ~/= %=` · `++ --` | Değeri güncelle |
| Karşılaştırma | `== != > < >= <=` | Metinlerde `<` yok, `compareTo` var |
| Mantıksal | `&& \|\| !` | Kısa devre: null kontrolünü sola yaz |
| Tip | `is` · `is!` · `as` | Tipi bilinmeyen veri |
| for | `for (int i = 0; i < n; i++) { ... }` | Tekrar sayısı belli |
| for-in | `for (var e in liste) { ... }` | Bir listenin her elemanı |
| while | `while (kosul) { ... }` | Tekrar sayısı belli değil; 0 kez çalışabilir |
| do-while | `do { ... } while (kosul);` | En az 1 kez çalışmalı |
| break / continue | `break;` · `continue;` | Döngüden çık / turu atla |
| Etiket | `dis: for (...) { ... break dis; }` | İç içe döngülerde veya switch içinden dış döngüyü yönet |
| Girdi | `import 'dart:io';` · `(stdin.readLineSync() ?? '').trim()` | Klavyeden metin |
| Sayıya çevirme | `int.tryParse(m)` · `double.tryParse(m.replaceAll(',', '.'))` | Hatalı girdide çökmeden `null` |

---

# 16. Kendinizi Test Edin

Cevaplara bakmadan önce her soruyu çözmeye çalışın. Emin olamadığınız soruları VS Code'da deneyin. Sorulardaki kod parçaları tam program değildir; denemek için `void main() { ... }` içine yazın ve gerekiyorsa değişkenleri tanımlayın.

**1.** `puan = 75` iken aşağıdaki iki kod parçası ne yazdırır?
```dart
if (puan >= 50) print('A');
if (puan >= 70) print('B');
```
```dart
if (puan >= 50) {
  print('A');
} else if (puan >= 70) {
  print('B');
}
```

**Cevap:** İlki `A` ve `B` yazar; iki `if` bağımsızdır. İkincisi yalnızca `A` yazar: İlk koşul doğru olduğu için zincir biter. Ayrıca ikinci koddaki `else if (puan >= 70)` koluna **hiçbir zaman** ulaşılamaz; koşullar genelden özele yanlış sıralanmıştır.

**2.** `int sayi = 5; if (sayi) { ... }` neden derlenmez?

**Cevap:** Dart'ta koşul mutlaka `bool` olmalıdır; sıfır olmayan sayılar "doğru" kabul edilmez. `if (sayi != 0)` veya `if (sayi > 0)` yazılmalıdır.

**3.** Çıktı nedir?
```dart
print(17 ~/ 5);
print(17 % 5);
print(17 / 5);
```

**Cevap:** `3`, `2`, `3.4`

**4.** Çıktı nedir?
```dart
int a = 3;
int b = a++ + ++a;
print('$a $b');
```

**Cevap:** `5 8`. `a++` ifadesi 3 değerini verir, ardından `a` 4 olur. `++a` önce `a`'yı 5 yapar ve 5 değerini verir. `b = 3 + 5 = 8`, `a = 5`.

**5.** `String? ad;` iken `if (ad == null || ad.isEmpty)` neden hata vermez, ama `if (ad.isEmpty || ad == null)` neden derlenmez?

**Cevap:** `||` soldan sağa çalışır ve kısa devre yapar. İlk yazımda `ad == null` doğruysa sağ tarafa hiç geçilmez; yanlışsa Dart sağ tarafta `ad`'ın null olmadığını bilir. İkinci yazımda ise `ad.isEmpty` henüz null kontrolü yapılmadan, en başta çağrılmaya çalışılır.

**6.** Aşağıdaki switch ifadesi neden derlenmez?
```dart
String s = switch (kod) {
  200 => 'Tamam',
  404 => 'Yok',
};
```

**Cevap:** `int` tipinin tüm olası değerleri karşılanmamıştır; örneğin 500 gelirse `s` ne olacak? Switch ifadesi eksiksiz olmak zorundadır. `_ => '...'` kolu eklenmelidir.

**7.** Çıktı nedir?
```dart
for (int i = 10; i > 0; i -= 3) {
  print(i);
}
```

**Cevap:** `10`, `7`, `4`, `1`. Bir sonraki değer -2 olur ve `i > 0` yanlış olduğu için döngü biter.

**8.** Aşağıdaki iki döngü kaç kez yazdırır?
```dart
int x = 0;
while (x > 0) {
  print('A');
}
do {
  print('B');
} while (x > 0);
```

**Cevap:** `A` hiç yazılmaz; `while` koşula önce bakar. `B` bir kez yazılır; `do-while` gövdeyi önce çalıştırır.

**9.** Çıktı nedir?
```dart
dis:
for (int i = 1; i <= 3; i++) {
  for (int j = 1; j <= 3; j++) {
    if (i * j == 4) break dis;
    print('$i-$j');
  }
}
```

**Cevap:** `1-1`, `1-2`, `1-3`, `2-1`. `i = 2, j = 2` olduğunda çarpım 4 olur ve `break dis` iki döngüden birden çıkar.

**10.** Bir menü döngüsünün içindeki `switch`'te, `case '0':` koluna `break;` yazıldı ama program menüyü göstermeye devam ediyor. Neden? İki çözüm yazın.

**Cevap:** `switch` içindeki `break` yalnızca switch'ten çıkar, döngüden değil. Çözümler: Döngüye etiket verip `break etiket;` yazmak veya bir bayrak değişkeni (`devam = false`) kullanmak.

**11.** `stdin.readLineSync()` neden `String?` döndürür? Bunu güvenle nasıl `String`'e çevirirsiniz?

**Cevap:** Giriş akışı kapanırsa (örneğin `Ctrl + D`) okunacak satır kalmaz ve `null` döner. Güvenli yol: `stdin.readLineSync() ?? ''`

**12.** Kullanıcı fiyat olarak `3,5` girdi. `double.tryParse('3,5')` ne döndürür? Nasıl düzeltirsiniz?

**Cevap:** `null` döndürür, çünkü Dart ondalık ayırıcı olarak nokta bekler. `double.tryParse(girdi.replaceAll(',', '.'))` ile düzeltilir.

---

# 17. Ödev 1

> **AI Seviye 0:** Bu ödevi yapay zekâ araçları kullanmadan çözün. Ödev çözümleri **3. haftanın ilk 15 dakikasında** sınıfta birlikte yapılacaktır. Derste rastgele seçilen öğrencilerden çözümlerini kısaca açıklamaları istenebilir.

**Teslim:**
- Her soru **ayrı bir dosya** olsun: `odev1_s1.dart`, `odev1_s2.dart`, ...
- Teslimden önce her dosyada `Shift + Alt + F` ile biçimlendirme yapın ve **Problems** panelinde hata kalmadığından emin olun.
- Teslim tarihi ve yöntemi Classroom'daki ödev sayfasındadır.
- **1–6. sorular zorunlu**, 7–8. sorular isteğe bağlıdır (ek puan).

Klavyeden veri alan tüm programlarda girdiyi `tryParse` ile çevirin; geçersiz girdide program **çökmemeli**.

---

### Soru 1 — Pil Tasarruf Simülasyonu *(while)*

Kullanıcıdan başlangıç pil seviyesini (1–100) alın. Her adım 1 dakikadır:
- Pil **%20'nin üzerindeyse** dakikada **4** puan azalır.
- Pil **%20 veya altındaysa** güç tasarrufu modu devrededir ve dakikada **2** puan azalır.
- Pil ilk kez %20 veya altına indiğinde **bir kez** `Güç tasarrufu modu açıldı.` yazdırın. Başlangıç değeri zaten 20 veya altındaysa bu mesajı en başta yazdırın.
- Pil 0 veya altına inince `%0` yazdırın, döngüyü bitirin ve toplam süreyi yazdırın.
- Geçersiz girdide `Lütfen 1 ile 100 arasında bir sayı girin.` yazdırıp programı bitirin.

**Beklenen ekran çıktısı:**

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

---

### Soru 2 — Kargo Ücreti Hesaplayıcı *(if / else if, switch ifadesi)*

Kullanıcıdan sırasıyla şunları alın: sepet tutarı (virgüllü girişi de kabul edin), teslimat bölgesi (`1` şehir içi, `2` yurt içi, `3` uzak bölge) ve premium üyelik (`e` / `h`).

Kurallar (bu sırayla):
1. Tutar geçersizse veya 0 ya da altındaysa: `Geçersiz tutar.`
2. Bölge 1, 2, 3 dışındaysa: `Geçersiz bölge.`
3. Premium üyeyse kargo **ücretsiz** (`Ücretsiz (Premium üye)`).
4. Tutar **300 TL veya üzeriyse** kargo **ücretsiz** (`Ücretsiz (300 TL üzeri)`).
5. Diğer durumlarda bölgeye göre: `1` → 29,90 TL · `2` → 39,90 TL · `3` → 59,90 TL. Bölge ücretini **switch ifadesiyle** belirleyin.

**Beklenen ekran çıktısı:**

```text
Sepet tutarı (TL): 250
Bölge (1: Şehir içi, 2: Yurt içi, 3: Uzak bölge): 2
Premium üye misiniz? (e/h): h
Kargo: 39.90 TL
Ödenecek toplam: 289.90 TL
```

```text
Sepet tutarı (TL): 120
Bölge (1: Şehir içi, 2: Yurt içi, 3: Uzak bölge): 3
Premium üye misiniz? (e/h): e
Kargo: Ücretsiz (Premium üye)
Ödenecek toplam: 120.00 TL
```

```text
Sepet tutarı (TL): 349,50
Bölge (1: Şehir içi, 2: Yurt içi, 3: Uzak bölge): 1
Premium üye misiniz? (e/h): h
Kargo: Ücretsiz (300 TL üzeri)
Ödenecek toplam: 349.50 TL
```

---

### Soru 3 — Asal Sayı Kontrolü *(for, break)*

Kullanıcıdan 2 veya daha büyük bir tam sayı alın. Sayı asalsa bunu yazdırın; değilse **en küçük bölenini** yazdırın.

**İpuçları:** 2'den başlayarak bölenleri deneyin. Bir bölen bulduğunuz anda `break` ile çıkın. Yalnızca `bolen * bolen <= sayi` olan bölenleri denemek yeterlidir (neden olduğunu düşünün).

**Beklenen ekran çıktısı:**

```text
Bir sayı girin: 97
97 asal bir sayıdır.
```

```text
Bir sayı girin: 91
91 asal değildir; en küçük böleni 7.
```

```text
Bir sayı girin: 1
Lütfen 2 veya daha büyük bir tam sayı girin.
```

---

### Soru 4 — Ayın Gün Sayısı *(switch ifadesi, mantıksal operatörler)*

Kullanıcıdan bir yıl ve bir ay numarası (1–12) alın; o ayın kaç gün çektiğini yazdırın.

**İpuçları:**
- Artık yıl kuralı: Yıl 4'e tam bölünür **ve** 100'e tam bölünmez **ya da** 400'e tam bölünür.
  `(yil % 4 == 0 && yil % 100 != 0) || yil % 400 == 0`
- Ayları switch ifadesinde `||` ile gruplayın: `1 || 3 || 5 || 7 || 8 || 10 || 12 => 31`

**Beklenen ekran çıktısı:**

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

```text
Yıl: 2026
Ay (1-12): 13
Ay 1 ile 12 arasında olmalı.
```

---

### Soru 5 — Birim Dönüştürücü Menüsü *(while, switch, etiketli break)*

Kullanıcı `0` seçene kadar tekrar eden bir menü yazın:

```text
--- BİRİM DÖNÜŞTÜRÜCÜ ---
1) km → mil
2) mil → km
3) °C → °F
4) °F → °C
0) Çıkış
```

- Seçimden sonra dönüştürülecek değeri isteyin (virgüllü girişi de kabul edin). Sonucu 2 ondalık basamakla yazdırın.
- Dönüşümler: `mil = km × 0.621371` · `km = mil × 1.609344` · `°F = °C × 9 / 5 + 32` · `°C = (°F − 32) × 5 / 9`
- Geçersiz değerde `Geçersiz değer.` yazıp menüye dönün. Geçersiz seçimde `Geçersiz seçim.` yazın.
- `0` seçildiğinde yapılan dönüşüm sayısını yazdırıp **etiketli break** ile çıkın.

**Beklenen ekran çıktısı (bir bölümü):**

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

---

### Soru 6 — Sayı Tahmin Oyunu *(do-while, break)*

Program 1 ile 100 arasında gizli bir sayı tutsun; kullanıcının **en fazla 7 hakkı** olsun. Her tahminden sonra `Daha büyük bir sayı söyleyin.` veya `Daha küçük bir sayı söyleyin.` ipucunu verin. **Geçersiz girdi hak harcamasın.**

**İpucu:** Rastgele sayı için dosyanın başına `import 'dart:math';` ekleyin ve şunu kullanın:

```dart
int gizliSayi = Random().nextInt(100) + 1; // 1 ile 100 arası
```

Programınızı test ederken gizli sayıyı geçici olarak ekrana yazdırabilirsiniz; teslimden önce o satırı silin.

**Beklenen ekran çıktısı (örnek; sayı her seferinde farklıdır):**

```text
1 ile 100 arasında bir sayı tuttum. 7 hakkınız var.
Tahmin 1/7: 50
Daha küçük bir sayı söyleyin.
Tahmin 2/7: 25
Daha büyük bir sayı söyleyin.
Tahmin 3/7: otuz
Geçersiz girdi, hakkınız azalmadı.
Tahmin 3/7: 37
Tebrikler! 3. denemede bildiniz.
```

Hak biterse: `Hakkınız bitti. Tuttuğum sayı 37 idi.`

---

### Soru 7 *(isteğe bağlı)* — Değerlendirme Yıldızları *(for, metin tekrarı)*

Kullanıcıdan 1–5 arası bir puan alın. Tüm puan seviyelerini bir `for` döngüsüyle listeleyin, kullanıcının puanını işaretleyin. Seviye adlarını switch ifadesiyle belirleyin: 1 Çok kötü · 2 Kötü · 3 Orta · 4 İyi · 5 Mükemmel.

**İpucu:** `'*' * puan + '-' * (5 - puan)`

**Beklenen ekran çıktısı:**

```text
Uygulamamızı 1-5 arası puanlayın: 4
1 [*----] Çok kötü
2 [**---] Kötü
3 [***--] Orta
4 [****-] İyi  ← sizin puanınız
5 [*****] Mükemmel
Teşekkürler!
```

---

### Soru 8 *(isteğe bağlı)* — Şifre Güç Göstergesi *(for-in, if, switch ifadesi)*

Kullanıcıdan bir şifre alın. Aşağıdaki her ölçüt için 1 puan verin:

| Ölçüt | Eksikse yazdırılacak mesaj |
|---|---|
| En az 8 karakter | `- En az 8 karakter` |
| En az bir rakam | `- En az bir rakam` |
| En az bir büyük harf (A–Z) | `- En az bir büyük harf (A-Z)` |
| En az bir küçük harf (a–z) | `- En az bir küçük harf (a-z)` |
| En az bir özel karakter (`!@#$%^&*.-_`) | `- En az bir özel karakter` |

Puana göre seviyeyi switch ifadesiyle belirleyin: 0–1 **Çok zayıf** · 2 **Zayıf** · 3 **Orta** · 4 **Güçlü** · 5 **Çok güçlü**

**İpuçları:**
- Karakterleri `for (var k in sifre.split(''))` ile dolaşın.
- Bir karakterin büyük harf olup olmadığını `'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.contains(k)` ile kontrol edebilirsiniz.
- Dart'ta `$` işareti metin içinde değişken başlatır. Özel karakter listesini yazarken **ham metin** kullanın: `r'!@#$%^&*.-_'` (başındaki `r`, metindeki özel işaretlerin olduğu gibi kalmasını sağlar).

**Beklenen ekran çıktısı:**

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

---

# 18. Kaynaklar

| Kaynak | Adres | Konu |
|---|---|---|
| Dallanma (branches) | [dart.dev/language/branches](https://dart.dev/language/branches) | if, switch deyimi ve ifadesi |
| Döngüler | [dart.dev/language/loops](https://dart.dev/language/loops) | for, while, do-while, break, continue, etiketler |
| Operatörler | [dart.dev/language/operators](https://dart.dev/language/operators) | Tüm operatörler ve öncelik tablosu |
| Desenler | [dart.dev/language/patterns](https://dart.dev/language/patterns) | switch'teki ilişkisel desenler, `when` |
| dart:io API | [api.dart.dev](https://api.dart.dev) → `dart:io` → `Stdin` | `readLineSync` ayrıntıları |

---

### Gelecek Hafta

**Hafta 3 — Fonksiyonlar ve Koleksiyonlar:** Fonksiyon tanımlama, kısa gösterim (`=>`), isteğe bağlı ve isimlendirilmiş parametreler; sabit ve dinamik uzunluklu listeler, liste metotları, Set ve Map. Bu hafta tekrar tekrar yazdığımız "girdiyi oku, temizle, sayıya çevir" kodunu bir fonksiyona dönüştüreceğiz.

**Derse hazırlık:**
- Ödev 1'i teslim edin. Çözümler derse ilk 15 dakikada birlikte yapılacak.
- Bu nottaki "Kendinizi Test Edin" sorularını çözün.

---

*BMH309 Mobil Cihaz Programlama · Hafta 2 Ders Notu*
