# <font color='blue'>**Hafta 6 · İstisnalar, Generic Tipler ve Asenkron Programlama**</font>

---
**Ders:** BMH309 Mobil Cihaz Programlama
**Konular:** Ödev 4 çözümleri · Hatalar ve istisnalar (`try`, `catch`, `on`, `finally`, `rethrow`, `throw`) · Kendi istisna sınıflarımız · Generic tipler (`<T>`) · Record'lar · Asenkron programlama (`Future`, `async`, `await`) · `Stream` · Yapay zekâ ile eş programlama ve `AI_LOG.md`
**Yazar:** Dr. Öğr. Üyesi Fesih Keskin

---

# Giriş

Geçen haftayı bir soruyla bitirmiştik: Sunucudan gelen `'kargo'` metni `SiparisDurumu.values.byName('kargo')` ile enum'a çevrilmeye çalışıldığında program **çöküyordu**. Gerçek bir uygulamada bu, kullanıcının ekranının bir anda kapanması demektir. Kullanıcı bunun nedenini bilemez; tek bildiği "uygulamanın bozuk" olduğudur.

Şimdiye kadar yazdığımız programlar kapalı bir dünyada yaşıyordu: Veriyi biz yazıyorduk, her şey anında hesaplanıyordu ve hiçbir şey ters gitmiyordu. Mobil uygulamalar ise **gerçek dünyayla** konuşur ve gerçek dünya üç konuda bizi zorlar:

1. **Bir şeyler ters gider.** Kullanıcı yaş kutusuna harf yazar, metroda internet kesilir, sunucu beklenmedik bir veri gönderir. Program çökmemeli; ne olduğunu kullanıcıya anlaşılır bir dille söylemeli. → **İstisnalar** (Bölüm 2–4)
2. **Aynı kalıp, farklı tipler.** Ürün listesi, mesaj listesi, kullanıcı listesi... "Önbellekte sakla", "sayfa sayfa yükle", "işlem başarılı mı, hatalı mı?" gibi kalıpları her tip için ayrı ayrı yazmak istemeyiz. → **Generic tipler ve record'lar** (Bölüm 5–6)
3. **Bazı işler zaman alır.** İnternetten hava durumu 2 saniyede gelir. Bu 2 saniye boyunca ekran donmamalı; kullanıcı kaydırabilmeli, düğmelere basabilmeli. → **Asenkron programlama** (Bölüm 7–9)

Bu üç konu, bir mobil uygulamanın **internetten veri çeken** her ekranında birlikte karşınıza çıkar:

| Bu hafta öğreneceğiniz | Flutter'da karşınıza çıkacağı yer |
|---|---|
| `try` / `catch` | Giriş ekranında yanlış şifre: `on FirebaseAuthException catch (e)` → ekranın altında kırmızı bir uyarı |
| Kendi istisna sınıflarınız | "İnternet yok", "Oturum süresi doldu", "Sunucu hatası" durumlarını ekranda farklı mesajlara çevirmek |
| Generic tipler | `List<Urun>`, `Future<List<Urun>>`, `FutureBuilder<Hava>`, `StreamBuilder<int>`, `State<SayacEkrani>` |
| Record'lar | Bir fonksiyondan `(enlem, boylam)` gibi birden fazla değeri tek seferde döndürmek |
| `Future`, `async`, `await` | İnternetten veri çekmek (`http.get`), telefona veri kaydetmek, kamerayı açıp fotoğrafı beklemek |
| `Stream` | Sohbet mesajları, Firestore'un canlı veritabanı (`snapshots()`), konum ve adım sayar güncellemeleri |

Bu hafta aynı zamanda **yapay zekâ kullanım kuralının değiştiği** haftadır. Bundan sonra AI'ı yalnızca açıklama için değil, **eş programcı** olarak da kullanacaksınız. Bunun nasıl doğru yapılacağını Bölüm 12'de ayrıntılı olarak ele alıyoruz.

### Bu Haftanın Hedefleri

Bu haftanın sonunda şunları yapabiliyor olmalısınız:

1. Derleme hatası, çalışma zamanı hatası ve mantık hatasını ayırt etmek; konsoldaki hata mesajını ve **yığın izini** (stack trace) okuyarak hatanın hangi satırda olduğunu bulmak.
2. `try`, `catch`, `on`, `finally` ve `rethrow` ile hataları yakalamak; `Exception` ile `Error` arasındaki farkı açıklamak.
3. `throw` ile hata fırlatmak; ek bilgi taşıyan kendi istisna sınıflarınızı yazmak.
4. Bir hatalı durumu ele almak için `tryParse`, `null` döndürmek, istisna fırlatmak ve sonuç nesnesi döndürmek arasında duruma göre seçim yapmak.
5. Generic sınıf ve generic fonksiyon yazmak; tip parametrelerine sınır (`extends`) koymak.
6. Record'larla bir fonksiyondan birden fazla değer döndürmek ve bu değerleri parçalayarak (destructuring) değişkenlere almak.
7. Senkron ve asenkron çalışmanın farkını açıklamak; `Future`'ın ne olduğunu kendi cümlelerinizle anlatmak.
8. `async` ve `await` ile asenkron fonksiyonlar yazmak; asenkron bir programın satırlarının hangi sırayla çalışacağını adım adım takip etmek.
9. Asenkron işlemlerde hataları yakalamak; `Future.wait` ile birbirinden bağımsız işleri aynı anda yürütmek; `timeout` ile zaman aşımı koymak.
10. `async*` ve `yield` ile Stream üretmek; `await for` ve `listen` ile Stream dinlemek.
11. AI'ı eş programcı olarak kullanırken **Oku → Anla → Planla → Değiştir → Test et** döngüsünü uygulamak, AI'ın yazdığı koddaki tipik hataları yakalamak ve `AI_LOG.md` tutmak.

### Bu Haftanın AI Kuralı

> **Hafta 6 ve sonrası: "AI eş programcıdır; kodun sahibi sizsiniz."**
> - AI'a kod yazdırabilir, kodunuzu düzelttirebilir, örnek veri ve test ürettirebilirsiniz.
> - Teslim ettiğiniz **her satırı** okuyup açıklayabilmelisiniz. Derste veya sözlü savunmada "Bu satır ne yapıyor?" sorusuna "AI yazdı" cevabı kabul edilmez.
> - AI'ın önerdiği kodu **okumadan, çalıştırmadan ve denemeden** kabul etmeyin. AI'ın kodu derlenebilir ve yine de yanlış olabilir.
> - AI kullandığınız her ödev ve proje çalışmasında bir `AI_LOG.md` dosyası tutun (şablonu Bölüm 12.4'te).
> - AI'a şifre, API anahtarı, kişisel veri (T.C. kimlik numarası, telefon numarası, öğrenci bilgileri) veya başkasına ait kod **vermeyin**.
> - Ara sınav, final sınavı ve sözlü savunma **AI kapalı** yapılır. Sınıf içi mini görevlerde AI'ın açık mı kapalı mı olduğu her görevde ayrıca söylenir.
> - Bu haftanın konuları (özellikle istisnalar ve `async`/`await`), AI'ın **en sık hata yaptığı** konulardır: hataları sessizce yutan boş `catch` blokları, unutulan `await`'ler, her şeyi `dynamic` yapan kodlar... Bu yüzden bu konuları önce AI'sız gerçekten anlamanız gerekiyor. Bölüm 12'de AI'ın yazdığı hatalı bir kodu birlikte denetleyeceğiz.

### Başlamadan Önce

- Bu hafta için `C:\dev\bmh309\hafta6` klasörünü oluşturup VS Code'da açın.
- Her kod bloğu tek başına çalışan tam bir programdır ve ilk satırında önerilen dosya adı yazar (`// Dosya: ...`).
- **Asenkron örnekler (Bölüm 7–11) bilerek bekler.** Çıktının bazı satırları 1–3 saniye sonra gelir. Programı çalıştırdıktan sonra terminali izleyin; beklemeler örneğin bir parçasıdır. Çıktıların hangi sırayla ve ne zaman geldiğine dikkat edin.
- Bazı örneklerin ilk satırlarında `import 'dart:async';` göreceksiniz. `Future` ve `Stream` her Dart dosyasında hazırdır; ancak `TimeoutException`, `StreamController` gibi bazı yardımcılar `dart:async` kütüphanesindedir ve bu satırla dosyaya eklenir.
- ❌ işaretli bloklar bilerek hatalıdır. "**Çıktı (bir bölümü)**" yazan yerlerde konsolda daha fazla satır görürsünüz; dosya yolları ve satır numaraları sizinkilerden farklı olabilir.
- Bu nottaki örnekler Dart 3.14 ile denenmiştir; Dart 3.0 ve sonraki sürümlerde çalışırlar. Sürümünüzü terminalde `dart --version` ile görebilirsiniz. Hata mesajlarının metni sürümden sürüme küçük farklar gösterebilir.

---

# İçindekiler

1. [Ödev 4 Çözümleri](#1-ödev-4-çözümleri)
2. [Hatalar: Program Neden Çöker?](#2-hatalar-program-neden-çöker)
3. [try, catch, finally: Hataları Yakalamak](#3-try-catch-finally-hataları-yakalamak)
4. [throw: Kendi Hatalarımızı Fırlatmak](#4-throw-kendi-hatalarımızı-fırlatmak)
5. [Generic Tipler](#5-generic-tipler)
6. [Record'lar: Birden Fazla Değeri Birlikte Taşımak](#6-recordlar-birden-fazla-değeri-birlikte-taşımak)
7. [Asenkron Programlama I: Future, async ve await](#7-asenkron-programlama-i-future-async-ve-await)
8. [Asenkron Programlama II: Hatalar, Paralel İşler ve Zaman Aşımı](#8-asenkron-programlama-ii-hatalar-paralel-işler-ve-zaman-aşımı)
9. [Stream: Sürekli Gelen Veriler](#9-stream-sürekli-gelen-veriler)
10. [Hepsini Birleştirelim: Kampüs Duyuru Ekranının Veri Katmanı](#10-hepsini-birleştirelim-kampüs-duyuru-ekranının-veri-katmanı)
11. [Örnek Problem ve Farklı Çözüm Yolları](#11-örnek-problem-ve-farklı-çözüm-yolları)
12. [Yapay Zekâ ile Eş Programlama](#12-yapay-zekâ-ile-eş-programlama)
13. [Özet](#13-özet)
14. [Kendinizi Test Edin](#14-kendinizi-test-edin)
15. [Ödev 5](#15-ödev-5)
16. [Kaynaklar](#16-kaynaklar)

---

# 1. Ödev 4 Çözümleri

Bu bölümde geçen haftanın ödev sorularının birer örnek çözümünü veriyoruz. **Sizin çözümünüz farklı olabilir.** Verilen `main` fonksiyonuyla çıktınız beklenen çıktıyla birebir aynıysa ve override ettiğiniz metotlarda `@override` kullandıysanız çözümünüz doğrudur.

Ödev 4, AI'ın yalnızca açıklayıcı olarak kullanılabildiği **son** ödevdi. Çözümleri okurken her satırı kendi kodunuzla karşılaştırın: Bu hafta AI'ın yazdığı kodları denetleyeceğiz ve bunun için önce bu tür kodları rahatça okuyabilmeniz gerekiyor.

## Soru 1 — Akıllı Ev Cihazları

**Çözümün mantığı:** `Cihaz` soyut bir kalıptır: Her cihazın bir odası ve açık/kapalı durumu vardır; ama cihazın **türünün adı** ve **ne kadar güç harcadığı** her alt sınıfta farklıdır. Bu ikisi soyut bırakılır. `durum()` metodu ise bu soyut üyeleri kullanan ortak bir **şablon metottur**; bir kez yazılır, her cihaz için çalışır.

```dart
// Dosya: 01_s1_akilli_ev.dart
abstract class Cihaz {
  final String oda;
  bool acik = false;

  Cihaz(this.oda);

  String get tur;

  double anlikWatt();

  String durum() =>
      '${tur.padRight(5)} - ${oda.padRight(8)}: ${(acik ? 'açık' : 'kapalı').padRight(6)} ${anlikWatt().toStringAsFixed(0).padLeft(5)} W';
}

class Ampul extends Cihaz {
  final int parlaklik;

  Ampul(super.oda, {this.parlaklik = 100});

  @override
  String get tur => 'Ampul';

  @override
  double anlikWatt() => acik ? parlaklik * 0.1 : 0;
}

class Klima extends Cihaz {
  final int hedefSicaklik;

  Klima(super.oda, this.hedefSicaklik);

  @override
  String get tur => 'Klima';

  @override
  double anlikWatt() => acik ? 900.0 + (24 - hedefSicaklik).abs() * 50 : 0;
}

class Priz extends Cihaz {
  final double bagliCihazWatt;

  Priz(super.oda, this.bagliCihazWatt);

  @override
  String get tur => 'Priz';

  @override
  double anlikWatt() => acik ? bagliCihazWatt : 0;
}

double toplamWatt(List<Cihaz> liste) =>
    liste.fold(0.0, (toplam, c) => toplam + c.anlikWatt());

List<String> aciklar(List<Cihaz> liste) =>
    liste.where((c) => c.acik).map((c) => '${c.tur} (${c.oda})').toList();

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

  // Abstract classes can't be instantiated.
  // Cihaz c = Cihaz('Banyo');
}
```

**Çıktı:**

```text
Ampul - Salon   : açık       6 W
Ampul - Mutfak  : kapalı     0 W
Klima - Salon   : açık    1100 W
Priz  - Çalışma : açık     150 W
Toplam: 1256 W
Açık cihazlar: [Ampul (Salon), Klima (Salon), Priz (Çalışma)]
```

**Açıklama:**
- `String get tur;` ve `double anlikWatt();` gövdesiz (soyut) üyelerdir. Her alt sınıf bunları **yazmak zorundadır**; yazmazsa derleme hatası alır.
- `Ampul(super.oda, {this.parlaklik = 100})`: `super.oda` değeri üst sınıfın kurucusuna iletir, `{this.parlaklik = 100}` ise varsayılan değeri olan isimli bir parametredir. `Ampul('Mutfak')` yazıldığında parlaklık 100 olur.
- Klimada `900.0 + ...` yazılmasının nedeni: `900 + (24 - hedefSicaklik).abs() * 50` ifadesinin tamamı `int`'tir ve `double` döndüren bir metottan `int` döndürülemez. `900.0` yazınca toplama `double` olur. (Alternatif: `(...).toDouble()`.) `: 0` kısmında ise sorun yoktur; sayı **sabitleri** (literal) `double` beklenen yerde kendiliğinden `0.0` olur.
- `fold(0.0, ...)`: Başlangıç değeri `0.0` olduğu için toplam `double` olarak tutulur. Kapalı cihazlar 0 döndürdüğü için ayrıca filtrelemeye gerek yoktur: 6 + 0 + 1100 + 150 = 1256.
- **Ek görevin cevabı:** `Cihaz c = Cihaz('Banyo');` satırı "Abstract classes can't be instantiated." hatasını verir. *Türkçesi:* "Soyut sınıflardan nesne oluşturulamaz." "Türü belirsiz bir cihaz" ne kadar watt harcar? Bu sorunun cevabı olmadığı için Dart buna izin vermez.

## Soru 2 — Sipariş Takip Ekranı

**Çözümün mantığı:** Her sipariş durumunun sabit bir etiketi ve ilerleme yüzdesi vardır; bu, alan taşıyan bir **gelişmiş enum** demektir. Arama sonucu ise üç farklı biçimde olabilir ve her biri farklı veri taşır (bulunan siparişin durumu, bulunamayanın numarası, geçersiz girilen metin); bu da bir **sealed sınıf** demektir.

```dart
// Dosya: 01_s2_siparis_takip.dart
enum SiparisDurumu {
  alindi('Sipariş alındı', 10),
  hazirlaniyor('Hazırlanıyor', 40),
  kargoda('Kargoda', 75),
  teslimEdildi('Teslim edildi', 100);

  final String etiket;
  final int ilerleme;

  const SiparisDurumu(this.etiket, this.ilerleme);

  String get cubuk {
    int dolu = ilerleme ~/ 10;
    return '[${'#' * dolu}${'-' * (10 - dolu)}]';
  }
}

sealed class TakipSonucu {}

class Bulundu extends TakipSonucu {
  final String no;
  final SiparisDurumu durum;

  Bulundu(this.no, this.durum);
}

class Bulunamadi extends TakipSonucu {
  final String no;

  Bulunamadi(this.no);
}

class GecersizNumara extends TakipSonucu {
  final String girilen;

  GecersizNumara(this.girilen);
}

TakipSonucu siparisAra(Map<String, SiparisDurumu> kayitlar, String girilen) {
  String no = girilen.trim().toUpperCase();
  if (!no.startsWith('SP-') || no.length != 7) {
    return GecersizNumara(girilen.trim());
  }
  SiparisDurumu? durum = kayitlar[no];
  if (durum == null) {
    return Bulunamadi(no);
  }
  return Bulundu(no, durum);
}

String ekran(TakipSonucu sonuc) => switch (sonuc) {
      Bulundu b => '${b.no}: ${b.durum.etiket} ${b.durum.cubuk} %${b.durum.ilerleme}',
      Bulunamadi b => '${b.no} numaralı sipariş bulunamadı.',
      GecersizNumara g => '"${g.girilen}" geçerli bir sipariş numarası değil.',
    };

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

**Çıktı:**

```text
SP-1024: Kargoda [#######---] %75
SP-1025: Sipariş alındı [#---------] %10
SP-1019: Teslim edildi [##########] %100
SP-9999 numaralı sipariş bulunamadı.
"1024" geçerli bir sipariş numarası değil.
Aktif siparişler: [SP-1024, SP-1025]
```

**Açıklama:**
- `'#' * dolu`: Dart'ta bir metni bir tam sayıyla çarpmak, metni o kadar kez **tekrarlar**: `'#' * 3` → `'###'`. İlerleme 75 ise `75 ~/ 10` = 7 dolu, 3 boş kutu çizilir.
- `girilen.trim().toUpperCase()`: Kullanıcının yanlışlıkla yazdığı boşluklar silinir ve küçük harfle yazılan `sp-1025` de bulunur. Mobil uygulamalarda arama ve kod girişi kutularında bu temizlik **her zaman** yapılmalıdır.
- `kayitlar[no]` bir `SiparisDurumu?` döndürür (anahtar yoksa `null`). `if (durum == null)` kontrolünden sonra Dart, `durum`'un artık null olamayacağını bilir; bu yüzden son satırda `Bulundu(no, durum)` yazılabilir (tip yükseltme).
- `switch` ifadesinde `_` kolu yoktur. Yarın `IptalEdildi` diye dördüncü bir sonuç türü eklerseniz, `ekran` fonksiyonu derleme hatası vererek sizi uyarır.
- **Bu haftayla bağlantısı:** Geçersiz bir numara girilmesi bir "hata"dır; ama bu çözümde program çökmüyor, hata bir **sonuç türüyle** (`GecersizNumara`) ifade ediliyor. Bölüm 4.5'te bir hatalı durumu ne zaman böyle bir sonuçla, ne zaman bir istisnayla ifade etmemiz gerektiğini konuşacağız.

## Soru 3 — Sosyal Akış

**Çözümün mantığı:** "Paylaşılabilmek" bir **sözleşmedir** (arayüz): Gönderi, fotoğraf ve reklam paylaşılabilir. "Beğenilebilmek" ise **hazır kod**dur (sayaç + metotlar) ve yalnızca kullanıcı içeriklerinde vardır; bu bir **mixin** demektir. Gönderi ve fotoğrafın ortak yanı (yazarı, beğenilebilmesi) soyut `SosyalIcerik` sınıfında toplanır. Reklam bu sınıfa dahil edilmediği için beğeni yeteneği de almaz.

```dart
// Dosya: 01_s3_sosyal_akis.dart
abstract class Paylasilabilir {
  String paylasimMetni();
}

mixin Begenilebilir {
  int _begeni = 0;

  int get begeni => _begeni;

  void begen([int kez = 1]) {
    _begeni += kez;
  }
}

abstract class SosyalIcerik with Begenilebilir implements Paylasilabilir {
  final String yazar;

  SosyalIcerik(this.yazar);
}

class Gonderi extends SosyalIcerik {
  final String metin;

  Gonderi(super.yazar, this.metin);

  @override
  String paylasimMetni() => '@$yazar: $metin';
}

class Fotograf extends SosyalIcerik {
  final String dosya;

  Fotograf(super.yazar, this.dosya);

  @override
  String paylasimMetni() => '@$yazar bir fotoğraf paylaştı: $dosya';
}

class Reklam implements Paylasilabilir {
  final String marka;

  Reklam(this.marka);

  @override
  String paylasimMetni() => '[Sponsorlu] $marka';
}

int toplamBegeni(List<Paylasilabilir> akis) =>
    akis.whereType<SosyalIcerik>().fold(0, (toplam, i) => toplam + i.begeni);

List<String> populerler(List<Paylasilabilir> akis, {int enAz = 10}) => akis
    .whereType<SosyalIcerik>()
    .where((i) => i.begeni >= enAz)
    .map((i) => i.paylasimMetni())
    .toList();

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

**Çıktı:**

```text
@ayse: Flutter projem bitti! (12 beğeni)
@mert bir fotoğraf paylaştı: kampus.jpg (25 beğeni)
[Sponsorlu] Cep Market
@zeynep: Dart çok keyifli. (4 beğeni)
Toplam beğeni: 41
Popüler (10+): [@ayse: Flutter projem bitti!, @mert bir fotoğraf paylaştı: kampus.jpg]
```

**Açıklama:**
- `SosyalIcerik` soyut olduğu için `paylasimMetni()` metodunu yazmak zorunda **değildir**; bu sorumluluk somut alt sınıflara (`Gonderi`, `Fotograf`) geçer.
- `begen([int kez = 1])`: Köşeli parantez, parametrenin **isteğe bağlı** olduğunu gösterir. `g2.begen(3)` 3, `g2.begen()` 1 beğeni ekler; toplam 4.
- `whereType<SosyalIcerik>()`: Akıştaki reklamı atar ve geri kalanları `SosyalIcerik` tipinde verir. Bu sayede `fold` içinde `i.begeni` yazılabilir. `whereType`'taki `<SosyalIcerik>` yazımına dikkat edin: Bu, bu hafta Bölüm 5'te göreceğimiz **generic metotların** bir örneğidir.
- `_begeni` alanı mixin'in içinde private'tır. Dışarıdan `g1._begeni = 1000` yazılamaz (başka bir dosyadan); beğeni yalnızca `begen` metoduyla artar.

## Soru 4 — Uzantılar

**Çözümün mantığı:** Her uzantı, var olan bir tipe (`String`, `int`, `List<double>`) yeni bir **getter** ekler. Türkçe büyük-küçük harf dönüşümü için Hafta 5 Bölüm 5.2'deki `TurkceMetin` uzantısı aynı dosyaya eklenir ve diğer uzantıların içinde kullanılır.

```dart
// Dosya: 01_s4_uzantilar.dart
extension TurkceMetin on String {
  String get trBuyuk => replaceAll('i', 'İ').replaceAll('ı', 'I').toUpperCase();

  String get trKucuk => replaceAll('I', 'ı').replaceAll('İ', 'i').toLowerCase();
}

extension MetinAraclari on String {
  String get baslikHali => split(' ')
      .where((k) => k.isNotEmpty)
      .map((k) => '${k[0].trBuyuk}${k.substring(1).trKucuk}')
      .join(' ');

  int get kelimeSayisi => split(' ').where((k) => k.isNotEmpty).length;

  bool get gecerliTelefonMu {
    String rakamlar = replaceAll(' ', '');
    bool hepsiRakam = rakamlar.split('').every((c) => '0123456789'.contains(c));
    return hepsiRakam && (rakamlar.length == 10 || rakamlar.length == 11);
  }
}

extension SayiAraclari on int {
  String get binlikli {
    String s = toString();
    String sonuc = '';
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) {
        sonuc += '.';
      }
      sonuc += s[i];
    }
    return sonuc;
  }

  String get sureMetni => this < 60 ? '$this dk' : '${this ~/ 60} sa ${this % 60} dk';
}

extension ListeIstatistigi on List<double> {
  double get toplam => fold(0.0, (t, x) => t + x);

  double get ortalama => isEmpty ? 0 : toplam / length;
}

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

**Çıktı:**

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

**Açıklama:**
- `baslikHali`: Metin boşluklardan bölünür, boş parçalar atılır (iki kelime arasında iki boşluk olabilir), her kelimenin ilk harfi `trBuyuk`, kalanı `trKucuk` yapılır ve kelimeler yeniden birleştirilir. `'KIRK'` → `'K'` + `'ırk'` → `'Kırk'`. Standart `toLowerCase()` kullanılsaydı sonuç `'Kirk'` olurdu.
- `gecerliTelefonMu`: `split('')` metni tek tek karakterlere böler; `every` her karakterin `'0123456789'` içinde olup olmadığını sorar. `'0532-111'` içindeki tire rakam olmadığı için sonuç `false` olur.
- `binlikli`: Sayının rakamları soldan sağa dolaşılır; **sağda kalan** rakam sayısı 3'ün katı olduğunda araya nokta konur. `12100` için `i = 2`'de sağda 3 rakam (`100`) kalır, nokta oraya girer: `12.100`. Bu çözüm negatif sayıları ele almaz; geliştirmeyi size bırakıyoruz.
- `List<double>` üzerindeki uzantıda `fold` ve `length` doğrudan yazılabilir; çünkü uzantının içinde `this` listenin kendisidir.
- **Uzantıların kendi aralarında kullanımı:** `MetinAraclari` içinde `trBuyuk` çağrılabilir; çünkü her iki uzantı da aynı dosyadadır ve `String` tipine eklenmiştir.

## Soru 5 — Fitness Uygulaması

**Çözümün mantığı:** Döngü yasak olduğu için her soruyu "hangi metot bu işi yapar?" diye düşünerek çözüyoruz: toplamak → `fold`; seçmek → `where`; dönüştürmek → `map`; en büyüğü bulmak → `reduce`; farklı olanlar → `toSet`; sıralamak → `sort` (ama kopya üzerinde).

```dart
// Dosya: 01_s5_fitness.dart
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

int toplamKalori(List<Antrenman> l) => l.fold(0, (t, a) => t + a.kalori);

int turDakikasi(List<Antrenman> l, String tur) =>
    l.where((a) => a.tur == tur).fold(0, (t, a) => t + a.dakika);

Antrenman enUzun(List<Antrenman> l) => l.reduce((a, b) => b.dakika > a.dakika ? b : a);

List<String> kaloriUstu(List<Antrenman> l, int esik) =>
    l.where((a) => a.kalori > esik).map((a) => '${a.gun} ${a.tur}').toList();

Map<String, int> gunlereGoreKalori(List<Antrenman> l) => l.fold(<String, int>{}, (harita, a) {
      harita.update(a.gun, (k) => k + a.kalori, ifAbsent: () => a.kalori);
      return harita;
    });

Set<String> turler(List<Antrenman> l) => l.map((a) => a.tur).toSet();

List<String> enCokKalori(List<Antrenman> l, int adet) {
  List<Antrenman> kopya = l.toList();
  kopya.sort((a, b) => b.kalori.compareTo(a.kalori));
  return kopya.take(adet).map((a) => '${a.gun} ${a.tur} (${a.kalori})').toList();
}

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

**Çıktı:**

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

**Açıklama:**
- `enUzun`: `reduce` listeyi ikişer ikişer karşılaştırarak tek bir elemana indirir: "Şimdiye kadarki en uzun (`a`) ile sıradaki (`b`) karşılaştır, uzun olanı tut." Liste boş olsaydı `reduce` hata verirdi; bu konuya Bölüm 2'de döneceğiz.
- `gunlereGoreKalori`: `fold`'un başlangıç değeri boş bir Map'tir: `<String, int>{}`. Başındaki `<String, int>` yazılmazsa Dart boş süslü parantezin tipini çıkaramaz. Her adımda Hafta 5'teki "varsa artır, yoksa ekle" kalıbı (`update` + `ifAbsent`) uygulanır ve aynı Map bir sonraki adıma geri verilir. Aynı iş `forEach` ile de yazılabilirdi; `fold`, sonucu **tek bir ifadede** üretmeyi sağlar.
- `enCokKalori`: `sort` listeyi **yerinde** değiştirir. Orijinal `hafta` listesinin sırası bozulmasın diye önce `toList()` ile bir kopya alınır, sıralama kopya üzerinde yapılır. Kopya alınmasaydı fonksiyon çağrıldıktan sonra `hafta` listesi kaloriye göre sıralanmış olurdu ve bu, programın başka yerlerinde fark edilmesi zor hatalara yol açardı.
- `kaloriUstu(hafta, 300)` 300'den **fazla** olanları ister; tam 300 olan bir antrenman olsaydı listeye girmezdi. Bir sorudaki "fazla", "en az", "üstü" gibi sözcükler `>` mi yoksa `>=` mi kullanacağınızı belirler.

> 💡 **Ödevden derse:** Soru 5'te `enUzun` fonksiyonuna boş bir liste verilirse ne olur? Soru 2'de bir kullanıcı numara yerine emoji yazarsa? Bu hafta tam olarak bu sorularla, yani **işler ters gittiğinde** ne olacağıyla ilgileniyoruz.

---

# 2. Hatalar: Program Neden Çöker?

## 2.1 Üç tür hata

Programlarda karşılaşacağınız hataları ortaya çıktıkları **zamana** göre üçe ayırabiliriz:

| Tür | Ne zaman ortaya çıkar? | Belirtisi | Örnek |
|---|---|---|---|
| **Derleme hatası** | Program çalışmadan **önce** | VS Code'da kırmızı dalgalı çizgi; program hiç başlamaz | `int yas = 'yirmi';` |
| **Çalışma zamanı hatası** | Program **çalışırken** | Program o satırda durur; konsolda `Unhandled exception` yazar | `int.parse('yirmi')` |
| **Mantık hatası** | Program çalışırken | Program çökmez, ama sonuç **yanlıştır** | Üç notun ortalamasını `toplam / 2` ile hesaplamak |

Derleme hatalarını Dart bizim yerimize yakalar. Null safety, `sealed` sınıfların eksiksizlik kontrolü ve tip sistemi, hataları program daha çalışmadan yakalamak için vardır. Mantık hatalarını ise ileride **testlerle** yakalayacağız.

Bu haftanın konusu ortadaki satır: **çalışma zamanı hataları.** Derleyici bunları neden yakalayamaz? Çünkü kullanıcının yaş kutusuna ne yazacağını, metroda internetin ne zaman kesileceğini veya sunucunun hangi veriyi göndereceğini, program **çalışmadan önce** bilmenin hiçbir yolu yoktur.

## 2.2 Bir çökmeyi yakından inceleyelim

Geçen haftanın sorusundaki çökmeyi yeniden oluşturalım. Bu kez çevirme işini ayrı bir fonksiyona taşıyoruz; böylece hata mesajında daha fazla bilgi göreceğiz:

```dart
// Dosya: 02_01_cokme.dart
// ❌ ÇALIŞMA ZAMANI HATASI
enum SiparisDurumu { hazirlaniyor, kargoda, teslimEdildi }

SiparisDurumu durumuCevir(String metin) {
  return SiparisDurumu.values.byName(metin);
}

void main() {
  print(durumuCevir('kargoda'));
  print(durumuCevir('kargo'));
  print('Bu satır çalışmaz.');
}
```

**Çıktı (bir bölümü):**

```text
SiparisDurumu.kargoda
Unhandled exception:
Invalid argument (name): No enum value with that name: "kargo"
#0      EnumByName.byName (dart:core/enum.dart:180:5)
#1      durumuCevir (file:///C:/dev/bmh309/hafta6/02_01_cokme.dart:6:31)
#2      main (file:///C:/dev/bmh309/hafta6/02_01_cokme.dart:11:9)
```

Bu çıktıyı satır satır okuyalım:

| Satır | Anlamı |
|---|---|
| `SiparisDurumu.kargoda` | İlk çağrı sorunsuz çalıştı. |
| `Unhandled exception:` | "**Yakalanmamış istisna.**" Bir hata oluştu ve programın hiçbir yeri bu hatayı ele almadı; bu yüzden program durdu. |
| `Invalid argument (name): No enum value with that name: "kargo"` | Hatanın **türü ve mesajı**. *Türkçesi:* "Geçersiz argüman (name): 'kargo' adında bir enum değeri yok." |
| `#0`, `#1`, `#2`... | **Yığın izi** (stack trace): Hata anında hangi fonksiyonun hangi fonksiyonu çağırdığının listesi. **En üstteki**, hatanın fırlatıldığı yerdir. |

Yığın izini bir **çağrı zinciri** olarak düşünebilirsiniz:

```text
main()                ← 11. satır: durumuCevir('kargo') çağrıldı
 └─ durumuCevir()     ← 6. satır: byName('kargo') çağrıldı
     └─ byName()      ← 'kargo' bulunamadı, hata FIRLATILDI 💥
```

Hata, oluştuğu yerden **yukarı doğru** zincir boyunca ilerler: önce `byName`'den `durumuCevir`'e, oradan `main`'e. Zincirdeki fonksiyonlardan hiçbiri hatayı yakalamazsa hata en tepeye ulaşır ve program durur. "Bu satır çalışmaz." yazısının ekrana hiç gelmemesinin nedeni budur. Bu "yukarı doğru ilerleme" fikri, bir sonraki bölümde hataları yakalarken çok işimize yarayacak.

> 🔎 **Yığın izi nasıl okunur?** Yukarıdan aşağıya doğru okuyun ve **kendi dosyanızın adını gördüğünüz ilk satırda** durun. `dart:core` ile başlayan satırlar Dart'ın kendi kodudur; hata orada değil, o kodu yanlış kullanan **sizin** satırınızdadır. Örnekte bu satır `02_01_cokme.dart:6:31`, yani 6. satırın 31. karakteridir. VS Code'un terminalinde bu yola **Ctrl + tıklayınca** doğrudan o satıra gidersiniz.

## 2.3 Mobil uygulamada "çökme" ne demek?

Konsol programında yakalanmayan bir hata programı durdurur. Flutter'da ise sonuç, hatanın nerede oluştuğuna bağlıdır:

- **Ekranı çizen kodda** (`build` metodunda) oluşursa: Geliştirme sırasında ekranın tamamı **kırmızı bir hata ekranına** dönüşür; yayınlanmış uygulamada ise kullanıcı **gri, boş bir ekran** görür.
- **Bir düğmenin kodunda** (`onPressed`) oluşursa: Uygulama kapanmaz; ama düğmenin işi yarıda kalır. Kullanıcı "Kaydet"e basar ve **hiçbir şey olmaz.** Kayıt yapılmadığını bile fark etmeyebilir.

Her iki durumda da kullanıcı ne olduğunu anlayamaz. Mağaza yorumlarındaki "Uygulama sürekli donuyor ⭐" yorumlarının büyük kısmı, yakalanmamış hatalardan gelir. Bu yüzden profesyonel uygulamalar, kullanıcıların telefonlarında oluşan hataları **Firebase Crashlytics** gibi servislerle geliştiricilere raporlar.

## 2.4 Sık karşılaşacağınız çalışma zamanı hataları

Bu hataların çoğunu önceki haftalarda gördük. Hepsini bir arada görmek, konsolda karşılaştığınızda tanımanızı kolaylaştırır:

| Hata | Örnek kod | Konsoldaki mesaj | Türkçesi ve çözümü |
|---|---|---|---|
| `FormatException` | `int.parse('12a')` | `FormatException: Invalid radix-10 number` | "Geçersiz onluk sayı." → `int.tryParse` |
| `RangeError` | `['a', 'b', 'c'][3]` | `RangeError (length): Invalid value: Not in inclusive range 0..2: 3` | "Geçersiz değer: 0..2 aralığında değil: 3." → indeksi `length` ile karşılaştırın |
| `StateError` | `<int>[].first`, bulamayan `firstWhere`, boş listede `reduce` | `Bad state: No element` | "Hatalı durum: Eleman yok." → `isEmpty` kontrolü, `firstOrNull` |
| `TypeError` | `metin!.length` (metin `null` iken) | `Null check operator used on a null value` | "Null kontrol operatörü null bir değerde kullanıldı." → `?.`, `??`, `if (x != null)` |
| `TypeError` | `veri['yas'] as int` (değer `'21'` iken) | `type 'String' is not a subtype of type 'int' in type cast` | "'String', 'int'in alt tipi değil." → sunucudan gelen veriyi kontrol edin |
| `ArgumentError` | `SiparisDurumu.values.byName('kargo')` | `Invalid argument (name): No enum value with that name: "kargo"` | "Geçersiz argüman." → önce kontrol edin (Bölüm 3.8) |
| `UnsupportedError` | `List.filled(3, 0).add(5)` | `Unsupported operation: Cannot add to a fixed-length list` | "Desteklenmeyen işlem." → büyüyebilen liste kullanın |
| `IntegerDivisionByZeroException` | `10 ~/ 0` | `IntegerDivisionByZeroException` | "Tam sayı sıfıra bölündü." → böleni kontrol edin |

> ⚠️ **Dikkat:** `10 ~/ 0` (tam sayı bölmesi) hata verir; ama `10 / 0` hata **vermez**, sonucu `Infinity` (sonsuz) olur. Ortalama hesaplarken eleman sayısı 0 ise ekranda "Ortalama: Infinity" veya "NaN" (Not a Number, "sayı değil") görmenizin nedeni budur.

> 💡 Mesajların metni Dart sürümüne göre biraz farklı olabilir. Örneğin eski sürümlerde liste indeksi hatası `RangeError (index): Index out of range: index should be less than 3: 3` biçiminde yazılır. Önemli olan, mesajın başındaki **hata türünü** (`RangeError`) tanımanızdır.

## 2.5 Exception mı, Error mı?

Dart, çalışma zamanı hatalarını iki büyük aileye ayırır. Bu ayrım, bir hatayla karşılaştığınızda **ne yapmanız gerektiğini** belirler:

| | `Exception` (istisna) | `Error` (hata) |
|---|---|---|
| **Anlamı** | Öngörülebilir, olağan bir sorun | Programcının yaptığı bir yanlışlık |
| **Nereden gelir?** | Dış dünyadan: kullanıcı girdisi, internet, sunucu, dosya | Kodun kendisinden |
| **Örnekler** | `FormatException`, `TimeoutException`, internet bağlantı hataları | `RangeError`, `StateError`, `TypeError`, `ArgumentError`, `UnsupportedError` |
| **Ne yapılır?** | **Yakalanır** ve kullanıcıya anlaşılır bir mesajla açıklanır | **Yakalanmaz**; kod düzeltilir |

Bir benzetme: `Exception` **yağmur yağması** gibidir. Yağmuru engelleyemezsiniz, ama önceden plan yapıp şemsiye alırsınız. `Error` ise **arabanın frenlerinin bozuk olması** gibidir; bunu yolda "yakalamaya" çalışmazsınız, yola çıkmadan önce tamir edersiniz.

Akılda kalacak kural: **Exception'ları yakalayın, Error'ları düzeltin.**

> 💡 `byName` örneği bu kuralın sınırında duruyor: Fırlatılan hata bir `ArgumentError`'dur (programcı hatası); ama hatalı metin **sunucudan** gelir. Böyle durumlarda en iyi yol, hatayı yakalamak yerine **hataya hiç izin vermemektir**: Dönüştürmeden önce metnin geçerli olup olmadığını kontrol etmek. Bunun nasıl yapıldığını Bölüm 3.8'de göreceğiz.

---

# 3. try, catch, finally: Hataları Yakalamak

## 3.1 İlk try-catch

Bir kayıt formundaki "Yaş" kutusuna kullanıcıların yazdığı metinleri sayıya çevirelim:

```dart
// Dosya: 03_01_ilk_try_catch.dart
void main() {
  List<String> girdiler = ['21', 'yirmi', '19'];

  for (String girdi in girdiler) {
    try {
      int yas = int.parse(girdi);
      print('Yaş: $yas, gelecek yıl: ${yas + 1}');
    } catch (e) {
      print('"$girdi" bir sayı değil, lütfen rakamla yazın.');
    }
  }
  print('Program devam ediyor.');
}
```

**Çıktı:**

```text
Yaş: 21, gelecek yıl: 22
"yirmi" bir sayı değil, lütfen rakamla yazın.
Yaş: 19, gelecek yıl: 20
Program devam ediyor.
```

**Açıklama:**
- `try { ... }` → "Bu bloğu **dene**."
- `catch (e) { ... }` → "Denerken bir hata olursa, hatayı **yakala** ve bu bloğu çalıştır."
- `'yirmi'` girdisinde neler olduğunu adım adım izleyelim:

```text
try {
  int yas = int.parse(girdi);    ← 'yirmi' için hata BURADA oluşur
  print('Yaş: ...');             ← bu satır ATLANIR
} catch (e) {
  print('... bir sayı değil');   ← program doğrudan buraya geçer
}
                                 ← sonra döngünün bir sonraki turuna devam eder
```

Üç kuralı aklınızda tutun:

1. `try` bloğunda hata **olmazsa**, `catch` bloğu **hiç** çalışmaz (21 ve 19 için olduğu gibi).
2. `try` bloğunda bir satırda hata olursa, `try` bloğunun **geri kalanı atlanır** ve `catch` bloğu çalışır.
3. Hata yakalandıktan sonra program **çökmez**; `try-catch`'ten sonraki satırdan devam eder.

Bir benzetme: `try-catch` bir trapez sanatçısının altındaki **güvenlik ağıdır**. Ağ varsa düşmek gösterinin sonu değildir; sanatçı kalkar ve gösteri devam eder.

> 💡 Bu örnek `try-catch`'i tanıtmak için seçildi. Metni sayıya çevirmek için aslında `int.tryParse` daha uygundur; nedenini Bölüm 3.8'de göreceğiz.

## 3.2 Hata nesnesi: catch (e)

`catch (e)` yazdığımızda `e`, fırlatılan **hata nesnesinin kendisidir**. Hatanın türünü ve mesajını ondan öğrenebiliriz. Ödev 4'ün 5. sorusundaki "en uzun antrenman" mantığını boş bir listeyle çalıştıralım:

```dart
// Dosya: 03_02_hata_nesnesi.dart
void main() {
  List<int> puanlar = [];

  try {
    int enYuksek = puanlar.reduce((a, b) => a > b ? a : b);
    print('En yüksek puan: $enYuksek');
  } catch (e) {
    print('Hata türü  : ${e.runtimeType}');
    print('Hata mesajı: $e');
  }
}
```

**Çıktı:**

```text
Hata türü  : StateError
Hata mesajı: Bad state: No element
```

**Açıklama:** `reduce` ilk elemanla başladığı için boş listede çalışamaz ve bir `StateError` fırlatır. `e.runtimeType` hatanın türünü, `print(e)` ise mesajını verir. `catch (e)` her türlü hatayı yakalar; bu yüzden `e`'nin tipi en genel tip olan `Object`'tir. Hatanın türüne özgü bilgilere (örneğin `FormatException`'ın hangi metinde oluştuğuna) ulaşmak için `on` kullanırız.

## 3.3 on ile hata türüne göre yakalamak

Bir alışveriş uygulamasında kupon kodları `IND-25` biçimindedir: tire işaretinden sonraki sayı indirim yüzdesidir. Kullanıcı kodu yanlış yazabilir:

```dart
// Dosya: 03_03_on_ile_yakalama.dart
int kuponIndirimi(String kod) {
  // Kupon biçimi: 'IND-25' → %25 indirim
  return int.parse(kod.substring(4));
}

void main() {
  for (String kod in ['IND-25', 'IND-XL', 'IN']) {
    try {
      int oran = kuponIndirimi(kod);
      print('$kod: %$oran indirim uygulandı.');
    } on FormatException catch (e) {
      print('$kod: Kupon kodu hatalı ("${e.source}" bir sayı değil).');
    } catch (e) {
      print('$kod: Beklenmeyen hata, geliştiricilere bildirildi → ${e.runtimeType}');
    }
  }
}
```

**Çıktı:**

```text
IND-25: %25 indirim uygulandı.
IND-XL: Kupon kodu hatalı ("XL" bir sayı değil).
IN: Beklenmeyen hata, geliştiricilere bildirildi → RangeError
```

**Açıklama:**
- `on FormatException catch (e)` → "Yalnızca **`FormatException`** türündeki hataları yakala; `e`'yi de bu tipte ver." Bu sayede `e.source` (hatanın oluştuğu metin) gibi `FormatException`'a özgü alanlara erişebiliyoruz.
- `'IN'` kodunda `substring(4)` metnin dışına taşar ve bir `RangeError` oluşur. Bu bir **programcı hatasıdır**: Kodun uzunluğu önceden kontrol edilmeliydi. İlk `on` bloğu bu hatayla eşleşmez; ikinci blok (`catch (e)`) her şeyi yakaladığı için onu yakalar.
- Bloklar **yukarıdan aşağıya** denenir ve **ilk eşleşen** çalışır. Bu yüzden özel türler yukarıya, genel yakalayıcı en alta yazılır.
- Gerçek uygulamalarda en alttaki genel yakalayıcı, kullanıcıya "Bir şeyler ters gitti" der ve hatayı geliştiricilere raporlar. Böylece hem uygulama çökmez hem de programcı hatası gizlenmez; raporu gören geliştirici kodu düzeltir.

`try` ile kullanılabilecek yakalama biçimleri:

| Yazım | Anlamı | `e`'nin tipi |
|---|---|---|
| `catch (e)` | Her türlü hatayı yakala | `Object` |
| `on FormatException` | Yalnızca bu türü yakala; hata nesnesine ihtiyacım yok | — |
| `on FormatException catch (e)` | Yalnızca bu türü yakala ve nesnesini ver | `FormatException` |
| `on Exception catch (e)` | Tüm istisnaları yakala (ama `Error`'ları değil) | `Exception` |
| `catch (e, s)` | Her şeyi yakala; ayrıca yığın izini de ver (Bölüm 3.5) | `Object`, `StackTrace` |

## 3.4 ❌ Genel yakalayıcıyı başa koymak

```dart
// Dosya: 03_04_tuzak_siralama.dart
// ❌ UYARI ve MANTIK HATASI: Genel yakalayıcı özel olanı gölgeliyor.
void main() {
  try {
    int.parse('XL');
  } on Exception {
    print('Bir hata oluştu.');
  } on FormatException {
    print('Sayı biçimi hatalı.');
  }
}
```

**Uyarı mesajı (VS Code, Problems paneli):**

```text
Dead code: This on-catch block won't be executed because 'FormatException' is a subtype of 'Exception' and hence will have been caught already.
```

**Çıktı:**

```text
Bir hata oluştu.
```

**Açıklama:** `FormatException` bir `Exception`'dır; bu yüzden ilk blok onu yakalar ve ikinci blok **hiçbir zaman** çalışmaz. VS Code bu bloğu soluk renkte gösterir ve "ölü kod" (dead code) uyarısı verir. *Türkçesi:* "Bu blok asla çalışmayacak; çünkü `FormatException`, `Exception`'ın bir alt tipidir ve zaten yakalanmış olacaktır." Düzeltme: Blokların yerini değiştirmek.

## 3.5 catch (e, s): Yığın izini yakalamak

`catch` bloğuna ikinci bir isim yazılırsa, ona hatanın **yığın izi** gelir:

```dart
// Dosya: 03_05_yigin_izi.dart
void main() {
  List<String> sehirler = ['Siirt', 'Batman', 'Mardin'];

  try {
    String sehir = sehirler.firstWhere((s) => s.startsWith('Z'));
    print('Bulunan: $sehir');
  } catch (e, s) {
    print('Hata: $e');
    print('Yığın izi:');
    print(s);
  }
}
```

**Çıktı (bir bölümü):**

```text
Hata: Bad state: No element
Yığın izi:
#0      ListBase.firstWhere (dart:collection/list.dart:132:5)
#1      main (file:///C:/dev/bmh309/hafta6/03_05_yigin_izi.dart:6:29)
```

**Açıklama:** `s`'nin tipi `StackTrace`'tir. Konsol programında yığın izini kendimiz görürüz; ama uygulamanız binlerce kullanıcının telefonunda çalışırken onların konsolunu göremezsiniz. Bu yüzden gerçek uygulamalarda `e` ve `s` birlikte bir raporlama servisine gönderilir:

```dart
// ŞABLON: Flutter'da hata raporlama (çalıştırılamaz, yalnızca okuyun)
try {
  sepetiGuncelle();
} catch (e, s) {
  FirebaseCrashlytics.instance.recordError(e, s);
  // Kullanıcıya "Bir şeyler ters gitti" mesajı gösterilir.
}
```

## 3.6 finally: Her durumda çalışan blok

Bir mobil uygulamada "Kaydet" düğmesine basıldığında ekranda dönen bir **yükleniyor çarkı** belirir. İşlem başarılı da olsa, hata da verse, işlem bittiğinde çark **mutlaka** durmalıdır. Aksi halde çark sonsuza kadar döner ve kullanıcı uygulamanın donduğunu düşünür.

```dart
// Dosya: 03_06_finally.dart
bool yukleniyor = false;

void profilKaydet(String yasMetni) {
  yukleniyor = true;
  print('[Çark dönüyor] Kaydediliyor...');
  try {
    int yas = int.parse(yasMetni);
    print('Kaydedildi: $yas yaş');
  } on FormatException {
    print('Hata: Yaş bir sayı olmalı.');
  } finally {
    yukleniyor = false;
    print('[Çark durdu]');
  }
}

void main() {
  profilKaydet('21');
  print('---');
  profilKaydet('yirmi bir');
  print('Yükleniyor mu? $yukleniyor');
}
```

**Çıktı:**

```text
[Çark dönüyor] Kaydediliyor...
Kaydedildi: 21 yaş
[Çark durdu]
---
[Çark dönüyor] Kaydediliyor...
Hata: Yaş bir sayı olmalı.
[Çark durdu]
Yükleniyor mu? false
```

**Açıklama:** `finally` bloğu, `try` bloğu başarıyla bitse de, `catch` bloğu çalışsa da **her durumda** en son çalışır. "Açtığını kapat" türündeki işler (yükleniyor çarkını durdurmak, bir dosyayı veya veritabanı bağlantısını kapatmak) buraya yazılır.

"Bu satırları `try-catch`'in hemen altına yazsak olmaz mı?" diye sorabilirsiniz. Olmaz; çünkü `finally` iki durumda daha çalışır: `try` bloğunda **`return`** yapıldığında ve hata o fonksiyonda **yakalanmayıp** yukarı iletildiğinde:

```dart
// Dosya: 03_07_finally_her_zaman.dart
int kalanHak = 3;

int puanOku(String metin) {
  try {
    return int.parse(metin);
  } finally {
    kalanHak--;
    print('Deneme kaydedildi, kalan hak: $kalanHak');
  }
}

void main() {
  print('Puan: ${puanOku('85')}');
  try {
    print('Puan: ${puanOku('seksen')}');
  } on FormatException {
    print('Geçersiz puan.');
  }
}
```

**Çıktı:**

```text
Deneme kaydedildi, kalan hak: 2
Puan: 85
Deneme kaydedildi, kalan hak: 1
Geçersiz puan.
```

**Açıklama:**
- `puanOku` fonksiyonunda `catch` yoktur; `try` bloğunun yanında yalnızca `finally` vardır. Bu geçerli bir yazımdır.
- İlk çağrıda `return` satırı çalışır; ama fonksiyon değeri döndürmeden **hemen önce** `finally` çalışır. Bu yüzden "Deneme kaydedildi" yazısı "Puan: 85"ten **önce** gelir.
- İkinci çağrıda `int.parse` hata verir. `puanOku` bu hatayı yakalamaz; ama hata `main`'e iletilmeden **önce** `finally` çalışır ve hak yine azalır. Hatayı `main`'deki `on FormatException` yakalar.

> 🔗 **Flutter'da:** Bir ekranın "Kaydet" düğmesi tam olarak bu kalıpla yazılır: `try` içinde kayıt işlemi, `catch` içinde kullanıcıya hata mesajı (SnackBar), `finally` içinde `setState(() => yukleniyor = false);`. Bu kalıbın asenkron halini Bölüm 8.1 ve 8.8'de yazacağız.

## 3.7 rethrow: Yakala, kaydet, yukarı ilet

Bazen bir hatayı yakalayıp bir iş yapmak (örneğin teknik ayrıntıları kaydetmek), ama hatanın **ele alınmasını** çağıran koda bırakmak isteriz. Bunun için `rethrow` kullanılır:

```dart
// Dosya: 03_08_rethrow.dart
List<String> hataKaydi = [];

int yaziBoyutuOku(Map<String, String> ayarlar) {
  try {
    return int.parse(ayarlar['yaziBoyutu'] ?? '16');
  } on FormatException catch (e) {
    hataKaydi.add('Ayar dosyası bozuk: yaziBoyutu = ${e.source}');
    rethrow;
  }
}

void main() {
  Map<String, String> ayarlar = {'tema': 'koyu', 'yaziBoyutu': 'büyük'};

  try {
    print('Yazı boyutu: ${yaziBoyutuOku(ayarlar)}');
  } on FormatException {
    print('Ayarlarınız okunamadı, varsayılan ayarlar kullanılıyor.');
  }
  print('Hata kaydı: $hataKaydi');
}
```

**Çıktı:**

```text
Ayarlarınız okunamadı, varsayılan ayarlar kullanılıyor.
Hata kaydı: [Ayar dosyası bozuk: yaziBoyutu = büyük]
```

**Açıklama:**
- `rethrow` → "Bu hatayı **aynen** yukarı, beni çağıran koda ilet." Yalnızca `catch` bloğunun içinde kullanılabilir.
- Bu örnekte iki **katman** var ve her biri kendi işini yapıyor: `yaziBoyutuOku` teknik ayrıntıyı bilir (hangi ayar, hangi değer) ve kaydeder. `main` ise kullanıcıyla konuşmayı bilir ve ona sade bir mesaj gösterir. Kullanıcıya "yaziBoyutu = büyük" gibi teknik bir ayrıntı göstermek doğru olmazdı.
- `rethrow` yerine `throw e;` de yazılabilirdi; ama `rethrow` hatanın **orijinal yığın izini** korur. Böylece rapora bakan geliştirici, hatanın gerçekte nerede oluştuğunu görür.

## 3.8 tryParse mi, try-catch mi?

Bölüm 3.1'deki örneği Hafta 1'den bildiğimiz `int.tryParse` ile yazalım:

```dart
// Dosya: 03_09_tryparse.dart
void main() {
  List<String> girdiler = ['21', 'yirmi', '19'];

  for (String girdi in girdiler) {
    int? yas = int.tryParse(girdi);
    if (yas == null) {
      print('"$girdi" bir sayı değil, lütfen rakamla yazın.');
    } else {
      print('Yaş: $yas, gelecek yıl: ${yas + 1}');
    }
  }
}
```

**Çıktı:**

```text
Yaş: 21, gelecek yıl: 22
"yirmi" bir sayı değil, lütfen rakamla yazın.
Yaş: 19, gelecek yıl: 20
```

**Açıklama:** Sonuç aynı; ama kod daha sade. `tryParse` hata fırlatmaz, çeviremediği metin için `null` döndürür. Dart'ın null safety sistemi de `int?` tipiyle bizi `null` durumunu ele almaya **zorlar**. İki yaklaşımın arkasında iki farklı düşünce vardır:

- **"Önce bak, sonra atla":** İşlemi yapmadan önce yapılıp yapılamayacağını kontrol et (`tryParse`, `isEmpty`, `firstOrNull`, `containsKey`).
- **"Atla; düşersen ağ var":** İşlemi doğrudan dene, olmazsa yakala (`try-catch`).

| Durum | Tercih |
|---|---|
| Metni sayıya çevirmek | `int.tryParse`, `double.tryParse` |
| Listede eleman aramak | `where(...).firstOrNull` |
| Boş olabilecek listede `reduce`, `first` | Önce `isEmpty` kontrolü |
| Metni enum değerine çevirmek | Önce değerin var olup olmadığını kontrol etmek (aşağıda) |
| İnternetten veri çekmek, dosya okumak, JSON çözmek | `try-catch` (önceden kontrol etmenin yolu yok) |

Kural: Önceden **kolayca** kontrol edebiliyorsanız kontrol edin. Edemiyorsanız (internet, işlemin tam ortasında da kesilebilir) `try-catch` kullanın.

Şimdi geçen haftanın sorusunu bu kurala göre çözelim:

```dart
// Dosya: 03_10_byname_cozumu.dart
enum SiparisDurumu { hazirlaniyor, kargoda, teslimEdildi }

SiparisDurumu? durumuCevir(String metin) =>
    SiparisDurumu.values.where((d) => d.name == metin).firstOrNull;

void main() {
  for (String gelen in ['kargoda', 'kargo', 'teslimEdildi']) {
    SiparisDurumu? durum = durumuCevir(gelen);
    print(durum == null ? '"$gelen" → Durum bilinmiyor' : '"$gelen" → ${durum.name}');
  }
}
```

**Çıktı:**

```text
"kargoda" → kargoda
"kargo" → Durum bilinmiyor
"teslimEdildi" → teslimEdildi
```

**Açıklama:** `where` adı eşleşen enum değerlerini seçer, `firstOrNull` ilkini verir; eşleşen yoksa `null` döner. Fonksiyonun dönüş tipi `SiparisDurumu?` olduğu için, onu çağıran ekran "durum bilinmiyor" ihtimalini ele almak **zorundadır**. Bilinmeyen durumu sessizce `hazirlaniyor` saymak da bir seçenekti (`?? SiparisDurumu.hazirlaniyor`); ama bu, kullanıcıya **yanlış bilgi** göstermek olurdu.

## 3.9 ❌ try-catch tuzakları

### Tuzak 1: Boş catch ile hatayı yutmak

```dart
// Dosya: 03_11_tuzak_bos_catch.dart
// ❌ MANTIK HATASI: Hata sessizce yutuluyor.
double sepetToplami(List<String> fiyatlar) {
  double toplam = 0;
  for (String f in fiyatlar) {
    try {
      toplam += double.parse(f);
    } catch (e) {}
  }
  return toplam;
}

void main() {
  print('Ödenecek: ${sepetToplami(['49.90', '120,50', '15.00']).toStringAsFixed(2)} TL');
}
```

**Çıktı:**

```text
Ödenecek: 64.90 TL
```

**Açıklama:** `'120,50'` metninde nokta yerine **virgül** var (Türkçe yazım); `double.parse` bunu çeviremez. Boş `catch` bloğu hatayı yakalar ve **hiçbir şey yapmaz**: 120,50 TL'lik ürün sepetten sessizce düşer, kimse bir şey fark etmez ve mağaza para kaybeder. Program çökseydi hata en azından görülürdü!

VS Code bu kod için şu uyarıyı gösterir (Flutter projelerinde varsayılan olarak açıktır):

```text
Empty catch block.
```

Boş `catch`, **en tehlikeli** hata yönetimi biçimidir; çünkü hatayı ortadan kaldırmaz, yalnızca **görünmez** yapar. Bir hatayı yakalıyorsanız onunla mutlaka bir şey yapın: kullanıcıya gösterin, kaydedin veya düzeltip yeniden deneyin. Bu örnekte doğru çözüm, virgülü noktaya çevirmek (`f.replaceAll(',', '.')`) ve yine de çevrilemeyen bir fiyat varsa siparişi **durdurmaktır**.

### Tuzak 2: try içinde tanımlanan değişken dışarıda görünmez

```dart
// Dosya: 03_12_tuzak_kapsam.dart
// ❌ DERLEME HATASI
void main() {
  try {
    int yas = int.parse('21');
  } on FormatException {
    print('Geçersiz yaş');
  }
  print(yas + 1);
}
```

**Hata mesajı:**

```text
Undefined name 'yas'.
```

**Açıklama:** `try` bir bloktur; içinde tanımlanan değişken, Hafta 2'de gördüğümüz **kapsam** kuralı gereği yalnızca o blokta yaşar. İki çözüm vardır: (1) Değişkeni kullanan satırları da `try`'ın içine almak, (2) değişkeni `try`'dan önce `int? yas;` olarak tanımlayıp içeride değer atamak.

### Tuzak 3: `on Exception`, Error'ları yakalamaz

```dart
// Dosya: 03_13_tuzak_on_exception.dart
// ❌ ÇALIŞMA ZAMANI HATASI
void main() {
  List<String> menu = ['Mercimek çorbası', 'Pilav', 'Ayran'];

  try {
    print('Bugünün tatlısı: ${menu[3]}');
  } on Exception {
    print('Menü okunamadı.');
  }
}
```

**Çıktı (bir bölümü):**

```text
Unhandled exception:
RangeError (length): Invalid value: Not in inclusive range 0..2: 3
```

**Açıklama:** `RangeError` bir `Exception` değil, bir **`Error`**'dur; bu yüzden `on Exception` onu yakalamaz ve program çöker. Bu bir kusur değil, **bilinçli bir tasarımdır**: Üç elemanlı bir listenin 4. elemanını istemek bir programcı hatasıdır ve yakalanmak yerine düzeltilmelidir (`menu.length > 3` kontrolü veya tatlıyı ayrı bir alanda tutmak).

> 🔗 **Flutter'da:** Firebase ile giriş yapan bir ekranın kodu aşağıdaki gibidir. Hata türü `FirebaseAuthException`'dır ve `e.code` alanı hatanın nedenini taşır. Satırdaki `await` kelimesini Bölüm 7'de öğreneceğiz.
>
> ```dart
> // ŞABLON: Flutter'da giriş düğmesi (çalıştırılamaz, yalnızca okuyun)
> try {
>   await FirebaseAuth.instance.signInWithEmailAndPassword(email: eposta, password: sifre);
> } on FirebaseAuthException catch (e) {
>   String mesaj = switch (e.code) {
>     'invalid-credential' => 'E-posta veya şifre hatalı.',
>     'too-many-requests' => 'Çok fazla deneme yaptınız, biraz bekleyin.',
>     _ => 'Giriş yapılamadı (${e.code}).',
>   };
>   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mesaj)));
> }
> ```

---

# 4. throw: Kendi Hatalarımızı Fırlatmak

## 4.1 Neden hata fırlatırız?

Hafta 4'teki `Cuzdan` sınıfının `paraCek` metodu, işlem yapılamadığında `false` döndürüyordu. Ama neden yapılamadığını söyleyemiyordu: Tutar mı negatifti, bakiye mi yetmedi? Ekran kullanıcıya ne diyeceğini bilemiyordu.

Kendi kodumuzda bir sorun fark ettiğimizde **`throw`** ile bir hata fırlatabiliriz:

```dart
// Dosya: 04_01_throw.dart
class Cuzdan {
  double _bakiye;

  Cuzdan(this._bakiye);

  double get bakiye => _bakiye;

  void ode(double tutar) {
    if (tutar > _bakiye) {
      throw Exception('Yetersiz bakiye');
    }
    _bakiye -= tutar;
  }
}

void main() {
  Cuzdan cuzdan = Cuzdan(100);

  for (double tutar in [30, 90, 50]) {
    try {
      cuzdan.ode(tutar);
      print('${tutar.toStringAsFixed(2)} TL ödendi. Kalan: ${cuzdan.bakiye.toStringAsFixed(2)} TL');
    } on Exception catch (e) {
      print('${tutar.toStringAsFixed(2)} TL ödenemedi → $e');
    }
  }
}
```

**Çıktı:**

```text
30.00 TL ödendi. Kalan: 70.00 TL
90.00 TL ödenemedi → Exception: Yetersiz bakiye
50.00 TL ödendi. Kalan: 20.00 TL
```

**Açıklama:**
- `throw Exception('Yetersiz bakiye');` → "Bir hata nesnesi oluştur ve onu **fırlat**." `throw` satırı, `return` gibi fonksiyonu **hemen** bitirir; altındaki `_bakiye -= tutar;` satırı çalışmaz. Bu yüzden başarısız ödemede bakiye değişmez (70 TL olarak kalır).
- Fırlatılan hata, Bölüm 2.2'de gördüğümüz gibi çağrı zincirinde yukarı doğru ilerler ve `main`'deki `on Exception catch (e)` tarafından yakalanır.
- `Exception('...')` ile oluşturulan hatanın mesajı ekrana `Exception: ` ön ekiyle yazılır.

Bu çözümün bir zayıf noktası var: Ekran, eksik tutarı kullanıcıya göstermek isterse ("40 TL daha yüklemelisiniz") bu bilgiye ulaşamaz; elinde yalnızca bir **metin** vardır. Ayrıca farklı hata türlerini birbirinden ayırmanın tek yolu mesaj metinlerini karşılaştırmaktır ve mesaj değiştiği anda bu karşılaştırma bozulur. Çözüm: **Kendi istisna sınıfımızı** yazmak (Bölüm 4.3).

## 4.2 Exception mı fırlatmalı, Error mı?

Bölüm 2.5'teki ayrım, fırlatırken de geçerlidir. Bir fonksiyon yazarken kendinize şunu sorun: "Bu sorun **kimin** hatası?"

| Durum | Kimin hatası? | Ne fırlatılır? | Yakalanmalı mı? |
|---|---|---|---|
| Bakiye yetersiz | Kimsenin; olağan bir durum | Kendi `Exception` sınıfınız | **Evet**, kullanıcıya açıklanır |
| İnternet bağlantısı yok | Dış dünyanın | Bir `Exception` | **Evet** |
| Ödeme tutarı negatif gönderildi | Fonksiyonu **çağıran programcının** | `ArgumentError` | Hayır, çağıran kod düzeltilir |
| Henüz yazılmamış bir metot çağrıldı | Programcının | `UnimplementedError` | Hayır |

Programcı hatalarında hata fırlatmak, hatayı **erken ve gürültülü** hale getirir. Negatif bir tutar sessizce kabul edilseydi bakiye **artardı** ve bu hata belki aylar sonra fark edilirdi. Çökme ise sorunu hemen, doğru satırı göstererek ortaya çıkarır:

```dart
// Dosya: 04_02_argument_error.dart
// ❌ ÇALIŞMA ZAMANI HATASI
class Cuzdan {
  double _bakiye;

  Cuzdan(this._bakiye);

  void ode(double tutar) {
    if (tutar <= 0) {
      throw ArgumentError.value(tutar, 'tutar', 'Ödeme tutarı pozitif olmalı');
    }
    _bakiye -= tutar;
  }
}

void main() {
  Cuzdan cuzdan = Cuzdan(100);
  double indirim = 120;
  cuzdan.ode(100 - indirim);
}
```

**Çıktı (bir bölümü):**

```text
Unhandled exception:
Invalid argument (tutar): Ödeme tutarı pozitif olmalı: -20.0
#0      Cuzdan.ode (file:///C:/dev/bmh309/hafta6/04_02_argument_error.dart:10:7)
#1      main (file:///C:/dev/bmh309/hafta6/04_02_argument_error.dart:19:10)
```

**Açıklama:** `ArgumentError.value(değer, parametreAdı, mesaj)` hatalı değeri, hangi parametrede olduğunu ve nedenini birlikte raporlar. Yığın izindeki `#1` satırı asıl suçluyu gösterir: `main`'in 19. satırı, indirimin tutardan büyük olabileceğini düşünmemiş.

> 💡 **`UnimplementedError` ile karşılaşacaksınız:** VS Code'un "Create missing overrides" (eksik metotları oluştur) hızlı düzeltmesi ve AI araçları, gövdesini henüz yazmadıkları metotlara `throw UnimplementedError();` satırını koyar. Bu satır "burası henüz yazılmadı" demektir. Programınız bir `UnimplementedError` ile çöküyorsa, doldurmayı unuttuğunuz bir metot var demektir.

## 4.3 Kendi istisna sınıfımız

Kendi istisna sınıfımız, hatayla birlikte **veri taşıyabilir** ve **türüyle** yakalanabilir:

```dart
// Dosya: 04_03_kendi_istisnamiz.dart
class YetersizBakiyeException implements Exception {
  final double bakiye;
  final double istenen;

  YetersizBakiyeException(this.bakiye, this.istenen);

  double get eksik => istenen - bakiye;

  @override
  String toString() => 'YetersizBakiyeException: ${eksik.toStringAsFixed(2)} TL eksik';
}

class Cuzdan {
  double _bakiye;

  Cuzdan(this._bakiye);

  void ode(double tutar) {
    if (tutar > _bakiye) {
      throw YetersizBakiyeException(_bakiye, tutar);
    }
    _bakiye -= tutar;
  }
}

void main() {
  Cuzdan cuzdan = Cuzdan(100);

  try {
    cuzdan.ode(140);
  } on YetersizBakiyeException catch (e) {
    print('Bakiyeniz yetersiz. ${e.eksik.toStringAsFixed(2)} TL yükleyip tekrar deneyin.');
    print('Teknik kayıt: $e');
  }
}
```

**Çıktı:**

```text
Bakiyeniz yetersiz. 40.00 TL yükleyip tekrar deneyin.
Teknik kayıt: YetersizBakiyeException: 40.00 TL eksik
```

**Açıklama:**
- `implements Exception`: `Exception`, Dart'ta bir **arayüzdür** (Hafta 5, Bölüm 3). Sınıfımızın onu uygulaması, "bu bir **öngörülebilir** sorundur, yakalanmalıdır" demektir. Ayrıca `on Exception` yazan kodların bu hatayı da yakalamasını sağlar.
- **İsimlendirme geleneği:** İstisna sınıflarının adı `Exception` ile biter: `FormatException`, `TimeoutException`, `YetersizBakiyeException`.
- **Veri taşımak:** `bakiye` ve `istenen` alanları sayesinde ekran, "40 TL yükle" düğmesini doğru tutarla gösterebilir. Bir metin mesajı bunu sağlayamazdı.
- **`toString`:** Override edilmezse `print(e)` yalnızca `Instance of 'YetersizBakiyeException'` yazar. Teknik kayıtlarda işe yarar bir metin görmek için override edilir.

### ❌ Exception'dan kalıtım almak

```dart
// Dosya: 04_04_tuzak_extends_exception.dart
// ❌ DERLEME HATASI
class BaglantiException extends Exception {
  final String adres;

  BaglantiException(this.adres);
}

void main() {
  print(BaglantiException('api.siirt.edu.tr').adres);
}
```

**Hata mesajı:**

```text
The class 'BaglantiException' can't extend 'Exception' because 'Exception' only has factory constructors (no generative constructors), and 'BaglantiException' has at least one generative constructor.
```

**Açıklama:** *Türkçesi:* "`Exception` yalnızca factory kuruculara sahip olduğu için `BaglantiException` ondan kalıtım alamaz." Kısacası `Exception`'dan **`extends`** ile kalıtım alınamaz; **`implements`** kullanılır. Bu, Hafta 5'te öğrendiğimiz farka da uygundur: `Exception` hazır kod sunmaz, yalnızca bir **sözleşmedir** ("ben bir istisnayım").

## 4.4 Hata aileleri: sealed ile istisna hiyerarşisi

Bir uygulama internetle konuşurken birçok farklı nedenden hata alabilir. Bu hataları bir **aile** olarak tanımlarsak hem hepsini birden yakalayabilir hem de her birine **ayrı** bir kullanıcı mesajı verebiliriz. Hafta 5'teki `sealed` sınıflar bunun için idealdir:

```dart
// Dosya: 04_05_hata_ailesi.dart
sealed class AgHatasi implements Exception {
  String get teknikDetay;
}

class BaglantiYok extends AgHatasi {
  @override
  String get teknikDetay => 'İnternet bağlantısı yok';
}

class SunucuHatasi extends AgHatasi {
  final int durumKodu;

  SunucuHatasi(this.durumKodu);

  @override
  String get teknikDetay => 'Sunucu $durumKodu kodu döndürdü';
}

class OturumSuresiDoldu extends AgHatasi {
  @override
  String get teknikDetay => 'Oturum anahtarının süresi doldu';
}

String kullaniciMesaji(AgHatasi hata) => switch (hata) {
      BaglantiYok _ => 'İnternet bağlantınızı kontrol edin.',
      SunucuHatasi s when s.durumKodu >= 500 => 'Sunucularımızda bir sorun var, birazdan tekrar deneyin.',
      SunucuHatasi _ => 'İsteğiniz işlenemedi.',
      OturumSuresiDoldu _ => 'Oturumunuzun süresi doldu, lütfen yeniden giriş yapın.',
    };

// Sahte bir sunucu: Verilen senaryoya göre ya başarılı olur ya da hata fırlatır.
void istekGonder(AgHatasi? senaryo) {
  if (senaryo != null) {
    throw senaryo;
  }
}

void main() {
  List<AgHatasi?> senaryolar = [
    null,
    BaglantiYok(),
    SunucuHatasi(503),
    SunucuHatasi(404),
    OturumSuresiDoldu(),
  ];

  for (AgHatasi? senaryo in senaryolar) {
    try {
      istekGonder(senaryo);
      print('✓ Veriler yüklendi.');
    } on AgHatasi catch (e) {
      print('✗ ${kullaniciMesaji(e)}  [${e.teknikDetay}]');
    }
  }
}
```

**Çıktı:**

```text
✓ Veriler yüklendi.
✗ İnternet bağlantınızı kontrol edin.  [İnternet bağlantısı yok]
✗ Sunucularımızda bir sorun var, birazdan tekrar deneyin.  [Sunucu 503 kodu döndürdü]
✗ İsteğiniz işlenemedi.  [Sunucu 404 kodu döndürdü]
✗ Oturumunuzun süresi doldu, lütfen yeniden giriş yapın.  [Oturum anahtarının süresi doldu]
```

**Açıklama:**
- `sealed class AgHatasi implements Exception`: Hem bir istisna (yakalanabilir), hem de kapalı bir aile (alt türleri yalnızca bu dosyada).
- `on AgHatasi catch (e)`: Ailenin **tüm** üyelerini tek satırda yakalar.
- `kullaniciMesaji` fonksiyonundaki `switch`'te `_` kolu yoktur. Yarın aileye `IstekZamanAsimi` diye yeni bir hata eklenirse, bu fonksiyon derleme hatası verir ve yeni hata için kullanıcı mesajı yazmayı **unutamazsınız**.
- `when s.durumKodu >= 500`: HTTP durum kodlarında 500 ve üzeri sunucu tarafındaki sorunları gösterir (Hafta 2'deki `switch` örneğini hatırlayın).
- **İki ayrı dil:** `teknikDetay` geliştiriciler için (kayıt, rapor), `kullaniciMesaji` kullanıcılar için. Kullanıcıya "503" gibi bir kod göstermek ona hiçbir şey anlatmaz.

## 4.5 Hatalı bir durumu ifade etmenin dört yolu

Artık bir fonksiyonun "işler yolunda gitmedi" demesinin dört farklı yolunu biliyoruz:

| Yol | Örnek | Ne zaman? |
|---|---|---|
| `null` döndürmek | `int.tryParse`, `firstOrNull`, `harita[anahtar]` | "Bulunamadı / çevrilemedi" olağan bir durum ve **tek bir nedeni** var |
| `bool` döndürmek | `bool odeyebilirMi(double tutar)` | Yalnızca evet/hayır sorusu soruluyor |
| İstisna fırlatmak | `throw YetersizBakiyeException(...)` | Hata nadir ve önemli; **görmezden gelinmemeli**; genellikle birkaç katman yukarıda (ekranda) ele alınacak |
| Sonuç nesnesi döndürmek | Ödev 4 Soru 2'deki `TakipSonucu`; Bölüm 5.7'deki `Sonuc<T>` | Başarı da hata da **eşit derecede olağan**; çağıranın her ikisini de ele alması derleyici tarafından **zorunlu** tutulmak isteniyor |

`null` döndürmenin zayıf yanı, **nedenin kaybolmasıdır**: `null` gelen bir fonksiyon, internet mi yoktu, kayıt mı bulunamadı, söyleyemez. İstisnanın zayıf yanı ise **görünmez** olmasıdır: Bir fonksiyonun imzasına (`void ode(double tutar)`) bakarak hangi istisnaları fırlatabileceğini anlayamazsınız; bunu ancak belgelerinden veya kodundan öğrenirsiniz. Sonuç nesnesi ise her iki sorunu da çözer; ama biraz daha fazla kod gerektirir. Hangisini seçeceğiniz, durumun ne kadar olağan olduğuna ve çağıranın onu ele almasının ne kadar önemli olduğuna bağlıdır.

## 4.6 assert: Geliştirme sırasında varsayımları kontrol etmek

`assert`, programcının "bu noktada şu koşul **kesinlikle** doğru olmalı" varsayımını yazmasıdır. Koşul yanlışsa program durur:

```dart
// Dosya: 04_06_assert.dart
// ❌ ÇALIŞMA ZAMANI HATASI (assert'ler açıkken)
class Puan {
  final int deger;

  Puan(this.deger) : assert(deger >= 0 && deger <= 100, 'Puan 0-100 arasında olmalı: $deger');
}

void main() {
  print(Puan(85).deger);
  print(Puan(120).deger);
}
```

Terminalde **`dart run --enable-asserts 04_06_assert.dart`** ile çalıştırın.

**Çıktı (bir bölümü):**

```text
85
Unhandled exception:
'file:///C:/dev/bmh309/hafta6/04_06_assert.dart': Failed assertion: line 6 pos 29: 'deger >= 0 && deger <= 100': Puan 0-100 arasında olmalı: 120
```

Aynı dosyayı **`dart run 04_06_assert.dart`** ile (assert'ler kapalı) çalıştırırsanız program çökmez:

```text
85
120
```

**Açıklama:**
- `: assert(koşul, 'mesaj')`: Kurucunun başlatıcı listesine (Hafta 4) yazılan bir kontroldür. Koşul yanlışsa `AssertionError` fırlatılır.
- **Önemli:** `assert`'ler yalnızca **geliştirme sırasında** çalışır. `dart run` varsayılan olarak onları atlar; `--enable-asserts` ile açılır. Flutter'da ise geliştirme (debug) modunda **açık**, yayınlanan uygulamada (release) **tamamen kaldırılmış** durumdadır.
- Bu yüzden `assert` **kullanıcı girdisini doğrulamak için kullanılmaz**: Yayınlanan uygulamada kullanıcı 120 yazdığında hiçbir kontrol yapılmaz. Kullanıcı girdisi her zaman `if` ve istisnalarla kontrol edilir. `assert`, "bu fonksiyonu yanlış çağırırsam beni **geliştirirken** uyar" demenin yoludur.
- Flutter'ın kendi widget'ları da yüzlerce `assert` içerir. Geliştirme sırasında gördüğünüz "Failed assertion" mesajlarının çoğu, bir widget'ı kurallarına aykırı kullandığınızı söyler.

## 4.7 ❌ Metin fırlatmak

Dart, `throw` ile **herhangi bir nesnenin** fırlatılmasına izin verir; bir `String` bile:

```dart
// Dosya: 04_07_tuzak_metin_firlatmak.dart
// ❌ KÖTÜ UYGULAMA: Çalışır, ama türüyle yakalanamaz.
void sifreKontrol(String sifre) {
  if (sifre.length < 8) {
    throw 'Şifre en az 8 karakter olmalı';
  }
}

void main() {
  try {
    sifreKontrol('1234');
  } on Exception {
    print('Exception yakalandı.');
  } catch (e) {
    print('Başka bir şey yakalandı: $e (${e.runtimeType})');
  }
}
```

**Çıktı:**

```text
Başka bir şey yakalandı: Şifre en az 8 karakter olmalı (String)
```

**Açıklama:** Fırlatılan şey bir `Exception` olmadığı için `on Exception` onu yakalayamadı; yalnızca "her şeyi yakala" bloğu yakaladı. Metin fırlatmanın sorunları: türüyle yakalanamaz, ek veri taşıyamaz ve onu yakalayan kod mesaj metnine bağımlı kalır. AI araçlarının ve internetteki eski örneklerin bir kısmında bu yazımı görebilirsiniz; siz her zaman bir istisna sınıfı fırlatın.

---

# 5. Generic Tipler

## 5.1 Generic tipleri aslında zaten kullanıyoruz

Hafta 3'ten beri `List<String>`, `Map<String, int>`, `Set<int>` yazıyoruz. Geçen hafta `whereType<Video>()` yazdık. Bu köşeli parantezler (`< >`) ne anlama geliyor?

`List`, Dart ekibinin **bir kez** yazdığı bir sınıftır. Ama bu sınıf, içine hangi tipte eleman konacağını **önceden bilmez**. Listenin elemanlarının tipi, onu kullanan kişi tarafından `< >` içinde **sonradan** söylenir: `List<String>` "metin listesi", `List<Urun>` "ürün listesi" demektir. Tipi sonradan belirlenen bu tür sınıf ve fonksiyonlara **generic** (genel amaçlı) denir.

Bir benzetme: Market raflarındaki boş **saklama kapları** düşünün. Kabın kendisi her şey için aynıdır; ama üzerine "Pirinç" etiketi yapıştırdığınız anda içine yalnızca pirinç koyarsınız ve kapağı açtığınızda ne bulacağınızı bilirsiniz. `List` kaptır, `<String>` etikettir.

Etiketin bize kazandırdığı şey **güvenliktir**:

```dart
// Dosya: 05_01_tip_guvenligi.dart
// ❌ DERLEME HATASI
void main() {
  List<int> notlar = [90, 75];
  notlar.add('yüz');
  print(notlar);
}
```

**Hata mesajı:**

```text
The argument type 'String' can't be assigned to the parameter type 'int'.
```

**Açıklama:** *Türkçesi:* "'String' tipindeki argüman, 'int' tipindeki parametreye atanamaz." `List<int>` dediğimiz anda listenin `add` metodu **yalnızca** `int` kabul eder. Hata, program çalışmadan önce yakalanır. Ayrıca listeden okuduğumuz her elemanın `int` olduğundan emin olduğumuz için `notlar[0] + 5` gibi işlemleri hiçbir dönüşüm yapmadan yazabiliriz.

Bu bölümde generic tipleri **kullanmaktan** bir adım öteye geçip kendi generic sınıflarımızı ve fonksiyonlarımızı **yazacağız**.

## 5.2 Sorun: Her tip için ayrı sınıf mı?

Mobil uygulamalar internetten çektikleri veriyi bir süre **önbellekte** (cache) saklar. Böylece aynı ekran ikinci kez açıldığında veri yeniden indirilmez, uygulama hızlı açılır ve kullanıcının mobil verisi harcanmaz. Bir uygulamada sıcaklıklar (`double`), şehir adları (`String`), menüler (`List<String>`)... için önbellek gerekebilir.

Her tip için ayrı bir sınıf yazmak (`SayiOnbellek`, `MetinOnbellek`, `MenuOnbellek`...) aynı kodu defalarca tekrarlamak demektir. Akla gelen ilk "kurnaz" çözüm, en genel tip olan `Object`'i kullanmaktır:

```dart
// Dosya: 05_02_tuzak_object_onbellek.dart
// ❌ ÇALIŞMA ZAMANI HATASI
class Onbellek {
  final Map<String, Object> _veriler = {};

  void kaydet(String anahtar, Object deger) {
    _veriler[anahtar] = deger;
  }

  Object? getir(String anahtar) => _veriler[anahtar];
}

void main() {
  Onbellek onbellek = Onbellek();
  onbellek.kaydet('sicaklik', 18.5);
  onbellek.kaydet('sehir', 'Siirt');

  double sicaklik = onbellek.getir('sicaklik') as double;
  print('Sıcaklık: $sicaklik');

  double nem = onbellek.getir('sehir') as double;
  print('Nem: $nem');
}
```

**Çıktı (bir bölümü):**

```text
Sıcaklık: 18.5
Unhandled exception:
type 'String' is not a subtype of type 'double' in type cast
```

**Açıklama:** Önbellek her şeyi kabul ediyor; ama karşılığında, içinden çıkan değerin **ne olduğunu unutuyor**. Her okumada `as double` ile "bana güven, bu bir double" demek zorundayız ve yanlış anahtar yazdığımız anda program çalışırken çöküyor. Derleyici bize yardım edemiyor, çünkü her şey `Object`.

İstediğimiz şey ikisinin ortası: **Bir kez** yazılan, ama kullanılırken **tipi bilinen** bir önbellek.

## 5.3 Generic sınıf yazmak

```dart
// Dosya: 05_03_generic_onbellek.dart
class Onbellek<T> {
  final Map<String, T> _veriler = {};

  void kaydet(String anahtar, T deger) {
    _veriler[anahtar] = deger;
  }

  T? getir(String anahtar) => _veriler[anahtar];

  int get boyut => _veriler.length;
}

void main() {
  Onbellek<double> sicakliklar = Onbellek<double>();
  sicakliklar.kaydet('Siirt', 18.5);
  sicakliklar.kaydet('Van', 9.0);

  Onbellek<List<String>> menuler = Onbellek();
  menuler.kaydet('Pazartesi', ['Mercimek çorbası', 'Pilav', 'Ayran']);

  double? siirt = sicakliklar.getir('Siirt');
  print('Siirt: ${siirt ?? '-'} °C');
  print('Erzurum: ${sicakliklar.getir('Erzurum') ?? 'önbellekte yok'}');
  print('Pazartesi menüsünde ${menuler.getir('Pazartesi')?.length ?? 0} yemek var.');
  print('Önbellek boyutları: ${sicakliklar.boyut}, ${menuler.boyut}');
}
```

**Çıktı:**

```text
Siirt: 18.5 °C
Erzurum: önbellekte yok
Pazartesi menüsünde 3 yemek var.
Önbellek boyutları: 2, 1
```

**Açıklama:**
- `class Onbellek<T>`: Sınıf adından sonraki `<T>`, bir **tip parametresidir**. "T, bu sınıfı kullanan kişinin daha sonra söyleyeceği bir tiptir" demektir. Sınıfın içinde `T`, herhangi bir tip gibi kullanılır: `Map<String, T>`, `T deger`, `T?`.
- `Onbellek<double>()` yazıldığı anda, o nesne için sınıftaki **her `T` `double` olur**. Dart'ın gözünde `sicakliklar` nesnesi aşağıdaki sınıftan oluşturulmuş gibidir:

```text
class Onbellek<double> {
  final Map<String, double> _veriler = {};
  void kaydet(String anahtar, double deger) { ... }
  double? getir(String anahtar) => _veriler[anahtar];
}
```

- `Onbellek<List<String>> menuler = Onbellek();`: Sağ tarafta `<List<String>>` yazmasak da Dart tipi sol taraftan **çıkarır** (tip çıkarımı). Sınıfı bir kez yazdık, iki farklı tiple kullandık.
- `getir` metodunun dönüş tipi `T?`'dir: Anahtar önbellekte yoksa `null` döner. Bu yüzden okurken `??` ve `?.` kullanıyoruz.
- `sicakliklar.kaydet('Mardin', 'sıcak');` yazmayı deneyin: Bölüm 5.1'dekiyle aynı derleme hatasını alırsınız. Bölüm 5.2'deki çalışma zamanı hatası, artık bir **derleme hatasına** dönüştü.

**İsimlendirme geleneği:** Tip parametreleri genellikle **tek büyük harfle** yazılır: `T` (type, tip), `E` (element, eleman), `K` ve `V` (key/value, anahtar/değer), `R` (return, dönüş). Dart'ın kendi tanımlarında `List<E>`, `Map<K, V>`, `Set<E>` yazar. Bir sınıfın birden fazla tip parametresi olabilir; `Map<K, V>` bunun örneğidir.

## 5.4 Generic fonksiyonlar

Yalnızca sınıflar değil, **fonksiyonlar** da generic olabilir. Tip parametresi fonksiyon adından hemen sonra yazılır:

```dart
// Dosya: 05_04_generic_fonksiyon.dart
T ilkVeyaVarsayilan<T>(List<T> liste, T varsayilan) => liste.isEmpty ? varsayilan : liste.first;

Map<T, int> say<T>(List<T> ogeler) {
  Map<T, int> sayac = {};
  for (T x in ogeler) {
    sayac.update(x, (n) => n + 1, ifAbsent: () => 1);
  }
  return sayac;
}

void main() {
  print(ilkVeyaVarsayilan(<String>[], 'Henüz mesaj yok'));
  print(ilkVeyaVarsayilan([4.5, 3.0], 0.0));

  print(say(['kahve', 'çay', 'kahve', 'su', 'kahve']));
  print(say([5, 4, 5, 3, 5, 4]));
  print(say<bool>([true, false, true]));
}
```

**Çıktı:**

```text
Henüz mesaj yok
4.5
{kahve: 3, çay: 1, su: 1}
{5: 3, 4: 2, 3: 1}
{true: 2, false: 1}
```

**Açıklama:**
- `T ilkVeyaVarsayilan<T>(List<T> liste, T varsayilan)`: Okunuşu: "Herhangi bir T tipi için; T'lerden oluşan bir liste ve bir T alır, bir T döndürür." Fonksiyon, listenin tipi ne olursa olsun çalışır; ama dönüş tipi **listenin tipiyle aynıdır**. `[4.5, 3.0]` verildiğinde sonuç `double`'dır.
- `say<T>`: Hafta 3'ten beri yazdığımız **sayma kalıbının** generic hali. Artık metinleri, puanları, `bool` değerleri, hatta enum değerlerini aynı fonksiyonla sayabiliriz.
- Çağırırken tipi yazmak **zorunlu değildir**; Dart onu argümanlardan çıkarır (`say(['kahve', ...])` → `T = String`). İstersek açıkça da yazabiliriz: `say<bool>(...)`.
- `<String>[]`: Boş bir liste verirken tipini belirtmek iyi bir alışkanlıktır; aksi halde Dart boş köşeli parantezlerden tipi çıkaramayabilir.

Dart'ın kendi kütüphanesindeki generic metotları zaten kullandınız: `whereType<Video>()`, `map<String>(...)`, `fold<double>(...)`. Hepsi bu bölümdeki gibi tanımlanmıştır.

## 5.5 Bir mobil örnek: Sayfa sayfa yükleme

Bir sosyal medya uygulaması akıştaki gönderilerin hepsini bir anda indirmez; kullanıcı aşağı kaydırdıkça 10'ar, 20'şer **sayfa sayfa** yükler (pagination). "Sayfa" kavramı, içindeki öğelerin tipinden bağımsızdır: gönderi, ürün, yorum... Bu, generic bir sınıf ile generic bir fonksiyonun birlikte kullanılması için ideal bir örnektir:

```dart
// Dosya: 05_05_sayfali_liste.dart
class Sayfa<T> {
  final List<T> ogeler;
  final int sayfaNo;
  final bool sonSayfa;

  Sayfa(this.ogeler, this.sayfaNo, this.sonSayfa);

  @override
  String toString() => 'Sayfa $sayfaNo: $ogeler${sonSayfa ? ' (son sayfa)' : ''}';
}

Sayfa<T> sayfala<T>(List<T> tumu, int sayfaNo, int boyut) {
  List<T> ogeler = tumu.skip((sayfaNo - 1) * boyut).take(boyut).toList();
  bool son = sayfaNo * boyut >= tumu.length;
  return Sayfa(ogeler, sayfaNo, son);
}

void main() {
  List<String> gonderiler = ['G1', 'G2', 'G3', 'G4', 'G5', 'G6', 'G7'];
  for (int no = 1; no <= 3; no++) {
    print(sayfala(gonderiler, no, 3));
  }

  Sayfa<int> puanlar = sayfala([90, 85, 70, 60], 2, 3);
  print(puanlar);
  print('İlk puan + 5 = ${puanlar.ogeler.first + 5}');
}
```

**Çıktı:**

```text
Sayfa 1: [G1, G2, G3]
Sayfa 2: [G4, G5, G6]
Sayfa 3: [G7] (son sayfa)
Sayfa 2: [60] (son sayfa)
İlk puan + 5 = 65
```

**Açıklama:**
- `skip((sayfaNo - 1) * boyut)`: Önceki sayfalardaki öğeleri atlar; `take(boyut)`: bu sayfanınkileri alır (Hafta 5, Bölüm 9.6).
- `sayfala` fonksiyonu `List<T>` alır ve `Sayfa<T>` döndürür; tip bilgisi baştan sona **korunur**. Bu yüzden `puanlar.ogeler.first + 5` yazabiliyoruz: Dart, `ogeler`'in `List<int>` olduğunu biliyor.
- Uygulamada `sonSayfa` alanı `true` olduğunda "daha fazla yükle" isteği gönderilmez ve listenin sonuna "Hepsi bu kadar" yazılır.

## 5.6 Tip sınırları: `T extends ...`

Bir sayı listesinin ortalamasını generic olarak yazmaya çalışalım:

```dart
// Dosya: 05_06_tuzak_sinirsiz_generic.dart
// ❌ DERLEME HATASI
double ortalama<T>(List<T> sayilar) => sayilar.fold(0.0, (t, x) => t + x) / sayilar.length;

void main() {
  print(ortalama([3, 4, 5]));
}
```

**Hata mesajı:**

```text
The argument type 'T' can't be assigned to the parameter type 'num'.
```

**Açıklama:** `T` **herhangi bir tip** olabilir: `String`, `bool`, `Urun`... Dart, bir `bool` ile toplama yapılamayacağını bildiği için `t + x` satırına izin vermez. Bizim aslında söylemek istediğimiz şey "T herhangi bir tip değil, **bir sayı tipi** olmalı"dır. Bunun için tip parametresine bir **sınır** (bound) koyarız:

```dart
// Dosya: 05_07_sinirli_generic.dart
class Urun {
  final String ad;
  final double fiyat;

  Urun(this.ad, this.fiyat);
}

class Telefon extends Urun {
  final int depolamaGb;

  Telefon(super.ad, super.fiyat, this.depolamaGb);
}

class Kitap extends Urun {
  final String yazar;

  Kitap(super.ad, super.fiyat, this.yazar);
}

double ortalama<T extends num>(List<T> sayilar) =>
    sayilar.isEmpty ? 0 : sayilar.fold(0.0, (t, x) => t + x) / sayilar.length;

T enPahali<T extends Urun>(List<T> urunler) => urunler.reduce((a, b) => b.fiyat > a.fiyat ? b : a);

void main() {
  print(ortalama([3, 4, 5]));
  print(ortalama([4.5, 3.0]));

  List<Telefon> telefonlar = [Telefon('Model A', 18000, 128), Telefon('Model B', 24000, 256)];
  List<Kitap> kitaplar = [
    Kitap('Mobil Programlama', 420, 'A. Yılmaz'),
    Kitap('Veri Yapıları', 380, 'B. Demir'),
  ];

  Telefon t = enPahali(telefonlar);
  Kitap k = enPahali(kitaplar);
  print('En pahalı telefon: ${t.ad}, ${t.depolamaGb} GB');
  print('En pahalı kitap: ${k.ad}, yazarı ${k.yazar}');
}
```

**Çıktı:**

```text
4.0
3.75
En pahalı telefon: Model B, 256 GB
En pahalı kitap: Mobil Programlama, yazarı A. Yılmaz
```

**Açıklama:**
- `<T extends num>` → "T, `num` **veya onun bir alt tipi** olmalı" (`int` ya da `double`). Artık Dart, `x`'in bir sayı olduğunu bildiği için `t + x`'e izin verir. `ortalama(['a', 'b'])` yazmayı denerseniz derleme hatası alırsınız.
- `<T extends Urun>` → "T, `Urun` veya bir alt sınıfı olmalı." Bu sayede fonksiyonun içinde `fiyat` alanını kullanabiliyoruz; çünkü her `T`'nin bir fiyatı olduğu garanti.
- **Neden `Urun enPahali(List<Urun> urunler)` yazmadık?** Öyle yazsaydık dönüş tipi `Urun` olurdu ve `t.depolamaGb` satırı derleme hatası verirdi: Dart, dönen ürünün bir telefon olduğunu **unuturdu**. Generic sürüm, telefon listesi verildiğinde **telefon**, kitap listesi verildiğinde **kitap** döndürür. Tip parametresi, giren tipin bilgisini çıkışa **taşır**.

## 5.7 Sonuc<T>: Ya başarı ya hata

Bölüm 4.5'te bir hatalı durumu ifade etmenin yollarından birinin **sonuç nesnesi** döndürmek olduğunu söylemiştik. Ödev 4'teki `TakipSonucu` yalnızca sipariş takibi için yazılmıştı. Generic ve `sealed` sınıfları birleştirerek **her türlü** işlem için kullanılabilecek bir sonuç tipi yazabiliriz:

```dart
// Dosya: 05_08_sonuc_tipi.dart
sealed class Sonuc<T> {}

class Basarili<T> extends Sonuc<T> {
  final T veri;

  Basarili(this.veri);
}

class Hatali<T> extends Sonuc<T> {
  final String mesaj;

  Hatali(this.mesaj);
}

Sonuc<int> yasDogrula(String metin) {
  int? yas = int.tryParse(metin.trim());
  if (yas == null) {
    return Hatali('Yaş bir sayı olmalı.');
  }
  if (yas < 13) {
    return Hatali('Uygulamayı kullanmak için en az 13 yaşında olmalısınız.');
  }
  return Basarili(yas);
}

Sonuc<String> kullaniciAdiDogrula(String metin) {
  String ad = metin.trim().toLowerCase();
  if (ad.length < 3) {
    return Hatali('Kullanıcı adı en az 3 karakter olmalı.');
  }
  if (ad.contains(' ')) {
    return Hatali('Kullanıcı adında boşluk olamaz.');
  }
  return Basarili('@$ad');
}

String goster<T>(Sonuc<T> sonuc) => switch (sonuc) {
      Basarili<T> b => '✓ ${b.veri}',
      Hatali<T> h => '✗ ${h.mesaj}',
    };

void main() {
  for (String girdi in ['21', 'on iki', '9']) {
    print('Yaş "$girdi": ${goster(yasDogrula(girdi))}');
  }
  for (String girdi in ['Ayse_K', 'ab', 'mert can']) {
    print('Ad "$girdi": ${goster(kullaniciAdiDogrula(girdi))}');
  }

  Sonuc<int> sonuc = yasDogrula('30');
  if (sonuc is Basarili<int>) {
    print('Gelecek yıl: ${sonuc.veri + 1}');
  }
}
```

**Çıktı:**

```text
Yaş "21": ✓ 21
Yaş "on iki": ✗ Yaş bir sayı olmalı.
Yaş "9": ✗ Uygulamayı kullanmak için en az 13 yaşında olmalısınız.
Ad "Ayse_K": ✓ @ayse_k
Ad "ab": ✗ Kullanıcı adı en az 3 karakter olmalı.
Ad "mert can": ✗ Kullanıcı adında boşluk olamaz.
Gelecek yıl: 31
```

**Açıklama:**
- `sealed class Sonuc<T>`: Bir sonuç ya `Basarili` ya da `Hatali`'dır; üçüncü bir ihtimal yoktur. `T`, başarı durumunda taşınan verinin tipidir.
- `return Basarili(yas);`: Fonksiyonun dönüş tipi `Sonuc<int>` olduğu için Dart bunun `Basarili<int>` olduğunu kendisi çıkarır.
- `goster` fonksiyonu da generic'tir; `Sonuc<int>` de alır, `Sonuc<String>` de. İçindeki `switch`'te `_` kolu yoktur; Dart iki durumun da ele alındığını doğrular.
- `if (sonuc is Basarili<int>)`: Kontrolden sonra Dart, `sonuc`'un bir `Basarili<int>` olduğunu bilir ve `sonuc.veri + 1` yazmamıza izin verir (Hafta 4'teki tip yükseltme).
- **İstisnadan farkı:** Bir fonksiyonun dönüş tipi `Sonuc<int>` ise, onu çağıran kişi hata ihtimalini **imzadan görür** ve ele almadan veriye ulaşamaz. İstisnada ise bu ihtimal fonksiyonun imzasında görünmez.

> 🔗 **Flutter'da:** Bu kalıp Flutter dünyasında çok yaygındır. `FutureBuilder`'ın verdiği `AsyncSnapshot<T>` (Bölüm 7.9) ve ilerleyen haftalarda göreceğimiz Riverpod'un `AsyncValue<T>` tipi, aynı fikrin **üç durumlu** halidir: yükleniyor / veri geldi / hata.

## 5.8 Flutter'da generic tipler

Flutter kodunda `< >` görmediğiniz bir ekran neredeyse yoktur. Bu tabloyu dönem boyunca tekrar tekrar hatırlayacaksınız:

| Yazım | Anlamı | Göreceğimiz yer |
|---|---|---|
| `List<Urun>` | Ürün listesi | Her liste ekranı |
| `Future<Hava>` | **İleride** gelecek bir `Hava` nesnesi | Bölüm 7 |
| `Stream<int>` | **Zamanla** gelen tam sayılar | Bölüm 9 |
| `FutureBuilder<Hava>` | Bir `Future<Hava>`'yı bekleyip sonucuna göre ekranı çizen widget | Bölüm 7.9 |
| `StreamBuilder<List<Mesaj>>` | Her yeni mesaj listesinde ekranı yeniden çizen widget | Bölüm 9.8 |
| `State<SayacEkrani>` | Bir ekranın değişebilen durumu | StatefulWidget haftası |
| `Navigator.push<bool>(...)` | Açılan sayfadan `bool` bir sonuç beklemek ("Silmek istediğinize emin misiniz?") | Gezinme haftası |

---

# 6. Record'lar: Birden Fazla Değeri Birlikte Taşımak

## 6.1 Sorun: Bir fonksiyondan iki değer döndürmek

Bir adım sayar uygulaması, haftalık adım sayılarının **en azını** ve **en çoğunu** birlikte göstermek istiyor. Fonksiyonlar tek bir değer döndürür; iki değeri nasıl döndürürüz?

- **Liste döndürmek** (`[4300, 15210]`): Hangi indeksin ne olduğu anlaşılmaz; iki değerin tipleri farklı olsaydı tip bilgisi kaybolurdu.
- **Map döndürmek** (`{'enAz': 4300, 'enCok': 15210}`): Anahtar adını yanlış yazmak derleme hatası vermez, `null` döner.
- **Bir sınıf yazmak**: Doğru ama bir kerelik bir sonuç için ağır: sınıf, alanlar, kurucu...

Dart 3 ile gelen **record'lar** (kayıtlar) bu iş için tasarlanmıştır:

```dart
// Dosya: 06_01_ilk_record.dart
(int, int) enAzEnCok(List<int> sayilar) {
  int enAz = sayilar.reduce((a, b) => a < b ? a : b);
  int enCok = sayilar.reduce((a, b) => a > b ? a : b);
  return (enAz, enCok);
}

void main() {
  List<int> adimlar = [8450, 12030, 4300, 9900, 15210, 7020, 11000];

  (int, int) sonuc = enAzEnCok(adimlar);
  print(sonuc);
  print('En az: ${sonuc.$1}, en çok: ${sonuc.$2}');

  var (enAz, enCok) = enAzEnCok(adimlar);
  print('Fark: ${enCok - enAz} adım');
}
```

**Çıktı:**

```text
(4300, 15210)
En az: 4300, en çok: 15210
Fark: 10910 adım
```

**Açıklama:**
- `(int, int)`: Bir **record tipi**: "İki tam sayıdan oluşan bir ikili." Dönüş tipinin yerine yazılır.
- `return (enAz, enCok);`: Bir **record değeri**: Değerler parantez içinde, virgülle ayrılarak yazılır.
- `sonuc.$1`, `sonuc.$2`: Konumsal (sırayla yazılan) alanlara `$` işareti ve sıra numarasıyla erişilir. **Numaralar 1'den başlar**, listelerdeki gibi 0'dan değil.
- `var (enAz, enCok) = ...;`: **Parçalama** (destructuring). Record'u tek satırda iki ayrı değişkene açar. `$1`, `$2` yazmaktan çok daha okunaklıdır ve en sık kullanılan yazım budur.

## 6.2 İsimli alanlar

`$1`, `$2` kısa ama anlamsızdır: Hangisi en az, hangisi en çok? Record alanlarına **isim** verebiliriz:

```dart
// Dosya: 06_02_isimli_alanlar.dart
({String durum, double sicaklik, int nem}) havaOzeti(String sehir) => switch (sehir) {
      'Siirt' => (durum: 'Güneşli', sicaklik: 18.5, nem: 35),
      'Van' => (durum: 'Karlı', sicaklik: -2.0, nem: 80),
      _ => (durum: 'Bilinmiyor', sicaklik: 0, nem: 0),
    };

void main() {
  var hava = havaOzeti('Siirt');
  print('${hava.durum}, ${hava.sicaklik} °C, nem %${hava.nem}');

  var (:durum, :sicaklik, :nem) = havaOzeti('Van');
  print('Van: $durum / $sicaklik °C / %$nem');

  (String, {int adet}) siparis = ('Simit', adet: 3);
  print('${siparis.adet} adet ${siparis.$1}');
}
```

**Çıktı:**

```text
Güneşli, 18.5 °C, nem %35
Van: Karlı / -2.0 °C / %80
3 adet Simit
```

**Açıklama:**
- `({String durum, double sicaklik, int nem})`: İsimli alanlar **süslü parantez** içinde yazılır; tıpkı fonksiyonlardaki isimlendirilmiş parametreler gibi. Alanlara isimleriyle erişilir: `hava.durum`.
- `var (:durum, :sicaklik, :nem) = ...`: İsimli alanları **aynı isimli** değişkenlere açar. `:durum`, `durum: durum` yazmanın kısaltmasıdır.
- `(String, {int adet})`: Konumsal ve isimli alanlar bir arada da kullanılabilir.
- `sicaklik: 0`: Record'un tipi `double` beklediği için `0` sabiti kendiliğinden `0.0` olur (Soru 1'deki klima örneğini hatırlayın).

## 6.3 Parçalama her yerde

Parçalama yalnızca fonksiyon sonuçlarında değil, döngülerde ve atamalarda da kullanılabilir:

```dart
// Dosya: 06_03_parcalama.dart
void main() {
  List<(String, int)> skorlar = [('Ayşe', 1250), ('Mert', 980), ('Zeynep', 1430)];
  for (var (ad, puan) in skorlar) {
    print('$ad: $puan puan');
  }

  Map<String, int> stok = {'Kulaklık': 4, 'Şarj aleti': 0};
  for (var MapEntry(key: urun, value: adet) in stok.entries) {
    print('$urun → ${adet > 0 ? '$adet adet' : 'tükendi'}');
  }

  int a = 1;
  int b = 2;
  (a, b) = (b, a);
  print('a = $a, b = $b');
}
```

**Çıktı:**

```text
Ayşe: 1250 puan
Mert: 980 puan
Zeynep: 1430 puan
Kulaklık → 4 adet
Şarj aleti → tükendi
a = 2, b = 1
```

**Açıklama:**
- `List<(String, int)>`: Elemanları record olan bir liste. Döngüde her eleman `(ad, puan)` olarak açılır.
- `var MapEntry(key: urun, value: adet)`: Hafta 5'te gördüğümüz `MapEntry` nesnesinin `key` ve `value` alanlarını doğrudan `urun` ve `adet` değişkenlerine açar. Bu, bir **nesne deseni**dir (object pattern); Bölüm 6.5'te tekrar göreceğiz.
- `(a, b) = (b, a);`: İki değişkenin değerini geçici bir değişken kullanmadan **takas** eder.

## 6.4 Record'lar değerlerine göre karşılaştırılır

```dart
// Dosya: 06_04_record_esitligi.dart
class Nokta {
  final int x;
  final int y;

  Nokta(this.x, this.y);
}

void main() {
  print((3, 4) == (3, 4));
  print(Nokta(3, 4) == Nokta(3, 4));

  List<(int, int)> yol = [(0, 0), (0, 1), (1, 1), (0, 1), (0, 0)];
  Set<(int, int)> ziyaretEdilen = yol.toSet();
  print('${yol.length} adım, ${ziyaretEdilen.length} farklı kare: $ziyaretEdilen');
}
```

**Çıktı:**

```text
true
false
5 adım, 3 farklı kare: {(0, 0), (0, 1), (1, 1)}
```

**Açıklama:** İki record'un **tüm alanları eşitse** record'lar da eşittir. Sınıflarda ise `==` varsayılan olarak "aynı nesne mi?" diye sorar: İki ayrı `Nokta(3, 4)` nesnesi, değerleri aynı olsa da **farklı** nesnelerdir. Bu yüzden record'lar `Set` içinde tekrarları doğru şekilde eler: Oyuncunun 5 adımlık yolunda aynı karelerden iki kez geçilmiş, `toSet()` ise yalnızca 3 farklı kareyi tutmuştur. Bir oyun haritasında veya bir koşu uygulamasının rotasında geçilen noktaları `(satır, sütun)` olarak tutmak, bu özelliğin tipik bir kullanımıdır.

## 6.5 switch ile record ve nesne desenleri

Hafta 2'de `switch` ifadelerinde `>= 90` gibi desenler kullanmıştık. Record'lar sayesinde **birden fazla değere birlikte** bakabiliriz. Ayrıca `sealed` sınıfların alanlarını da `switch` içinde doğrudan açabiliriz:

```dart
// Dosya: 06_05_desenler.dart
String kiyafetOnerisi(String durum, double sicaklik) => switch ((durum, sicaklik)) {
      ('Yağmurlu', _) => 'Şemsiyeni al.',
      ('Karlı', _) || (_, < 5) => 'Kalın bir mont giy.',
      (_, >= 25) => 'Tişört yeterli, su içmeyi unutma.',
      _ => 'Hafif bir ceket al.',
    };

sealed class Sonuc<T> {}

class Basarili<T> extends Sonuc<T> {
  final T veri;

  Basarili(this.veri);
}

class Hatali<T> extends Sonuc<T> {
  final String mesaj;

  Hatali(this.mesaj);
}

String sicaklikYazisi(Sonuc<double> sonuc) => switch (sonuc) {
      Basarili(:final veri) => 'Sıcaklık: $veri °C',
      Hatali(:final mesaj) => 'Hava durumu alınamadı: $mesaj',
    };

void main() {
  print(kiyafetOnerisi('Yağmurlu', 12));
  print(kiyafetOnerisi('Güneşli', 3));
  print(kiyafetOnerisi('Güneşli', 31));
  print(kiyafetOnerisi('Bulutlu', 16));

  print(sicaklikYazisi(Basarili(18.5)));
  print(sicaklikYazisi(Hatali('Sunucu yanıt vermedi')));
}
```

**Çıktı:**

```text
Şemsiyeni al.
Kalın bir mont giy.
Tişört yeterli, su içmeyi unutma.
Hafif bir ceket al.
Sıcaklık: 18.5 °C
Hava durumu alınamadı: Sunucu yanıt vermedi
```

**Açıklama:**
- `switch ((durum, sicaklik))`: İki değer bir record'da birleştirilir ve birlikte eşleştirilir. Dıştaki parantezler `switch`'e, içteki parantezler record'a aittir.
- `('Yağmurlu', _)`: "Durum yağmurluysa, sıcaklık **ne olursa olsun**."
- `('Karlı', _) || (_, < 5)`: "Ya karlıysa ya da sıcaklık 5'in altındaysa." Hafta 2'deki `401 || 403` yazımının record'lu halidir.
- `Basarili(:final veri)`: "Sonuç bir `Basarili` ise, `veri` alanını **aynı isimli** bir değişkene aç." Bölüm 5.7'deki `Basarili<T> b => b.veri` yazımıyla aynı işi yapar; ama alanlara doğrudan isimleriyle ulaştığımız için daha kısadır. İki yazım da doğrudur; okumayı kolaylaştıranı seçin.

## 6.6 Record mı, sınıf mı?

| | Record | Sınıf |
|---|---|---|
| **Tanımlama** | Gerekmez; kullanıldığı yerde yazılır | `class` ile ayrıca tanımlanır |
| **Metot, getter, `toString`** | Eklenemez | Eklenebilir |
| **Eşitlik** | Değere göre, kendiliğinden | Varsayılan olarak nesnenin kimliğine göre |
| **Alanlar değişebilir mi?** | Hayır | `final` olmayan alanlar değişebilir |
| **Uygun olduğu yer** | Bir fonksiyondan **geçici olarak** birkaç değer döndürmek; kısa ömürlü, küçük veriler | Uygulamanın **temel kavramları** (`Urun`, `Kullanici`, `Siparis`); davranışı olan her şey |

Pratik bir kural: Aynı record tipini programın **üç farklı yerinde** yazmaya başladıysanız, ona bir isim verme, yani onu bir sınıfa dönüştürme zamanı gelmiştir.

> 🔗 **Flutter'da:** Bölüm 8.3'te, internete gönderilen iki farklı isteği **aynı anda** başlatıp sonuçlarını tek satırda bir record olarak alacağız: `var (hava, menu) = await (havaGetir(), menuGetir()).wait;`

---

# 7. Asenkron Programlama I: Future, async ve await

## 7.1 Neden asenkron? Tek garsonlu restoran

Şimdiye kadar yazdığımız bütün programlar **senkron** (eşzamanlı) çalıştı: Her satır, bir önceki satır bitmeden başlamadı. Hesaplama yapan satırlar için bu bir sorun değildir; çünkü bir toplama işlemi milyonda bir saniye sürer. Ama bazı işler **uzun** sürer:

| İş | Tipik süre |
|---|---|
| Bir listeyi sıralamak (1000 eleman) | Milisaniyenin küçük bir kesri |
| Telefonun hafızasından bir ayarı okumak | Birkaç milisaniye |
| İnternetten hava durumunu çekmek | 0,2 – 3 saniye (metroda çok daha fazla) |
| Kameradan fotoğraf çekilmesini beklemek | Kullanıcı ne zaman basarsa |

Bir telefon ekranı saniyede **60 kez** (yeni telefonlarda 120 kez) yeniden çizilir; yani her kare için yaklaşık **16 milisaniye** vardır. Dart'ta sizin kodunuz ile ekranı çizen kod **aynı iş hattında** (thread) çalışır. Kodunuz internetten gelecek cevabı 2 saniye boyunca senkron olarak bekleseydi, ekran 2 saniye boyunca hiç çizilemez, dokunmalara cevap verilemezdi: Uygulama **donardı.** Android, 5 saniye boyunca cevap vermeyen uygulamalar için kullanıcıya "Uygulama yanıt vermiyor. Kapatılsın mı?" penceresini gösterir.

Bunu bir **restoran benzetmesiyle** düşünelim. Dart, **tek garsonlu** bir restorandır:

- **Senkron garson:** 1 numaralı masanın siparişini alır, mutfağa götürür ve yemek pişene kadar **mutfak kapısında bekler.** Bu sürede diğer masalar ne sipariş verebilir ne de su isteyebilir. Restoran donmuştur.
- **Asenkron garson:** Siparişi mutfağa iletir, karşılığında bir **sipariş fişi** alır ve hemen diğer masalara bakmaya döner. Mutfaktan "1 numaranın yemeği hazır!" **zili** gelince yemeği masaya götürür.

Asenkron garson daha hızlı yürümüyor; yalnızca **boş beklemeyi** bıraktı. Mutfak, Dart'ın dışındaki dünyadır (sunucu, disk, kamera); fiş bir **`Future`**'dır; zil ise "işin bittiği" haberidir. Dart, bekleyen işlerin haberlerini bir sırada (olay kuyruğu) tutar ve elindeki işi bitirdikçe sıradaki haberi ele alır. Buna **olay döngüsü** (event loop) denir.

## 7.2 Future nedir?

`Future<T>`, "şu an elimde olmayan, ama **ileride** hazır olacak bir `T` değerinin" temsilcisidir. Gündelik hayattaki en iyi karşılığı, bir kafede sipariş verdiğinizde elinize verilen **titreşimli çağrı cihazıdır**: Elinizde henüz kahve yoktur, ama kahvenizin hazırlandığının garantisi vardır. Cihaz titrediğinde kahvenizi alırsınız. Bazen de cihaz titrer ve size "Üzgünüz, süt bitti" denir.

Bir `Future` her an şu üç durumdan birindedir:

| Durum | Kafe karşılığı | Dart'taki karşılığı |
|---|---|---|
| **Tamamlanmamış** (bekliyor) | Kahve hazırlanıyor | İşlem sürüyor |
| **Değerle tamamlandı** | Kahveniz hazır | `Future<String>` bir `String` verdi |
| **Hatayla tamamlandı** | "Süt bitti" | İşlem bir istisnayla bitti |

`Future<String>` yazımındaki `<String>`, Bölüm 5'teki generic tiplerin ta kendisidir: "İleride bir `String` verecek olan Future."

## 7.3 İlk Future: Future.delayed ile sahte bir sunucu

İnternetten veri çekmeyi ilerleyen haftalarda `http` paketiyle yapacağız. Şimdilik bir sunucunun **gecikmesini** `Future.delayed` ile taklit edeceğiz:

```dart
// Dosya: 07_01_ilk_future.dart
Future<String> kullaniciAdiGetir() {
  return Future.delayed(Duration(seconds: 2), () => 'ayse.yilmaz');
}

void main() {
  print('1. İstek gönderiliyor...');
  Future<String> fis = kullaniciAdiGetir();
  print('2. Elimizdeki: $fis');
  fis.then((ad) => print('4. Kullanıcı adı geldi: $ad'));
  print('3. main fonksiyonu bitti, ekran donmadı.');
}
```

**Çıktı:**

```text
1. İstek gönderiliyor...
2. Elimizdeki: Instance of 'Future<String>'
3. main fonksiyonu bitti, ekran donmadı.
4. Kullanıcı adı geldi: ayse.yilmaz
```

İlk üç satır **hemen**, dördüncü satır **2 saniye sonra** gelir. Programı çalıştırıp izleyin.

**Açıklama:**
- `Future.delayed(süre, fonksiyon)`: "Bu süre kadar bekle, sonra fonksiyonu çalıştır; fonksiyonun sonucu Future'ın değeri olsun." Gerçek bir sunucu isteği gibi davranır.
- `kullaniciAdiGetir()` **beklemez**; hemen bir `Future<String>` (fiş) döndürür. 2. satırda fişi yazdırdığımızda kullanıcı adını değil, `Instance of 'Future<String>'` ("bir Future nesnesi") yazısını görüyoruz: Kahve değil, çağrı cihazı. *(Eski Dart sürümlerinde `Instance of '_Future<String>'` yazar.)*
- `fis.then(fonksiyon)`: "Fiş **tamamlandığında** bu fonksiyonu çalıştır." Hafta 5'te gördüğümüz **geri çağırma** (callback) fikri. `then` da beklemez; yalnızca bir not bırakır.
- `main` biter; ama Dart programı hemen kapatmaz, çünkü bekleyen bir iş (2 saniyelik sayaç) vardır. Sayaç dolunca not çalışır ve 4. satır yazılır.

Zaman çizelgesi:

| Zaman | Ne oluyor? | Ekran |
|---|---|---|
| 0 sn | İstek başlatılır, fiş alınır | `1.` |
| 0 sn | Fiş yazdırılır (içi henüz boş) | `2.` |
| 0 sn | `then` ile "tamamlanınca şunu yap" notu bırakılır | |
| 0 sn | `main` biter | `3.` |
| 2 sn | Sayaç dolar, Future tamamlanır, `then`'deki fonksiyon çalışır | `4.` |

## 7.4 async ve await: Beklemenin okunaklı yolu

`then` ile her sonucu bir geri çağırma fonksiyonunda işlemek, adımlar çoğaldıkça okumayı zorlaştırır. Dart'ın **`async`** ve **`await`** kelimeleri, asenkron kodu senkron kod gibi **yukarıdan aşağı** okunabilir şekilde yazmamızı sağlar:

```dart
// Dosya: 07_02_async_await.dart
Future<String> kullaniciAdiGetir() {
  return Future.delayed(Duration(seconds: 2), () => 'ayse.yilmaz');
}

Future<void> main() async {
  print('İstek gönderiliyor...');
  String ad = await kullaniciAdiGetir();
  print('Hoş geldin, $ad!');
}
```

**Çıktı:**

```text
İstek gönderiliyor...
Hoş geldin, ayse.yilmaz!
```

**Açıklama:**
- **`await`** → "Bu Future tamamlanana kadar **bu fonksiyonu** beklet; tamamlanınca bana **değerini** ver." `kullaniciAdiGetir()` bir `Future<String>` döndürür; `await kullaniciAdiGetir()` ise bir **`String`** verir. Fişi verip kahveyi alırsınız.
- **`async`** → "Bu fonksiyonun içinde `await` kullanacağım." `await` yalnızca `async` ile işaretlenmiş fonksiyonlarda kullanılabilir.
- `Future<void> main() async`: `main` fonksiyonu da asenkron olabilir. Değer döndürmeyen asenkron fonksiyonların dönüş tipi `Future<void>`'dir.
- **En önemli nokta:** `await` yalnızca **içinde bulunduğu fonksiyonu** bekletir; **programı veya uygulamayı değil.** Garson bu masanın yemeğini beklerken "1 numaraya yemek götürülecek" diye not alır ve diğer masalara bakmaya devam eder. Flutter'da `await` ile internetten veri beklenirken ekran çizilmeye, animasyonlar oynamaya, kaydırma çalışmaya devam eder.

## 7.5 Asenkron fonksiyon yazmak

Kendi asenkron fonksiyonlarımızı yazalım. Bir cüzdan uygulaması bakiyeyi sunucudan alıyor:

```dart
// Dosya: 07_03_async_fonksiyon.dart
Future<int> bakiyeGetir(String kullanici) async {
  await Future.delayed(Duration(seconds: 1));
  return kullanici == 'ayse' ? 250 : 0;
}

Future<String> bakiyeMesaji(String kullanici) async {
  int bakiye = await bakiyeGetir(kullanici);
  if (bakiye == 0) {
    return '@$kullanici: Bakiyeniz bulunmuyor.';
  }
  return '@$kullanici: Bakiyeniz $bakiye TL.';
}

Future<void> main() async {
  print(await bakiyeMesaji('ayse'));
  print(await bakiyeMesaji('mert'));
}
```

**Çıktı:**

```text
@ayse: Bakiyeniz 250 TL.
@mert: Bakiyeniz bulunmuyor.
```

**Açıklama:**
- `await Future.delayed(Duration(seconds: 1));`: Değer beklemeden yalnızca **zaman** bekler; sunucunun cevap süresini taklit eder.
- `bakiyeGetir` fonksiyonu içinde `return 250;` yazıyoruz, ama dönüş tipi `Future<int>`. Bir `async` fonksiyon **her zaman bir Future döndürür**; `return` ettiğimiz değeri Dart kendisi bir Future'ın içine koyar.
- **Asenkronluk yukarı doğru yayılır:** `bakiyeMesaji`, `bakiyeGetir`'i `await` ile beklediği için kendisi de `async` olmak zorundadır; onu çağıran `main` de öyle. Uygulamada bu zincir genellikle bir düğmenin `onPressed` fonksiyonunda sona erer.

Senkron ve asenkron yazımın karşılaştırması:

| | Senkron | Asenkron |
|---|---|---|
| Değer döndüren fonksiyon | `int bakiyeGetir()` | `Future<int> bakiyeGetir() async` |
| Değer döndürmeyen fonksiyon | `void kaydet()` | `Future<void> kaydet() async` |
| Fonksiyonun içinde | `return 250;` | `return 250;` (Dart, Future'a sarar) |
| Sonucu kullanmak | `int b = bakiyeGetir();` | `int b = await bakiyeGetir();` |

## 7.6 Çalışma sırası: Asenkron fonksiyon nerede durur?

Asenkron programlamanın en çok kafa karıştıran konusu, satırların **hangi sırayla** çalıştığıdır. Tek bir kuralı bilmek yeterli:

> **Bir `async` fonksiyon, ilk `await`'e kadar hemen (senkron) çalışır. `await`'e gelince durur ve kontrolü kendisini çağıran koda geri verir. Kalan kısım, beklenen iş bitince çalışır.**

```dart
// Dosya: 07_04_calisma_sirasi.dart
Future<void> veriYukle() async {
  print('B: Yükleme başladı');
  await Future.delayed(Duration(seconds: 1));
  print('D: Veri geldi');
}

void main() {
  print('A: Uygulama açıldı');
  veriYukle();
  print('C: Ekran çizildi');
}
```

**Çıktı:**

```text
A: Uygulama açıldı
B: Yükleme başladı
C: Ekran çizildi
D: Veri geldi
```

Adım adım:

| Adım | Çalışan kod | Ekran |
|---|---|---|
| 1 | `main`: A yazılır | `A` |
| 2 | `main`: `veriYukle()` çağrılır | |
| 3 | `veriYukle`: B yazılır (**ilk `await`'e kadar her şey hemen çalışır**) | `B` |
| 4 | `veriYukle`: `await`'e gelir, **durur**, kontrolü `main`'e geri verir | |
| 5 | `main`: C yazılır, `main` biter | `C` |
| 6 | 1 saniye sonra: `veriYukle` kaldığı yerden devam eder, D yazılır | `D` |

İki yaygın yanlış inanış:
- ❌ "`async` fonksiyonun **tamamı** sonra çalışır." → Hayır, ilk `await`'e kadar olan kısım **hemen** çalışır (B, C'den önce geldi).
- ❌ "`await` **bütün programı** durdurur." → Hayır, yalnızca bulunduğu fonksiyonu durdurur (C, D'yi beklemedi).

`main` içinde `veriYukle()`'yi `await` ile çağırırsak sıra değişir; çünkü artık `main` de bekler:

```dart
// Dosya: 07_05_calisma_sirasi_await.dart
Future<void> veriYukle() async {
  print('B: Yükleme başladı');
  await Future.delayed(Duration(seconds: 1));
  print('D: Veri geldi');
}

Future<void> main() async {
  print('A: Uygulama açıldı');
  await veriYukle();
  print('C: Ekran çizildi');
}
```

**Çıktı:**

```text
A: Uygulama açıldı
B: Yükleme başladı
D: Veri geldi
C: Ekran çizildi
```

**Açıklama:** `await veriYukle();` → "`veriYukle`'nin döndürdüğü Future tamamlanana kadar `main`'i beklet." Future, `veriYukle` fonksiyonunun **tamamı** (D dahil) bitince tamamlanır. Bu yüzden C en sona kaldı. Hangisi doğru? Duruma göre: Ekranın veriyi beklemeden çizilmesi gerekiyorsa ilki, veri gelmeden devam edilemiyorsa ikincisi.

## 7.7 Sıralı bekleme: Bir işin sonucu diğerine gerekiyorsa

Bir alışveriş uygulaması "Siparişlerim" ekranını açarken önce kullanıcının **profilini** getirir, sonra profildeki kullanıcı numarasıyla **siparişleri** getirir. İkinci istek, birinci isteğin sonucuna **bağlıdır**:

```dart
// Dosya: 07_06_sirali_bekleme.dart
class Profil {
  final int id;
  final String ad;

  Profil(this.id, this.ad);
}

Future<Profil> profilGetir() async {
  await Future.delayed(Duration(seconds: 1));
  return Profil(42, 'Ayşe');
}

Future<List<String>> siparisleriGetir(int kullaniciId) async {
  await Future.delayed(Duration(seconds: 1));
  return kullaniciId == 42 ? ['SP-1024', 'SP-1025'] : [];
}

Future<void> main() async {
  Stopwatch kronometre = Stopwatch();
  kronometre.start();

  Profil profil = await profilGetir();
  print('Profil: ${profil.ad}');
  List<String> siparisler = await siparisleriGetir(profil.id);
  print('Siparişler: $siparisler');

  print('Geçen süre: yaklaşık ${(kronometre.elapsedMilliseconds / 1000).round()} sn');
}
```

**Çıktı:**

```text
Profil: Ayşe
Siparişler: [SP-1024, SP-1025]
Geçen süre: yaklaşık 2 sn
```

**Açıklama:**
- `Stopwatch`: Dart'ın hazır **kronometresi.** `start()` ile başlar; `elapsedMilliseconds` geçen süreyi milisaniye olarak verir. Süreyi saniyeye çevirip yuvarladık; çünkü milisaniyeler her çalıştırmada biraz farklı olur (2003, 2011...).
- Toplam süre, iki bekleme süresinin **toplamıdır** (1 + 1). Siparişleri getirmek için kullanıcı numarasına (`profil.id`) ihtiyacımız olduğundan bu iki işi aynı anda başlatamayız. Birbirinden **bağımsız** işlerin nasıl aynı anda yapılacağını Bölüm 8.3'te göreceğiz.

## 7.8 then mi, await mi?

Aynı iş `then` ile de yazılabilir:

```dart
// Dosya: 07_07_then_zinciri.dart
class Profil {
  final int id;
  final String ad;

  Profil(this.id, this.ad);
}

Future<Profil> profilGetir() => Future.delayed(Duration(seconds: 1), () => Profil(42, 'Ayşe'));

Future<List<String>> siparisleriGetir(int kullaniciId) =>
    Future.delayed(Duration(seconds: 1), () => ['SP-1024', 'SP-1025']);

void main() {
  profilGetir().then((profil) {
    print('Profil: ${profil.ad}');
    return siparisleriGetir(profil.id);
  }).then((siparisler) {
    print('Siparişler: $siparisler');
  });
}
```

**Çıktı:**

```text
Profil: Ayşe
Siparişler: [SP-1024, SP-1025]
```

**Açıklama:** `then` içindeki fonksiyon başka bir Future döndürürse, sonraki `then` o Future'ın sonucunu bekler. Kod çalışıyor; ama adım sayısı arttıkça iç içe geçmiş fonksiyonlar okumayı zorlaştırır. Hata yönetimi de ayrı bir yazım ister (`catchError`). Bu derste her zaman **`async`/`await`** kullanacağız. `then`'i yine de tanıyın: Eski kodlarda, internetteki örneklerde ve bazı Flutter kalıplarında (`Navigator.push(...).then((sonuc) {...})`) karşınıza çıkacaktır.

## 7.9 ❌ async/await tuzakları

### Tuzak 1: await'i unutmak

```dart
// Dosya: 07_08_tuzak_await_unutmak.dart
// ❌ MANTIK HATASI: await unutuldu.
Future<int> sepetAdediGetir() async {
  await Future.delayed(Duration(milliseconds: 500));
  return 3;
}

Future<void> main() async {
  var adet = sepetAdediGetir();
  print('Sepetinizde $adet ürün var.');
}
```

**Çıktı:**

```text
Sepetinizde Instance of 'Future<int>' ürün var.
```

**Açıklama:** `await` yazılmadığı için `adet` bir sayı değil, bir **Future**'dır ve ekrana fişin kendisi yazılır. Flutter'da bu hata, ekranda bir `Text` widget'ının içinde "Instance of 'Future<int>'" yazması olarak görünür; yeni başlayanların en sık yaptığı asenkron hatadır. Derleyici neden uyarmadı? Çünkü `var` kullandık ve Dart, `adet`'in tipini `Future<int>` olarak çıkardı. Tipi açıkça yazsaydık (`int adet = sepetAdediGetir();`) hemen bir derleme hatası alırdık:

```text
A value of type 'Future<int>' can't be assigned to a variable of type 'int'.
```

Bu, değişken tiplerini açıkça yazmanın faydalarından biridir.

### Tuzak 2: async olmayan fonksiyonda await

```dart
// Dosya: 07_09_tuzak_async_yok.dart
// ❌ DERLEME HATASI
Future<String> selamGetir() async => 'Merhaba';

void main() {
  String selam = await selamGetir();
  print(selam);
}
```

**Hata mesajı:**

```text
The await expression can only be used in an async function.
```

**Açıklama:** *Türkçesi:* "`await` ifadesi yalnızca `async` bir fonksiyonda kullanılabilir." Çözüm: `Future<void> main() async`.

### Tuzak 3: async fonksiyonun dönüş tipi Future değil

```dart
// Dosya: 07_10_tuzak_donus_tipi.dart
// ❌ DERLEME HATASI
String selamGetir() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Merhaba';
}

Future<void> main() async {
  print(await selamGetir());
}
```

**Hata mesajı:**

```text
Functions marked 'async' must have a return type which is a supertype of 'Future'.
```

**Açıklama:** *Türkçesi:* "`async` ile işaretlenen fonksiyonların dönüş tipi Future (veya onun üst tipi) olmalıdır." Bir asenkron fonksiyon sonucunu **hemen** veremez; bu yüzden `String` değil, `Future<String>` döndürür.

### Tuzak 4: `void` asenkron fonksiyon beklenemez

```dart
// Dosya: 07_11_tuzak_void_async.dart
// ❌ DERLEME HATASI
void kaydet() async {
  await Future.delayed(Duration(seconds: 1));
  print('Kaydedildi');
}

Future<void> main() async {
  await kaydet();
  print('Ana sayfaya dönülüyor');
}
```

**Hata mesajı:**

```text
This expression has a type of 'void' so its value can't be used.
```

**Açıklama:** `void kaydet() async` bir Future döndürmez (dönüş tipi `void`); bu yüzden onu çağıran kişi işin **ne zaman bittiğini bilemez** ve onu `await` ile bekleyemez. Daha kötüsü, içinde oluşan hataları da kimse yakalayamaz. Kural: Asenkron fonksiyonlarda `void` değil, **her zaman `Future<void>`** yazın. (Tek istisnası, Flutter'ın kendisinin çağırdığı ve sonucunu beklemediği `onPressed: () async {...}` gibi geri çağırmalardır.)

> 🔗 **Flutter'da:** Bir düğmeye basıldığında asenkron bir iş yapmak ve bir Future'ın sonucunu ekranda göstermek için şu iki kalıp kullanılır. `FutureBuilder`'ın `snapshot` nesnesi, Bölüm 5.7'deki `Sonuc<T>`'nin üç durumlu bir benzeridir: bekleniyor / hata / veri.
>
> ```dart
> // ŞABLON: Flutter'da asenkron düğme ve FutureBuilder (çalıştırılamaz, yalnızca okuyun)
> ElevatedButton(
>   onPressed: () async {
>     await profilKaydet();
>     Navigator.pop(context);
>   },
>   child: const Text('Kaydet'),
> )
>
> FutureBuilder<Hava>(
>   future: havaFuture, // initState içinde bir kez oluşturulur
>   builder: (context, snapshot) {
>     if (snapshot.connectionState == ConnectionState.waiting) {
>       return const CircularProgressIndicator();
>     }
>     if (snapshot.hasError) {
>       return Text('Hava durumu alınamadı: ${snapshot.error}');
>     }
>     return Text('${snapshot.data!.sicaklik} °C');
>   },
> )
> ```

---

# 8. Asenkron Programlama II: Hatalar, Paralel İşler ve Zaman Aşımı

## 8.1 Asenkron hataları yakalamak

Bir Future **hatayla** da tamamlanabilir (kafedeki "süt bitti" haberi). İyi haber şu: `await` kullandığımızda hata, `await` satırında **normal bir istisna gibi** fırlatılır. Yani Bölüm 3'te öğrendiğimiz `try`, `on`, `catch`, `finally` aynen çalışır:

```dart
// Dosya: 08_01_async_hata.dart
class BaglantiHatasi implements Exception {
  final String mesaj;

  BaglantiHatasi(this.mesaj);

  @override
  String toString() => 'BaglantiHatasi: $mesaj';
}

bool internetVar = true;

Future<double> sicaklikGetir(String sehir) async {
  await Future.delayed(Duration(milliseconds: 800));
  if (!internetVar) {
    throw BaglantiHatasi('Sunucuya ulaşılamadı');
  }
  return 18.5;
}

Future<void> ekraniYukle(String sehir) async {
  print('[$sehir] Yükleniyor...');
  try {
    double sicaklik = await sicaklikGetir(sehir);
    print('[$sehir] $sicaklik °C');
  } on BaglantiHatasi catch (e) {
    print('[$sehir] Hava durumu alınamadı. ($e)');
  } finally {
    print('[$sehir] Yükleniyor göstergesi kapatıldı.');
  }
}

Future<void> main() async {
  await ekraniYukle('Siirt');
  internetVar = false;
  await ekraniYukle('Batman');
}
```

**Çıktı:**

```text
[Siirt] Yükleniyor...
[Siirt] 18.5 °C
[Siirt] Yükleniyor göstergesi kapatıldı.
[Batman] Yükleniyor...
[Batman] Hava durumu alınamadı. (BaglantiHatasi: Sunucuya ulaşılamadı)
[Batman] Yükleniyor göstergesi kapatıldı.
```

**Açıklama:**
- `sicaklikGetir` içinde fırlatılan hata, fonksiyonun döndürdüğü Future'ı **hatayla** tamamlar.
- `await sicaklikGetir(sehir)` satırı bu hatayı "açar" ve o satırda fırlatır; `on BaglantiHatasi` onu yakalar.
- `finally`, başarılı ve başarısız her iki durumda da yükleniyor göstergesini kapatır. Bu, Bölüm 3.6'daki "Kaydet" kalıbının asenkron halidir ve Flutter'da her veri yükleyen ekranda kullanılır.

## 8.2 ❌ Beklenmeyen bir Future'ın hatası yakalanamaz

```dart
// Dosya: 08_02_tuzak_yakalanmayan_hata.dart
// ❌ ÇALIŞMA ZAMANI HATASI
Future<void> profilKaydet() async {
  await Future.delayed(Duration(milliseconds: 500));
  throw Exception('Sunucu yanıt vermedi');
}

Future<void> main() async {
  try {
    profilKaydet();
    print('Profil kaydedildi!');
  } catch (e) {
    print('Kaydedilemedi: $e');
  }
  print('main bitti');
}
```

**Çıktı (bir bölümü):**

```text
Profil kaydedildi!
main bitti
Unhandled exception:
Exception: Sunucu yanıt vermedi
```

**Açıklama:** Bu, asenkron programlamanın **en sinsi** hatasıdır:
1. `profilKaydet()` `await` olmadan çağrıldı. Fonksiyon hemen bir Future döndürdü; o anda henüz bir hata yoktu.
2. `try` bloğu hatasız bitti ve kullanıcıya "Profil kaydedildi!" yazıldı. **Bu bir yalan!**
3. Yarım saniye sonra hata oluştu; ama artık o Future'ı bekleyen kimse yoktu. `try-catch` çoktan geride kalmıştı. Hata yakalanmadı ve program çöktü.

Çözüm tek kelime: `await profilKaydet();`. Kural: **Bir Future döndüren fonksiyonu ya `await` ile bekleyin ya da bilerek beklemediğinizi açıkça belirtin.** Flutter projelerinde `analysis_options.yaml` dosyasına `unawaited_futures` kuralını eklerseniz, VS Code beklenmeyen Future'ları sizin için işaretler.

## 8.3 Sıralı mı, paralel mi? Future.wait

Bir kampüs uygulaması açıldığında üç bilgi gösteriyor: hava durumu, duyurular ve yemekhane menüsü. Bu üç istek birbirinden **bağımsızdır**; hiçbiri diğerinin sonucuna ihtiyaç duymaz.

```dart
// Dosya: 08_03_future_wait.dart
Future<String> havaGetir() => Future.delayed(Duration(seconds: 2), () => 'Güneşli, 18 °C');

Future<String> duyuruGetir() => Future.delayed(Duration(seconds: 1), () => '3 yeni duyuru');

Future<String> menuGetir() => Future.delayed(Duration(seconds: 3), () => 'Mercimek, Pilav, Ayran');

int saniye(Stopwatch k) => (k.elapsedMilliseconds / 1000).round();

Future<void> main() async {
  Stopwatch k = Stopwatch();
  k.start();
  String hava = await havaGetir();
  String duyuru = await duyuruGetir();
  String menu = await menuGetir();
  print('Sıralı : $hava | $duyuru | $menu');
  print('Süre   : ${saniye(k)} sn');

  k.reset();
  List<String> sonuclar = await Future.wait([havaGetir(), duyuruGetir(), menuGetir()]);
  print('Paralel: ${sonuclar[0]} | ${sonuclar[1]} | ${sonuclar[2]}');
  print('Süre   : ${saniye(k)} sn');
}
```

**Çıktı:**

```text
Sıralı : Güneşli, 18 °C | 3 yeni duyuru | Mercimek, Pilav, Ayran
Süre   : 6 sn
Paralel: Güneşli, 18 °C | 3 yeni duyuru | Mercimek, Pilav, Ayran
Süre   : 3 sn
```

**Açıklama:**
- **Sıralı:** Her `await`, bir önceki istek bitmeden sonrakinin **başlamasını** engeller. Toplam süre = 2 + 1 + 3 = **6 saniye**.
- **Paralel:** `[havaGetir(), duyuruGetir(), menuGetir()]` listesi oluşturulurken üç fonksiyon **hemen** çağrılır; üç istek de **aynı anda başlar**. `Future.wait` üçünün de bitmesini bekler. Toplam süre = en uzun olanın süresi = **3 saniye**.
- `Future.wait`, sonuçları bir **liste** olarak ve **verdiğimiz sırayla** döndürür (hangisinin önce bittiğine bakmaz): `sonuclar[0]` her zaman hava durumudur.
- `k.reset()`: Kronometreyi sıfırlar; kronometre çalışmaya devam eder.

Zaman çizelgesiyle:

```text
Sıralı:   hava   ██████
                       duyuru ███
                                  menü █████████        → 6 sn
Paralel:  hava   ██████
          duyuru ███
          menü   █████████                              → 3 sn
          0 sn         1         2         3
```

Restoran benzetmesiyle: Garson üç siparişi **art arda** mutfağa iletir ve üçü de hazır olunca masaya birlikte götürür. Dart hâlâ **tek garsonludur**; aynı anda çalışan şeyler mutfaklar, yani sunuculardır.

**Kural:** Birbirine **bağımlı** işler sıralı (`await`, `await`...); birbirinden **bağımsız** işler paralel (`Future.wait`). Kullanıcı açısından fark büyüktür: Açılış ekranı 6 yerine 3 saniyede gelir.

## 8.4 Farklı tipleri birlikte beklemek: record ile `.wait`

`Future.wait` bir **liste** döndürür; listedeki bütün elemanlar aynı tipte olmalıdır. Sonuçlarımızın tipleri farklıysa (biri `double`, biri `List<String>`, biri `int`), Bölüm 6'daki **record'lar** imdadımıza yetişir:

```dart
// Dosya: 08_04_record_wait.dart
Future<double> sicaklikGetir() => Future.delayed(Duration(seconds: 1), () => 18.5);

Future<List<String>> menuGetir() => Future.delayed(Duration(seconds: 2), () => ['Mercimek', 'Pilav']);

Future<int> bildirimSayisiGetir() => Future.delayed(Duration(seconds: 1), () => 3);

Future<void> main() async {
  var (sicaklik, menu, bildirim) = await (sicaklikGetir(), menuGetir(), bildirimSayisiGetir()).wait;

  print('Hissedilen sıcaklık: ${sicaklik + 1} °C');
  print('Menüde ${menu.length} yemek var: ${menu.join(', ')}');
  print('$bildirim okunmamış bildirim');
}
```

**Çıktı:**

```text
Hissedilen sıcaklık: 19.5 °C
Menüde 2 yemek var: Mercimek, Pilav
3 okunmamış bildirim
```

**Açıklama:**
- `(sicaklikGetir(), menuGetir(), bildirimSayisiGetir())`: Üç Future'dan oluşan bir **record**. Üç istek yine aynı anda başlar.
- `.wait`: Record'daki bütün Future'ları bekler ve sonuçları **aynı sırayla, tipleri korunarak** bir record olarak verir: `(double, List<String>, int)`.
- `var (sicaklik, menu, bildirim) = ...`: Bölüm 6.1'deki parçalama. Her değişkenin tipi doğru çıkarıldığı için `sicaklik + 1` ve `menu.length` hiçbir dönüşüm yapmadan yazılabiliyor. `Future.wait` ile aynı işi yapsaydık sonuçlar bir `List<Object>` olarak gelir ve her biri için `as double` gibi dönüşümler gerekirdi.

## 8.5 Biri başarısız olursa?

Paralel beklemenin bir bedeli vardır: İşlerden **biri** hata verirse, bekleyen kod **hepsini** kaybeder:

```dart
// Dosya: 08_05_wait_hata.dart
Future<String> havaGetir() => Future.delayed(Duration(seconds: 1), () => 'Güneşli');

Future<String> menuGetir() async {
  await Future.delayed(Duration(milliseconds: 500));
  throw Exception('Menü servisi çalışmıyor');
}

Future<void> main() async {
  try {
    List<String> sonuclar = await Future.wait([havaGetir(), menuGetir()]);
    print(sonuclar);
  } catch (e) {
    print('Ekran yüklenemedi: $e');
  }
}
```

**Çıktı:**

```text
Ekran yüklenemedi: Exception: Menü servisi çalışmıyor
```

**Açıklama:** Hava durumu başarıyla geldi; ama yalnızca menü servisi çalışmadığı için kullanıcı **hiçbir şey** göremedi. İyi bir uygulama, çalışan parçaları göstermeli ve yalnızca menü kutusunda "Menü şu an alınamıyor" demelidir. Bunu Bölüm 11'de, her isteğin kendi hatasını yönettiği bir çözümle yapacağız.

## 8.6 Zaman aşımı: timeout

İnternet bağlantısı bazen kesilmez ama **sonsuza kadar** cevap da gelmez (metroda, asansörde, zayıf Wi-Fi'da). Kullanıcıyı sonsuza kadar bekletmemek için bir Future'a **zaman sınırı** koyabiliriz:

```dart
// Dosya: 08_06_timeout.dart
import 'dart:async';

Future<String> yavasSunucu() => Future.delayed(Duration(seconds: 5), () => 'Güncel veri');

Future<void> main() async {
  print('İstek gönderildi...');
  try {
    String veri = await yavasSunucu().timeout(Duration(seconds: 2));
    print('Gelen: $veri');
  } on TimeoutException {
    print('Sunucu 2 saniye içinde yanıt vermedi. Lütfen tekrar deneyin.');
  }

  String gosterilen = await yavasSunucu().timeout(
    Duration(seconds: 1),
    onTimeout: () => 'Önbellekteki eski veri',
  );
  print('Gösterilen: $gosterilen');
}
```

**Çıktı:**

```text
İstek gönderildi...
Sunucu 2 saniye içinde yanıt vermedi. Lütfen tekrar deneyin.
Gösterilen: Önbellekteki eski veri
```

**Açıklama:**
- `future.timeout(süre)`: Future bu süre içinde tamamlanmazsa bir **`TimeoutException`** fırlatır. Bu sınıf `dart:async` kütüphanesindedir; bu yüzden dosyanın başına `import 'dart:async';` yazdık.
- `onTimeout: () => ...`: Hata fırlatmak yerine **yedek bir değer** döndürür. Örnekte kullanıcıya en azından önbellekteki eski veri gösteriliyor.
- **Dikkat:** Son satır yazıldıktan sonra program birkaç saniye daha açık kalır. Çünkü `timeout`, yavaş isteği **iptal etmez**; yalnızca onu **beklemeyi bırakır.** İsteğin zamanlayıcısı arka planda dolana kadar çalışmaya devam eder. Gerçek uygulamalarda bu fark önemlidir: Zaman aşımına uğrayan bir "Ödeme yap" isteği, sunucuda **yine de** tamamlanmış olabilir! Bu yüzden ödeme gibi işlemlerden sonra, zaman aşımı olsa bile işlemin durumu sunucudan tekrar sorgulanır.

## 8.7 Yeniden deneme

Mobil ağlarda bir isteğin ilk denemede başarısız olup birkaç saniye sonra başarılı olması çok yaygındır. Bu yüzden uygulamalar, bağlantı hatalarında isteği birkaç kez **yeniden dener.** Bu işi her istek için ayrı ayrı yazmak yerine, Bölüm 5'teki generic fonksiyonlar ve Hafta 5'teki fonksiyon tipleriyle **bir kez** yazalım:

```dart
// Dosya: 08_07_yeniden_deneme.dart
class BaglantiHatasi implements Exception {}

int denemeSayaci = 0;

// Sahte sunucu: İlk iki denemede bağlantı hatası verir, üçüncüde başarılı olur.
Future<String> duyurulariGetir() async {
  await Future.delayed(Duration(milliseconds: 300));
  denemeSayaci++;
  if (denemeSayaci < 3) {
    throw BaglantiHatasi();
  }
  return '5 yeni duyuru';
}

Future<T> tekrarDene<T>(Future<T> Function() islem, {int enFazla = 3}) async {
  int deneme = 1;
  while (true) {
    try {
      return await islem();
    } on BaglantiHatasi {
      print('Deneme $deneme başarısız.');
      if (deneme == enFazla) {
        rethrow;
      }
    }
    await Future.delayed(Duration(milliseconds: 500 * deneme));
    deneme++;
  }
}

Future<void> main() async {
  String sonuc = await tekrarDene(duyurulariGetir);
  print('Sonuç: $sonuc');
}
```

**Çıktı:**

```text
Deneme 1 başarısız.
Deneme 2 başarısız.
Sonuç: 5 yeni duyuru
```

**Açıklama:**
- `Future<T> Function() islem`: "Parametre almayan ve bir `Future<T>` döndüren bir fonksiyon." `tekrarDene(duyurulariGetir)` yazarken fonksiyonu **çağırmıyor**, kendisini gönderiyoruz (parantez yok). Böylece `tekrarDene` onu istediği kadar çağırabilir.
- `<T>`: Fonksiyon generic olduğu için `Future<String>`, `Future<double>`, `Future<List<Urun>>` döndüren her işlemle çalışır.
- `while (true)`: Döngü yalnızca iki yolla biter: `return` (başarı) veya `rethrow` (son deneme de başarısız). Dart bunu bildiği için fonksiyonun sonuna ayrıca bir `return` yazmamız gerekmiyor.
- **Artan bekleme:** Her başarısız denemeden sonra biraz **daha uzun** bekleniyor (500 ms, 1000 ms...). Sunucu zaten zorlanıyorsa, binlerce telefonun aynı anda saniyede bir istek göndermesi onu tamamen çökertebilir.
- ⚠️ **`return await islem();` satırındaki `await` çok önemlidir.** `return islem();` yazılsaydı Future `try` bloğundan **beklenmeden** çıkardı; hata, `try` bloğu bittikten **sonra** oluşacağı için `on BaglantiHatasi` onu yakalayamazdı. Bir Future'ı `try` içinde döndürüyorsanız mutlaka `await` ile döndürün.

## 8.8 Flutter'da: "Kaydet" düğmesinin tam hali

Bu bölümde öğrendiklerimizin hepsi, Flutter'da tek bir düğmenin kodunda birleşir:

```dart
// ŞABLON: Flutter'da "Kaydet" düğmesinin kodu (çalıştırılamaz, yalnızca okuyun)
Future<void> kaydet() async {
  setState(() => yukleniyor = true);
  try {
    await profilServisi.kaydet(profil).timeout(const Duration(seconds: 10));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profil kaydedildi.')));
  } on TimeoutException {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bağlantı çok yavaş.')));
  } on AgHatasi catch (e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(kullaniciMesaji(e))));
  } finally {
    if (mounted) setState(() => yukleniyor = false);
  }
}
```

Satır satır: Yükleniyor göstergesini aç → kaydetmeyi **bekle**, ama en fazla 10 saniye → başarılıysa bildir → zaman aşımı ve ağ hatalarında kullanıcıya **anlaşılır** bir mesaj göster → her durumda göstergeyi kapat. `mounted` kontrolü şunu sorar: "Ben beklerken kullanıcı bu ekrandan çıktı mı?" Çıktıysa artık ekrana bir şey gösterilemez. Bunu Flutter haftalarında ayrıntılı göreceğiz.

---

# 9. Stream: Sürekli Gelen Veriler

## 9.1 Future tek değer, Stream bir değerler dizisi

Bir `Future` **bir kez** tamamlanır: Kahveniz gelir ve iş biter. Ama bazı veriler **sürekli** gelir:

- Adım sayar uygulamasında her birkaç saniyede bir yeni adım sayısı,
- Harita uygulamasında her saniye yeni bir konum,
- Bir sohbet ekranında her yeni mesaj,
- Bir dosya indirilirken ilerleme yüzdesi (%10, %20, ...),
- Firestore veritabanında bir koleksiyon her değiştiğinde listenin yeni hali.

Bu tür veriler için **`Stream`** (akış) kullanılır. Bir benzetme: `Future` sipariş ettiğiniz **tek bir paket**tir; `Stream` ise abone olduğunuz bir **YouTube kanalı** gibidir: Yeni videolar zaman içinde birer birer gelir ve ne zaman biteceği belli değildir. Kanala abone olursunuz (dinlersiniz), her yeni videoda haberdar olursunuz, istediğinizde abonelikten çıkarsınız.

Dart'taki dört temel "değer taşıyıcı" şöyle sınıflandırılabilir:

| | Tek değer | Çok değer |
|---|---|---|
| **Hemen hazır (senkron)** | `int` | `List<int>`, `Iterable<int>` |
| **Zamanla gelir (asenkron)** | `Future<int>` | `Stream<int>` |

## 9.2 async* ve yield ile Stream üretmek

Telefonunuza SMS ile gelen doğrulama kodunun bir **geçerlilik süresi** vardır ve ekranda geri sayım görünür. Bunu bir Stream ile yazalım:

```dart
// Dosya: 09_01_geri_sayim.dart
Stream<int> geriSayim(int baslangic) async* {
  for (int i = baslangic; i >= 1; i--) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

Future<void> main() async {
  print('Doğrulama kodu SMS ile gönderildi. Kodun süresi:');
  await for (int kalan in geriSayim(3)) {
    print('$kalan sn');
  }
  print('Süre doldu. "Kodu tekrar gönder" düğmesi aktif.');
}
```

**Çıktı:**

```text
Doğrulama kodu SMS ile gönderildi. Kodun süresi:
3 sn
2 sn
1 sn
Süre doldu. "Kodu tekrar gönder" düğmesi aktif.
```

**Açıklama:**
- **`async*`** (yıldızlı async): "Bu fonksiyon bir **Stream** üretir." Dönüş tipi `Stream<int>`'tir.
- **`yield i;`**: "Akışa `i` değerini **gönder** ve kaldığın yerden devam et." `return` fonksiyonu bitirir; `yield` ise bitirmez, yalnızca bir değer yollar. Fonksiyonun sonuna gelindiğinde akış **kapanır.**
- **`await for`**: "Akıştan her yeni değer geldiğinde döngü gövdesini çalıştır; akış kapanınca döngüden çık." Değerler arasında 1 saniyelik boşluklar vardır ve `await for` her değeri bekler. Döngü bitmeden son satır çalışmaz.

| Fonksiyon türü | Anahtar kelime | Dönüş tipi | Değer gönderme |
|---|---|---|---|
| Normal | — | `int` | `return` (bir kez) |
| Asenkron | `async` | `Future<int>` | `return` (bir kez, ileride) |
| Akış üreten | `async*` | `Stream<int>` | `yield` (çok kez, zamanla) |

## 9.3 listen ile dinlemek

Bir akışı dinlemenin ikinci yolu `listen` metodudur. `await for` bulunduğu fonksiyonu **bekletir**; `listen` ise beklemez, Future'daki `then` gibi bir **geri çağırma** kaydeder:

```dart
// Dosya: 09_02_listen.dart
Stream<int> adimSayar() async* {
  List<int> olcumler = [120, 340, 560, 800];
  for (int adim in olcumler) {
    await Future.delayed(Duration(milliseconds: 500));
    yield adim;
  }
}

void main() {
  print('Adım sayar başlatılıyor...');
  adimSayar().listen(
    (adim) => print('Bugünkü adım: $adim'),
    onDone: () => print('Ölçüm bitti.'),
  );
  print('Ana ekran çizildi.');
}
```

**Çıktı:**

```text
Adım sayar başlatılıyor...
Ana ekran çizildi.
Bugünkü adım: 120
Bugünkü adım: 340
Bugünkü adım: 560
Bugünkü adım: 800
Ölçüm bitti.
```

**Açıklama:**
- `listen(fonksiyon)`: "Akıştan her değer geldiğinde bu fonksiyonu çalıştır." `listen` hemen döner; bu yüzden "Ana ekran çizildi." ilk değerden **önce** yazılır.
- `onDone`: Akış kapandığında bir kez çalışır.
- **Hangisini kullanmalı?** Akışın değerlerini sırayla işleyip **bitince devam etmek** istiyorsanız `await for`; akışı arka planda dinlerken **başka işlere devam etmek** istiyorsanız `listen`. Flutter'ın `StreamBuilder` widget'ı arka planda `listen` kullanır.

## 9.4 Aboneliği iptal etmek

Bazı akışlar **hiç bitmez**: Konum güncellemeleri, kullanıcı harita ekranında olduğu sürece gelir. Kullanıcı ekrandan çıktığında akışı dinlemeyi bırakmazsak telefon boşuna konum hesaplamaya devam eder, **pil** ve **bellek** harcanır. `listen` bize bir **abonelik** (subscription) nesnesi verir; onunla dinlemeyi durdururuz:

```dart
// Dosya: 09_03_abonelik_iptal.dart
import 'dart:async';

Stream<String> konumGuncellemeleri() async* {
  int sira = 0;
  while (true) {
    await Future.delayed(Duration(milliseconds: 500));
    sira++;
    yield 'Konum #$sira';
  }
}

Future<void> main() async {
  StreamSubscription<String> abonelik = konumGuncellemeleri().listen((konum) => print(konum));

  await Future.delayed(Duration(milliseconds: 1750));
  await abonelik.cancel();
  print('Harita ekranı kapatıldı, konum takibi durduruldu.');
}
```

**Çıktı:**

```text
Konum #1
Konum #2
Konum #3
Harita ekranı kapatıldı, konum takibi durduruldu.
```

**Açıklama:**
- `konumGuncellemeleri` içindeki `while (true)` döngüsü kendiliğinden hiç bitmez; akış **sonsuzdur**.
- `StreamSubscription<String> abonelik`: `listen`'ın döndürdüğü abonelik. Bu tip `dart:async` kütüphanesindedir.
- 1,75 saniyede üç konum gelir (0,5 – 1,0 – 1,5 sn). `abonelik.cancel()` ile dinleme durdurulur; `async*` fonksiyonu da bir sonraki `yield`'da sessizce sonlanır ve program kapanır.
- Flutter'da bu iptal işlemi, ekran kapanırken çalışan `dispose` metodunda yapılır. Unutulursa ekran kapandıktan sonra da veri gelmeye devam eder; bu, **bellek sızıntısı** (memory leak) denen hatalara yol açar.

## 9.5 Stream metotları: where, map, take

Hafta 5'te listeler için öğrendiğimiz metotların çoğu Stream'lerde de **aynı isimle** vardır. Bir akıllı saat uygulaması, nabız sensöründen gelen ölçümlerden yalnızca yüksek olanları uyarı olarak göstermek istiyor:

```dart
// Dosya: 09_04_stream_metotlari.dart
Stream<int> nabizSensoru() async* {
  List<int> olcumler = [72, 75, 104, 98, 112, 80, 121, 76];
  for (int nabiz in olcumler) {
    await Future.delayed(Duration(milliseconds: 200));
    yield nabiz;
  }
}

Future<void> main() async {
  Stream<String> uyarilar = nabizSensoru()
      .where((n) => n > 100)
      .map((n) => 'UYARI: Yüksek nabız $n bpm')
      .take(2);

  await for (String uyari in uyarilar) {
    print(uyari);
  }
  print('İki uyarı gösterildi, uyarılar bir süre susturuldu.');
}
```

**Çıktı:**

```text
UYARI: Yüksek nabız 104 bpm
UYARI: Yüksek nabız 112 bpm
İki uyarı gösterildi, uyarılar bir süre susturuldu.
```

**Açıklama:**
- `where`, `map` ve `take` birer **yeni akış** döndürür. Değerler sensörden geldikçe bu "boru hattından" teker teker geçer: önce süzülür, sonra metne dönüştürülür.
- `take(2)`: İlk iki değerden sonra akışı **kapatır** ve kaynağı dinlemeyi bırakır. 121 değeri hiç işlenmez.
- Listelerdeki zincirle aynı yazım; tek fark, listede bütün değerler **baştan hazır** iken akışta değerlerin **zamanla** gelmesidir.

Hazır akış üretmenin iki kısa yolu daha vardır: `Stream.fromIterable([1, 2, 3])` bir listedeki değerleri sırayla akışa koyar; `Stream.periodic(Duration(seconds: 1), (i) => i)` her saniye artan bir sayı üretir (saatler ve sayaçlar için).

## 9.6 Stream'de hatalar

Bir akış, değerlerin arasında bir **hata** da gönderebilir. `await for` bu hatayı fırlatır; `listen` ise `onError` fonksiyonuna iletir:

```dart
// Dosya: 09_05_stream_hata.dart
class SensorHatasi implements Exception {
  @override
  String toString() => 'SensorHatasi: Sıcaklık sensörü okunamadı';
}

Stream<double> sicaklikSensoru() async* {
  yield 21.5;
  await Future.delayed(Duration(milliseconds: 300));
  yield 21.8;
  await Future.delayed(Duration(milliseconds: 300));
  throw SensorHatasi();
}

Future<void> main() async {
  try {
    await for (double s in sicaklikSensoru()) {
      print('Oda sıcaklığı: $s °C');
    }
  } on SensorHatasi catch (e) {
    print('Hata: $e');
  }

  sicaklikSensoru().listen(
    (s) => print('[listen] $s °C'),
    onError: (Object e) => print('[listen] Hata yakalandı: $e'),
    onDone: () => print('[listen] Akış kapandı.'),
  );
}
```

**Çıktı:**

```text
Oda sıcaklığı: 21.5 °C
Oda sıcaklığı: 21.8 °C
Hata: SensorHatasi: Sıcaklık sensörü okunamadı
[listen] 21.5 °C
[listen] 21.8 °C
[listen] Hata yakalandı: SensorHatasi: Sıcaklık sensörü okunamadı
[listen] Akış kapandı.
```

**Açıklama:**
- `async*` fonksiyonunda fırlatılan hata, akışa bir **hata olayı** olarak gönderilir; ardından akış kapanır.
- `await for` bu hatayı döngünün içinde fırlatır; `try-catch` ile yakalanır. Bölüm 8.1'deki `await` + `try-catch` kuralının akış versiyonu.
- `listen`'da `onError` verilmezse hata **yakalanmamış** sayılır ve program çöker. Bir akışı `listen` ile dinliyorsanız `onError`'ı unutmayın.

## 9.7 StreamController: Akışı elle beslemek

`async*` fonksiyonları, değerleri **kendi içlerinde** üretir. Bazen ise değerler programın **farklı yerlerinden** gelir: Bir sohbet uygulamasında mesajlar hem sunucudan hem de kullanıcının kendisinden gelir. Bu durumda **`StreamController`** kullanılır: Bir ucundan `add` ile değer eklenir, diğer ucundan (`stream`) dinlenir.

```dart
// Dosya: 09_06_stream_controller.dart
import 'dart:async';

class SohbetOdasi {
  final StreamController<String> _kontrolcu = StreamController<String>.broadcast();

  Stream<String> get mesajlar => _kontrolcu.stream;

  void gonder(String kimden, String metin) {
    _kontrolcu.add('$kimden: $metin');
  }

  Future<void> kapat() => _kontrolcu.close();
}

Future<void> main() async {
  SohbetOdasi oda = SohbetOdasi();

  oda.mesajlar.listen((mesaj) => print('[Sohbet ekranı] $mesaj'));
  oda.mesajlar.listen((_) => print('[Bildirim] Yeni mesajınız var'));

  oda.gonder('Ayşe', 'Proje toplantısı kaçta?');
  oda.gonder('Mert', '15.00, kütüphanede.');

  await oda.kapat();
  print('Sohbet kapatıldı.');
}
```

**Çıktı:**

```text
[Sohbet ekranı] Ayşe: Proje toplantısı kaçta?
[Bildirim] Yeni mesajınız var
[Sohbet ekranı] Mert: 15.00, kütüphanede.
[Bildirim] Yeni mesajınız var
Sohbet kapatıldı.
```

**Açıklama:**
- `_kontrolcu` **private**'tır: Dışarıdan yalnızca `gonder` metoduyla mesaj eklenebilir ve `mesajlar` akışı dinlenebilir. Hafta 4'teki kapsülleme ilkesi.
- `.broadcast()`: **Çok dinleyicili** bir akış oluşturur. Örnekte aynı akışı iki yer dinliyor: sohbet ekranı ve bildirim sistemi. Her mesaj iki dinleyiciye de ulaşır.
- `close()`: Akışı kapatır; dinleyicilerin `onDone` fonksiyonları çalışır. Kapatılan bir controller'a artık değer eklenemez.
- `(_) =>`: Gelen değeri kullanmayacağımız için parametreye `_` adını verdik: "Bir değer geliyor ama ilgilenmiyorum."

### ❌ Tek dinleyicili bir akışı iki kez dinlemek

Varsayılan olarak akışlar **tek dinleyicilidir** (single-subscription). `async*` ile üretilen akışlar da böyledir:

```dart
// Dosya: 09_07_tuzak_iki_dinleyici.dart
// ❌ ÇALIŞMA ZAMANI HATASI
Stream<int> indirmeYuzdesi() async* {
  for (int y = 25; y <= 100; y += 25) {
    await Future.delayed(Duration(milliseconds: 200));
    yield y;
  }
}

void main() {
  Stream<int> indirme = indirmeYuzdesi();
  indirme.listen((y) => print('İlerleme çubuğu: %$y'));
  indirme.listen((y) => print('Bildirim: %$y'));
}
```

**Çıktı (bir bölümü):**

```text
Unhandled exception:
Bad state: Stream has already been listened to.
```

**Açıklama:** *Türkçesi:* "Hatalı durum: Bu akış zaten dinleniyor." Tek dinleyicili akışlar, bir dosya indirmesi gibi **her parçanın bir kez** işlenmesi gereken veriler içindir. Birden fazla yerin dinlemesi gerekiyorsa `StreamController.broadcast()` kullanılır veya akış `indirme.asBroadcastStream()` ile çok dinleyicili hale getirilir.

## 9.8 Future ve Stream karşılaştırması

| | `Future<T>` | `Stream<T>` |
|---|---|---|
| **Kaç değer?** | Bir (veya bir hata) | Sıfır, bir veya çok; zamanla |
| **Üretmek** | `async` + `return` | `async*` + `yield`; ya da `StreamController` |
| **Beklemek** | `await` | `await for` |
| **Geri çağırma ile** | `.then(...)` | `.listen(...)` |
| **Hata yakalamak** | `await` + `try-catch` | `await for` + `try-catch`; ya da `onError` |
| **İptal** | (Beklemeyi bırakmak: `timeout`) | `abonelik.cancel()` |
| **Flutter widget'ı** | `FutureBuilder` | `StreamBuilder` |
| **Tipik örnek** | Giriş yapmak, hava durumunu bir kez çekmek | Sohbet mesajları, konum, adım sayar, canlı veritabanı |

> 🔗 **Flutter'da:** `StreamBuilder`, bir akışı dinler ve **her yeni değerde** ekranın ilgili kısmını yeniden çizer. Firestore'daki bir koleksiyonu dinleyen sohbet ekranları tam olarak böyle yazılır:
>
> ```dart
> // ŞABLON: Flutter'da StreamBuilder (çalıştırılamaz, yalnızca okuyun)
> StreamBuilder<List<String>>(
>   stream: sohbetServisi.mesajlar,
>   builder: (context, snapshot) {
>     if (snapshot.hasError) {
>       return const Text('Mesajlar yüklenemedi.');
>     }
>     if (!snapshot.hasData) {
>       return const CircularProgressIndicator();
>     }
>     List<String> mesajlar = snapshot.data!;
>     return ListView(children: mesajlar.map((m) => Text(m)).toList());
>   },
> )
> ```

---

# 10. Hepsini Birleştirelim: Kampüs Duyuru Ekranının Veri Katmanı

Bu bölümde haftanın bütün konularını tek bir programda birleştiriyoruz. Program, bir kampüs uygulamasının **"Duyurular" ekranının** arka planda yaptığı işleri taklit ediyor: sunucudan veri istemek, hataları kullanıcıya anlaşılır mesajlara çevirmek, hata olursa yeniden denemek ve ekranın o anki durumunu çizmek.

Programı okumadan önce genel yapıya bakalım. Her katman yalnızca bir işten sorumludur:

```text
 SahteSunucu          →  DuyuruDeposu              →  duyuruEkrani (Stream)      →  ciz
 (dış dünya)             (repository)                 (ekranın durumu)              (arayüz)
 ham veri gönderir       ham veriyi modele çevirir    Yükleniyor / Liste /          her durumu
 veya istisna fırlatır   istisnaları Sonuc'a çevirir  Boş / Hata durumları üretir   metne çevirir
                         zaman aşımı koyar            hata olursa yeniden dener
```

```dart
// Dosya: 10_01_kampus_duyurulari.dart
import 'dart:async';

// ---------- 1. Hata ailesi (Bölüm 4.4) ----------
sealed class AgHatasi implements Exception {}

class BaglantiYok extends AgHatasi {}

class SunucuHatasi extends AgHatasi {
  final int durumKodu;

  SunucuHatasi(this.durumKodu);
}

String kullaniciMesaji(AgHatasi hata) => switch (hata) {
      BaglantiYok _ => 'İnternet bağlantısı yok.',
      SunucuHatasi s when s.durumKodu >= 500 => 'Sunucuda bir sorun var.',
      SunucuHatasi _ => 'İstek işlenemedi.',
    };

// ---------- 2. Sonuç tipi (Bölüm 5.7) ----------
sealed class Sonuc<T> {}

class Basarili<T> extends Sonuc<T> {
  final T veri;

  Basarili(this.veri);
}

class Hatali<T> extends Sonuc<T> {
  final String mesaj;

  Hatali(this.mesaj);
}

// ---------- 3. Model ----------
class Duyuru {
  final String baslik;
  final String birim;
  final bool acil;

  Duyuru(this.baslik, this.birim, this.acil);

  Duyuru.fromMap(Map<String, Object> veri)
      : baslik = veri['baslik'] as String,
        birim = veri['birim'] as String,
        acil = veri['acil'] as bool;
}

// ---------- 4. Sahte sunucu: Her istekte sıradaki senaryoyu uygular ----------
class SahteSunucu {
  final List<String> _senaryolar;
  int _istekSayisi = 0;

  SahteSunucu(this._senaryolar);

  Future<List<Map<String, Object>>> duyurulariIste() async {
    String senaryo = _senaryolar[_istekSayisi % _senaryolar.length];
    _istekSayisi++;
    switch (senaryo) {
      case 'baglanti-yok':
        await Future.delayed(Duration(milliseconds: 200));
        throw BaglantiYok();
      case 'sunucu-hatasi':
        await Future.delayed(Duration(milliseconds: 200));
        throw SunucuHatasi(503);
      case 'yavas':
        await Future.delayed(Duration(seconds: 3));
        return [];
      case 'bos':
        await Future.delayed(Duration(milliseconds: 300));
        return [];
      default:
        await Future.delayed(Duration(milliseconds: 300));
        return [
          {'baslik': 'Vize sonuçları açıklandı', 'birim': 'Öğrenci İşleri', 'acil': false},
          {'baslik': 'Yarın Kezer kampüsünde elektrik kesintisi', 'birim': 'Yapı İşleri', 'acil': true},
          {'baslik': 'Kütüphane hafta sonu açık', 'birim': 'Kütüphane', 'acil': false},
        ];
    }
  }
}

// ---------- 5. Depo (repository): Ham veriyi modele, istisnaları Sonuc'a çevirir ----------
class DuyuruDeposu {
  final SahteSunucu _sunucu;

  DuyuruDeposu(this._sunucu);

  Future<Sonuc<List<Duyuru>>> duyurulariGetir() async {
    try {
      List<Map<String, Object>> ham = await _sunucu.duyurulariIste().timeout(Duration(seconds: 1));
      return Basarili(ham.map((m) => Duyuru.fromMap(m)).toList());
    } on TimeoutException {
      return Hatali('Sunucu yanıt vermiyor.');
    } on AgHatasi catch (e) {
      return Hatali(kullaniciMesaji(e));
    }
  }
}

// ---------- 6. Ekran durumları (Hafta 5, Bölüm 7) ----------
sealed class EkranDurumu {}

class Yukleniyor extends EkranDurumu {
  final int deneme;

  Yukleniyor(this.deneme);
}

class Liste extends EkranDurumu {
  final List<Duyuru> duyurular;

  Liste(this.duyurular);
}

class BosListe extends EkranDurumu {}

class HataEkrani extends EkranDurumu {
  final String mesaj;
  final bool tekrarDenenecek;

  HataEkrani(this.mesaj, {required this.tekrarDenenecek});
}

// ---------- 7. Ekranın durum akışı: yükle, hata olursa yeniden dene ----------
Stream<EkranDurumu> duyuruEkrani(DuyuruDeposu depo, {int enFazlaDeneme = 3}) async* {
  for (int deneme = 1; deneme <= enFazlaDeneme; deneme++) {
    yield Yukleniyor(deneme);
    Sonuc<List<Duyuru>> sonuc = await depo.duyurulariGetir();
    switch (sonuc) {
      case Basarili(:final veri):
        yield veri.isEmpty ? BosListe() : Liste(veri);
        return;
      case Hatali(:final mesaj):
        bool tekrar = deneme < enFazlaDeneme;
        yield HataEkrani(mesaj, tekrarDenenecek: tekrar);
        if (tekrar) {
          await Future.delayed(Duration(milliseconds: 500));
        }
    }
  }
}

// ---------- 8. Çizim: Her durum için ekranda ne görünecek? ----------
({int toplam, int acil}) ozet(List<Duyuru> duyurular) =>
    (toplam: duyurular.length, acil: duyurular.where((d) => d.acil).length);

String duyuruListesi(List<Duyuru> duyurular) {
  var (:toplam, :acil) = ozet(duyurular);
  List<String> satirlar = ['[Liste] $toplam duyuru, $acil acil'];
  for (Duyuru d in duyurular) {
    satirlar.add('   ${d.acil ? '(!)' : '   '} ${d.baslik} - ${d.birim}');
  }
  return satirlar.join('\n');
}

String ciz(EkranDurumu durum) => switch (durum) {
      Yukleniyor(deneme: 1) => '[Yükleniyor] Duyurular getiriliyor...',
      Yukleniyor(:final deneme) => '[Yükleniyor] Tekrar deneniyor ($deneme. deneme)...',
      BosListe() => '[Boş] Henüz duyuru yok.',
      HataEkrani(:final mesaj, tekrarDenenecek: true) => '[Uyarı] $mesaj Birazdan tekrar denenecek.',
      HataEkrani(:final mesaj) => '[Hata] $mesaj Lütfen daha sonra tekrar deneyin.',
      Liste(:final duyurular) => duyuruListesi(duyurular),
    };

// ---------- 9. "Ekran": Durum akışını dinler ve her durumu çizer ----------
Future<void> ekraniCalistir(String baslik, List<String> senaryolar) async {
  print('=== $baslik ===');
  DuyuruDeposu depo = DuyuruDeposu(SahteSunucu(senaryolar));
  await for (EkranDurumu durum in duyuruEkrani(depo)) {
    print(ciz(durum));
  }
}

Future<void> main() async {
  await ekraniCalistir('Senaryo 1: İnternet bir anlığına kesik', ['baglanti-yok', 'tamam']);
  await ekraniCalistir('Senaryo 2: Sunucu sorunlu', ['yavas', 'sunucu-hatasi', 'yavas']);
  await ekraniCalistir('Senaryo 3: Hiç duyuru yok', ['bos']);
}
```

**Çıktı:**

```text
=== Senaryo 1: İnternet bir anlığına kesik ===
[Yükleniyor] Duyurular getiriliyor...
[Uyarı] İnternet bağlantısı yok. Birazdan tekrar denenecek.
[Yükleniyor] Tekrar deneniyor (2. deneme)...
[Liste] 3 duyuru, 1 acil
       Vize sonuçları açıklandı - Öğrenci İşleri
   (!) Yarın Kezer kampüsünde elektrik kesintisi - Yapı İşleri
       Kütüphane hafta sonu açık - Kütüphane
=== Senaryo 2: Sunucu sorunlu ===
[Yükleniyor] Duyurular getiriliyor...
[Uyarı] Sunucu yanıt vermiyor. Birazdan tekrar denenecek.
[Yükleniyor] Tekrar deneniyor (2. deneme)...
[Uyarı] Sunucuda bir sorun var. Birazdan tekrar denenecek.
[Yükleniyor] Tekrar deneniyor (3. deneme)...
[Hata] Sunucu yanıt vermiyor. Lütfen daha sonra tekrar deneyin.
=== Senaryo 3: Hiç duyuru yok ===
[Yükleniyor] Duyurular getiriliyor...
[Boş] Henüz duyuru yok.
```

**Açıklama (katman katman):**

1. **`SahteSunucu`** gerçek bir sunucu gibi davranır: Bazen bekletir, bazen istisna fırlatır, bazen ham veri (`Map` listesi) gönderir. Hangi davranışı göstereceği, kurucuya verilen **senaryo listesiyle** belirlenir. Böylece bütün hata durumlarını gerçek bir internet bağlantısına ihtiyaç duymadan, **her seferinde aynı sonuçla** deneyebiliyoruz. Profesyonel projelerde testler de böyle sahte servislerle yazılır.
2. **`DuyuruDeposu`** sunucuyla konuşan **tek** yerdir. Üç iş yapar: zaman aşımı koyar (`timeout`), ham veriyi `Duyuru` nesnelerine çevirir (`fromMap`) ve istisnaları `Sonuc` nesnelerine çevirir. Depodan dışarıya **hiçbir istisna sızmaz**; onu kullanan kod yalnızca `Basarili` veya `Hatali` görür.
3. **`duyuruEkrani`** bir **durum akışıdır**: Ekranın zaman içindeki hallerini (`Yukleniyor` → `HataEkrani` → `Yukleniyor` → `Liste`) sırayla `yield` eder. Hata durumunda biraz bekleyip yeniden dener; üçüncü denemede de başarısız olursa vazgeçer. İçindeki `switch` bir **ifade değil, deyimdir** (statement); `case Basarili(:final veri):` satırı Bölüm 6.5'teki nesne desenini kullanır. `return;` satırı akışı kapatır.
4. **`ciz`** her durumu ekranda görünecek metne çevirir. `Yukleniyor(deneme: 1)` deseni "ilk deneme" durumunu, `HataEkrani(:final mesaj, tekrarDenenecek: true)` ise "tekrar denenecek hata" durumunu yakalar. `_` kolu yoktur; yarın yeni bir ekran durumu eklenirse derleyici bizi uyarır.
5. Senaryo 2'de program son satırı yazdıktan sonra birkaç saniye daha açık kalır: Zaman aşımına uğrayan `yavas` isteklerinin zamanlayıcıları hâlâ çalışıyordur (Bölüm 8.6).

Bu haftanın konularının programdaki yerleri:

| Konu | Programdaki yeri |
|---|---|
| Kendi istisna sınıfları, `sealed` hata ailesi | `AgHatasi`, `BaglantiYok`, `SunucuHatasi` |
| `throw` | `SahteSunucu.duyurulariIste` |
| `try` / `on` / `catch` | `DuyuruDeposu.duyurulariGetir` |
| Generic sınıf | `Sonuc<T>`, `Basarili<T>`, `Hatali<T>` |
| Record | `ozet` fonksiyonunun `({int toplam, int acil})` dönüş tipi |
| Nesne desenleri | `Basarili(:final veri)`, `Yukleniyor(deneme: 1)` |
| `Future`, `async`, `await` | `duyurulariIste`, `duyurulariGetir`, `ekraniCalistir` |
| `timeout`, `TimeoutException` | `DuyuruDeposu` |
| `Stream`, `async*`, `yield`, `await for` | `duyuruEkrani`, `ekraniCalistir` |

> 🔗 **Flutter'da:** Bu programın Flutter'daki karşılığı neredeyse birebir aynıdır. `SahteSunucu` yerine `http` paketi veya Firebase gelir; `DuyuruDeposu` aynen kalır; `duyuruEkrani` akışını ekranda bir `StreamBuilder` dinler; `ciz` fonksiyonunun yerini de her durum için farklı bir widget döndüren bir `switch` alır (`Yukleniyor` → dönen çark, `HataEkrani` → mesaj ve "Tekrar dene" düğmesi, `Liste` → `ListView`). Ders bilgi paketindeki **katmanlı mimari** ve **repository deseni** konularının ilk tohumu bu programdır.

---

# 11. Örnek Problem ve Farklı Çözüm Yolları

**Problem:** Kampüs uygulamasının ana sayfası üç kutu gösteriyor: **hava durumu** (sunucusu 1 saniyede cevap veriyor), **yemekhane menüsü** (2 saniye; ama bu sabah menü servisi **çalışmıyor**) ve **duyurular** (1 saniye). Ana sayfa mümkün olduğunca **hızlı** açılmalı ve bir servis çalışmasa bile **diğer kutular gösterilmeli**.

Üç çözümü karşılaştıracağız. Her dosya tek başına çalışsın diye servisler her çözümde yeniden tanımlanmıştır.

## Çözüm 1: Sıralı bekleme, tek bir try-catch

```dart
// Dosya: 11_01_cozum1_sirali.dart
Future<String> havaGetir() => Future.delayed(Duration(seconds: 1), () => 'Güneşli, 18 °C');

Future<String> menuGetir() async {
  await Future.delayed(Duration(seconds: 2));
  throw Exception('Menü servisi çalışmıyor');
}

Future<String> duyuruGetir() => Future.delayed(Duration(seconds: 1), () => '3 yeni duyuru');

Future<void> main() async {
  Stopwatch k = Stopwatch();
  k.start();
  try {
    String hava = await havaGetir();
    String menu = await menuGetir();
    String duyuru = await duyuruGetir();
    print('[Hava] $hava');
    print('[Menü] $menu');
    print('[Duyurular] $duyuru');
  } catch (e) {
    print('Ana sayfa yüklenemedi. Lütfen tekrar deneyin.');
  }
  print('Süre: ${(k.elapsedMilliseconds / 1000).round()} sn');
}
```

**Çıktı:**

```text
Ana sayfa yüklenemedi. Lütfen tekrar deneyin.
Süre: 3 sn
```

**Değerlendirme:** En kolay okunan çözüm; ama iki sorunu var. (1) **Yavaş:** Bağımsız işler sırayla bekleniyor; menü hata vermeseydi süre 1 + 2 + 1 = 4 saniye olacaktı. (2) **Kırılgan:** Menü hata verdiği anda `try` bloğunun geri kalanı atlandı; duyurular **hiç istenmedi**, hava durumu ise geldiği halde gösterilmedi.

## Çözüm 2: Future.wait ile paralel bekleme

```dart
// Dosya: 11_02_cozum2_paralel.dart
Future<String> havaGetir() => Future.delayed(Duration(seconds: 1), () => 'Güneşli, 18 °C');

Future<String> menuGetir() async {
  await Future.delayed(Duration(seconds: 2));
  throw Exception('Menü servisi çalışmıyor');
}

Future<String> duyuruGetir() => Future.delayed(Duration(seconds: 1), () => '3 yeni duyuru');

Future<void> main() async {
  Stopwatch k = Stopwatch();
  k.start();
  try {
    List<String> sonuclar = await Future.wait([havaGetir(), menuGetir(), duyuruGetir()]);
    print('[Hava] ${sonuclar[0]}');
    print('[Menü] ${sonuclar[1]}');
    print('[Duyurular] ${sonuclar[2]}');
  } catch (e) {
    print('Ana sayfa yüklenemedi. Lütfen tekrar deneyin.');
  }
  print('Süre: ${(k.elapsedMilliseconds / 1000).round()} sn');
}
```

**Çıktı:**

```text
Ana sayfa yüklenemedi. Lütfen tekrar deneyin.
Süre: 2 sn
```

**Değerlendirme:** **Hızlı:** Üç istek aynı anda başladı; süre en uzun isteğin süresi kadar (2 sn). Ama hâlâ **kırılgan:** Hava durumu ve duyurular başarıyla geldi; ama menü yüzünden `Future.wait` hatayla tamamlandı ve kullanıcı yine **hiçbir şey** göremedi (Bölüm 8.5).

## Çözüm 3: Paralel bekleme + her kutu kendi hatasını yönetir

Fikir şu: Her isteği, hatayı **içeride yakalayıp** bir `Sonuc`'a çeviren küçük bir "güvenlik kılıfına" sokalım. Kılıflı istekler **hiçbir zaman** hata fırlatmaz; dolayısıyla paralel beklemede biri diğerini düşüremez.

```dart
// Dosya: 11_03_cozum3_bagimsiz.dart
sealed class Sonuc<T> {}

class Basarili<T> extends Sonuc<T> {
  final T veri;

  Basarili(this.veri);
}

class Hatali<T> extends Sonuc<T> {
  final String mesaj;

  Hatali(this.mesaj);
}

Future<String> havaGetir() => Future.delayed(Duration(seconds: 1), () => 'Güneşli, 18 °C');

Future<String> menuGetir() async {
  await Future.delayed(Duration(seconds: 2));
  throw Exception('Menü servisi çalışmıyor');
}

Future<String> duyuruGetir() => Future.delayed(Duration(seconds: 1), () => '3 yeni duyuru');

Future<Sonuc<T>> guvenli<T>(Future<T> Function() islem) async {
  try {
    return Basarili(await islem());
  } on Exception catch (e) {
    return Hatali('$e');
  }
}

String kutu(String baslik, Sonuc<String> sonuc) => switch (sonuc) {
      Basarili(:final veri) => '[$baslik] $veri',
      Hatali() => '[$baslik] Şu an alınamıyor. (Tekrar dene)',
    };

Future<void> main() async {
  Stopwatch k = Stopwatch();
  k.start();
  var (hava, menu, duyuru) = await (guvenli(havaGetir), guvenli(menuGetir), guvenli(duyuruGetir)).wait;
  print(kutu('Hava', hava));
  print(kutu('Menü', menu));
  print(kutu('Duyurular', duyuru));
  print('Süre: ${(k.elapsedMilliseconds / 1000).round()} sn');
}
```

**Çıktı:**

```text
[Hava] Güneşli, 18 °C
[Menü] Şu an alınamıyor. (Tekrar dene)
[Duyurular] 3 yeni duyuru
Süre: 2 sn
```

**Değerlendirme:**
- `guvenli<T>`: Bölüm 5'teki generic fonksiyonların, Bölüm 8.7'deki "fonksiyonu parametre olarak gönderme" fikrinin ve `Sonuc<T>`'nin birleşimi. Her türlü isteği sarabilir.
- `return Basarili(await islem());`: `await` burada da kritik; olmasaydı hata `try` bloğunun dışında oluşur ve yakalanamazdı (Bölüm 8.7'deki uyarı).
- `(guvenli(havaGetir), ...).wait`: Üç kılıflı istek aynı anda başlar (Bölüm 8.4). Hiçbiri hata fırlatmadığı için `.wait` her zaman üç sonucu birden verir.
- `Hatali()`: Alanlarına ihtiyaç duymadığımız bir nesne deseni: "Sonuç Hatali türündeyse."
- Gerçek uygulamada `Hatali`'nin içindeki teknik mesaj (`Exception: Menü servisi çalışmıyor`) kullanıcıya gösterilmez; hata raporlama servisine gönderilir.

## Karşılaştırma

| | Çözüm 1: Sıralı | Çözüm 2: Future.wait | Çözüm 3: Bağımsız kutular |
|---|---|---|---|
| **Süre** (hepsi başarılıyken) | 4 sn (toplam) | 2 sn (en uzunu) | 2 sn (en uzunu) |
| **Menü çalışmazsa** | Hiçbir şey görünmez | Hiçbir şey görünmez | Hava ve duyurular görünür, menü kutusunda uyarı |
| **Kod** | En kısa, en kolay okunan | Kısa | Biraz daha uzun (`Sonuc`, `guvenli`) |
| **Ne zaman uygun?** | İşler birbirine **bağımlıysa** (Bölüm 7.7) | İşler bağımsız ve **hepsi birden gerekliyse** (ör. ödeme özeti: tutar + adres + kart) | İşler bağımsız ve her biri **tek başına anlamlıysa** (ana sayfa kutuları, panolar) |

Doğru çözüm problemin kendisine bağlıdır: Ödeme ekranında kartı alınamayan bir siparişin özetini göstermek anlamsızdır (Çözüm 2), ana sayfada ise bir kutunun çalışmaması diğerlerini gizlememelidir (Çözüm 3).

---

# 12. Yapay Zekâ ile Eş Programlama

## 12.1 Neler değişiyor?

| | Hafta 1–5 | Hafta 6 ve sonrası |
|---|---|---|
| AI kavram açıklayabilir mi? | Evet | Evet |
| AI kod yazabilir mi? | **Hayır** | **Evet** |
| Kodun sorumluluğu kimde? | Sizde | **Yine sizde** |
| Belgeleme | — | `AI_LOG.md` zorunlu |
| Ara sınav, final, sözlü savunma | AI kapalı | AI kapalı |

Bir benzetme: Modern yolcu uçaklarında **otomatik pilot** uçuşun büyük kısmını yönetebilir. Ama kokpitte otomatik pilotun ne yaptığını her an anlayan ve gerektiğinde kontrolü devralabilen eğitimli bir **pilot** olmadan hiçbir uçak kalkmaz. Bu derste AI sizin otomatik pilotunuzdur; **pilot sizsiniz.** İlk beş haftayı AI'sız geçirmemizin nedeni de buydu: Uçmayı bilmeyen biri otomatik pilotu denetleyemez.

## 12.2 Çalışma döngüsü: Oku → Anla → Planla → Değiştir → Test et

AI ile her çalışmanızda bu beş adımı izleyin:

1. **Oku.** Değişiklik yapacağınız kodu baştan sona okuyun. AI'a da önce **okutun**: "Bu dosyayı oku ve ne yaptığını özetle. Henüz hiçbir şeyi değiştirme." AI'ın özeti sizin anladığınızla uyuşuyor mu?
2. **Anla.** Her satırın ne yaptığını **kendi cümlelerinizle** açıklayabiliyor musunuz? Anlamadığınız her satırı sorun: "Bu satırdaki `await` neden gerekli? Kaldırsam ne olur?" **Anlamadığınız kodu kabul etmeyin.**
3. **Planla.** Kod yazdırmadan önce bir **plan** isteyin (Claude Code'da plan modu). Planı okuyun: Hangi dosyalar değişecek? Hata durumları (internet yok, boş liste, yanlış girdi) ele alınmış mı? Plan sizi ikna etmiyorsa kod aşamasına geçmeyin.
4. **Değiştir.** **Küçük adımlarla** ilerleyin: Bir seferde tek bir özellik. Her adımdan sonra Problems panelinin boş olduğunu görün ve çalışan hali Git ile kaydedin (commit). Bir şey bozulursa son çalışan hale dönebilirsiniz.
5. **Test et.** Kodu çalıştırın ve yalnızca "her şeyin yolunda gittiği" durumu değil, **hata durumlarını** da deneyin: Sahte sunucuya hata senaryosu verin, boş liste gönderin, sayı yerine harf yazın. Çıktıyı beklenen çıktıyla karşılaştırın.

## 12.3 İyi bir istem (prompt) yazmak

AI'ın vereceği cevabın kalitesi, ona ne kadar **bağlam** ve **kısıt** verdiğinize bağlıdır.

**Zayıf istem:**

```text
hava durumu kodu yaz
```

Bu istemle AI; Flutter mı konsol mu, hangi paket, hata durumlarında ne olacağı, hangi Dart sürümü... gibi her şeyi **tahmin etmek** zorunda kalır. Sonuç büyük olasılıkla sizin projenize uymaz.

**Güçlü istem:**

```text
Dart 3 ile konsolda çalışan bir program yazıyorum (Flutter yok, harici paket yok).
Amaç: Sahte bir hava durumu servisinden (Future.delayed ile 1 saniye gecikmeli)
şehir adına göre sıcaklık almak.

Kurallar:
- Servis, bilinmeyen şehirlerde SehirBulunamadi adlı kendi istisna sınıfımızı fırlatsın.
- İstek 2 saniyede bitmezse TimeoutException yakalansın ve kullanıcıya mesaj gösterilsin.
- async/await kullan, then kullanma. Boş catch bloğu yazma.
- Değişken tiplerini açıkça yaz (var kullanma). Değişken adları Türkçe olsun ama
  yalnızca İngilizce harflerle yazılsın (ş, ğ, ı gibi harfler olmasın).

Önce planını madde madde yaz; ben onaylayınca kodu yaz.
Kodu yazdıktan sonra her try-catch bloğunun hangi durumu ele aldığını açıkla.
```

İyi bir istemin parçaları: **bağlam** (ne yazıyorsunuz, hangi ortam), **amaç**, **kısıtlar** (bu derste öğrendiğiniz kurallar), **çalışma biçimi** (önce plan) ve **açıklama isteği** (öğrenmeniz için).

> 💡 **Proje kuralları dosyası:** Aynı kuralları her istemde tekrar yazmak yerine, AI araçlarının her oturumda okuduğu bir kurallar dosyası oluşturabilirsiniz (Claude Code için proje klasöründeki `CLAUDE.md`, diğer bazı araçlar için `AGENTS.md`). Örneğin: "Boş catch yazma. Asenkron fonksiyonlarda `Future<void>` kullan. Override edilen metotlarda `@override` kullan." Proje haftalarında takımınız için bir kurallar dosyası yazacaksınız. Ayrıca Dart ekibinin **Dart and Flutter MCP sunucusu** (`dart mcp-server`), AI araçlarının Dart analizörünü çalıştırmasını, hataları görmesini ve testleri koşturmasını sağlar; bu sayede AI yazdığı kodun derlenip derlenmediğini kendisi kontrol edebilir.

## 12.4 AI_LOG.md şablonu

AI kullandığınız her ödev ve proje klasöründe bir `AI_LOG.md` dosyası tutun. Her önemli AI kullanımı bir kayıttır:

```markdown
# AI_LOG.md — BMH309 · Ad Soyad · Öğrenci No

## Kayıt 1
- **Tarih:** 2026-11-28
- **Araç:** (ör. Claude Code)
- **Görev:** Ödev 5, Soru 4 — kargo özetinde iki isteği paralel göndermek
- **İstemim:** "durumGetir ve tahminiTeslimGetir isteklerini aynı anda nasıl
  gönderebilirim? Kodu yazma, önce iki yöntemi karşılaştır."
- **AI'ın önerisi (özet):** Future.wait veya record ile .wait kullanmayı önerdi.
- **Kabul ettiklerim:** Future.wait kullandım; çünkü iki sonuç da String.
- **Değiştirdiklerim / reddettiklerim ve nedeni:** AI tahmini teslim için
  catch (e) {} yazdı. Boş catch hatayı gizlediği için reddettim; onTimeout ile
  'bilinmiyor' döndürdüm.
- **Nasıl doğruladım:** Verilen main ile çalıştırdım, çıktıyı beklenen çıktıyla
  karşılaştırdım. TR999 için hata senaryosunu ayrıca denedim.
- **Öğrendiğim:** Future.wait, işlerden biri hata verirse diğerleri bitince
  ilk hatayı fırlatıyor.
```

Kayıtlar uzun olmak zorunda değildir; ama **dürüst** olmalıdır. "AI'ın önerisini olduğu gibi kullandım" da geçerli bir kayıttır; yeter ki kodu açıklayabilin. Sözlü savunmada `AI_LOG.md` dosyanızdaki kayıtlardan sorular sorulabilir.

## 12.5 AI'ın kodunu denetleme listesi

AI'ın bu haftanın konularında en sık yaptığı hatalar ve onları nerede öğrendiğimiz:

| Kontrol edin | Neden tehlikeli? | Bölüm |
|---|---|---|
| Boş veya yalnızca `print` yapan `catch` blokları | Hata **yutulur**, kimse fark etmez | 3.9 |
| Her şeyi yakalayan `catch (e)` | Programcı hataları (`RangeError`...) gizlenir | 3.3, 2.5 |
| `await` unutulmuş Future'lar | "Kaydedildi" yalanları, yakalanmayan hatalar | 7.9, 8.2 |
| `void ... async` fonksiyonlar | Beklenemez, hataları yakalanamaz | 7.9 |
| `try` içinde `return islem();` (`await` olmadan) | Hata `try`'ın dışında oluşur | 8.7 |
| Bağımsız işlerin sırayla beklenmesi | Ekran gereksiz yere yavaş açılır | 8.3 |
| `dynamic`, `as`, `!` bolluğu | Çalışma zamanı çökmeleri | 2.4 |
| `throw 'metin'` | Türüyle yakalanamaz | 4.7 |
| Zaman aşımı olmayan ağ istekleri | Sonsuza kadar dönen yükleniyor çarkları | 8.6 |
| Var olmayan metot, sınıf veya paket | AI bazen **uydurur** (buna "halüsinasyon" denir) | — |
| Açıklayamadığınız karmaşıklık | Sözlü savunmada açıklayamazsınız | — |

## 12.6 Alıştırma: AI'ın yazdığı bu kodu denetleyin

Bir öğrenci AI'a şunu yazmış: *"Kampüs uygulaması için duyuruları getiren ve okunmamış olanları ekrana yazan bir fonksiyon yaz."* Gelen kod derleniyor ve çalışıyor:

```dart
// Dosya: 12_01_ai_kodu_hatali.dart
// ❌ MANTIK HATALARI: Yapay zekânın yazdığı kodu denetleyin.
Future<List<dynamic>> duyurulariGetir() async {
  await Future.delayed(Duration(milliseconds: 500));
  return [
    {'baslik': 'Vize sonuçları açıklandı', 'okundu': false},
    {'baslik': 'Kütüphane hafta sonu açık', 'okundu': true},
  ];
}

void okunmamislariYazdir() async {
  try {
    var duyurular = duyurulariGetir();
    print('Duyurular yüklendi.');
    for (var d in await duyurular) {
      if (d['okundu'] == false) {
        print('Okunmamış: ' + d['baslik']);
      }
    }
  } catch (e) {}
}

void main() {
  okunmamislariYazdir();
  print('Ana sayfa hazır.');
}
```

**Çıktı:**

```text
Duyurular yüklendi.
Ana sayfa hazır.
Okunmamış: Vize sonuçları açıklandı
```

Okumaya devam etmeden önce kodda **en az beş sorun** bulmaya çalışın.

**Cevap:**
1. **`void okunmamislariYazdir() async`:** `void` asenkron fonksiyon; çağıran kod onu bekleyemez ve hatalarını yakalayamaz (Bölüm 7.9, Tuzak 4). `Future<void>` olmalı.
2. **Boş `catch (e) {}`:** Sunucu farklı biçimde veri gönderirse (örneğin `baslik` alanı eksikse) hata sessizce yutulur ve ekran boş kalır; kimse nedenini bilmez (Bölüm 3.9).
3. **"Duyurular yüklendi." yalanı:** `var duyurular = duyurulariGetir();` satırında `await` yok; mesaj, veri gelmeden **önce** yazılıyor. `var` kullanıldığı için `duyurular`'ın aslında bir Future olduğu da gözden kaçıyor (Bölüm 7.9, Tuzak 1).
4. **`List<dynamic>` ve `d['okundu']`:** Tip güvenliği yok. Anahtar adı yanlış yazılsa (`'okunda'`) derleyici uyarmaz, koşul hiçbir zaman sağlanmaz. Veri bir model sınıfına (`Duyuru`) çevrilmeli.
5. **`main` beklemiyor:** "Ana sayfa hazır." duyurulardan önce yazılıyor; `main` asenkron işin bitmesini beklemiyor.
6. **Zaman aşımı yok:** Sunucu cevap vermezse kullanıcı sonsuza kadar bekler (Bölüm 8.6).
7. **`'Okunmamış: ' + d['baslik']`:** Metin birleştirme yerine `'Okunmamış: ${d.baslik}'` yazımı tercih edilir (Flutter projelerinde VS Code bunu da işaretler).

Düzeltilmiş hali:

```dart
// Dosya: 12_02_ai_kodu_duzeltilmis.dart
import 'dart:async';

class Duyuru {
  final String baslik;
  final bool okundu;

  Duyuru(this.baslik, this.okundu);

  Duyuru.fromMap(Map<String, Object> veri)
      : baslik = veri['baslik'] as String,
        okundu = veri['okundu'] as bool;
}

Future<List<Duyuru>> duyurulariGetir() async {
  await Future.delayed(Duration(milliseconds: 500));
  List<Map<String, Object>> ham = [
    {'baslik': 'Vize sonuçları açıklandı', 'okundu': false},
    {'baslik': 'Kütüphane hafta sonu açık', 'okundu': true},
  ];
  return ham.map((m) => Duyuru.fromMap(m)).toList();
}

Future<void> okunmamislariYazdir() async {
  try {
    List<Duyuru> duyurular = await duyurulariGetir().timeout(Duration(seconds: 5));
    print('Duyurular yüklendi.');
    for (Duyuru d in duyurular.where((d) => !d.okundu)) {
      print('Okunmamış: ${d.baslik}');
    }
  } on TimeoutException {
    print('Duyurular şu an yüklenemiyor, lütfen tekrar deneyin.');
  }
}

Future<void> main() async {
  await okunmamislariYazdir();
  print('Ana sayfa hazır.');
}
```

**Çıktı:**

```text
Duyurular yüklendi.
Okunmamış: Vize sonuçları açıklandı
Ana sayfa hazır.
```

**Açıklama:** Artık mesajlar doğru sırada ve doğru zamanda yazılıyor. Veri bir model sınıfına çevrildiği için `d.okundu` yazımında yapılacak bir yazım hatası derleme hatası verir. `fromMap` içindeki `as String` ve `as bool` dönüşümleri, sunucudan beklenmedik bir veri gelirse hatanın **sınırda**, yani verinin uygulamaya girdiği yerde ortaya çıkmasını sağlar. Sunucudan gelen JSON verisini güvenli biçimde modele çevirmeyi ilerleyen haftalarda ayrıntılı göreceğiz.

> 💡 **Ders çıkarımı:** AI'ın ilk kodu **çalışıyordu.** Çıktısı bile neredeyse doğruydu. Sorunlar ancak **hata durumları** ve **zamanlama** düşünüldüğünde ortaya çıktı. "Çalışıyor" ile "doğru" aynı şey değildir.

## 12.7 Güvenlik ve dürüstlük

- AI'a **şifre, API anahtarı, kişisel veri** (T.C. kimlik numarası, telefon numarası, öğrenci listeleri) yapıştırmayın. AI'a gönderdiğiniz her şey sizin bilgisayarınızdan çıkar.
- Başkasına ait kodu (bir arkadaşınızın ödevi gibi) AI'a verip "bunu benimkine uyarla" demeyin.
- AI'ın yazdığı kodun lisansını ve kaynağını sorgulayın; uzun ve "tanıdık görünen" kod parçaları başka bir projeden gelmiş olabilir.
- AI'ın sizin yerinize karar verdiği her yer, öğrenmediğiniz bir yerdir. Sınavda ve sözlü savunmada AI yanınızda olmayacak.

---

# 13. Özet

| Konu | Sözdizimi | Not |
|---|---|---|
| Hata türleri | Derleme · Çalışma zamanı · Mantık | Bu hafta: çalışma zamanı hataları |
| Yığın izi | `#0 ... #1 main (dosya.dart:9:5)` | Kendi dosyanızı gördüğünüz ilk satıra bakın |
| Exception / Error | `FormatException`, `TimeoutException` / `RangeError`, `StateError`, `TypeError` | Exception'ları yakalayın, Error'ları düzeltin |
| try-catch | `try { ... } catch (e) { ... }` | Hata olunca `try`'ın kalanı atlanır |
| on | `on FormatException catch (e)` | Özelden genele sıralayın |
| Yığın izi yakalamak | `catch (e, s)` | Hata raporlama servislerine gönderilir |
| finally | `finally { yukleniyor = false; }` | Her durumda çalışır (return ve yakalanmayan hata dahil) |
| rethrow | `catch (e) { kaydet(e); rethrow; }` | Orijinal yığın izini korur |
| tryParse | `int.tryParse(metin)` → `int?` | "Önce bak, sonra atla" |
| throw | `throw YetersizBakiyeException(100, 140);` | Fonksiyonu hemen bitirir |
| Kendi istisnanız | `class XException implements Exception { ... }` | `extends Exception` olmaz; veri taşır |
| Hata ailesi | `sealed class AgHatasi implements Exception {}` | `on AgHatasi` + eksiksiz `switch` |
| assert | `assert(kosul, 'mesaj')` | Yalnızca geliştirmede; kullanıcı girdisi için değil |
| Generic sınıf | `class Onbellek<T> { T? getir(...) }` | Bir kez yaz, her tiple kullan |
| Generic fonksiyon | `T ilk<T>(List<T> l)` | Tip çoğunlukla çıkarılır |
| Tip sınırı | `<T extends num>`, `<T extends Urun>` | T'nin üyelerini kullanabilmek için |
| Sonuç tipi | `sealed class Sonuc<T>` → `Basarili<T>`, `Hatali<T>` | Hata ihtimali imzada görünür |
| Record | `(int, int)`, `({double enlem, double boylam})` | `$1`, `.enlem`; değere göre eşitlik |
| Parçalama | `var (a, b) = ...;` · `var (:ad) = ...;` | Döngüde, atamada, `switch`'te |
| Nesne deseni | `Basarili(:final veri)` | Alanı doğrudan değişkene açar |
| Future | `Future<String>` | İleride gelecek tek değer |
| async / await | `Future<int> f() async { ... await g(); }` | `await` yalnızca kendi fonksiyonunu bekletir |
| Çalışma sırası | İlk `await`'e kadar hemen çalışır | A, B, C, D örneği |
| Paralel | `Future.wait([...])` · `(f1(), f2()).wait` | Bağımsız işler için |
| Zaman aşımı | `.timeout(süre)` · `onTimeout:` | `TimeoutException` (`dart:async`) |
| Stream | `Stream<int> f() async* { yield 1; }` | Zamanla gelen çok değer |
| Dinlemek | `await for (x in akis)` · `akis.listen(...)` | `listen` beklemez |
| Abonelik | `StreamSubscription` · `cancel()` | Ekran kapanınca iptal |
| StreamController | `StreamController<T>.broadcast()` · `add` · `close` | Akışı elle beslemek |
| AI ile çalışmak | Oku → Anla → Planla → Değiştir → Test et | `AI_LOG.md` tutun |

---

# 14. Kendinizi Test Edin

Sorulardaki kod parçaları tam program değildir; denemek için sınıfları ve fonksiyonları dosyanın üst düzeyine, kodu `main` içine yazın. Asenkron kodlar için `main`'i `Future<void> main() async` yapın.

**1.** Aşağıdakilerin her biri hangi tür hatadır (derleme, çalışma zamanı, mantık)? (a) `String ad = 42;` (b) Boş bir listede `reduce` çağırmak. (c) Bir indirim hesabında `fiyat * 0.2` yerine `fiyat * 0.02` yazmak.

**Cevap:** (a) Derleme hatası; program hiç çalışmaz. (b) Çalışma zamanı hatası (`StateError: No element`). (c) Mantık hatası; program çalışır ama yanlış sonuç verir.

**2.** Çıktı nedir?
```dart
void f(String s) {
  try {
    print('A');
    int.parse(s);
    print('B');
  } on FormatException {
    print('C');
  } finally {
    print('D');
  }
}
// main içinde:
f('5');
f('x');
```

**Cevap:** `A`, `B`, `D`, `A`, `C`, `D`. İlk çağrıda hata olmaz; `catch` atlanır, `finally` çalışır. İkinci çağrıda `int.parse` hata verir; `B` atlanır, `C` ve `finally` çalışır.

**3.** Aşağıdaki hatalardan hangileri `try-catch` ile yakalanıp kullanıcıya bir mesaj gösterilmeli, hangileri kod düzeltilerek önlenmeli? `TimeoutException`, `RangeError`, kullanıcı girdisinden gelen `FormatException`, `Null check operator used on a null value`.

**Cevap:** `TimeoutException` ve kullanıcı girdisinden gelen `FormatException` dış dünyadan gelen, öngörülebilir durumlardır (Exception); yakalanıp kullanıcıya açıklanır. `RangeError` ve null kontrol hatası (`TypeError`) programcı hatalarıdır (Error); kod düzeltilmelidir.

**4.** Bir `try` bloğunun altına önce `on Exception`, sonra `on FormatException` yazılırsa ne olur?

**Cevap:** `FormatException` bir `Exception` olduğu için her zaman ilk blok tarafından yakalanır; ikinci blok asla çalışmaz ve VS Code "dead code" uyarısı verir. Özel türler yukarıya, genel olanlar aşağıya yazılmalıdır.

**5.** `rethrow` ile `throw e` arasındaki fark nedir?

**Cevap:** İkisi de hatayı yukarı iletir; ama `rethrow` hatanın **orijinal yığın izini** korur. `throw e` ise yığın izini `catch` bloğunun bulunduğu yerden yeniden başlatır ve hatanın gerçekte nerede oluştuğu bilgisi kaybolur.

**6.** Bir alışveriş uygulaması için, istenen adet ve stoktaki adedi taşıyan, `print` edildiğinde `StokYetersizException: 3 istendi, 1 var` yazan bir istisna sınıfı yazın.

**Cevap:**
```dart
class StokYetersizException implements Exception {
  final int istenen;
  final int stok;

  StokYetersizException(this.istenen, this.stok);

  @override
  String toString() => 'StokYetersizException: $istenen istendi, $stok var';
}
```

**7.** `T enPahali<T extends Urun>(List<T> urunler)` yerine `Urun enPahali(List<Urun> urunler)` yazsaydık ne kaybederdik?

**Cevap:** Dönüş tipi her zaman `Urun` olurdu. Bir telefon listesi verdiğimizde bile sonuç `Urun` tipinde döner ve `depolamaGb` gibi telefona özgü alanlara dönüşüm yapmadan erişemezdik. Generic sürüm, giren tipi (`Telefon`) çıkışa taşır.

**8.** Çıktı nedir?
```dart
var (a, b) = (3, 'x');
print('$b$a');
(int, {String ad}) k = (7, ad: 'Ali');
print('${k.$1} ${k.ad}');
print((1, 2) == (1, 2));
```

**Cevap:** `x3`, `7 Ali`, `true`. Konumsal alanlar `$1`'den başlar; record'lar değerlerine göre karşılaştırılır.

**9.** Çıktı hangi sırayla gelir?
```dart
Future<void> yukle() async {
  print('2');
  await Future.delayed(Duration.zero);
  print('4');
}

void main() {
  print('1');
  yukle();
  print('3');
}
```

**Cevap:** `1`, `2`, `3`, `4`. `yukle` ilk `await`'e kadar hemen çalışır (`2`); `await`'te durur ve kontrol `main`'e döner (`3`). Bekleme süresi sıfır olsa bile `4`, `main` bittikten sonra yazılır.

**10.** Çıktı hangi sırayla gelir?
```dart
Future<int> f() async {
  print('B');
  await Future.delayed(Duration(milliseconds: 100));
  print('C');
  return 7;
}

Future<void> main() async {
  print('A');
  Future<int> x = f();
  print('D');
  print('E ${await x}');
}
```

**Cevap:** `A`, `B`, `D`, `C`, `E 7`. `f()` çağrıldığında `B` hemen yazılır ve bir Future döner; `main` beklemeden `D`'yi yazar. `await x` satırında `main` durur; `f` devam eder (`C`) ve 7 döndürür; ardından `E 7` yazılır.

**11.** `void kaydet() async { ... }` yazımının iki sakıncası nedir?

**Cevap:** (1) Fonksiyon Future döndürmediği için çağıran kod işin ne zaman bittiğini bilemez ve `await kaydet()` yazamaz (derleme hatası). (2) İçinde oluşan hatalar hiçbir `try-catch` tarafından yakalanamaz. Doğrusu `Future<void> kaydet() async`.

**12.** Süreleri 1, 2 ve 3 saniye olan birbirinden bağımsız üç istek önce sırayla `await` ile, sonra `Future.wait` ile bekleniyor. Toplam süreler yaklaşık nedir? İkinci istek birincinin sonucuna ihtiyaç duysaydı ne değişirdi?

**Cevap:** Sıralı: 1 + 2 + 3 = 6 saniye. `Future.wait`: en uzunu kadar, 3 saniye. İkinci istek birincinin sonucuna bağlı olsaydı bu ikisi paralel gönderilemezdi; en az 1 + 2 = 3 saniye sırayla beklenmesi gerekirdi.

**13.** Bir Flutter ekranında `Text('Sepette ${sepetAdediGetir()} ürün')` yazılmış ve ekranda "Sepette Instance of 'Future<int>' ürün" görünüyor. Sorun nedir?

**Cevap:** `sepetAdediGetir()` bir `Future<int>` döndürür ve beklenmeden metnin içine konmuştur; ekrana sayının kendisi değil, Future nesnesi yazılır. Sonuç `await` ile beklenmeli veya ekranda bir `FutureBuilder` ile gösterilmelidir.

**14.** Aşağıdakilerin her biri için `Future` mı yoksa `Stream` mi kullanılır? (a) Giriş yapmak (b) Sohbet mesajları (c) GPS konumu (d) Bir dosyanın indirilme yüzdesi (e) Profil fotoğrafını bir kez yüklemek

**Cevap:** (a) Future (b) Stream (c) Stream (d) Stream (e) Future. Tek bir sonuç beklenen işler Future, zaman içinde birden çok değer üreten kaynaklar Stream'dir.

**15.** Çıktı nedir?
```dart
Stream<int> s() async* {
  for (int i = 1; i <= 5; i++) {
    yield i * i;
  }
}
// async main içinde:
await for (int x in s().where((x) => x.isOdd).take(2)) {
  print(x);
}
```

**Cevap:** `1` ve `9`. Akış 1, 4, 9, 16, 25 üretir; `where` tek olanları (1, 9, 25) geçirir; `take(2)` ilk ikisini alıp akışı kapatır.

**16.** Bölüm 8.7'deki `tekrarDene` fonksiyonunda `return await islem();` yerine `return islem();` yazılsaydı ne olurdu?

**Cevap:** Future beklenmeden `try` bloğundan çıkardı. Hata, `try` bloğu bittikten sonra oluşacağı için `on BaglantiHatasi` onu yakalayamaz, yeniden deneme hiç yapılmaz ve hata doğrudan `main`'e ulaşırdı.

---

# 15. Ödev 5

> **AI kuralı:** Bu ödevde AI'ı **eş programcı** olarak kullanabilirsiniz (Bölüm 12). Ancak: (1) Teslim ettiğiniz her satırı açıklayabilmelisiniz. (2) Ödev klasörünüzde bir **`AI_LOG.md`** dosyası olmalıdır; AI kullanmadıysanız dosyaya "Bu ödevde AI kullanmadım." yazın. Ödev çözümleri **7. haftanın ilk 15 dakikasında** sınıfta birlikte yapılacaktır. Derste rastgele seçilen öğrencilerden çözümlerini ve `AI_LOG.md` kayıtlarını açıklamaları istenebilir.

**Teslim:**
- Her soru ayrı bir dosya: `odev5_s1.dart`, `odev5_s2.dart`, ... ve bir `AI_LOG.md` dosyası.
- Her soruda verilen `main` fonksiyonunu ve "olduğu gibi kullanın" denen kodları **aynen** kullanın; diğer her şeyi siz yazın. Çıktınız beklenen çıktıyla birebir aynı olmalıdır.
- Teslimden önce `Shift + Alt + F` ile biçimlendirin; **Problems** panelinde hata ve uyarı kalmasın. Boş `catch` bloğu kullanmayın. Asenkron fonksiyonlarda `void` değil `Future<void>` kullanın.
- Teslim tarihi ve yöntemi Classroom'daki ödev sayfasındadır.

---

### Soru 1 — Not Giriş Sistemi *(istisnalar, finally, record)*

Bir öğretim üyesinin not giriş ekranına yazılan metinler kontrol edilecek.

- **`GecersizNotException implements Exception`**: `final String girilen` ve `final String neden` alanları; `toString()` → `GecersizNotException: "girilen" (neden)`
- **`int notOku(String girilen)`**: Metni temizler (`trim`). Boşsa `'boş'`, sayıya çevrilemiyorsa `'sayı değil'`, 0–100 aralığında değilse `'aralık dışı'` nedeniyle `GecersizNotException` fırlatır. `girilen` alanına temizlenmiş metin yazılır.
- **`String harfNotu(int n)`**: Hafta 2'deki tablo: 90+ AA, 85+ BA, 80+ BB, 75+ CB, 70+ CC, 60+ DC, 50+ DD, diğerleri FF. `switch` ifadesiyle yazın.
- **`({List<int> gecerli, List<String> hatalar}) notlariIsle(List<String> girdiler)`**: Her girdiyi `notOku` ile okur. Geçerli notları `gecerli` listesine, hataların `toString()` metinlerini `hatalar` listesine ekler. Yalnızca `on GecersizNotException catch (e)` kullanın. Her girdi işlendikten sonra (başarılı veya hatalı) üst düzeydeki `int islenenSayisi` sayacını **`finally`** içinde bir artırın.

```dart
// ŞABLON: Tanımlarınızı bu main'in üstüne yazın.
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

**Beklenen ekran çıktısı:**

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

---

### Soru 2 — Son Görüntülenenler ve Puanlar *(generic sınıf, generic fonksiyon, tip sınırı)*

- **`class SonGoruntulenenler<T>`**: Bir alışveriş uygulamasının "Son görüntülediğiniz ürünler" şeridi. `final int kapasite` (kurucudan), private bir `List<T>` alanı. `void ekle(T oge)`: Öğe listede zaten varsa önce oradan çıkarır; öğeyi listenin **başına** ekler; liste kapasiteyi aşarsa **en eski** (son) öğeyi siler. `List<T> get liste`: Listenin bir **kopyasını** döndürür.
- **`abstract class Puanlanabilir`**: soyut getter'lar `String get ad` ve `double get puan`.
- **`Film implements Puanlanabilir`** (`ad`, `puan`, `int yil`) ve **`Restoran implements Puanlanabilir`** (`ad`, `puan`, `String semt`).
- **`T enIyi<T extends Puanlanabilir>(List<T> liste)`**: Puanı en yüksek öğeyi döndürür. Liste boşsa `ArgumentError('Liste boş olamaz')` fırlatır.
- **`Map<K, List<T>> grupla<T, K>(List<T> ogeler, K Function(T) anahtarBul)`**: Öğeleri, `anahtarBul` fonksiyonunun verdiği anahtara göre gruplar (Hafta 5, Bölüm 10.3'teki gruplama kalıbının generic hali).

```dart
// ŞABLON: Tanımlarınızı bu main'in üstüne yazın.
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
}
```

**Beklenen ekran çıktısı:**

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

**Ek görev:** `main`'in sonuna `urunler.ekle(5);` satırını ekleyin. Aldığınız hata mesajını bu satırın üstüne yorum olarak yazın, ardından satırı yorum haline getirin. Hatanın nedenini bir cümleyle açıklayın.

---

### Soru 3 — Kampüs Kart Yükleme *(Sonuc&lt;T&gt;, record, desenler)*

- **`sealed class Sonuc<T>`**, **`Basarili<T>`** (`veri`) ve **`Hatali<T>`** (`mesaj`): Bölüm 5.7'deki gibi.
- **`Sonuc<String> kartNoDogrula(String girilen)`**: Boşluklar silindikten sonra tam olarak **8 rakamdan** oluşuyorsa `Basarili` (temizlenmiş numara); değilse `Hatali('Kart numarası 8 haneli olmalı.')`.
- **`Sonuc<double> tutarDogrula(String girilen)`**: Virgül noktaya çevrilir (`'7,5'` → `7.5`). Sayıya çevrilemiyorsa `'Tutar bir sayı olmalı.'`; 10'dan küçükse `'En az 10 TL yüklenebilir.'`; 1000'den büyükse `'En fazla 1000 TL yüklenebilir.'` mesajlı `Hatali`; aksi halde `Basarili`.
- **`Sonuc<(String, double)> yuklemeHazirla(String kartNo, String tutar)`**: İki doğrulamanın sonuçlarını **bir record'da birleştirip** tek bir `switch` ifadesiyle değerlendirin. Önce kart numarası hatası, sonra tutar hatası raporlanır; ikisi de başarılıysa `Basarili((kart, tutar))` döner.
- **`String makbuz(Sonuc<(String, double)> sonuc)`**: Başarılıysa kart numarasının ilk 2 ve son 2 hanesi görünecek şekilde (`12****78`) makbuz metni, değilse `İşlem reddedildi: mesaj`. `_` kolu olmayan bir `switch` ifadesiyle yazın.

```dart
// ŞABLON: Tanımlarınızı bu main'in üstüne yazın.
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

**Beklenen ekran çıktısı:**

```text
Kart 12****78: 50.00 TL yüklendi.
İşlem reddedildi: En az 10 TL yüklenebilir.
İşlem reddedildi: Kart numarası 8 haneli olmalı.
Kart 87****21: 250.75 TL yüklendi.
İşlem reddedildi: Tutar bir sayı olmalı.
İşlem reddedildi: En fazla 1000 TL yüklenebilir.
Toplam yüklenen: 300.75 TL
```

**İpucu:** `switch ((kartNoDogrula(kartNo), tutarDogrula(tutar)))` yazdığınızda kollarınız `(Hatali(:final mesaj), _)` gibi record desenleri olabilir (Bölüm 6.5). Makbuzda record'u parçalamak için `Basarili(veri: (final kart, final miktar))` deseni kullanılabilir.

---

### Soru 4 — Kargo Takip *(Future, paralel bekleme, timeout, yeniden deneme, async\*)*

Aşağıdaki sahte servisi **olduğu gibi** kullanın:

```dart
// ŞABLON: Bu sınıfları olduğu gibi kullanın, değiştirmeyin.
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
```

Aşağıdaki fonksiyonları yazın:

- **`Future<String> kargoOzeti(SahteKargoServisi servis, String takipNo)`**: Durum ve tahmini teslim bilgisini **aynı anda** (paralel) ister. Tahmini teslim 1 saniyede gelmezse yerine `'bilinmiyor'` kullanılır. Sonuç: `'TR100: Dağıtımda (tahmini teslim: Yarın akşam)'`. Kargo bulunamazsa `'TR999: Böyle bir kargo bulunamadı.'` döndürür.
- **`Future<T> tekrarDene<T>(Future<T> Function() islem, {int enFazla = 3})`**: Bölüm 8.7'deki gibi; her başarısız denemede `Konum denemesi N başarısız.` yazar. `on Exception` kullanın.
- **`Stream<String> takipAkisi(SahteKargoServisi servis, List<String> numaralar)`**: Numaraları **sırayla** sorgular ve her özeti akışa gönderir (`async*`).

```dart
// ŞABLON: Fonksiyonlarınızı bu main'in üstüne yazın.
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

**Beklenen ekran çıktısı:**

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

**İpucu:** İki istek de `String` döndürdüğü için `Future.wait` kullanılabilir. `Future.wait`, işlerden biri hata verirse o hatayı aynen fırlatır; bu yüzden `on KargoBulunamadi` ile yakalanabilir.

---

### Soru 5 — Akıllı Su Şişesi *(Stream, async\*, await for, hata yönetimi)*

Bir akıllı su şişesi, her yudumda içilen miktarı (ml) telefona gönderiyor. Aşağıdaki sensör kodunu **olduğu gibi** kullanın:

```dart
// ŞABLON: Bu kodu olduğu gibi kullanın, değiştirmeyin.
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
```

Aşağıdaki fonksiyonları yazın:

- **`Stream<int> gecerliYudumlar(Stream<int> kaynak)`**: Yalnızca 1–500 ml arasındaki ölçümleri geçirir (0: şişe kaldırıldı ama içilmedi; negatif ve 500 üstü: hatalı ölçüm). `where` ile yazın.
- **`Stream<int> toplamlar(Stream<int> yudumlar)`**: Her yudumda o ana kadarki **toplamı** gönderir. `async*`, `await for` ve `yield` ile yazın.
- **`String cubuk(int toplam, int hedef)`**: Yüzde = `toplam * 100 ~/ hedef`. Her %10 için bir `#`, en fazla 10 kutu: `[####------] %46`.
- **`Future<int> gunlukTakip(Stream<int> sensor, int hedef)`**: Geçerli yudumların toplamlarını `await for` ile dinler; her toplam için `'${toplam.toString().padLeft(5)} ml ${cubuk(toplam, hedef)}'` satırını yazar. Toplam hedefe ulaşınca `Günlük hedefe ulaşıldı!` yazıp toplamı **hemen** döndürür. Akış hedefe ulaşmadan biterse `Gün bitti, hedefe ulaşılamadı.` yazar. Sensör hatası olursa `Uyarı: ` ve hatayı yazar. Son iki durumda da son bilinen toplamı döndürür.

```dart
// ŞABLON: Fonksiyonlarınızı bu main'in üstüne yazın.
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

**Beklenen ekran çıktısı:**

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

**İpucu:** `await for` döngüsünün içinden `return` ile çıkmak, akışın dinlenmesini de kendiliğinden durdurur (Bölüm 9.4'teki `cancel` gibi). Ödev 4, Soru 2'deki `cubuk` getter'ı bu soru için iyi bir başlangıç noktasıdır.

---

# 16. Kaynaklar

| Kaynak | Adres | Konu |
|---|---|---|
| Hata yönetimi | [dart.dev/language/error-handling](https://dart.dev/language/error-handling) | `throw`, `try`, `catch`, `finally`, `rethrow` |
| Generic tipler | [dart.dev/language/generics](https://dart.dev/language/generics) | Generic sınıflar, fonksiyonlar, tip sınırları |
| Record'lar | [dart.dev/language/records](https://dart.dev/language/records) | Record tipleri, alanlar, eşitlik |
| Desenler | [dart.dev/language/patterns](https://dart.dev/language/patterns) | Parçalama, record ve nesne desenleri |
| Asenkron programlama | [dart.dev/language/async](https://dart.dev/language/async) | `async`, `await`, `async*`, `await for` |
| Future, async, await (eğitim) | [dart.dev/libraries/async/async-await](https://dart.dev/libraries/async/async-await) | Adım adım asenkron programlama |
| Future'larda hata yönetimi | [dart.dev/libraries/async/futures-error-handling](https://dart.dev/libraries/async/futures-error-handling) | Asenkron hataların ayrıntıları |
| Stream kullanmak | [dart.dev/libraries/async/using-streams](https://dart.dev/libraries/async/using-streams) | `await for`, `listen`, Stream metotları |
| Stream oluşturmak | [dart.dev/libraries/async/creating-streams](https://dart.dev/libraries/async/creating-streams) | `async*`, `StreamController` |
| FutureBuilder | [api.flutter.dev/flutter/widgets/FutureBuilder-class.html](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html) | Future'ı ekranda göstermek |
| StreamBuilder | [api.flutter.dev/flutter/widgets/StreamBuilder-class.html](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) | Stream'i ekranda göstermek |
| Yapay zekâ ile geliştirme | [docs.flutter.dev/ai/mcp-server](https://docs.flutter.dev/ai/mcp-server) | Dart and Flutter MCP sunucusu |

---

### Gelecek Hafta

**Hafta 7 — Flutter'a Giriş: Widget'lar ve Yerleşim:** Dart dilini tamamladık; artık ekran çizmeye başlıyoruz. Widget kavramı ve widget ağacı; `StatelessWidget` ve `BuildContext`; `Text`, `Icon`, `Image`, `Container`; yerleşim widget'ları (`Row`, `Column`, `Stack`, `Expanded`) ve Flutter'ın kısıt modeli; hot reload ile çalışmak. Bu haftaki `sealed` ekran durumlarını, `FutureBuilder` ve `StreamBuilder` kalıplarını gerçek ekranlarda kullanacağımız günler yaklaşıyor.

**Derse hazırlık:**
- Ödev 5'i ve `AI_LOG.md` dosyanızı teslim edin. Çözümler derste ilk 15 dakikada birlikte yapılacak.
- Bu nottaki "Kendinizi Test Edin" sorularını çözün; özellikle 9. ve 10. sorulardaki çalışma sırası sorularını kâğıt üzerinde adım adım izleyin.
- Terminalde `flutter doctor` komutunu çalıştırın ve bütün maddelerin yeşil olduğundan emin olun (Hafta 1 kurulum kılavuzu). Bir emülatörü veya telefonunuzu bağlayıp `flutter create` ile oluşturduğunuz örnek uygulamayı çalıştırabildiğinizi kontrol edin.

---

*BMH309 Mobil Cihaz Programlama · Hafta 6 Ders Notu*
