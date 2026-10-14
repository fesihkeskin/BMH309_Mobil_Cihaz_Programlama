# <font color='blue'>**Hafta 4 · Sınıflar ve Nesneler**</font>

---
**Ders:** BMH309 Mobil Cihaz Programlama
**Konular:** Ödev 2 çözümleri · Sınıf ve nesne · Kurucular ve `this` · İsimli kurucular ve `factory` · Private alanlar, getter ve setter · Kalıtım ve `super` · Override · Polimorfizm ve `is`
**Yazar:** Dr. Öğr. Üyesi Fesih Keskin

---

# Giriş

Geçen hafta Cep Market sepet programını yazarken bir ürünün bilgilerini üç ayrı yerde tutmak zorunda kaldık: Fiyat bir Map'te, sepetteki adet başka bir Map'te, ürünün adı ise bu Map'lerin anahtarındaydı. Ürüne "stok" ya da "kategori" gibi yeni bir bilgi eklemek isteseydik bir Map daha açmamız ve hepsini birbiriyle uyumlu tutmamız gerekecekti.

Bu hafta bu sorunu **Nesne Yönelimli Programlama** (NYP, İngilizcesi *Object-Oriented Programming*, OOP) ile çözüyoruz. Bir ürünün tüm bilgilerini **ve** o bilgilerle yapılabilecek işleri tek bir yapıda, bir **sınıfta** toplayacağız.

Bu konu Flutter için özellikle önemlidir: **Flutter'da her şey bir nesnedir.** Ekrandaki her yazı, buton ve resim bir sınıftan oluşturulmuş bir nesnedir. Kendi ekranlarınızı yazarken de `StatelessWidget` gibi hazır sınıflardan **kalıtım** alacak ve `build` metodunu **override** edeceksiniz.

### Bu Haftanın Hedefleri

Bu haftanın sonunda şunları yapabiliyor olmalısınız:

1. Sınıf ve nesne kavramlarını açıklamak; alan (field) ve metot içeren sınıflar yazmak.
2. Kurucular (constructor) yazmak; `this` anahtar kelimesinin anlamını açıklamak.
3. İsimli kurucular, başlatıcı listeleri ve `factory` kurucular kullanmak.
4. `_` ile private alanlar tanımlamak; getter ve setter ile veriye kontrollü erişim sağlamak.
5. `extends` ile kalıtım kurmak; `super` ile üst sınıfın kurucusunu ve metotlarını çağırmak.
6. `@override` ile metotları yeniden tanımlamak.
7. Polimorfizmi açıklamak; `is`, `is!` ve `as` ile tip kontrolü yapmak.

### Bu Haftanın AI Kuralı

> **Hafta 1–5: "AI açıklar, siz yazarsınız."**
> - AI'ı kavram sormak, hata mesajlarını açıklatmak ve kodunuzu okutmak için kullanabilirsiniz.
> - AI'a kod yazdırmak veya dosyalarınızı değiştirtmek **yasaktır**. Claude Code'u plan modunda kullanınız.
> - Sınıf içi mini görevler AI kapalı yapılır.
> - AI yanılabilir; şüphelendiğiniz her bilgiyi dart.dev'den doğrulayınız.

### Başlamadan Önce

- Bu hafta için `C:\dev\bmh309\hafta4` klasörünü oluşturup VS Code'da açın.
- Her kod bloğu tek başına çalışan tam bir programdır ve ilk satırında önerilen dosya adı yazar (`// Dosya: ...`). **Tek istisna** Bölüm 5.2'dedir: Orada bir dosya, başka bir dosya tarafından `import` edilen bir **kütüphane dosyasıdır**; bu durum kod bloğunun içinde açıkça belirtilmiştir.
- Bu haftanın örneklerinin çoğu klavyeden veri almaz; VS Code'daki **Run** düğmesiyle çalıştırabilirsiniz. Yalnızca Ödev 2'nin 5. sorusunun çözümü terminalden çalıştırılmalıdır.
- ❌ işaretli bloklar bilerek hatalıdır; hata mesajını görmeniz için verilmiştir.

---

# İçindekiler

1. [Ödev 2 Çözümleri](#1-ödev-2-çözümleri)
2. [Sınıf ve Nesne](#2-sınıf-ve-nesne)
3. [Kurucular ve this](#3-kurucular-ve-this)
4. [İsimli Kurucular ve factory](#4-isimli-kurucular-ve-factory)
5. [Kapsülleme: Private Alanlar, Getter ve Setter](#5-kapsülleme-private-alanlar-getter-ve-setter)
6. [Kalıtım: extends ve super](#6-kalıtım-extends-ve-super)
7. [Override: Metotları Yeniden Tanımlamak](#7-override-metotları-yeniden-tanımlamak)
8. [Polimorfizm ve is](#8-polimorfizm-ve-is)
9. [Hepsini Birleştirelim: Cep Market v2](#9-hepsini-birleştirelim-cep-market-v2)
10. [Örnek Problem ve Farklı Çözüm Yolları](#10-örnek-problem-ve-farklı-çözüm-yolları)
11. [Özet](#11-özet)
12. [Kendinizi Test Edin](#12-kendinizi-test-edin)
13. [Ödev 3](#13-ödev-3)
14. [Kaynaklar](#14-kaynaklar)

---

# 1. Ödev 2 Çözümleri

Bu bölümde geçen haftanın ödev sorularının birer örnek çözümünü veriyoruz. **Sizin çözümünüz farklı olabilir.** İstenen fonksiyonlar yazılmışsa, çıktı beklenen çıktıyla aynıysa ve program hatalı girdide çökmüyorsa çözümünüz doğrudur.

Çözümleri okurken şuna dikkat edin: Her soruda verinin kendisi (liste, küme, Map) ve o veriyle çalışan fonksiyonlar **ayrı ayrı** duruyor. Fonksiyonlara veriyi her seferinde parametre olarak göndermek zorunda kalıyoruz: `urunEkle(sepet, ...)`, `urunCikar(sepet, ...)`. Bu haftanın konusu olan sınıflar, veriyi ve onunla çalışan fonksiyonları **tek bir yapıda** birleştirecek: `sepet.ekle(...)`.

## Soru 1 — Alışveriş Listesi

**Çözümün mantığı:** `urunEkle` önce girdiyi temizler, sonra hatalı durumları erken çıkışla (`return false`) eler. `alfabetik` fonksiyonu, Hafta 3'te gördüğümüz **referans** tuzağına düşmemek için önce `List.of` ile bir kopya alır, sonra kopyayı sıralar.

```dart
// Dosya: 01_s1_alisveris_listesi.dart
bool urunEkle(List<String> sepet, String urun) {
  String temiz = urun.trim();
  if (temiz.isEmpty) {
    print('Ürün adı boş olamaz.');
    return false;
  }
  if (sepet.contains(temiz)) {
    print('$temiz zaten sepette.');
    return false;
  }
  sepet.add(temiz);
  print('$temiz eklendi.');
  return true;
}

bool urunCikar(List<String> sepet, String urun) {
  String temiz = urun.trim();
  if (sepet.remove(temiz)) {
    print('$temiz çıkarıldı.');
    return true;
  }
  print('$temiz sepette bulunamadı.');
  return false;
}

void sepetiYazdir(List<String> sepet) {
  if (sepet.isEmpty) {
    print('Sepet boş.');
    return;
  }
  for (int i = 0; i < sepet.length; i++) {
    print('${i + 1}. ${sepet[i]}');
  }
}

List<String> alfabetik(List<String> sepet) {
  List<String> kopya = List.of(sepet);
  kopya.sort();
  return kopya;
}

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

**Çıktı:**

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

**Açıklama:**
- `sepet.remove(temiz)` silme başarılıysa `true` döndürür. Bu yüzden ayrıca `contains` ile kontrol etmeye gerek kalmadı.
- `alfabetik` içinde `sepet.sort()` yazsaydık, fonksiyon dışarıdaki listeyi de sıralardı ve son satır `Orijinal : [Armut, Domates, Süt]` olurdu.

## Soru 2 — Haftalık Adım Raporu

```dart
// Dosya: 01_s2_adim_raporu.dart
int toplamAdim(List<int> adimlar) {
  int toplam = 0;
  for (int adim in adimlar) {
    toplam += adim;
  }
  return toplam;
}

double ortalamaAdim(List<int> adimlar) =>
    adimlar.isEmpty ? 0.0 : toplamAdim(adimlar) / adimlar.length;

int enAktifGunIndeksi(List<int> adimlar) {
  int enIyi = 0;
  for (int i = 1; i < adimlar.length; i++) {
    if (adimlar[i] > adimlar[enIyi]) {
      enIyi = i;
    }
  }
  return enIyi;
}

int hedefeUlasilanGun(List<int> adimlar, {int hedef = 8000}) {
  int sayac = 0;
  for (int adim in adimlar) {
    if (adim >= hedef) {
      sayac++;
    }
  }
  return sayac;
}

void grafikCiz(List<String> gunler, List<int> adimlar, {int birim = 1000}) {
  for (int i = 0; i < adimlar.length; i++) {
    print('${gunler[i]} | ${'#' * (adimlar[i] ~/ birim)} ${adimlar[i]}');
  }
}

void main() {
  List<String> gunler = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
  List<int> adimlar = List.filled(7, 0);
  adimlar[0] = 6500;
  adimlar[1] = 8200;
  adimlar[2] = 7400;
  adimlar[3] = 10350;
  adimlar[4] = 5600;
  adimlar[5] = 12100;
  adimlar[6] = 9000;

  int enAktif = enAktifGunIndeksi(adimlar);

  print('Toplam adım  : ${toplamAdim(adimlar)}');
  print('Ortalama     : ${ortalamaAdim(adimlar).toStringAsFixed(1)}');
  print('En aktif gün : ${gunler[enAktif]} (${adimlar[enAktif]} adım)');
  print('Hedef 8000   : ${hedefeUlasilanGun(adimlar)} gün');
  print('Hedef 10000  : ${hedefeUlasilanGun(adimlar, hedef: 10000)} gün');
  grafikCiz(gunler, adimlar);

  // Ek görev:
  // adimlar.add(7000);
  // Bu satır çalıştırılınca "Unsupported operation: Cannot add to a fixed-length list"
  // hatası alınır. List.filled varsayılan olarak SABİT uzunluklu liste oluşturur;
  // elemanlar değiştirilebilir ama listeye eleman eklenemez.
}
```

**Çıktı:**

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

**Açıklama:**
- `ortalamaAdim` fonksiyonu `0` yerine `0.0` döndürüyor. Dönüş tipi `double` olduğu için `0` da çalışırdı, ama `0.0` niyetimizi daha açık gösterir.
- `hedefeUlasilanGun(adimlar)` çağrısında `hedef` verilmediği için varsayılan değer `8000` kullanıldı; ikinci çağrıda isimli argümanla `10000` verildi.
- `'#' * (adimlar[i] ~/ birim)`: Önce tam sayı bölmesiyle kaç `#` çizileceği bulunur, sonra metin o kadar tekrarlanır.

## Soru 3 — Ortak İlgi Alanları

```dart
// Dosya: 01_s3_ilgi_alanlari.dart
void karsilastir(Set<String> a, Set<String> b, String adA, String adB) {
  print('${'Ortak ilgi alanları'.padRight(20)}: ${a.intersection(b)}');
  print('${'Tüm ilgi alanları'.padRight(20)}: ${a.union(b)}');
  print('${'Yalnızca $adA'.padRight(20)}: ${a.difference(b)}');
  print('${'Yalnızca $adB'.padRight(20)}: ${b.difference(a)}');
}

double benzerlikYuzdesi(Set<String> a, Set<String> b) {
  Set<String> tumu = a.union(b);
  if (tumu.isEmpty) {
    return 0.0;
  }
  return a.intersection(b).length / tumu.length * 100;
}

Set<String> etiketleriTemizle(List<String> etiketler) {
  Set<String> sonuc = {};
  for (String etiket in etiketler) {
    String temiz = etiket.trim().toLowerCase();
    if (temiz.isNotEmpty) {
      sonuc.add(temiz);
    }
  }
  return sonuc;
}

void main() {
  Set<String> ayse = {'müzik', 'sinema', 'yazılım', 'fotoğraf', 'koşu'};
  Set<String> mert = {'yazılım', 'oyun', 'müzik', 'basketbol'};
  List<String> etiketGirdisi = ['yazılım', 'Müzik', 'yazılım', 'oyun', 'müzik '];

  karsilastir(ayse, mert, 'Ayşe', 'Mert');
  print('${'Benzerlik'.padRight(20)}: %${benzerlikYuzdesi(ayse, mert).toStringAsFixed(2)}');
  print('Temizlenmiş etiketler: ${etiketleriTemizle(etiketGirdisi)}');
}
```

**Çıktı:**

```text
Ortak ilgi alanları : {müzik, yazılım}
Tüm ilgi alanları   : {müzik, sinema, yazılım, fotoğraf, koşu, oyun, basketbol}
Yalnızca Ayşe       : {sinema, fotoğraf, koşu}
Yalnızca Mert       : {oyun, basketbol}
Benzerlik           : %28.57
Temizlenmiş etiketler: {yazılım, müzik, oyun}
```

**Açıklama:**
- `padRight(20)` etiketleri aynı genişliğe getirerek iki nokta üst üste işaretlerinin alt alta gelmesini sağlar.
- Benzerlik: 2 ortak / 7 toplam × 100 = %28.57. Bu orana **Jaccard benzerliği** denir; öneri sistemlerinde sıkça kullanılır.
- `etiketleriTemizle`, tekrarları ayrıca kontrol etmez: `Set`'e aynı eleman ikinci kez eklenemediği için tekrarlar kendiliğinden ayıklanır.

## Soru 4 — Uygulama Yorumu Analizi

```dart
// Dosya: 01_s4_yorum_analizi.dart
Map<String, int> kelimeSay(String metin, Set<String> haricTutulanlar) {
  String temiz = metin.toLowerCase();
  for (String isaret in ['.', ',', '!', '?']) {
    temiz = temiz.replaceAll(isaret, '');
  }

  Map<String, int> sayac = {};
  for (String kelime in temiz.split(' ')) {
    if (kelime.isEmpty || haricTutulanlar.contains(kelime)) {
      continue;
    }
    sayac[kelime] = (sayac[kelime] ?? 0) + 1;
  }
  return sayac;
}

String enSikKelime(Map<String, int> sayac) {
  String enSik = '';
  int enCok = 0;
  for (var kayit in sayac.entries) {
    if (kayit.value > enCok) {
      enSik = kayit.key;
      enCok = kayit.value;
    }
  }
  return enSik;
}

List<String> tekrarEdenler(Map<String, int> sayac, {int enAz = 2}) {
  List<String> sonuc = [];
  for (var kayit in sayac.entries) {
    if (kayit.value >= enAz) {
      sonuc.add(kayit.key);
    }
  }
  return sonuc;
}

void main() {
  String yorum = 'Uygulama çok hızlı ve kullanışlı. Tasarım güzel, menü hızlı. '
      'Bildirimler bazen geç geliyor ama uygulama genel olarak hızlı ve güzel.';
  Set<String> haricTutulanlar = {'ve', 'çok', 'ama', 'bir', 'bu'};

  Map<String, int> sayac = kelimeSay(yorum, haricTutulanlar);

  int toplam = 0;
  for (int adet in sayac.values) {
    toplam += adet;
  }
  String enSik = enSikKelime(sayac);

  print('Farklı kelime sayısı : ${sayac.length}');
  print('Toplam kelime sayısı : $toplam');
  print('En sık geçen         : $enSik (${sayac[enSik]} kez)');
  print('En az 2 kez geçenler : ${tekrarEdenler(sayac)}');
}
```

**Çıktı:**

```text
Farklı kelime sayısı : 12
Toplam kelime sayısı : 16
En sık geçen         : hızlı (3 kez)
En az 2 kez geçenler : [uygulama, hızlı, güzel]
```

**Açıklama:**
- Noktalama işaretleri bir **liste** üzerinde dönülerek silindi; yeni bir işaret eklemek için yalnızca listeye eklemek yeter.
- `continue` ile istenmeyen kelimeler sayılmadan atlandı (Hafta 2, Bölüm 11.2).
- ⚠️ Bu metinde büyük `I` harfi yoktu. Olsaydı `toLowerCase()` onu Türkçedeki `ı`'ya değil `i`'ye çevirirdi (Hafta 1, Bölüm 8). Türkçe metin işleyen uygulamalarda bu fark kelime sayımını bozabilir.

## Soru 5 — Telefon Rehberi

> Bu program klavyeden veri alır; **terminalden** çalıştırın.

**Çözümün mantığı:** Her iş ayrı bir fonksiyonda: doğrulama (`telefonGecerliMi`), biçimlendirme (`telefonFormatla`), ekleme, arama ve listeleme. `main` yalnızca menüyü yönetir.

```dart
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
```

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

**Açıklama:**
- `rehber.remove(silinecek)` silinen değeri, anahtar yoksa `null` döndürür; bu sayede tek satırda hem silindi hem de "var mıydı?" kontrolü yapıldı.
- `kisiEkle`, eklemeden **önce** kişinin var olup olmadığını kaydeder; çünkü ekledikten sonra her durumda var olacaktır.
- Her `case` bloğunda farklı değişken adları (`ad`, `bulunanlar`, `silinecek`) kullanıldı; böylece hangi değişkenin hangi seçeneğe ait olduğu kolayca okunur.
- `rehber` Map'i tüm fonksiyonlara tek tek gönderiliyor. Bu haftanın sonunda bu yapıyı bir `Rehber` sınıfına dönüştürmeyi kendiniz deneyebilirsiniz: `rehber.ekle(ad, telefon)`, `rehber.ara('ay')`.

---

# 2. Sınıf ve Nesne

## 2.1 Sorun: Dağınık veri

Hafta 3'te bir ürünün bilgilerini **paralel listelerde** tutmanın riskli olduğunu söylemiştik. Bu riski görelim:

```dart
// Dosya: 02_01_dagik_veri.dart
// ❌ ÇALIŞMA ZAMANI HATASI: Listelerden biri güncellenmeyi unuttu.
void main() {
  List<String> adlar = ['Süt', 'Ekmek', 'Peynir'];
  List<double> fiyatlar = [32.50, 15.00, 145.00];
  List<int> stoklar = [12, 0, 5];

  // Yeni ürün: üç listeyi birden güncellemek gerekiyor
  adlar.add('Zeytin');
  fiyatlar.add(120.00);
  // stoklar.add(...) unutuldu!

  for (int i = 0; i < adlar.length; i++) {
    print('${adlar[i]}: ${fiyatlar[i]} TL, stok: ${stoklar[i]}');
  }
}
```

**Çıktı (bir bölümü):**

```text
Süt: 32.5 TL, stok: 12
Ekmek: 15.0 TL, stok: 0
Peynir: 145.0 TL, stok: 5
```

**Açıklama:** Üç ürün yazdırıldıktan sonra program `RangeError` ile çöker; çünkü `stoklar` listesinde 4. eleman yoktur. Bir ürünün bilgileri birbirinden kopuk üç yerde durduğu için, bir yeri güncellemeyi unutmak programı bozar. İhtiyacımız olan şey, bir ürünün **tüm bilgilerini bir arada** tutan bir yapıdır.

## 2.2 Sınıf nedir, nesne nedir?

**Sınıf** (class), bir şeyin hangi bilgilere sahip olacağını ve neler yapabileceğini tanımlayan bir **kalıptır**. **Nesne** (object), bu kalıptan üretilmiş somut bir örnektir.

```text
          SINIF (kalıp)                         NESNELER (örnekler)
   ┌──────────────────────────┐        ┌───────────────────────────┐
   │ Urun                     │  ───►  │ ad: Süt     fiyat: 32.5   │
   │  ad, fiyat, stok         │        └───────────────────────────┘
   │  bilgiYazdir()           │  ───►  ┌───────────────────────────┐
   │  sat(adet)               │        │ ad: Ekmek   fiyat: 15.0   │
   └──────────────────────────┘        └───────────────────────────┘
```

Bir benzetme: Sınıf bir evin **mimari planı**, nesneler o plana göre yapılmış **evlerdir**. Tek bir plandan istediğiniz kadar ev yapabilirsiniz; her evin kapı rengi (verisi) farklı olabilir ama hepsi aynı plana uyar.

| Terim | Anlamı | Örnek |
|---|---|---|
| **Sınıf** | Kalıp, tanım | `Urun` |
| **Nesne** / örnek (instance) | Sınıftan üretilen somut değer | `Urun()` ile oluşan her şey |
| **Alan** (field, özellik) | Nesnenin taşıdığı veri | `ad`, `fiyat`, `stok` |
| **Metot** (method) | Nesnenin yapabildiği iş; sınıfın içindeki fonksiyon | `bilgiYazdir()`, `sat(2)` |
| **Nokta operatörü** | Nesnenin alanına veya metoduna erişim | `sut.fiyat`, `sut.sat(2)` |

## 2.3 İlk sınıf

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz, yalnızca yapıyı gösterir.
class SinifAdi {
  // Alanlar: nesnenin verisi
  Tip alanAdi = baslangicDegeri;

  // Metotlar: nesnenin davranışları
  DonusTipi metotAdi(parametreler) {
    // alanlara doğrudan erişilebilir
  }
}
```

```dart
// Dosya: 02_02_ilk_sinif.dart
class Urun {
  String ad = '';
  double fiyat = 0;
  int stok = 0;

  void bilgiYazdir() {
    print('$ad: ${fiyat.toStringAsFixed(2)} TL (stok: $stok)');
  }
}

void main() {
  Urun sut = Urun();
  sut.ad = 'Süt';
  sut.fiyat = 32.50;
  sut.stok = 12;

  Urun ekmek = Urun();
  ekmek.ad = 'Ekmek';
  ekmek.fiyat = 15;

  sut.bilgiYazdir();
  ekmek.bilgiYazdir();
}
```

**Çıktı:**

```text
Süt: 32.50 TL (stok: 12)
Ekmek: 15.00 TL (stok: 0)
```

**Açıklama:**
- `class Urun { ... }` yeni bir **tip** tanımlar. Artık `int`, `String` gibi `Urun` tipinde değişkenler de oluşturabiliriz.
- `Urun()` ifadesi, sınıftan **yeni bir nesne** oluşturur. Java veya C#'taki `new` kelimesi Dart'ta isteğe bağlıdır ve kullanılmaz.
- `bilgiYazdir` metodu içinde `ad`, `fiyat` ve `stok` doğrudan kullanılabilir; metot, **çağrıldığı nesnenin** alanlarını kullanır. `sut.bilgiYazdir()` Süt'ün, `ekmek.bilgiYazdir()` Ekmek'in bilgisini yazar.
- `ekmek.stok` değeri verilmediği için başlangıç değerinde (`0`) kaldı.
- **Adlandırma:** Sınıf adları büyük harfle başlar ve her kelimenin ilk harfi büyük yazılır (`UpperCamelCase`): `Urun`, `SepetKalemi`, `KullaniciProfili`. Alan ve metot adları ise `lowerCamelCase` yazılır.

## 2.4 Nesnenin durumunu değiştiren metotlar

Metotlar alanları okuyabilir ve **değiştirebilir**. Bir nesnenin alanlarının o anki değerlerine nesnenin **durumu** (state) denir.

```dart
// Dosya: 02_03_metotlar.dart
class Urun {
  String ad = '';
  double fiyat = 0;
  int stok = 0;

  bool stoktaVarMi() {
    return stok > 0;
  }

  double kdvliFiyat() {
    return fiyat * 1.20;
  }

  void stokEkle(int adet) {
    stok += adet;
    print('$ad stoğuna $adet eklendi. Yeni stok: $stok');
  }

  bool sat(int adet) {
    if (adet > stok) {
      print('$ad: Yetersiz stok ($stok adet var).');
      return false;
    }
    stok -= adet;
    print('$ad: $adet adet satıldı. Kalan: $stok');
    return true;
  }
}

void main() {
  Urun peynir = Urun();
  peynir.ad = 'Peynir';
  peynir.fiyat = 145;
  peynir.stok = 3;

  print('Stokta var mı? ${peynir.stoktaVarMi()}');
  print('KDV dahil: ${peynir.kdvliFiyat().toStringAsFixed(2)} TL');
  peynir.sat(2);
  peynir.sat(5);
  peynir.stokEkle(10);
  peynir.sat(5);
}
```

**Çıktı:**

```text
Stokta var mı? true
KDV dahil: 174.00 TL
Peynir: 2 adet satıldı. Kalan: 1
Peynir: Yetersiz stok (1 adet var).
Peynir stoğuna 10 eklendi. Yeni stok: 11
Peynir: 5 adet satıldı. Kalan: 6
```

**Açıklama:** Hafta 3'te `urunEkle(sepet, 'Süt')` gibi, veriyi fonksiyona parametre olarak gönderiyorduk. Şimdi veri ve onunla çalışan kod **aynı yerde**: `peynir.sat(2)`. "Peynir, 2 tane sat" diye okunur. Satış kuralı (stok yetmiyorsa satma) sınıfın içinde olduğu için, programın neresinde satış yapılırsa yapılsın aynı kural uygulanır.

## 2.5 Nesneyi yazdırmak: toString

```dart
// Dosya: 02_04_tostring.dart
class Urun {
  String ad = '';
  double fiyat = 0;
}

class Konum {
  double enlem = 0;
  double boylam = 0;

  @override
  String toString() => 'Konum($enlem, $boylam)';
}

void main() {
  Urun u = Urun();
  u.ad = 'Süt';
  print(u);

  Konum k = Konum();
  k.enlem = 37.93;
  k.boylam = 41.94;
  print(k);
  print('Teslimat noktası: $k');
}
```

**Çıktı:**

```text
Instance of 'Urun'
Konum(37.93, 41.94)
Teslimat noktası: Konum(37.93, 41.94)
```

**Açıklama:**
- Bir nesne `print` ile yazdırıldığında veya metnin içine `$k` ile yerleştirildiğinde Dart, nesnenin `toString()` metodunu çağırır. Varsayılan sonuç `Instance of 'Urun'` gibi pek bir şey anlatmayan bir metindir.
- `Konum` sınıfında `toString` metodunu kendimiz yazdık. Başındaki `@override` ifadesi "bu metodu yeniden tanımlıyorum" anlamına gelir; Bölüm 7'de ayrıntılı göreceğiz.

> **İpucu:** Yazdığınız her sınıfa bir `toString` ekleyin. Hata ayıklarken nesnenin içinde ne olduğunu tek bir `print` ile görebilirsiniz.

## 2.6 Nesneler referansla tutulur

Hafta 3'te listelerin referansla tutulduğunu görmüştük. Kendi sınıflarımızdan oluşturduğumuz nesneler de aynı şekilde davranır:

```dart
// Dosya: 02_05_nesne_referans.dart
class Sayac {
  int deger = 0;
}

void arttir(Sayac s) {
  s.deger++;
}

void main() {
  Sayac a = Sayac();
  Sayac b = a;
  b.deger = 5;
  print('a: ${a.deger}, b: ${b.deger}');

  arttir(a);
  print('a: ${a.deger}');

  Sayac c = Sayac();
  c.deger = 6;
  print(a == c);
  print(a == b);
}
```

**Çıktı:**

```text
a: 5, b: 5
a: 6
false
true
```

**Açıklama:**
- `b = a` yeni bir nesne oluşturmaz; `b`, `a`'nın gösterdiği **aynı nesneye** ikinci bir isimdir. Bu yüzden `b.deger = 5` atamasından sonra `a.deger` de 5'tir.
- `arttir(a)` fonksiyonu nesnenin kendisine erişir; içerideki değişiklik dışarıda da görünür.
- `a == c` sonucu `false`: İki nesnenin içindeki değerler aynı (6) olsa da bellekte **iki ayrı nesnedir**. Varsayılan `==`, "aynı nesne mi?" diye bakar.

## 2.7 ❌ Null safety ve alanlar

```dart
// Dosya: 02_06_tuzak_alan_baslatma.dart
// ❌ DERLEME HATASI
class Kullanici {
  String ad;
  int yas;
}

void main() {
  Kullanici k = Kullanici();
  print(k.ad);
}
```

**Hata mesajı:**

```text
Non-nullable instance field 'ad' must be initialized.
```

*Türkçesi: "Null olamayan 'ad' alanına bir başlangıç değeri verilmelidir."* Aynı hata `yas` için de verilir. Dart, bir nesne oluşturulduğu anda tüm alanların geçerli bir değeri olmasını ister. Çözüm yolları:

| Çözüm | Yazım | Ne zaman? |
|---|---|---|
| Başlangıç değeri vermek | `String ad = '';` | Mantıklı bir varsayılan değer varsa |
| Nullable yapmak | `String? ad;` | Bilginin gerçekten olmayabileceği durumlarda (ör. takma ad) |
| **Kurucu ile değer almak** | `Kullanici(this.ad, this.yas);` | **En doğru yol:** Nesne oluşturulurken değer zorunlu olarak verilir (Bölüm 3) |

## 2.8 Nesne listeleri

Sınıflar, Hafta 3'teki koleksiyonlarla birlikte kullanıldığında asıl gücünü gösterir:

```dart
// Dosya: 02_07_nesne_listesi.dart
class Urun {
  String ad = '';
  double fiyat = 0;
  int stok = 0;
}

void main() {
  List<Urun> katalog = [];

  Urun sut = Urun();
  sut.ad = 'Süt';
  sut.fiyat = 32.5;
  sut.stok = 12;
  katalog.add(sut);

  Urun ekmek = Urun();
  ekmek.ad = 'Ekmek';
  ekmek.fiyat = 15;
  katalog.add(ekmek);

  for (Urun u in katalog) {
    String durum = u.stok > 0 ? '${u.stok} adet' : 'TÜKENDİ';
    print('${u.ad.padRight(8)} ${u.fiyat.toStringAsFixed(2).padLeft(7)} TL  $durum');
  }
}
```

**Çıktı:**

```text
Süt        32.50 TL  12 adet
Ekmek      15.00 TL  TÜKENDİ
```

**Açıklama:** `List<Urun>`, "Urun nesnelerinden oluşan liste" demektir. Artık her ürünün bilgisi tek bir nesnede; paralel listelerdeki "birini güncellemeyi unutma" riski ortadan kalktı. Ama bir sorun var: Her ürünü oluşturmak **dört satır** sürüyor ve bir alana değer vermeyi unutmak çok kolay. Bir sonraki bölümde bu sorunu **kurucularla** çözeceğiz.

> 🔗 **Flutter'da:** Bir alışveriş uygulamasındaki ürün listesi tam olarak bir `List<Urun>`'dur. `ListView`, bu listeyi dolaşarak her nesne için ekranda bir kart çizer.

---

# 3. Kurucular ve this

## 3.1 Kurucu nedir?

**Kurucu** (constructor), bir nesne oluşturulurken çalışan ve nesnenin alanlarına ilk değerlerini veren özel bir metottur. Adı sınıfın adıyla aynıdır ve dönüş tipi yazılmaz. `Urun()` yazdığımızda aslında `Urun` sınıfının kurucusunu çağırıyorduk. Kurucu yazmazsak Dart, parametresiz ve boş bir **varsayılan kurucu** ekler.

### ❌ Java/C# alışkanlığı: Alanlara kurucunun gövdesinde değer vermek

```dart
// Dosya: 03_01_tuzak_kurucu_govde.dart
// ❌ DERLEME HATASI
class Urun {
  String ad;
  double fiyat;

  Urun(String ad, double fiyat) {
    this.ad = ad;
    this.fiyat = fiyat;
  }
}

void main() {
  Urun u = Urun('Süt', 32.5);
  print(u.ad);
}
```

**Hata mesajı:**

```text
Non-nullable instance field 'ad' must be initialized.
```

**Açıklama:** Diğer dillerde yaygın olan bu yazım Dart'ta çalışmaz. Dart'ta kurucunun **gövdesi** (`{ }` içi) çalışmaya başlamadan önce tüm null olamayan alanların değeri hazır olmalıdır. Gövdedeki atamalar Dart için "çok geç" kalır. Doğru yol bir sonraki örnekte.

## 3.2 this ile kısa kurucu

```dart
// Dosya: 03_02_kurucu_kisa.dart
class Urun {
  String ad;
  double fiyat;
  int stok;

  Urun(this.ad, this.fiyat, this.stok);

  void bilgiYazdir() {
    print('$ad: ${fiyat.toStringAsFixed(2)} TL (stok: $stok)');
  }
}

void main() {
  Urun sut = Urun('Süt', 32.50, 12);
  Urun ekmek = Urun('Ekmek', 15, 0);
  sut.bilgiYazdir();
  ekmek.bilgiYazdir();
}
```

**Çıktı:**

```text
Süt: 32.50 TL (stok: 12)
Ekmek: 15.00 TL (stok: 0)
```

**Açıklama:**
- `Urun(this.ad, this.fiyat, this.stok);` satırı şunu söyler: "İlk argümanı `ad` alanına, ikincisini `fiyat` alanına, üçüncüsünü `stok` alanına ata." Atama, gövde çalışmadan **önce** yapılır; bu yüzden null safety kuralı sağlanır.
- Kurucunun gövdesi yoksa sonuna `;` konur. Gövdesi olabilir de: `Urun(this.ad, this.fiyat, this.stok) { print('Yeni ürün: $ad'); }`
- Artık bir ürünü tek satırda oluşturuyoruz: `Urun('Süt', 32.50, 12)`. Üstelik değer vermeyi unutmak imkânsız; argümanlardan biri eksikse program derlenmez.

## 3.3 this anahtar kelimesi

`this`, **o anda üzerinde çalışılan nesnenin kendisi** demektir. Bir metot `ayse.puanEkle(10)` diye çağrıldığında, metodun içindeki `this` Ayşe nesnesidir.

```dart
// Dosya: 03_03_this.dart
class Kullanici {
  String ad;
  int puan = 0;

  Kullanici(this.ad);

  void puanEkle(int puan) {
    this.puan += puan; // this.puan: nesnenin alanı, puan: parametre
    print('$ad: +$puan puan (toplam: ${this.puan})');
  }
}

void main() {
  Kullanici ayse = Kullanici('Ayşe');
  Kullanici mert = Kullanici('Mert');
  ayse.puanEkle(10);
  mert.puanEkle(5);
  ayse.puanEkle(25);
}
```

**Çıktı:**

```text
Ayşe: +10 puan (toplam: 10)
Mert: +5 puan (toplam: 5)
Ayşe: +25 puan (toplam: 35)
```

**Açıklama:** `puanEkle` metodunun parametresinin adı da `puan`. Metodun içinde yalnızca `puan` yazınca **parametre** anlaşılır; nesnenin alanına erişmek için `this.puan` yazmak gerekir. Ad çakışması olmadığında `this` yazılmaz: `print('$ad ...')` satırında `ad` doğrudan nesnenin alanıdır.

### ❌ this'i unutmak

```dart
// Dosya: 03_04_tuzak_this.dart
// ❌ MANTIK HATASI: Parametre kendisine atanıyor; alan değişmiyor.
class Kullanici {
  String ad = 'Misafir';

  void adDegistir(String ad) {
    ad = ad;
  }
}

void main() {
  Kullanici k = Kullanici();
  k.adDegistir('Mert');
  print(k.ad);
}
```

**Çıktı:**

```text
Misafir
```

**Açıklama:** `ad = ad;` satırında iki `ad` de **parametredir**; parametre kendine atanır, nesnenin alanı değişmez. Program hatasız çalışır ama yanlış sonuç verir. Doğrusu: `this.ad = ad;`. VS Code bu satırı bir uyarıyla işaretleyebilir; uyarıları görmezden gelmeyin.

## 3.4 İsimlendirilmiş parametreli kurucular

Hafta 3'te fonksiyonlar için gördüğümüz isimlendirilmiş parametreler kurucularda da kullanılır. Flutter'daki neredeyse tüm sınıflar bu şekilde oluşturulur.

```dart
// Dosya: 03_05_kurucu_isimli_parametre.dart
class Urun {
  String ad;
  double fiyat;
  int stok;
  String kategori;

  Urun({
    required this.ad,
    required this.fiyat,
    this.stok = 0,
    this.kategori = 'Genel',
  });

  @override
  String toString() => '$ad ($kategori): ${fiyat.toStringAsFixed(2)} TL, stok $stok';
}

void main() {
  Urun sut = Urun(ad: 'Süt', fiyat: 32.5, stok: 12, kategori: 'Süt Ürünleri');
  Urun kalem = Urun(ad: 'Kalem', fiyat: 12);
  Urun defter = Urun(fiyat: 45, ad: 'Defter', stok: 30);

  print(sut);
  print(kalem);
  print(defter);
}
```

**Çıktı:**

```text
Süt (Süt Ürünleri): 32.50 TL, stok 12
Kalem (Genel): 12.00 TL, stok 0
Defter (Genel): 45.00 TL, stok 30
```

**Açıklama:** `Urun(ad: 'Kalem', fiyat: 12)` çağrısı kendini anlatıyor ve verilmeyen alanlar varsayılan değerlerini alıyor. Konumsal ve isimlendirilmiş parametreler birlikte de kullanılabilir: `Urun(this.ad, this.fiyat, {this.stok = 0})`.

> 🔗 **Flutter'da:** `Text('Merhaba', maxLines: 2)` veya `Padding(padding: ..., child: ...)` yazdığınızda, tam olarak böyle bir kurucuyu çağırıyorsunuz. `required` ile işaretli bir parametreyi unutursanız, Hafta 3'te (Bölüm 4.3) gördüğümüz hata mesajını alırsınız.

## 3.5 Başlatıcı listesi

Bir alana değer vermeden önce o değer üzerinde **işlem** yapmak gerekiyorsa (temizlemek, dönüştürmek, başka alanlardan hesaplamak) **başlatıcı listesi** (initializer list) kullanılır. Kurucunun parametrelerinden sonra `:` ile başlar, gövdeden önce çalışır.

```dart
// Dosya: 03_06_baslatici_liste.dart
class Kullanici {
  String ad;
  String eposta;
  String kullaniciAdi;
  int kayitYili;

  Kullanici(this.ad, String eposta)
      : eposta = eposta.trim().toLowerCase(),
        kullaniciAdi = eposta.trim().toLowerCase().split('@')[0],
        kayitYili = 2026 {
    print('Yeni kullanıcı oluşturuldu: $kullaniciAdi');
  }
}

void main() {
  Kullanici k = Kullanici('Ayşe Yılmaz', '  Ayse.Yilmaz@Ornek.com ');
  print('Ad           : ${k.ad}');
  print('E-posta      : ${k.eposta}');
  print('Kullanıcı adı: ${k.kullaniciAdi}');
  print('Kayıt yılı   : ${k.kayitYili}');
}
```

**Çıktı:**

```text
Yeni kullanıcı oluşturuldu: ayse.yilmaz
Ad           : Ayşe Yılmaz
E-posta      : ayse.yilmaz@ornek.com
Kullanıcı adı: ayse.yilmaz
Kayıt yılı   : 2026
```

**Açıklama:**
- Başlatıcı listesindeki `eposta = eposta.trim()...` ifadesinde soldaki `eposta` **alan**, sağdaki **parametredir**.
- Çalışma sırası: **1)** argümanlar parametrelere geçer ve `this.ad` ataması yapılır → **2)** başlatıcı listesi çalışır → **3)** gövde çalışır. Gövdedeki `print` çalıştığında tüm alanların değeri hazırdır.
- Başlatıcı listesinde `this` kullanılamaz; çünkü nesne henüz tamamlanmamıştır.

## 3.6 final alanlar ve const kurucular

Bazı bilgiler nesne oluşturulduktan sonra **hiç değişmemelidir**: bir siparişin numarası, bir konumun koordinatları. Bu alanlar `final` yapılır.

```dart
// Dosya: 03_07_final_alanlar.dart
class Konum {
  final double enlem;
  final double boylam;

  const Konum(this.enlem, this.boylam);

  @override
  String toString() => '($enlem, $boylam)';
}

class Siparis {
  final String siparisNo;
  final double tutar;
  String durum;

  Siparis(this.siparisNo, this.tutar, {this.durum = 'Hazırlanıyor'});
}

void main() {
  const Konum magaza = Konum(37.93, 41.94);
  print('Mağaza konumu: $magaza');

  Siparis s = Siparis('SP-1024', 289.90);
  print('${s.siparisNo}: ${s.tutar.toStringAsFixed(2)} TL - ${s.durum}');
  s.durum = 'Kargoda';
  print('${s.siparisNo}: ${s.tutar.toStringAsFixed(2)} TL - ${s.durum}');
}
```

**Çıktı:**

```text
Mağaza konumu: (37.93, 41.94)
SP-1024: 289.90 TL - Hazırlanıyor
SP-1024: 289.90 TL - Kargoda
```

**Açıklama:**
- `Siparis` nesnesinin `durum` alanı değişebilir, ama `siparisNo` ve `tutar` bir kez verildikten sonra sabittir.
- `Konum` sınıfının **tüm** alanları `final` olduğu için kurucusu `const` yapılabildi. `const` kurucuyla oluşturulan nesneler derleme sırasında hazırlanır ve aynı değerlere sahip `const` nesneler bellekte tek bir kopya olarak tutulur.

```dart
// Dosya: 03_08_tuzak_final_alan.dart
// ❌ DERLEME HATASI
class Siparis {
  final String siparisNo;
  final double tutar;

  Siparis(this.siparisNo, this.tutar);
}

void main() {
  Siparis s = Siparis('SP-1024', 289.90);
  s.tutar = 100;
}
```

**Hata mesajı:**

```text
'tutar' can't be used as a setter because it's final.
```

*Türkçesi: "'tutar' final olduğu için değeri değiştirilemez."*

> 🔗 **Flutter'da:** Ekran parçaları (widget'lar) değişmez nesnelerdir: Tüm alanları `final`, kurucuları genellikle `const`'tur. `const Text('Merhaba')` yazmak, Flutter'a "bu parça hiç değişmeyecek, her seferinde yeniden oluşturma" demektir ve uygulamayı hızlandırır. VS Code'un Flutter projelerinde sık sık "const ekleyin" önerisi yapmasının nedeni budur.

## 3.7 Kurucuların özeti

| Yazım | Anlamı |
|---|---|
| (kurucu yazılmazsa) | Parametresiz varsayılan kurucu: `Urun()` |
| `Urun(this.ad, this.fiyat);` | Konumsal parametrelerle alanlara doğrudan atama |
| `Urun({required this.ad, this.stok = 0});` | İsimlendirilmiş parametrelerle atama |
| `Urun(String ad) : ad = ad.trim();` | Başlatıcı listesi: değeri işleyerek atama |
| `Urun(...) { ... }` | Gövde: Alanlar hazır olduktan sonra çalışacak ek işler |
| `const Konum(this.enlem, this.boylam);` | Tüm alanlar `final` ise derleme zamanı sabiti nesneler |

---

# 4. İsimli Kurucular ve factory

## 4.1 İsimli kurucular

Bir sınıfın nesnelerini **farklı yollarla** oluşturmak isteyebiliriz: bir konumu koordinatlarıyla, bir konumu "şehir merkezi" diye hazır bir değerle... Java'da bunun için aynı adlı birden fazla kurucu yazılır (overloading). **Dart'ta aynı adlı iki kurucu olamaz**; bunun yerine kuruculara isim verilir: `SinifAdi.isim(...)`.

```dart
// Dosya: 04_01_isimli_kurucu.dart
class Konum {
  final double enlem;
  final double boylam;
  final String ad;

  Konum(this.enlem, this.boylam, this.ad);

  Konum.merkez()
      : enlem = 37.93,
        boylam = 41.94,
        ad = 'Siirt Merkez';

  Konum.koordinat(this.enlem, this.boylam) : ad = 'İsimsiz konum';

  @override
  String toString() => '$ad ($enlem, $boylam)';
}

void main() {
  Konum ev = Konum(37.925, 41.932, 'Ev');
  Konum merkez = Konum.merkez();
  Konum nokta = Konum.koordinat(37.95, 41.96);

  print(ev);
  print(merkez);
  print(nokta);
}
```

**Çıktı:**

```text
Ev (37.925, 41.932)
Siirt Merkez (37.93, 41.94)
İsimsiz konum (37.95, 41.96)
```

**Açıklama:**
- `Konum.merkez()` hiç parametre almaz; tüm alanlara başlatıcı listesinde sabit değer verir.
- `Konum.koordinat(...)` iki alanı `this.` ile parametreden, üçüncüsünü başlatıcı listesinden alır.
- İsimli kurucular, nesnenin **nasıl** oluşturulduğunu adıyla anlatır: `Konum.merkez()` okuyan herkes ne olduğunu anlar.

> 🔗 **Flutter'da:** İsimli kurucuları her gün kullanacaksınız: `EdgeInsets.all(16)`, `EdgeInsets.symmetric(horizontal: 8)`, `Image.network(adres)`, `Image.asset(dosya)`, `ListView.builder(...)`.

## 4.2 Yönlendiren kurucular

Bir isimli kurucu, işi aynı sınıfın başka bir kurucusuna devredebilir. Buna **yönlendiren kurucu** (redirecting constructor) denir ve `: this(...)` ile yazılır.

```dart
// Dosya: 04_02_yonlendiren_kurucu.dart
class Urun {
  final String ad;
  final double fiyat;
  final int stok;

  Urun(this.ad, this.fiyat, this.stok);

  Urun.ucretsiz(String ad) : this(ad, 0, 999);

  Urun.tukenmis(String ad, double fiyat) : this(ad, fiyat, 0);

  @override
  String toString() {
    String fiyatMetni = fiyat == 0 ? 'Ücretsiz' : '${fiyat.toStringAsFixed(2)} TL';
    return '$ad: $fiyatMetni (stok: $stok)';
  }
}

void main() {
  print(Urun('Kulaklık', 749.9, 8));
  print(Urun.ucretsiz('Hediye Çanta'));
  print(Urun.tukenmis('Akıllı Saat', 2400));
}
```

**Çıktı:**

```text
Kulaklık: 749.90 TL (stok: 8)
Hediye Çanta: Ücretsiz (stok: 999)
Akıllı Saat: 2400.00 TL (stok: 0)
```

**Açıklama:** `Urun.ucretsiz('Hediye Çanta')` çağrısı, `Urun('Hediye Çanta', 0, 999)` çağrısına dönüşür. Asıl kurulum mantığı tek bir yerde (ana kurucuda) kalır; isimli kurucular yalnızca kısayol sağlar.

## 4.3 Map'ten nesne oluşturmak: fromMap

İnternetten gelen veriler Hafta 3'te gördüğümüz gibi `Map<String, dynamic>` biçimindedir. Bu Map'leri nesnelere çevirmek için genellikle `fromMap` (veya `fromJson`) adlı isimli bir kurucu yazılır.

```dart
// Dosya: 04_03_from_map.dart
class Urun {
  final String ad;
  final double fiyat;
  final int stok;

  Urun(this.ad, this.fiyat, this.stok);

  Urun.fromMap(Map<String, dynamic> veri)
      : ad = veri['ad'] as String,
        fiyat = (veri['fiyat'] as num).toDouble(),
        stok = veri['stok'] as int;

  Map<String, dynamic> toMap() {
    return {'ad': ad, 'fiyat': fiyat, 'stok': stok};
  }

  @override
  String toString() => '$ad - ${fiyat.toStringAsFixed(2)} TL ($stok adet)';
}

void main() {
  // Bu verilerin bir sunucudan geldiğini düşünün
  List<Map<String, dynamic>> gelenVeri = [
    {'ad': 'Süt', 'fiyat': 32.5, 'stok': 12},
    {'ad': 'Ekmek', 'fiyat': 15, 'stok': 40},
  ];

  List<Urun> urunler = [];
  for (var veri in gelenVeri) {
    urunler.add(Urun.fromMap(veri));
  }

  for (var u in urunler) {
    print(u);
  }
  print(urunler[0].toMap());
}
```

**Çıktı:**

```text
Süt - 32.50 TL (12 adet)
Ekmek - 15.00 TL (40 adet)
{ad: Süt, fiyat: 32.5, stok: 12}
```

**Açıklama:**
- `veri['ad']` ifadesinin tipi `dynamic`'tir. `as String` ile "bunun bir String olduğundan eminim" deriz (Hafta 2, Bölüm 7.3).
- Ekmek'in fiyatı Map'te `15` (yani `int`) olarak geldi. `veri['fiyat'] as double` yazsaydık program çalışırken hata verirdi. `(veri['fiyat'] as num).toDouble()` hem `int` hem `double` gelen değerleri güvenle `double`'a çevirir. JSON verilerinde bu durum çok sık yaşanır.
- `toMap()` ters yönde çalışır: Nesneyi tekrar Map'e çevirir; veriyi kaydederken veya sunucuya gönderirken kullanılır.

## 4.4 static üyeler

Bazı bilgiler tek tek nesnelere değil, **sınıfın kendisine** aittir: oluşturulan toplam sipariş sayısı, tüm siparişler için geçerli kargo ücreti gibi. Bu üyeler `static` ile tanımlanır ve nesne üzerinden değil, **sınıf adı** üzerinden kullanılır.

```dart
// Dosya: 04_04_static.dart
class Siparis {
  static int toplamSiparis = 0;
  static const double kargoUcreti = 39.90;

  final int no;
  final double tutar;

  Siparis(this.tutar) : no = ++toplamSiparis;

  static double kargoHesapla(double tutar) => tutar >= 300 ? 0.0 : kargoUcreti;
}

void main() {
  Siparis a = Siparis(120);
  Siparis b = Siparis(450);

  print('Sipariş ${a.no}: kargo ${Siparis.kargoHesapla(a.tutar).toStringAsFixed(2)} TL');
  print('Sipariş ${b.no}: kargo ${Siparis.kargoHesapla(b.tutar).toStringAsFixed(2)} TL');
  print('Toplam sipariş: ${Siparis.toplamSiparis}');
}
```

**Çıktı:**

```text
Sipariş 1: kargo 39.90 TL
Sipariş 2: kargo 0.00 TL
Toplam sipariş: 2
```

**Açıklama:**
- `toplamSiparis` sınıfa ait **tek** bir değişkendir; her `Siparis` nesnesi oluştuğunda başlatıcı listesindeki `++toplamSiparis` onu bir artırır ve yeni değeri siparişin numarası yapar.
- `static` bir metot (`kargoHesapla`) bir nesneye ihtiyaç duymaz; bu yüzden içinde `this` ve nesne alanları kullanılamaz.
- `static` üyeler, bir sonraki bölümdeki `factory` kurucularda sıkça kullanılır.

## 4.5 factory kurucular

Normal bir kurucu **her çağrıldığında yeni bir nesne oluşturur**. Bazen bunu istemeyiz: Gelen değeri önce kontrol etmek, daha önce oluşturulmuş bir nesneyi geri vermek veya duruma göre farklı bir alt sınıfın nesnesini döndürmek isteyebiliriz. Bunun için **factory** kurucu kullanılır.

| Normal kurucu | factory kurucu |
|---|---|
| Her çağrıda yeni nesne oluşturur | Döndüreceği nesneye kendisi karar verir; `return` ile döndürür |
| Alanlara `this.` veya başlatıcı listesiyle değer verir | `this` kullanamaz; nesneyi başka bir kurucuyu çağırarak elde eder |

### Örnek 1: Gelen değerleri temizleyip doğrulamak

```dart
// Dosya: 04_05_factory_dogrulama.dart
class Urun {
  final String ad;
  final double fiyat;

  Urun._(this.ad, this.fiyat); // Private kurucu: yalnızca bu dosyadan çağrılabilir

  factory Urun(String ad, double fiyat) {
    String temizAd = ad.trim();
    if (temizAd.isEmpty) {
      temizAd = 'İsimsiz ürün';
    }
    double guvenliFiyat = fiyat < 0 ? 0.0 : fiyat;
    return Urun._(temizAd, guvenliFiyat);
  }

  @override
  String toString() => '$ad: ${fiyat.toStringAsFixed(2)} TL';
}

void main() {
  print(Urun('  Kulaklık ', 749.9));
  print(Urun('', 50));
  print(Urun('Kablo', -20));
}
```

**Çıktı:**

```text
Kulaklık: 749.90 TL
İsimsiz ürün: 50.00 TL
Kablo: 0.00 TL
```

**Açıklama:**
- Asıl kurucunun adı `Urun._`: Alt çizgiyle başladığı için **private**'tır (Bölüm 5); başka dosyalardan çağrılamaz.
- Dışarıdan herkes `Urun(...)` yazar ve bu çağrı `factory` kurucuya gider. Factory, değerleri temizler ve **ancak ondan sonra** private kurucuyla nesneyi oluşturur. Böylece programda hatalı verili bir `Urun` nesnesi oluşması imkânsız hale gelir.

### Örnek 2: Tek bir nesne (Singleton)

Bazı nesnelerden uygulamada **yalnızca bir tane** olmalıdır: uygulama ayarları, veritabanı bağlantısı. Buna **tekil nesne** (singleton) deseni denir.

```dart
// Dosya: 04_06_factory_singleton.dart
class Ayarlar {
  static final Ayarlar _tekOrnek = Ayarlar._ic();

  String tema = 'Açık';
  String dil = 'Türkçe';

  Ayarlar._ic() {
    print('Ayarlar yüklendi.');
  }

  factory Ayarlar() {
    return _tekOrnek;
  }
}

void main() {
  Ayarlar a1 = Ayarlar();
  Ayarlar a2 = Ayarlar();

  a1.tema = 'Koyu';
  print('a2.tema: ${a2.tema}');
  print('Aynı nesne mi? ${identical(a1, a2)}');
}
```

**Çıktı:**

```text
Ayarlar yüklendi.
a2.tema: Koyu
Aynı nesne mi? true
```

**Açıklama:**
- `Ayarlar()` iki kez çağrıldı ama "Ayarlar yüklendi." yalnızca **bir kez** yazıldı: Factory her seferinde aynı `_tekOrnek` nesnesini döndürüyor.
- `a1` üzerinden yapılan değişiklik `a2`'de de görünüyor; çünkü ikisi de aynı nesne.
- `identical(a, b)`, iki değişkenin **aynı nesneyi** gösterip göstermediğini söyler.
- `static final` alanlar ilk kullanıldıkları anda bir kez oluşturulur. Bu yüzden mesaj, ilk `Ayarlar()` çağrısında yazıldı.

### Örnek 3: Önbellek

```dart
// Dosya: 04_07_factory_onbellek.dart
class Renk {
  static final Map<String, Renk> _onbellek = {};

  final String ad;
  final String hex;

  Renk._(this.ad, this.hex);

  factory Renk.adiyla(String ad) {
    Renk? kayitli = _onbellek[ad];
    if (kayitli != null) {
      return kayitli;
    }

    String hex = switch (ad) {
      'kırmızı' => '#E53935',
      'yeşil' => '#43A047',
      'mavi' => '#1E88E5',
      _ => '#000000',
    };
    Renk yeni = Renk._(ad, hex);
    _onbellek[ad] = yeni;
    print('Yeni renk oluşturuldu: $ad');
    return yeni;
  }
}

void main() {
  Renk r1 = Renk.adiyla('mavi');
  Renk r2 = Renk.adiyla('mavi');
  Renk r3 = Renk.adiyla('yeşil');

  print('${r1.hex} ${r3.hex}');
  print('r1 ve r2 aynı mı? ${identical(r1, r2)}');
}
```

**Çıktı:**

```text
Yeni renk oluşturuldu: mavi
Yeni renk oluşturuldu: yeşil
#1E88E5 #43A047
r1 ve r2 aynı mı? true
```

**Açıklama:** Factory önce önbelleğe (bir `Map`'e) bakar. İstenen renk daha önce oluşturulduysa **aynı nesneyi** döndürür; oluşturulmadıysa yenisini oluşturup önbelleğe kaydeder. İkinci `'mavi'` isteğinde "Yeni renk oluşturuldu" yazılmadı. Sık kullanılan, oluşturması pahalı nesnelerde (resimler, yazı tipleri) bu yöntem bellek ve zaman kazandırır.

> **İleriye bakış:** Factory kurucuların bir başka önemli kullanımı, gelen veriye göre **farklı alt sınıfların** nesnelerini döndürmektir. Bunu kalıtımı öğrendikten sonra, Bölüm 9'daki uygulamada göreceğiz.

## 4.6 Hangi kurucu ne zaman?

| İhtiyaç | Kurucu türü | Örnek |
|---|---|---|
| Nesneyi alanlarının değerleriyle oluşturmak | Normal (üretken) kurucu | `Urun('Süt', 32.5, 12)` |
| Aynı sınıfı farklı yollarla oluşturmak | İsimli kurucu | `Konum.merkez()` |
| Başka bir kurucuya kısayol | Yönlendiren kurucu | `Urun.ucretsiz('Çanta')` |
| Map / JSON'dan nesne oluşturmak | İsimli kurucu (`fromMap`) veya factory | `Urun.fromMap(veri)` |
| Değişmeyecek, sabit nesneler | `const` kurucu | `const Konum(37.93, 41.94)` |
| Değer kontrolü, tekil nesne, önbellek, alt sınıf seçimi | `factory` kurucu | `Ayarlar()`, `Renk.adiyla('mavi')` |

---

# 5. Kapsülleme: Private Alanlar, Getter ve Setter

## 5.1 Sorun: Herkes her şeyi değiştirebiliyor

```dart
// Dosya: 05_01_kapsulleme_sorunu.dart
// ❌ MANTIK HATASI: Bakiye dışarıdan serbestçe değiştirilebiliyor.
class Cuzdan {
  double bakiye = 0;

  void paraYatir(double tutar) {
    if (tutar > 0) {
      bakiye += tutar;
    }
  }
}

void main() {
  Cuzdan c = Cuzdan();
  c.paraYatir(100);
  c.bakiye = -5000; // Kimse engellemiyor!
  print('Bakiye: ${c.bakiye}');
}
```

**Çıktı:**

```text
Bakiye: -5000.0
```

**Açıklama:** `paraYatir` metodu negatif tutarları engelliyor; ama programın herhangi bir yerinden `c.bakiye = -5000` yazılarak bu kural tamamen atlanabiliyor. **Kapsülleme** (encapsulation), bir nesnenin verisini dışarıya kapatıp yalnızca kontrollü yollarla (metotlar, getter ve setter'lar) erişime açmaktır.

## 5.2 Private alanlar: _ ile başlayan adlar

Dart'ta adı **alt çizgi (`_`) ile başlayan** her şey (alan, metot, kurucu, sınıf) **private**'tır.

> ⚠️ **Önemli fark:** Java ve C#'ta private "yalnızca bu sınıfın içinden erişilebilir" demektir. **Dart'ta private, "yalnızca bu dosyanın içinden erişilebilir" demektir.** Aynı dosyadaki her kod private üyelere erişebilir. Bu yüzden kapsüllemeyi görmek için sınıfı **ayrı bir dosyaya** koymamız gerekir.

Bu örnek **iki dosyadan** oluşur. İkisini de `hafta4` klasörüne kaydedin.

```dart
// Dosya: 05_02_cuzdan.dart
// BU BİR KÜTÜPHANE DOSYASIDIR: main fonksiyonu yoktur ve tek başına çalıştırılmaz.
// 05_03 ve 05_04 dosyaları bu dosyayı import eder.
class Cuzdan {
  double _bakiye = 0;
  int _islemSayisi = 0;

  bool paraYatir(double tutar) {
    if (tutar <= 0) {
      return false;
    }
    _bakiye += tutar;
    _islemSayisi++;
    return true;
  }

  bool paraCek(double tutar) {
    if (tutar <= 0 || tutar > _bakiye) {
      return false;
    }
    _bakiye -= tutar;
    _islemSayisi++;
    return true;
  }

  String ozet() => 'Bakiye: ${_bakiye.toStringAsFixed(2)} TL ($_islemSayisi işlem)';
}
```

```dart
// Dosya: 05_03_cuzdan_kullan.dart
import '05_02_cuzdan.dart';

void main() {
  Cuzdan c = Cuzdan();
  print(c.paraYatir(250));
  print(c.paraCek(1000));
  print(c.paraCek(99.90));
  print(c.paraYatir(-50));
  print(c.ozet());
}
```

**Çıktı:**

```text
true
false
true
false
Bakiye: 150.10 TL (2 işlem)
```

**Açıklama:**
- `import '05_02_cuzdan.dart';` satırı, aynı klasördeki diğer dosyada tanımlanan `Cuzdan` sınıfını bu dosyada kullanılabilir hale getirir.
- `05_03` dosyası `Cuzdan`'ı kullanabilir, metotlarını çağırabilir; ama `_bakiye` alanını **göremez**. Bakiyeyi değiştirmenin tek yolu `paraYatir` ve `paraCek` metotlarıdır ve bu metotlar kurallara uyar.
- Geçersiz işlemler (1000 TL çekmek, -50 TL yatırmak) `false` döndürdü ve işlem sayısına eklenmedi.

```dart
// Dosya: 05_04_tuzak_private.dart
// ❌ DERLEME HATASI
import '05_02_cuzdan.dart';

void main() {
  Cuzdan c = Cuzdan();
  c._bakiye = -5000;
}
```

**Hata mesajı:**

```text
The setter '_bakiye' isn't defined for the type 'Cuzdan'.
```

*Türkçesi: "Cuzdan tipinde '_bakiye' diye bir setter yok."* Başka bir dosyadan bakıldığında private alan hiç yokmuş gibi davranılır.

### Aynı dosyada private işe yaramaz

```dart
// Dosya: 05_05_ayni_dosya.dart
class Kasa {
  int _sifre = 1234;
}

void main() {
  Kasa k = Kasa();
  k._sifre = 0; // Aynı dosyada olduğumuz için hata YOK
  print(k._sifre);
}
```

**Çıktı:**

```text
0
```

**Açıklama:** `main` ile `Kasa` aynı dosyada olduğu için `_sifre`'ye erişim serbest. Bu bir hata değil, Dart'ın kuralıdır. Gerçek projelerde (ve Flutter'da) her sınıf genellikle kendi dosyasında durur; böylece private üyeler gerçekten korunmuş olur. Bu nottaki diğer örneklerde, okunabilirlik için sınıflar ve `main` aynı dosyada duracak.

## 5.3 Getter: Kontrollü okuma

Private bir alanın değerini dışarıya **yalnızca okunabilir** olarak açmak için **getter** kullanılır. Getter, çağrılırken **parantez kullanılmayan** bir metottur; dışarıdan bir alan gibi görünür.

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
DonusTipi get getterAdi => ifade;

DonusTipi get getterAdi {
  // birden fazla satır gerekiyorsa
  return deger;
}
```

```dart
// Dosya: 05_06_getter.dart
class Urun {
  final String ad;
  double _fiyat;
  int _stok;

  Urun(this.ad, this._fiyat, this._stok);

  double get fiyat => _fiyat;
  int get stok => _stok;

  // Hesaplanan getter'lar: bir alanı değil, alanlardan hesaplanan bir değeri verir
  double get kdvliFiyat => _fiyat * 1.20;
  bool get stoktaVar => _stok > 0;
  String get durum => switch (_stok) {
        0 => 'Tükendi',
        < 5 => 'Son $_stok ürün!',
        _ => 'Stokta',
      };

  void sat(int adet) {
    if (adet > 0 && adet <= _stok) {
      _stok -= adet;
    }
  }
}

void main() {
  Urun kulaklik = Urun('Kulaklık', 749.90, 6);

  print('${kulaklik.ad}: ${kulaklik.fiyat} TL');
  print('KDV dahil: ${kulaklik.kdvliFiyat.toStringAsFixed(2)} TL');
  print('Durum: ${kulaklik.durum}');
  kulaklik.sat(3);
  print('Durum: ${kulaklik.durum}');
  kulaklik.sat(3);
  print('Durum: ${kulaklik.durum} / stokta var mı? ${kulaklik.stoktaVar}');
}
```

**Çıktı:**

```text
Kulaklık: 749.9 TL
KDV dahil: 899.88 TL
Durum: Stokta
Durum: Son 3 ürün!
Durum: Tükendi / stokta var mı? false
```

**Açıklama:**
- `kulaklik.fiyat` yazıldığında `fiyat` getter'ı çalışır ve `_fiyat`'ın değerini döndürür. Dışarıdan okunabilir ama **değiştirilemez**; stok da yalnızca `sat` metoduyla azaltılabilir.
- `kdvliFiyat`, `stoktaVar` ve `durum` diye bir alan **yoktur**; her okunduklarında alanlardan yeniden hesaplanırlar. Bu yüzden stok değiştikçe `durum` da kendiliğinden güncellendi.
- Kurucuda `this._fiyat` gibi private alanlara da doğrudan değer verilebilir.

## 5.4 Setter: Kontrollü yazma

Bir alanın dışarıdan değiştirilmesine **kurallarla** izin vermek için **setter** kullanılır. Dışarıdan normal bir atama gibi görünür: `urun.fiyat = 2200;`

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
set setterAdi(Tip yeniDeger) {
  // kontrol et, sonra private alana ata
}
```

```dart
// Dosya: 05_07_setter.dart
class Urun {
  final String ad;
  double _fiyat;
  int _indirimYuzdesi = 0;

  Urun(this.ad, this._fiyat);

  double get fiyat => _fiyat;

  set fiyat(double yeniFiyat) {
    if (yeniFiyat < 0) {
      print('Uyarı: Fiyat negatif olamaz, değişiklik yapılmadı.');
      return;
    }
    _fiyat = yeniFiyat;
  }

  int get indirimYuzdesi => _indirimYuzdesi;

  set indirimYuzdesi(int yuzde) {
    if (yuzde < 0) {
      _indirimYuzdesi = 0;
    } else if (yuzde > 90) {
      _indirimYuzdesi = 90;
    } else {
      _indirimYuzdesi = yuzde;
    }
  }

  double get indirimliFiyat => _fiyat * (100 - _indirimYuzdesi) / 100;
}

void main() {
  Urun saat = Urun('Akıllı Saat', 2400);

  saat.fiyat = -100;
  saat.fiyat = 2200;
  saat.indirimYuzdesi = 150;
  print('İndirim: %${saat.indirimYuzdesi}');

  saat.indirimYuzdesi = 25;
  print('${saat.ad}: ${saat.fiyat.toStringAsFixed(2)} TL → '
      '${saat.indirimliFiyat.toStringAsFixed(2)} TL (%${saat.indirimYuzdesi} indirim)');
}
```

**Çıktı:**

```text
Uyarı: Fiyat negatif olamaz, değişiklik yapılmadı.
İndirim: %90
Akıllı Saat: 2200.00 TL → 1650.00 TL (%25 indirim)
```

**Açıklama:**
- `saat.fiyat = -100` yazıldığında gerçekte `fiyat` **setter'ı** çalıştı ve değeri reddetti.
- `saat.indirimYuzdesi = 150` yazıldığında setter değeri 0–90 aralığına sabitledi.
- Getter ve setter **aynı adı** taşıyabilir (`fiyat`). Dışarıdan bakan için `fiyat` sıradan bir alan gibidir; ama arkasında kurallar işler.

> **Getter ve setter'ın asıl faydası:** Sınıfı kullanan kod hiç değişmeden, sınıfın içindeki kurallar değiştirilebilir. Örneğin yarın "fiyat 100.000 TL'yi geçemez" kuralı gelirse, yalnızca setter'ı değiştirirsiniz; `saat.fiyat = ...` yazan yüzlerce satıra dokunmazsınız.

## 5.5 ❌ Getter ve setter tuzakları

```dart
// Dosya: 05_08_tuzak_getter_setter.dart
// ❌ DERLEME HATALARI
class Cuzdan {
  double _bakiye = 100;

  double get bakiye => _bakiye;
}

void main() {
  Cuzdan c = Cuzdan();
  print(c.bakiye());
  c.bakiye = 500;
}
```

| Satır | Sorun |
|---|---|
| `c.bakiye()` | Getter **parantezsiz** çağrılır. `bakiye` bir `double` döndürür; `double` bir fonksiyon olmadığı için VS Code "çağrılamaz" hatası verir. Doğrusu: `c.bakiye` |
| `c.bakiye = 500;` | *"There isn't a setter named 'bakiye' in class 'Cuzdan'."* Getter var ama setter yok; yani alan dışarıdan **salt okunur**. Bu bir hata değil, tasarımın kendisidir. |

## 5.6 Getter mı, metot mu?

| Getter kullanın | Metot kullanın |
|---|---|
| Sonuç, nesnenin bir **özelliği** gibi okunuyorsa: `urun.kdvliFiyat`, `sepet.bosMu` | Bir **eylem** yapılıyorsa: `urun.sat(2)`, `cuzdan.paraCek(50)` |
| Hesaplama hızlı ve yan etkisizse (hiçbir şeyi değiştirmiyorsa) | Nesnenin durumunu değiştiriyorsa |
| Parametre gerekmiyorsa | Parametre gerekiyorsa |

> 🔗 **Flutter'da:** Bir metin kutusunu yöneten `TextEditingController` nesnesinde `controller.text` hem getter hem setter'dır: Okuyunca kutudaki yazıyı verir, `controller.text = ''` yazınca kutuyu temizler. Kendi uygulamalarınızda da veri modellerinizi private alanlar ve getter'larla korumanız, ekranların veriyi yanlışlıkla bozmasını engeller.

---

# 6. Kalıtım: extends ve super

## 6.1 Sorun: Benzer sınıflarda kod tekrarı

Mağazamızda elektronik ürünler (garanti süresi var) ve gıda ürünleri (son kullanma tarihi var) olsun:

```dart
// Dosya: 06_01_kod_tekrari.dart
class Elektronik {
  String ad;
  double fiyat;
  int garantiAy;

  Elektronik(this.ad, this.fiyat, this.garantiAy);

  String etiket() => '$ad - ${fiyat.toStringAsFixed(2)} TL';
}

class Gida {
  String ad;
  double fiyat;
  String sonKullanma;

  Gida(this.ad, this.fiyat, this.sonKullanma);

  String etiket() => '$ad - ${fiyat.toStringAsFixed(2)} TL';
}

void main() {
  print(Elektronik('Kulaklık', 749.9, 24).etiket());
  print(Gida('Süt', 32.5, '15.10.2026').etiket());
}
```

**Çıktı:**

```text
Kulaklık - 749.90 TL
Süt - 32.50 TL
```

**Açıklama:** `ad`, `fiyat` ve `etiket()` iki sınıfta **birebir aynı**. Etiketin biçimini değiştirmek istesek iki yeri değiştirmemiz gerekir; ürün türü sayısı arttıkça bu tekrar da büyür. Oysa elektronik ürün de gıda ürünü de **birer üründür**. Ortak olanı bir yerde toplayıp farklı olanları ayrı tutmanın yolu **kalıtımdır** (inheritance).

## 6.2 extends ile kalıtım

```dart
// ŞABLON: Bu blok tek başına çalışmaz.
class AltSinif extends UstSinif {
  // Yalnızca alt sınıfa özgü alanlar ve metotlar
}
```

```dart
// Dosya: 06_02_extends.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);

  String etiket() => '$ad - ${fiyat.toStringAsFixed(2)} TL';
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, super.fiyat, this.garantiAy);

  String garantiBilgisi() => '$garantiAy ay garanti';
}

class Gida extends Urun {
  String sonKullanma;

  Gida(super.ad, super.fiyat, this.sonKullanma);
}

void main() {
  Elektronik kulaklik = Elektronik('Kulaklık', 749.9, 24);
  Gida sut = Gida('Süt', 32.5, '15.10.2026');

  print(kulaklik.etiket());
  print(kulaklik.garantiBilgisi());
  print(sut.etiket());
  print('Son kullanma: ${sut.sonKullanma}');
}
```

**Çıktı:**

```text
Kulaklık - 749.90 TL
24 ay garanti
Süt - 32.50 TL
Son kullanma: 15.10.2026
```

**Açıklama:**
- `class Elektronik extends Urun` → "Elektronik, Urun'u **genişletir**." `Elektronik`, `Urun`'un tüm alanlarını (`ad`, `fiyat`) ve metotlarını (`etiket`) **miras alır**; üstüne kendi alanını (`garantiAy`) ve metodunu (`garantiBilgisi`) ekler.
- `etiket()` metodu artık **tek bir yerde** yazılı; hem `Elektronik` hem `Gida` onu kullanıyor.
- `Elektronik(super.ad, super.fiyat, this.garantiAy)`: `super.ad` ve `super.fiyat`, ilk iki argümanı **üst sınıfın kurucusuna** iletir; `this.garantiAy` ise alt sınıfın kendi alanına atanır.

```text
              Urun
         (ad, fiyat, etiket)
            ▲          ▲
            │          │
    Elektronik         Gida
   (garantiAy)     (sonKullanma)
```

| Terim | Anlamı |
|---|---|
| **Üst sınıf** (superclass, ebeveyn) | Miras veren sınıf: `Urun` |
| **Alt sınıf** (subclass, çocuk) | Miras alan sınıf: `Elektronik`, `Gida` |
| **"... bir ...'dur" ilişkisi** | Kalıtım ancak bu cümle anlamlıysa kullanılır: "Elektronik **bir** üründür" ✔, "Sepet **bir** üründür" ✘ |

## 6.3 super ile üst sınıfın kurucusunu çağırmak

Alt sınıfın kurucusu, nesnenin üst sınıftan gelen kısmını kurmak için **önce üst sınıfın kurucusunu** çalıştırmak zorundadır. Bunun iki yazımı vardır:

```dart
// Dosya: 06_03_super_kurucu.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat) {
    print('1) Urun kurucusu çalıştı: $ad');
  }
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(String ad, double fiyat, this.garantiAy) : super(ad.trim(), fiyat) {
    print('2) Elektronik kurucusu çalıştı: $garantiAy ay garanti');
  }
}

void main() {
  Elektronik e = Elektronik('  Tablet ', 8999, 24);
  print('Oluşturulan: ${e.ad}');
}
```

**Çıktı:**

```text
1) Urun kurucusu çalıştı: Tablet
2) Elektronik kurucusu çalıştı: 24 ay garanti
Oluşturulan: Tablet
```

**Açıklama:**
- Önce **üst sınıfın** kurucusu, sonra **alt sınıfın** kurucusunun gövdesi çalıştı. Bir ev önce temelden kurulur.
- Burada `super.ad` kısa yazımı yerine başlatıcı listesinde `: super(ad.trim(), fiyat)` yazdık; çünkü değeri üst sınıfa göndermeden **önce işlemek** (boşluklarını temizlemek) istedik.

| Yazım | Ne zaman? |
|---|---|
| `Elektronik(super.ad, super.fiyat, this.garantiAy);` | Değerler üst sınıfa **olduğu gibi** gönderilecekse (en yaygın) |
| `Elektronik(String ad, ...) : super(ad.trim(), fiyat);` | Değer üst sınıfa gönderilmeden önce işlenecekse |

### ❌ super çağrısını unutmak

```dart
// Dosya: 06_04_tuzak_super.dart
// ❌ DERLEME HATASI
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(this.garantiAy);
}

void main() {
  print(Elektronik(24).garantiAy);
}
```

**Hata mesajı:**

```text
The superclass 'Urun' doesn't have a zero argument constructor.
```

*Türkçesi: "Üst sınıf 'Urun'un parametresiz bir kurucusu yok."* Alt sınıfın kurucusunda `super` çağrısı yazılmazsa Dart, üst sınıfın **parametresiz** kurucusunu çağırmaya çalışır. `Urun`'un kurucusu ise `ad` ve `fiyat` istiyor. Düzeltme: `Elektronik(super.ad, super.fiyat, this.garantiAy);`

## 6.4 Her sınıfın atası: Object

Dart'ta `extends` yazmadığınız her sınıf, aslında `Object` sınıfını genişletir. `toString()`, `==`, `runtimeType` gibi üyeler oradan gelir.

```dart
// Dosya: 06_05_object.dart
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  Elektronik(super.ad);
}

void main() {
  Elektronik e = Elektronik('Kulaklık');
  print(e.runtimeType);
  print(e.toString());
  print(e.ad);
}
```

**Çıktı:**

```text
Elektronik
Instance of 'Elektronik'
Kulaklık
```

```text
        Object        ← toString(), ==, runtimeType ...
          ▲
         Urun         ← ad, fiyat, etiket()
        ▲    ▲
Elektronik    Gida
```

**Açıklama:**
- `runtimeType`, nesnenin **gerçek** sınıfının adını verir.
- `toString()` metodunu hiçbir sınıfta yazmadık; `Object`'ten miras geldi.
- **Dart'ta tek kalıtım vardır:** Bir sınıf yalnızca **bir** sınıfı `extends` edebilir. Birden fazla kaynaktan özellik almanın yollarını (`implements`, `with`) 5. haftada göreceğiz.

---

# 7. Override: Metotları Yeniden Tanımlamak

## 7.1 Alt sınıf, üst sınıfın davranışını değiştirebilir

Bütün ürünler kargolanır ama her türün kargo ücreti farklı hesaplanır. Alt sınıf, üst sınıftan aldığı bir metodu **kendine göre yeniden tanımlayabilir**. Buna **override** (geçersiz kılma) denir.

```dart
// Dosya: 07_01_override.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);

  double kargoUcreti() => 29.90;

  @override
  String toString() => '$ad (${fiyat.toStringAsFixed(2)} TL)';
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, super.fiyat, this.garantiAy);

  @override
  double kargoUcreti() => fiyat >= 1000 ? 0.0 : 49.90;
}

class Gida extends Urun {
  bool soguk;

  Gida(super.ad, super.fiyat, {this.soguk = false});

  @override
  double kargoUcreti() => soguk ? 59.90 : 19.90;
}

void main() {
  Urun kitap = Urun('Kitap', 120);
  Elektronik tablet = Elektronik('Tablet', 8999, 24);
  Elektronik kablo = Elektronik('Kablo', 129.9, 6);
  Gida dondurma = Gida('Dondurma', 85, soguk: true);
  Gida makarna = Gida('Makarna', 25);

  print('$kitap → kargo: ${kitap.kargoUcreti().toStringAsFixed(2)} TL');
  print('$tablet → kargo: ${tablet.kargoUcreti().toStringAsFixed(2)} TL');
  print('$kablo → kargo: ${kablo.kargoUcreti().toStringAsFixed(2)} TL');
  print('$dondurma → kargo: ${dondurma.kargoUcreti().toStringAsFixed(2)} TL');
  print('$makarna → kargo: ${makarna.kargoUcreti().toStringAsFixed(2)} TL');
}
```

**Çıktı:**

```text
Kitap (120.00 TL) → kargo: 29.90 TL
Tablet (8999.00 TL) → kargo: 0.00 TL
Kablo (129.90 TL) → kargo: 49.90 TL
Dondurma (85.00 TL) → kargo: 59.90 TL
Makarna (25.00 TL) → kargo: 19.90 TL
```

**Açıklama:**
- Beş nesnede de aynı metot (`kargoUcreti()`) çağrıldı, ama her nesne **kendi sınıfındaki** sürümü çalıştırdı. Düz `Urun` için üst sınıftaki sürüm (29.90), diğerleri için override edilmiş sürümler çalıştı.
- `toString()` ise yalnızca `Urun`'da yazıldı; alt sınıflar onu **olduğu gibi** miras aldı.
- Bir alt sınıf, istediği metodu override eder; istemediğini olduğu gibi kullanır.

## 7.2 @override etiketi neden önemli?

`@override` bir **etikettir** (annotation): "Bu metot, üst sınıftaki bir metodu yeniden tanımlıyor" der. Yazılmasa da program çalışır, ama yazmak sizi önemli bir hatadan korur:

```dart
// Dosya: 07_02_tuzak_override_yazim.dart
// ❌ UYARI ve MANTIK HATASI: Metot adı yanlış yazılmış.
class Urun {
  String ad;

  Urun(this.ad);

  double kargoUcreti() => 29.90;
}

class Elektronik extends Urun {
  Elektronik(super.ad);

  @override
  double kargoUcret() => 0; // "kargoUcreti" olmalıydı
}

void main() {
  Elektronik e = Elektronik('Tablet');
  print(e.kargoUcreti());
}
```

**Uyarı mesajı:**

```text
The method doesn't override an inherited method.
```

**Çıktı:**

```text
29.9
```

**Açıklama:** Metodun adındaki bir harf eksik olduğu için `kargoUcret` **yeni bir metot** oldu; üst sınıftaki `kargoUcreti` override edilmedi. Program çalıştı ama tabletin kargosu ücretsiz olması gerekirken 29.9 TL çıktı. `@override` yazdığımız için VS Code bu hatayı **hemen** yakaladı. `@override` yazılmasaydı hiçbir uyarı gelmezdi ve hata ancak bir müşteri şikâyet ettiğinde fark edilirdi.

> **Kural:** Override ettiğiniz **her** metodun üstüne `@override` yazın.

## 7.3 ❌ Override kuralları

Override edilen metot, üst sınıftaki metotla **uyumlu** olmalıdır: aynı ad, uyumlu parametreler, uyumlu dönüş tipi.

```dart
// Dosya: 07_03_tuzak_override_imza.dart
// ❌ DERLEME HATASI
class Urun {
  double kargoUcreti() => 29.90;
}

class Elektronik extends Urun {
  @override
  int kargoUcreti() => 0;
}

void main() {
  print(Elektronik().kargoUcreti());
}
```

**Hata mesajı:**

```text
'Elektronik.kargoUcreti' ('int Function()') isn't a valid override of 'Urun.kargoUcreti' ('double Function()').
```

*Türkçesi: "Elektronik'teki kargoUcreti (int döndüren fonksiyon), Urun'daki kargoUcreti'nin (double döndüren fonksiyon) geçerli bir yeniden tanımı değildir."* Programın geri kalanı `Urun`'un `kargoUcreti()` metodunun `double` döndüreceğine güveniyor; alt sınıf bu sözü bozamaz.

## 7.4 super.metot() ile üst sınıfın davranışını genişletmek

Bazen üst sınıfın yaptığını tamamen değiştirmek değil, **üstüne eklemek** isteriz. Bunun için override edilen metodun içinden `super.metotAdi()` ile üst sınıftaki sürüm çağrılır.

```dart
// Dosya: 07_04_super_metot.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);

  String etiket() => '$ad - ${fiyat.toStringAsFixed(2)} TL';
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, super.fiyat, this.garantiAy);

  @override
  String etiket() => '${super.etiket()} | $garantiAy ay garanti';
}

class IndirimliUrun extends Urun {
  int indirimYuzdesi;

  IndirimliUrun(super.ad, super.fiyat, this.indirimYuzdesi);

  @override
  String etiket() {
    double yeniFiyat = fiyat * (100 - indirimYuzdesi) / 100;
    return '${super.etiket()} → ${yeniFiyat.toStringAsFixed(2)} TL (%$indirimYuzdesi)';
  }
}

void main() {
  print(Urun('Defter', 45).etiket());
  print(Elektronik('Kulaklık', 749.9, 24).etiket());
  print(IndirimliUrun('Mont', 1800, 30).etiket());
}
```

**Çıktı:**

```text
Defter - 45.00 TL
Kulaklık - 749.90 TL | 24 ay garanti
Mont - 1800.00 TL → 1260.00 TL (%30)
```

**Açıklama:** `super.etiket()` üst sınıftaki etiketi üretir; alt sınıflar onun **sonuna** kendi bilgilerini ekler. Yarın `Urun`'un etiket biçimi değişirse (ör. fiyatın önüne "₺" eklenirse), bu değişiklik alt sınıfların etiketlerine de **kendiliğinden** yansır.

| İfade | Anlamı |
|---|---|
| `super(...)` / `super.ad` (kurucuda) | Üst sınıfın **kurucusunu** çağır |
| `super.etiket()` (metotta) | Üst sınıfın **metodunu** çağır |
| `this.ad` | **Bu** nesnenin alanı |

> 🔗 **Flutter'da:** Yazacağınız her ekran şu kalıpla başlar:
> ```dart
> class KarsilamaEkrani extends StatelessWidget {
>   const KarsilamaEkrani({super.key});
>
>   @override
>   Widget build(BuildContext context) {
>     return const Text('Merhaba');
>   }
> }
> ```
> Bu birkaç satırda bu haftanın neredeyse tüm konuları var: `extends` ile kalıtım, `const` kurucu, `super.key` ile üst sınıfa parametre iletme, `@override` ile `build` metodunu yeniden tanımlama. Flutter, ekranı çizmesi gerektiğinde **sizin** `build` metodunuzu çağırır.

---

# 8. Polimorfizm ve is

## 8.1 Üst sınıf tipinde değişken, alt sınıf nesnesi

Kalıtımın en güçlü sonucu şudur: **Alt sınıfın nesnesi, üst sınıf tipindeki bir değişkene konabilir.** Çünkü her `Elektronik` aynı zamanda bir `Urun`'dur.

```dart
// Dosya: 08_01_ust_tip.dart
class Urun {
  String ad;

  Urun(this.ad);

  String tanit() => '$ad bir üründür.';
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);

  @override
  String tanit() => '$ad bir elektronik üründür ($garantiAy ay garanti).';
}

void main() {
  Urun u = Elektronik('Kulaklık', 24);
  print(u.tanit());
  print(u.runtimeType);
}
```

**Çıktı:**

```text
Kulaklık bir elektronik üründür (24 ay garanti).
Elektronik
```

**Açıklama:** `u` değişkeninin **tanımlanan tipi** (statik tip) `Urun`'dur; ama gösterdiği nesnenin **gerçek tipi** (çalışma zamanı tipi) `Elektronik`'tir. `u.tanit()` çağrıldığında Dart, nesnenin **gerçek** tipine bakar ve `Elektronik`'teki sürümü çalıştırır.

```dart
// Dosya: 08_02_tuzak_ust_tip.dart
// ❌ DERLEME HATASI
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);
}

void main() {
  Urun u = Elektronik('Kulaklık', 24);
  print(u.garantiAy);
}
```

**Hata mesajı:**

```text
The getter 'garantiAy' isn't defined for the type 'Urun'.
```

**Açıklama:** Nesne gerçekte bir `Elektronik` olsa da derleyici yalnızca değişkenin **tanımlanan** tipine (`Urun`) bakar. Her `Urun`'un garantisi olmadığı için `u.garantiAy` yazmak yasaktır. Bu bilgiye nasıl ulaşacağımızı Bölüm 8.3'te göreceğiz.

| Ne belirler? | Statik tip (`Urun`) | Gerçek tip (`Elektronik`) |
|---|---|---|
| Hangi üyelere **erişebilirim**? | ✔ | |
| Hangi metot sürümü **çalışır**? | | ✔ |

## 8.2 Polimorfizm

**Polimorfizm** (çok biçimlilik), aynı çağrının nesnenin gerçek tipine göre **farklı davranışlar** üretmesidir. En çok, farklı türden nesneleri **tek bir listede** tutup aynı şekilde işlerken işe yarar.

```dart
// Dosya: 08_03_polimorfizm.dart
class Bildirim {
  String baslik;

  Bildirim(this.baslik);

  String goster() => '[Bildirim] $baslik';
  int oncelik() => 1;
}

class MesajBildirimi extends Bildirim {
  String gonderen;

  MesajBildirimi(super.baslik, this.gonderen);

  @override
  String goster() => '[Mesaj] $gonderen: $baslik';

  @override
  int oncelik() => 2;
}

class GuvenlikBildirimi extends Bildirim {
  GuvenlikBildirimi(super.baslik);

  @override
  String goster() => '[GÜVENLİK] $baslik';

  @override
  int oncelik() => 3;
}

void main() {
  List<Bildirim> bildirimler = [
    Bildirim('Uygulama güncellendi'),
    MesajBildirimi('Akşam toplantı var mı?', 'Ayşe'),
    GuvenlikBildirimi('Yeni cihazdan giriş yapıldı'),
    MesajBildirimi('Ödev dosyası ekte', 'Mert'),
  ];

  int toplamOncelik = 0;
  for (Bildirim b in bildirimler) {
    print(b.goster());
    toplamOncelik += b.oncelik();
  }
  print('Toplam öncelik puanı: $toplamOncelik');
}
```

**Çıktı:**

```text
[Bildirim] Uygulama güncellendi
[Mesaj] Ayşe: Akşam toplantı var mı?
[GÜVENLİK] Yeni cihazdan giriş yapıldı
[Mesaj] Mert: Ödev dosyası ekte
Toplam öncelik puanı: 8
```

**Açıklama:**
- Döngü, hangi bildirimin hangi türde olduğunu **bilmiyor ve bilmesine gerek yok**. Her nesneye "kendini göster" diyor; her nesne kendi bildiği şekilde gösteriyor.
- Yarın `KampanyaBildirimi` diye yeni bir tür eklesek, yalnızca yeni bir sınıf yazarız; **döngüye tek satır bile dokunmayız**. Polimorfizmin asıl değeri budur: Yeni özellik eklemek mevcut kodu bozmaz.

> 🔗 **Flutter'da:** `Column(children: [Text('Başlık'), Icon(Icons.star), ElevatedButton(...)])` yazdığınızda `children`, bir `List<Widget>`'tır. İçindeki her nesne farklı bir sınıftandır ama hepsi `Widget`'tır. Flutter bu listeyi dolaşıp her birine "kendini çiz" der. Flutter'ın tüm arayüz sistemi polimorfizm üzerine kuruludur.

## 8.3 is ile tip kontrolü

Bazen bir nesnenin hangi alt sınıftan olduğunu bilip, yalnızca o alt sınıfta bulunan bir bilgiye erişmemiz gerekir. Bunun için Hafta 2'de gördüğümüz `is` operatörü kullanılır.

```dart
// Dosya: 08_04_is_tip_kontrolu.dart
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, super.fiyat, this.garantiAy);
}

class Gida extends Urun {
  String sonKullanma;

  Gida(super.ad, super.fiyat, this.sonKullanma);
}

void main() {
  List<Urun> sepet = [
    Elektronik('Kulaklık', 749.9, 24),
    Gida('Süt', 32.5, '15.10.2026'),
    Urun('Defter', 45),
    Gida('Yoğurt', 55, '12.10.2026'),
  ];

  int gidaSayisi = 0;
  for (Urun u in sepet) {
    if (u is Elektronik) {
      print('${u.ad}: ${u.garantiAy} ay garanti');
    } else if (u is Gida) {
      gidaSayisi++;
      print('${u.ad}: SKT ${u.sonKullanma}');
    } else {
      print('${u.ad}: ek bilgi yok');
    }
  }
  print('Sepette $gidaSayisi gıda ürünü var.');
}
```

**Çıktı:**

```text
Kulaklık: 24 ay garanti
Süt: SKT 15.10.2026
Defter: ek bilgi yok
Yoğurt: SKT 12.10.2026
Sepette 2 gıda ürünü var.
```

**Açıklama:**
- `u is Elektronik` → "u'nun gösterdiği nesne bir Elektronik mi?"
- `if` bloğunun içinde Dart, `u`'nun bir `Elektronik` olduğundan emin olduğu için onu otomatik olarak `Elektronik` kabul eder ve `u.garantiAy` yazmaya izin verir. Buna **tip yükseltme** (type promotion) denir; Hafta 1'de `null` kontrolünden sonra gördüğümüz davranışın aynısıdır.
- Bir `Elektronik` nesnesi için `u is Urun` sonucu da `true`'dur: Her elektronik ürün aynı zamanda bir üründür.

## 8.4 as ve is!

| Operatör | Anlamı | Örnek |
|---|---|---|
| `is` | Bu tipte mi? | `u is Gida` |
| `is!` | Bu tipte **değil** mi? | `u is! Gida` |
| `as` | Bu tipe **dönüştür**; değilse çalışma zamanı hatası | `u as Elektronik` |

```dart
// Dosya: 08_05_as_is_degil.dart
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);
}

class Gida extends Urun {
  Gida(super.ad);
}

void main() {
  Urun u = Elektronik('Tablet', 24);

  if (u is! Gida) {
    print('${u.ad} bir gıda ürünü değil.');
  }

  Elektronik e = u as Elektronik;
  print('Garanti: ${e.garantiAy} ay');
}
```

**Çıktı:**

```text
Tablet bir gıda ürünü değil.
Garanti: 24 ay
```

```dart
// Dosya: 08_06_tuzak_as.dart
// ❌ ÇALIŞMA ZAMANI HATASI
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);
}

class Gida extends Urun {
  Gida(super.ad);
}

void main() {
  Urun s = Gida('Süt');
  Elektronik e = s as Elektronik;
  print(e.garantiAy);
}
```

**Çıktı (bir bölümü):**

```text
Unhandled exception:
type 'Gida' is not a subtype of type 'Elektronik' in type cast
```

**Açıklama:** `as`, derleyiciye "bana güven, bu bir Elektronik" demektir. Güven boşa çıkarsa program **çalışırken** çöker. Bu yüzden emin olmadığınız durumlarda `as` yerine `is` ile kontrol edin; `is` hem kontrol eder hem de tipi yükseltir.

## 8.5 switch ile tip desenleri

Hafta 2'de gördüğümüz switch ifadesi, tiplere göre de dallanabilir. Birden fazla alt sınıfın olduğu durumlarda `if-else if` zincirinden daha okunurdur:

```dart
// Dosya: 08_07_switch_tip_deseni.dart
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);
}

class Gida extends Urun {
  String sonKullanma;

  Gida(super.ad, this.sonKullanma);
}

String ekBilgi(Urun u) => switch (u) {
      Elektronik e => '${e.garantiAy} ay garanti',
      Gida g => 'SKT: ${g.sonKullanma}',
      _ => 'Ek bilgi yok',
    };

void main() {
  List<Urun> sepet = [
    Elektronik('Kulaklık', 24),
    Gida('Süt', '15.10.2026'),
    Urun('Defter'),
  ];

  for (Urun u in sepet) {
    print('${u.ad.padRight(9)}→ ${ekBilgi(u)}');
  }
}
```

**Çıktı:**

```text
Kulaklık → 24 ay garanti
Süt      → SKT: 15.10.2026
Defter   → Ek bilgi yok
```

**Açıklama:** `Elektronik e => ...` kolu şöyle okunur: "Değer bir `Elektronik` ise onu `e` adıyla al ve bu ifadeyi üret." `e`, kolun içinde `Elektronik` tipindedir; `e.garantiAy` doğrudan kullanılabilir. Kollar yukarıdan aşağıya denenir; `_` kolu eşleşmeyen her şeyi yakalar.

## 8.6 ❌ Nesnenin alanları yükseltilemez

```dart
// Dosya: 08_08_tuzak_alan_yukseltme.dart
// ❌ DERLEME HATASI
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);
}

class SepetKalemi {
  Urun urun;
  int adet;

  SepetKalemi(this.urun, this.adet);
}

void main() {
  SepetKalemi kalem = SepetKalemi(Elektronik('Kulaklık', 24), 1);
  if (kalem.urun is Elektronik) {
    print(kalem.urun.garantiAy);
  }
}
```

**Hata mesajı:**

```text
The getter 'garantiAy' isn't defined for the type 'Urun'.
```

**Açıklama:** `is` kontrolü yapılmasına rağmen tip yükseltme çalışmadı. Çünkü `kalem.urun` bir **yerel değişken değil, bir nesnenin alanıdır**. Dart'ın gözünde kontrol ile kullanım arasında bu alanın değeri değişebilir (ör. alt sınıflar onu bir getter'la her seferinde farklı döndürebilir). VS Code hata mesajının altında bunun nedenini de açıklar. Çözüm: Değeri önce **yerel bir değişkene** alın.

```dart
// Dosya: 08_09_alan_yukseltme_dogru.dart
class Urun {
  String ad;

  Urun(this.ad);
}

class Elektronik extends Urun {
  int garantiAy;

  Elektronik(super.ad, this.garantiAy);
}

class SepetKalemi {
  Urun urun;
  int adet;

  SepetKalemi(this.urun, this.adet);
}

void main() {
  SepetKalemi kalem = SepetKalemi(Elektronik('Kulaklık', 24), 1);
  Urun u = kalem.urun;
  if (u is Elektronik) {
    print('${u.ad}: ${u.garantiAy} ay garanti');
  }
}
```

**Çıktı:**

```text
Kulaklık: 24 ay garanti
```

## 8.7 is mi, override mı?

`is` ile tip kontrolü kullanışlıdır, ama aşırı kullanımı bir uyarı işaretidir. Şu iki yazımı karşılaştırın:

| `is` zinciriyle | Override ile (polimorfizm) |
|---|---|
| `if (u is Elektronik) { kargo = ...; } else if (u is Gida) { kargo = ...; }` | `kargo = u.kargoUcreti();` |
| Yeni bir ürün türü eklendiğinde bu zincirin bulunduğu **her yer** değiştirilmeli | Yeni tür kendi `kargoUcreti`'ni yazar; mevcut koda dokunulmaz |
| Unutulan bir yer sessizce yanlış sonuç verir | Unutmak mümkün değil; kural sınıfın içinde |

> **Kural:** Bir davranış nesnenin türüne göre değişiyorsa, o davranışı **sınıfın içine bir metot** olarak koyun ve override edin. `is`'i, yalnızca belirli bir alt türe özgü **veriye** (ör. garanti süresi) erişmeniz gerektiğinde kullanın. Bölüm 10'daki problemde bu farkı üç çözüm üzerinde göreceğiz.

---

# 9. Hepsini Birleştirelim: Cep Market v2

Hafta 3'teki sepet programını bu haftanın araçlarıyla yeniden yazıyoruz. Ürünler artık birer nesne; farklı ürün türleri kalıtımla tanımlanıyor; kargo ve KDV kuralları polimorfizmle her türün kendi sınıfında duruyor; katalog, bir `factory` kurucuyla Map verisinden oluşturuluyor.

```dart
// Dosya: 09_01_cep_market_oop.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

class Urun {
  final String ad;
  double _fiyat;
  int _stok;

  Urun(this.ad, this._fiyat, this._stok);

  factory Urun.fromMap(Map<String, dynamic> veri) {
    String ad = veri['ad'] as String;
    double fiyat = (veri['fiyat'] as num).toDouble();
    int stok = veri['stok'] as int;

    return switch (veri['tur']) {
      'elektronik' => Elektronik(ad, fiyat, stok, veri['garanti'] as int),
      'gida' => Gida(ad, fiyat, stok, soguk: veri['soguk'] == true),
      _ => Urun(ad, fiyat, stok),
    };
  }

  double get fiyat => _fiyat;
  int get stok => _stok;
  double get kdvOrani => 0.20;

  double kargoUcreti() => 29.90;

  bool stoktanDus(int adet) {
    if (adet <= 0 || adet > _stok) {
      return false;
    }
    _stok -= adet;
    return true;
  }

  @override
  String toString() => ad;
}

class Elektronik extends Urun {
  final int garantiAy;

  Elektronik(super.ad, super.fiyat, super.stok, this.garantiAy);

  @override
  double kargoUcreti() => fiyat >= 1000 ? 0.0 : 49.90;

  @override
  String toString() => '$ad ($garantiAy ay garanti)';
}

class Gida extends Urun {
  final bool soguk;

  Gida(super.ad, super.fiyat, super.stok, {this.soguk = false});

  @override
  double get kdvOrani => 0.01;

  @override
  double kargoUcreti() => soguk ? 59.90 : 19.90;

  @override
  String toString() => soguk ? '$ad (soğuk zincir)' : ad;
}

class SepetKalemi {
  final Urun urun;
  final int adet;

  SepetKalemi(this.urun, this.adet);

  double get araToplam => urun.fiyat * adet;
  double get kdv => araToplam * urun.kdvOrani;
}

class Sepet {
  static const double ucretsizKargoLimiti = 1500;

  final List<SepetKalemi> _kalemler = [];

  bool get bosMu => _kalemler.isEmpty;

  void ekle(Urun urun, {int adet = 1}) {
    if (!urun.stoktanDus(adet)) {
      print('${urun.ad}: Yetersiz stok (${urun.stok} adet var).');
      return;
    }
    _kalemler.add(SepetKalemi(urun, adet));
    print('${urun.ad} x$adet sepete eklendi.');
  }

  double get araToplam {
    double toplam = 0;
    for (SepetKalemi k in _kalemler) {
      toplam += k.araToplam;
    }
    return toplam;
  }

  double get kdvToplami {
    double toplam = 0;
    for (SepetKalemi k in _kalemler) {
      toplam += k.kdv;
    }
    return toplam;
  }

  double get kargo {
    if (araToplam >= ucretsizKargoLimiti) {
      return 0.0;
    }
    double enYuksek = 0;
    for (SepetKalemi k in _kalemler) {
      double ucret = k.urun.kargoUcreti();
      if (ucret > enYuksek) {
        enYuksek = ucret;
      }
    }
    return enYuksek;
  }

  void fisYazdir() {
    if (bosMu) {
      print('Sepetiniz boş.');
      return;
    }
    print('=============== FİŞ ===============');
    for (SepetKalemi k in _kalemler) {
      print('${k.urun.toString().padRight(24)} x${k.adet} ${k.araToplam.toStringAsFixed(2).padLeft(9)}');
    }
    print('-' * 35);
    print('Ara toplam : ${tl(araToplam)}');
    print('KDV        : ${tl(kdvToplami)}');
    print('Kargo      : ${kargo == 0 ? 'Ücretsiz' : tl(kargo)}');
    print('TOPLAM     : ${tl(araToplam + kdvToplami + kargo)}');
  }
}

void main() {
  List<Map<String, dynamic>> katalogVerisi = [
    {'tur': 'elektronik', 'ad': 'Kulaklık', 'fiyat': 749.90, 'stok': 5, 'garanti': 24},
    {'tur': 'gida', 'ad': 'Süt', 'fiyat': 32.50, 'stok': 20},
    {'tur': 'gida', 'ad': 'Dondurma', 'fiyat': 85, 'stok': 2, 'soguk': true},
    {'tur': 'diger', 'ad': 'Defter', 'fiyat': 45, 'stok': 30},
  ];

  List<Urun> katalog = [];
  for (var veri in katalogVerisi) {
    katalog.add(Urun.fromMap(veri));
  }

  print('Katalog:');
  for (Urun u in katalog) {
    print('- $u: ${tl(u.fiyat)} (${u.runtimeType})');
  }
  print('');

  Sepet sepet = Sepet();
  sepet.ekle(katalog[0]);
  sepet.ekle(katalog[1], adet: 2);
  sepet.ekle(katalog[2], adet: 5);
  sepet.ekle(katalog[2], adet: 2);
  sepet.ekle(katalog[3], adet: 2);
  print('');

  sepet.fisYazdir();
  print('Dondurma stoğu: ${katalog[2].stok}');
}
```

**Çıktı:**

```text
Katalog:
- Kulaklık (24 ay garanti): 749.90 TL (Elektronik)
- Süt: 32.50 TL (Gida)
- Dondurma (soğuk zincir): 85.00 TL (Gida)
- Defter: 45.00 TL (Urun)

Kulaklık x1 sepete eklendi.
Süt x2 sepete eklendi.
Dondurma: Yetersiz stok (2 adet var).
Dondurma x2 sepete eklendi.
Defter x2 sepete eklendi.

=============== FİŞ ===============
Kulaklık (24 ay garanti) x1    749.90
Süt                      x2     65.00
Dondurma (soğuk zincir)  x2    170.00
Defter                   x2     90.00
-----------------------------------
Ara toplam : 1074.90 TL
KDV        : 170.33 TL
Kargo      : 59.90 TL
TOPLAM     : 1305.13 TL
Dondurma stoğu: 0
```

**Programda hangi konu nerede?**

| Kod parçası | Konu | Bölüm |
|---|---|---|
| `class Urun { ... }`, `List<Urun> katalog` | Sınıf, nesne, nesne listesi | 2 |
| `Urun(this.ad, this._fiyat, this._stok)` | Kurucu, `this` ile atama, private alana atama | 3, 5 |
| `final String ad;` | Değişmeyen alan | 3.6 |
| `factory Urun.fromMap(...)` | Map'ten nesne; veriye göre **farklı alt sınıf** döndüren factory | 4.3, 4.5 |
| `static const double ucretsizKargoLimiti` | Sınıfa ait sabit | 4.4 |
| `double _fiyat`, `List<SepetKalemi> _kalemler` | Private alanlar | 5.2 |
| `double get fiyat`, `double get araToplam`, `bool get bosMu` | Getter ve hesaplanan getter | 5.3 |
| `class Elektronik extends Urun` | Kalıtım | 6 |
| `Elektronik(super.ad, super.fiyat, super.stok, this.garantiAy)` | `super` ile üst sınıf kurucusu | 6.3 |
| `@override double kargoUcreti()`, `@override double get kdvOrani` | Metodu ve getter'ı override etmek | 7 |
| `k.urun.kargoUcreti()`, `'${k.urun}'` | Polimorfizm: her ürün kendi kuralını uygular | 8.2 |
| `switch (veri['tur']) { 'elektronik' => ... }` | Switch ifadesi | Hafta 2 |

**Açıklama:**
- **Factory'nin gücü:** `Urun.fromMap` çağıran kod, gelen verinin elektronik mi gıda mı olduğunu bilmek zorunda değil; factory Map'teki `'tur'` değerine bakıp **doğru alt sınıfın** nesnesini döndürüyor. Katalog listesinde `runtimeType` sütunu bunu gösteriyor. Normal bir kurucu bunu yapamaz; o her zaman kendi sınıfının nesnesini oluşturur.
- **Polimorfizmin gücü:** `Sepet` sınıfı hiçbir yerde `is Elektronik` veya `is Gida` diye sormuyor. KDV için `urun.kdvOrani`, kargo için `urun.kargoUcreti()` çağırıyor; her ürün kendi kuralını uyguluyor. Gıdada KDV %1, diğerlerinde %20; sepetteki en yüksek kargo ücreti dondurmanın soğuk zincir ücreti (59.90 TL).
- **Kapsüllemenin gücü:** Stok yalnızca `stoktanDus` metoduyla azalabiliyor. 5 dondurma isteği reddedildi ve stok hiç değişmedi; 2 dondurma isteği kabul edildi.

> **Deneyin:**
> 1. Kataloğa `{'tur': 'elektronik', 'ad': 'Tablet', 'fiyat': 8999, 'stok': 3, 'garanti': 24}` ekleyip sepete koyun. Ara toplam 1500 TL'yi geçtiği için kargo `Ücretsiz` olmalı.
> 2. `Kitap` adında yeni bir alt sınıf ekleyin: KDV oranı %0, kargo ücreti 14.90 TL. `fromMap`'e `'kitap'` kolunu ekleyin. `Sepet` sınıfında **hiçbir değişiklik yapmanız gerekmediğini** gözlemleyin.

> 🔗 **Flutter'da:** Bu programın `Urun`, `SepetKalemi` ve `Sepet` sınıfları, bir Flutter alışveriş uygulamasının **model katmanına** neredeyse olduğu gibi taşınabilir. Ekranlar bu nesneleri gösterir; kurallar ise ekranlarda değil, bu sınıfların içinde yaşar.

---

# 10. Örnek Problem ve Farklı Çözüm Yolları

### **Problem:** Ödeme Yöntemleri ve İşlem Ücretleri

Bir mobil ödeme ekranı dört ödeme yöntemini destekliyor. Her yöntemin işlem ücreti farklı hesaplanıyor:

| Yöntem | Ekranda görünen ad | İşlem ücreti |
|---|---|---|
| Kredi kartı | `Kredi Kartı (tek çekim)` veya `Kredi Kartı (3 taksit)` | Tutarın %2'si; taksit sayısı 1'den büyükse ayrıca tutarın %3'ü vade farkı |
| Havale | `Havale/EFT` | Sabit 5 TL |
| Kapıda ödeme | `Kapıda Ödeme` | Sabit 25 TL |
| Cep Cüzdan | `Cep Cüzdan` | Ücretsiz |

Şu beş ödemeyi işleyip her birinin ücretini ve toplam işlem ücretini yazdırın: 1200 TL kredi kartı (3 taksit), 450 TL kredi kartı (tek çekim), 800 TL havale, 320 TL kapıda ödeme, 150 TL Cep Cüzdan.

**Beklenen ekran çıktısı:**

```text
Kredi Kartı (3 taksit) : 1200.00 TL + 60.00 TL = 1260.00 TL
Kredi Kartı (tek çekim): 450.00 TL + 9.00 TL = 459.00 TL
Havale/EFT             : 800.00 TL + 5.00 TL = 805.00 TL
Kapıda Ödeme           : 320.00 TL + 25.00 TL = 345.00 TL
Cep Cüzdan             : 150.00 TL + 0.00 TL = 150.00 TL
Toplam işlem ücreti: 99.00 TL
```

> **Önce kendiniz deneyin.** Çözümlere bakmadan önce en az 15 dakika kendi çözümünüz üzerinde çalışın.

### Çözüm Şekilleri

**1. Tek sınıf ve tür alanı (kalıtım yok)**

```dart
// Dosya: 10_01_odeme_tek_sinif.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

class Odeme {
  final String tur; // 'kart', 'havale', 'kapida', 'cuzdan'
  final double tutar;
  final int taksit;

  Odeme(this.tur, this.tutar, {this.taksit = 1});

  String get ad => switch (tur) {
        'kart' => taksit > 1 ? 'Kredi Kartı ($taksit taksit)' : 'Kredi Kartı (tek çekim)',
        'havale' => 'Havale/EFT',
        'kapida' => 'Kapıda Ödeme',
        'cuzdan' => 'Cep Cüzdan',
        _ => 'Bilinmeyen yöntem',
      };

  double ucret() => switch (tur) {
        'kart' => tutar * 0.02 + (taksit > 1 ? tutar * 0.03 : 0.0),
        'havale' => 5.0,
        'kapida' => 25.0,
        _ => 0.0,
      };
}

void main() {
  List<Odeme> odemeler = [
    Odeme('kart', 1200, taksit: 3),
    Odeme('kart', 450),
    Odeme('havale', 800),
    Odeme('kapida', 320),
    Odeme('cuzdan', 150),
  ];

  double toplamUcret = 0;
  for (Odeme o in odemeler) {
    double ucret = o.ucret();
    toplamUcret += ucret;
    print('${o.ad.padRight(23)}: ${tl(o.tutar)} + ${tl(ucret)} = ${tl(o.tutar + ucret)}');
  }
  print('Toplam işlem ücreti: ${tl(toplamUcret)}');
}
```

**Açıklama:** Kısa ve anlaşılır bir çözüm. Ancak her yöntemin kuralları **iki ayrı switch'e** dağılmış durumda. Yeni bir yöntem (ör. "Kripto") eklemek için iki switch'i de değiştirmek gerekir. Ayrıca `'havale'` yerine yanlışlıkla `'havle'` yazılırsa derleyici hiçbir uyarı vermez; ödeme sessizce "Bilinmeyen yöntem" olur ve ücretsiz geçer. `taksit` alanı da yalnızca kart için anlamlıdır ama her ödemede bulunur.

**2. Kalıtım ve override (polimorfizm)**

```dart
// Dosya: 10_02_odeme_polimorfizm.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

class Odeme {
  final double tutar;

  Odeme(this.tutar);

  String get ad => 'Cep Cüzdan';
  double ucret() => 0.0;
}

class KrediKarti extends Odeme {
  final int taksit;

  KrediKarti(super.tutar, {this.taksit = 1});

  @override
  String get ad => taksit > 1 ? 'Kredi Kartı ($taksit taksit)' : 'Kredi Kartı (tek çekim)';

  @override
  double ucret() => tutar * 0.02 + (taksit > 1 ? tutar * 0.03 : 0.0);
}

class Havale extends Odeme {
  Havale(super.tutar);

  @override
  String get ad => 'Havale/EFT';

  @override
  double ucret() => 5.0;
}

class KapidaOdeme extends Odeme {
  KapidaOdeme(super.tutar);

  @override
  String get ad => 'Kapıda Ödeme';

  @override
  double ucret() => 25.0;
}

void main() {
  List<Odeme> odemeler = [
    KrediKarti(1200, taksit: 3),
    KrediKarti(450),
    Havale(800),
    KapidaOdeme(320),
    Odeme(150),
  ];

  double toplamUcret = 0;
  for (Odeme o in odemeler) {
    double ucret = o.ucret();
    toplamUcret += ucret;
    print('${o.ad.padRight(23)}: ${tl(o.tutar)} + ${tl(ucret)} = ${tl(o.tutar + ucret)}');
  }
  print('Toplam işlem ücreti: ${tl(toplamUcret)}');
}
```

**Açıklama:** Her yöntemin adı ve ücret kuralı **kendi sınıfında**. `main`'deki döngü 1. çözümdekiyle **harfi harfine aynı**, ama artık hiçbir `switch` yok; her nesne kendi ücretini biliyor. `taksit` yalnızca `KrediKarti`'nda var. "Kripto" eklemek için yalnızca yeni bir sınıf yazmak yeter; mevcut koda dokunulmaz. Yanlış yazılmış bir sınıf adı (`Havle(800)`) ise derleme hatası verir. Bu çözümde üst sınıf `Odeme`, aynı zamanda ücretsiz Cep Cüzdan ödemesini temsil ediyor. Daha temiz bir tasarım, `Odeme`'yi **soyut** bir sınıf yapıp Cep Cüzdan için ayrı bir alt sınıf yazmaktır; soyut sınıfları gelecek hafta göreceğiz.

**3. Kalıtım ve dışarıda tip kontrolü (switch ile tip desenleri)**

```dart
// Dosya: 10_03_odeme_tip_deseni.dart
String tl(double tutar) => '${tutar.toStringAsFixed(2)} TL';

class Odeme {
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

class KapidaOdeme extends Odeme {
  KapidaOdeme(super.tutar);
}

String odemeAdi(Odeme o) => switch (o) {
      KrediKarti k => k.taksit > 1 ? 'Kredi Kartı (${k.taksit} taksit)' : 'Kredi Kartı (tek çekim)',
      Havale _ => 'Havale/EFT',
      KapidaOdeme _ => 'Kapıda Ödeme',
      _ => 'Cep Cüzdan',
    };

double ucretHesapla(Odeme o) => switch (o) {
      KrediKarti k => k.tutar * 0.02 + (k.taksit > 1 ? k.tutar * 0.03 : 0.0),
      Havale _ => 5.0,
      KapidaOdeme _ => 25.0,
      _ => 0.0,
    };

void main() {
  List<Odeme> odemeler = [
    KrediKarti(1200, taksit: 3),
    KrediKarti(450),
    Havale(800),
    KapidaOdeme(320),
    Odeme(150),
  ];

  double toplamUcret = 0;
  for (Odeme o in odemeler) {
    double ucret = ucretHesapla(o);
    toplamUcret += ucret;
    print('${odemeAdi(o).padRight(23)}: ${tl(o.tutar)} + ${tl(ucret)} = ${tl(o.tutar + ucret)}');
  }
  print('Toplam işlem ücreti: ${tl(toplamUcret)}');
}
```

**Açıklama:** Sınıflar yalnızca **veri** taşıyor; kurallar dışarıdaki iki fonksiyonda, tip desenleriyle yazılmış. `Havale _` kolu "değer bir Havale ise, adını kullanmadan eşleştir" demektir. Bu çözüm 1. çözümün tür adlarındaki yazım hatası sorununu çözer (sınıf adları derleyici tarafından denetlenir). Ancak yeni bir yöntem eklendiğinde iki fonksiyonun da güncellenmesi gerekir; güncellenmezse yeni yöntem sessizce `_` koluna düşer ve ücretsiz geçer.

**Hangisini seçmeli?**

| Ölçüt | 1. Tek sınıf | 2. Polimorfizm | 3. Tip desenleri |
|---|---|---|---|
| Kod uzunluğu | En kısa | En uzun | Orta |
| Yeni yöntem eklemek | 2 switch değişir | **Yalnızca yeni sınıf** | Yeni sınıf + 2 fonksiyon değişir |
| Tür adındaki yazım hatası | Yakalanmaz | Derleme hatası | Derleme hatası |
| Kurallar nerede? | Tek sınıfta, karışık | **Her türün kendi sınıfında** | Dışarıdaki fonksiyonlarda |

Üç çözüm de aynı çıktıyı üretir. Ödeme yöntemi gibi **sürekli yenisi eklenen** türler için 2. çözüm en sağlam olanıdır. 3. çözüm ise kuralların sınıflardan ayrı tutulması gereken durumlarda tercih edilir; gelecek hafta göreceğimiz `sealed` sınıflarla, unutulan bir tür derleme hatasına dönüştürülebilir ve bu çözümün zayıf noktası ortadan kalkar.

---

# 11. Özet

| Konu | Sözdizimi | Not |
|---|---|---|
| Sınıf | `class Urun { ... }` | Ad `UpperCamelCase` |
| Nesne | `Urun u = Urun('Süt', 32.5);` | `new` yazılmaz |
| Alan / metot | `u.fiyat`, `u.sat(2)` | Metot, çağrıldığı nesnenin alanlarını kullanır |
| toString | `@override String toString() => ...` | `print(u)` bunu çağırır |
| Referans | `Urun b = a;` | Aynı nesne; `==` varsayılan olarak "aynı nesne mi?" |
| Kurucu | `Urun(this.ad, this.fiyat);` | Gövdede atama null safety ile çalışmaz |
| İsimli parametreli kurucu | `Urun({required this.ad, this.stok = 0});` | Flutter'ın standart yazımı |
| Başlatıcı listesi | `Urun(String ad) : ad = ad.trim();` | Gövdeden önce çalışır |
| `this` | `this.puan += puan;` | Alan ile parametre aynı adlıysa gerekli |
| `final` alan, `const` kurucu | `final double enlem;` · `const Konum(...)` | Değişmez nesneler, Flutter widget'ları |
| İsimli kurucu | `Konum.merkez()` | Dart'ta aynı adlı iki kurucu olmaz |
| Yönlendiren kurucu | `Urun.ucretsiz(String ad) : this(ad, 0, 999);` | |
| `static` | `static int toplam = 0;` · `Siparis.toplam` | Nesneye değil sınıfa aittir |
| `factory` | `factory Urun(...) { return Urun._(...); }` | Doğrulama, singleton, önbellek, alt sınıf seçimi |
| Private | `double _bakiye;` | **Dosya** düzeyinde gizlilik |
| Getter | `double get bakiye => _bakiye;` | Parantezsiz okunur |
| Setter | `set fiyat(double f) { ... }` | Atama gibi kullanılır, kural koyar |
| Kalıtım | `class Elektronik extends Urun` | Tek kalıtım; tüm sınıfların atası `Object` |
| Üst sınıf kurucusu | `Elektronik(super.ad, this.garanti);` · `: super(ad, fiyat)` | Önce üst sınıf kurulur |
| Override | `@override double kargoUcreti() => 0.0;` | `@override` her zaman yazılır |
| Üst sınıf metodu | `super.etiket()` | Davranışı genişletmek için |
| Polimorfizm | `List<Urun>` içinde farklı alt sınıflar | Çalışan metot, nesnenin **gerçek** tipine göre seçilir |
| Tip kontrolü | `u is Gida`, `u is! Gida`, `u as Gida` | `is` sonrası yerel değişkenler yükseltilir; alanlar yükseltilmez |
| Tip desenleri | `switch (u) { Gida g => ..., _ => ... }` | |

---

# 12. Kendinizi Test Edin

Sorulardaki kod parçaları tam program değildir; denemek için sınıfları dosyanın üst düzeyine, kodu `void main() { ... }` içine yazın.

**1.** Sınıf ile nesne arasındaki fark nedir? Bir örnekle açıklayın.

**Cevap:** Sınıf bir kalıp (tanım), nesne o kalıptan üretilmiş somut bir örnektir. `Urun` bir sınıftır; `Urun('Süt', 32.5, 12)` ile oluşturulan değer bir nesnedir. Aynı sınıftan farklı verilere sahip istediğiniz kadar nesne oluşturulabilir.

**2.** Aşağıdaki kurucu neden derlenmez? Nasıl düzeltilir?
```dart
class Kitap {
  String baslik;
  Kitap(String baslik) {
    this.baslik = baslik;
  }
}
```

**Cevap:** `baslik` null olamayan bir alan; Dart, kurucunun gövdesi çalışmadan önce değerinin hazır olmasını ister. Düzeltme: `Kitap(this.baslik);` veya `Kitap(String baslik) : baslik = baslik;`

**3.** Çıktı nedir?
```dart
class Sayac {
  int deger = 0;
}
// main içinde:
Sayac a = Sayac();
Sayac b = a;
b.deger = 3;
print(a.deger);
```

**Cevap:** `3`. `b = a` yeni bir nesne oluşturmaz; ikisi de aynı nesneyi gösterir.

**4.** `ad = ad;` satırı bir metodun içinde neden alanı değiştirmez?

**Cevap:** Metodun `ad` adında bir parametresi varsa, metodun içindeki `ad` parametreyi ifade eder; satır parametreyi kendine atar. Alanı değiştirmek için `this.ad = ad;` yazılmalıdır.

**5.** Normal kurucu ile `factory` kurucu arasındaki iki farkı yazın.

**Cevap:** Normal kurucu her çağrıda yeni bir nesne oluşturur ve `this` kullanabilir. Factory kurucu döndüreceği nesneye kendisi karar verir (var olan bir nesneyi veya bir alt sınıfın nesnesini döndürebilir), `return` kullanır ve `this`'e erişemez.

**6.** Dart'ta `_bakiye` alanı hangi kod tarafından görülebilir?

**Cevap:** Yalnızca **aynı dosyadaki** kod tarafından. Dart'ta gizlilik sınıf düzeyinde değil, dosya (kütüphane) düzeyindedir.

**7.** Çıktı nedir?
```dart
class Daire {
  double r;
  Daire(this.r);
  double get cap => r * 2;
}
// main içinde:
Daire d = Daire(5);
print(d.cap);
d.r = 7;
print(d.cap);
```

**Cevap:** `10.0` ve `14.0`. `cap` bir alan değil, her okunduğunda `r`'den yeniden hesaplanan bir getter'dır.

**8.** Aşağıdaki kod neden derlenmez?
```dart
class A {
  int x;
  A(this.x);
}
class B extends A {
  int y;
  B(this.y);
}
```

**Cevap:** `B`'nin kurucusu `super` çağrısı yapmıyor; Dart, `A`'nın parametresiz kurucusunu çağırmaya çalışıyor ama `A`'nın böyle bir kurucusu yok. Düzeltme: `B(super.x, this.y);`

**9.** `@override` etiketini yazmamak programı bozar mı? Neden yine de yazılmalıdır?

**Cevap:** Bozmaz; program çalışır. Ancak metot adında bir yazım hatası yapıldığında `@override` olmadan yeni bir metot oluşur ve hata sessizce gözden kaçar. `@override` yazılırsa VS Code "bu metot hiçbir şeyi override etmiyor" uyarısı verir.

**10.** Çıktı nedir?
```dart
class Hayvan {
  String ses() => '...';
}
class Kedi extends Hayvan {
  @override
  String ses() => 'Miyav';
}
class Yavru extends Kedi {
  @override
  String ses() => '${super.ses()} miyav';
}
// main içinde:
List<Hayvan> liste = [Hayvan(), Kedi(), Yavru()];
for (Hayvan h in liste) {
  print(h.ses());
}
```

**Cevap:** `...`, `Miyav`, `Miyav miyav`. Her nesnede kendi sınıfının `ses()` metodu çalışır (polimorfizm); `Yavru`, `super.ses()` ile `Kedi`'nin sürümünü kullanıp üstüne ekleme yapar.

**11.** `Urun u = Elektronik('Tablet', 24);` tanımından sonra `u.garantiAy` neden yazılamaz? Nasıl erişilir?

**Cevap:** Derleyici yalnızca değişkenin tanımlanan tipine (`Urun`) bakar; `Urun`'da `garantiAy` yoktur. Erişmek için önce tip kontrolü yapılır: `if (u is Elektronik) { print(u.garantiAy); }`

**12.** `is` ile `as` arasındaki fark nedir? Hangisi daha güvenlidir?

**Cevap:** `is` bir **soru** sorar ve `true`/`false` döndürür; doğruysa yerel değişkenin tipini yükseltir. `as` bir **iddiadır**; nesne o tipte değilse program çalışırken hata verir. Emin olunmayan durumlarda `is` daha güvenlidir.

---

# 13. Ödev 3

> **AI kuralı:** AI'ı kavram sormak ve hata mesajlarını açıklatmak için kullanabilirsiniz; **kod yazdırmak yasaktır.** Ödev çözümleri **5. haftanın ilk 15 dakikasında** sınıfta birlikte yapılacaktır. Derste rastgele seçilen öğrencilerden çözümlerini kısaca açıklamaları istenebilir.

**Teslim:**
- Her soru ayrı bir dosya: `odev3_s1.dart`, `odev3_s2.dart`, ...
- Her soruda verilen `main` fonksiyonunu **aynen** kullanın; sınıfları ve fonksiyonları siz yazın. Çıktınız beklenen çıktıyla birebir aynı olmalıdır.
- Teslimden önce `Shift + Alt + F` ile biçimlendirin; **Problems** panelinde hata ve uyarı kalmasın. Override ettiğiniz her metotta `@override` kullanın.
- Teslim tarihi ve yöntemi Classroom'daki ödev sayfasındadır.

---

### Soru 1 — Akıllı Ampul *(sınıf, kurucu, private alan, getter, setter)*

Bir akıllı ev uygulaması için `AkilliAmpul` sınıfı yazın:

| Üye | Görevi |
|---|---|
| `final String oda` | Ampulün bulunduğu oda |
| `bool _acik` | Açık mı? Başlangıçta **kapalı** |
| `int _parlaklik` | 0–100 arası parlaklık; kurucuda isimli parametre `{int parlaklik = 70}` ile verilir |
| `bool get acikMi` | Açık olup olmadığını verir |
| `int get parlaklik` / `set parlaklik(int deger)` | Setter değeri 0–100 aralığına sabitler. Sonuç 0 ise ampul **kapanır**, 0'dan büyükse **açılır**. |
| `void ac()` / `void kapat()` | Açar / kapatır. Açarken parlaklık 0 ise 70 yapılır. |
| `String get durum` | `Salon: Kapalı` veya `Salon: Açık (%70)` |

```dart
// ŞABLON: Sınıfınızı bu main'in üstüne yazın.
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

**Beklenen ekran çıktısı:**

```text
Salon: Kapalı
Salon: Açık (%70)
Salon: Açık (%100)
Salon: Kapalı
Mutfak: Açık (%40)
Mutfak: Kapalı
Açık ampul var mı? false
```

---

### Soru 2 — Kullanıcı Profilleri *(isimli kurucular, factory, başlatıcı listesi, toString)*

`final` alanları `kullaniciAdi`, `eposta` ve `rol` olan bir `Kullanici` sınıfı yazın. `toString`, `@ayse <ayse@ornek.com> [yönetici]` biçiminde metin döndürsün.

| Kurucu | Görevi |
|---|---|
| `Kullanici(this.kullaniciAdi, this.eposta, {this.rol = 'üye'})` | Ana kurucu |
| `Kullanici.misafir()` | Kullanıcı adı `misafir`, e-posta `-`, rol `misafir` (başlatıcı listesiyle) |
| `factory Kullanici.epostadan(String eposta)` | E-postanın boşluklarını temizler ve küçük harfe çevirir. `@` içermiyorsa **misafir** kullanıcı döndürür. İçeriyorsa `@`'den önceki kısım kullanıcı adı olur. |
| `Kullanici.fromMap(Map<String, dynamic> veri)` | Map'ten oluşturur. `'rol'` anahtarı yoksa rol `üye` olur. |

```dart
// ŞABLON: Sınıfınızı bu main'in üstüne yazın.
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

**Beklenen ekran çıktısı:**

```text
@ayse <ayse@ornek.com> [yönetici]
@misafir <-> [misafir]
@mert.kaya <mert.kaya@ornek.com> [üye]
@misafir <-> [misafir]
@zeynep <zeynep@ornek.com> [üye]
```

**İpucu:** Map'te olmayabilecek bir değeri okurken `(veri['rol'] as String?) ?? 'üye'` yazabilirsiniz.

---

### Soru 3 — Ulaşım Uygulaması *(kalıtım, super, override, polimorfizm)*

Bir ulaşım uygulamasının yolculuk ücretlerini hesaplayın.

- **`Yolculuk`** (üst sınıf): `final double km`; `String get tur` (`'Yolculuk'`); `double ucret()` (`0`); `String ozet()` → `'${tur.padRight(8)} ${km.toStringAsFixed(1)} km → ${ucret().toStringAsFixed(2)} TL'`
- **`Taksi`**: Ücret = (45 TL açılış + km × 25 TL); gece ise bu tutar × 1.5. İsimli parametre: `{bool gece = false}`. Gece yolculuklarında `ozet()` sonuna ` (gece)` ekler (`super.ozet()` kullanın).
- **`Scooter`**: Ek alan `int dakika`. Ücret = 10 TL kilit açma + dakika × 4.5 TL. `ozet()` sonuna ` (11 dk)` gibi süreyi ekler.
- **`Otobus`**: Ücret sabit 20 TL; öğrenci ise 10 TL. İsimli parametre: `{bool ogrenci = false}`.
- **`Yolculuk enPahali(List<Yolculuk> liste)`** fonksiyonu en yüksek ücretli yolculuğu döndürür.

```dart
// ŞABLON: Sınıflarınızı ve fonksiyonunuzu bu main'in üstüne yazın.
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

**Beklenen ekran çıktısı:**

```text
Otobüs   12.5 km → 10.00 TL
Scooter  2.3 km → 59.50 TL (11 dk)
Taksi    8.4 km → 255.00 TL
Taksi    6.0 km → 292.50 TL (gece)
Otobüs   12.5 km → 20.00 TL
Günlük toplam: 637.00 TL
En pahalı yolculuk: Taksi 6.0 km (292.50 TL)
```

---

### Soru 4 — Medya Kitaplığı *(kalıtım, override, is)*

Bir medya uygulamasının kitaplığını modelleyin.

- **`Medya`**: `final String baslik`, `final int sure` (saniye); `String etiket()` → başlığı döndürür.
- **`Sarki`**: Ek alan `sanatci`; etiket: `[Şarkı] Deniz Ekin - Mavi Gökyüzü`
- **`Podcast`**: Ek alan `int bolum`; etiket: `[Podcast] Kod Sohbetleri #42`
- **`Video`**: Ek alan `bool hd` (isimli, varsayılan `false`); etiket: `[Video] Flutter'a Giriş (HD)` (HD değilse parantez yok)

Ayrıca şu fonksiyonları yazın:

| Fonksiyon | Görevi |
|---|---|
| `String sureMetni(int saniye)` | `252` → `4:12` (saniye her zaman iki basamak) |
| `int toplamSure(List<Medya> liste)` | Toplam süre (saniye) |
| `Map<String, int> turSayilari(List<Medya> liste)` | **`is` kullanarak** her türden kaç tane olduğunu sayar |
| `List<String> hdVideolar(List<Medya> liste)` | **`is` kullanarak** HD videoların başlıklarını döndürür |

```dart
// ŞABLON: Sınıflarınızı ve fonksiyonlarınızı bu main'in üstüne yazın.
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

**Beklenen ekran çıktısı:**

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

---

### Soru 5 — Spor Salonu Üyelikleri *(factory ile alt sınıf seçimi, super.metot(), private alan)*

- **`Uyelik`** (üst sınıf): `final String adSoyad`; private `int _kalanGun` ve getter'ı; `String get tur` (`'Üyelik'`); `double aylikUcret()` (`0`); `bool get bitiyorMu` (kalan gün 7 veya altındaysa `true`); `void gunGecir(int gun)` (kalan günü azaltır, **0'ın altına düşürmez**); `toString` → `'${tur.padRight(8)} $adSoyad (kalan $kalanGun gün)'`
- **`Aylik`**: Tür `Aylık`, aylık ücret 900 TL.
- **`Yillik`**: Tür `Yıllık`, aylık ücret 8400 / 12 TL.
- **`OgrenciUyelik extends Aylik`**: Tür `Öğrenci`; aylık ücret, `Aylik` ücretinin %60'ı. Ücreti **`super.aylikUcret()` kullanarak** hesaplayın.
- **`factory Uyelik.fromMap(Map<String, dynamic> veri)`**: `'tur'` değerine göre (`aylik`, `yillik`, `ogrenci`) doğru alt sınıfın nesnesini döndürür.
- **`double aylikGelir(List<Uyelik> liste)`** ve **`List<String> bitenler(List<Uyelik> liste)`** fonksiyonları.

```dart
// ŞABLON: Sınıflarınızı ve fonksiyonlarınızı bu main'in üstüne yazın.
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

**Beklenen ekran çıktısı:**

```text
Aylık    Ayşe Yılmaz (kalan 12 gün)
Yıllık   Mert Kaya (kalan 200 gün)
Öğrenci  Zeynep Ak (kalan 5 gün)
Aylık    Can Demir (kalan 3 gün)
Aylık gelir: 3040.00 TL
5 gün sonra süresi bitmek üzere olanlar: [Ayşe Yılmaz, Zeynep Ak, Can Demir]
```

**İpucu:** Bir alt sınıf, kendi üst sınıfının alt sınıfı olabilir: `OgrenciUyelik extends Aylik extends Uyelik`. `OgrenciUyelik` içindeki `super.aylikUcret()`, `Aylik`'taki sürümü çağırır.

---

# 14. Kaynaklar

| Kaynak | Adres | Konu |
|---|---|---|
| Sınıflar | [dart.dev/language/classes](https://dart.dev/language/classes) | Alanlar, metotlar, `static` |
| Kurucular | [dart.dev/language/constructors](https://dart.dev/language/constructors) | Kurucu türleri, başlatıcı listesi, `factory`, `super` parametreleri |
| Metotlar | [dart.dev/language/methods](https://dart.dev/language/methods) | Getter ve setter |
| Kalıtım | [dart.dev/language/extend](https://dart.dev/language/extend) | `extends`, `super`, `@override` |
| Desenler | [dart.dev/language/pattern-types](https://dart.dev/language/pattern-types) | Switch'te tip desenleri |
| Effective Dart | [dart.dev/effective-dart/design](https://dart.dev/effective-dart/design) | Sınıf, kurucu, getter adlandırma ve tasarım önerileri |

---

### Gelecek Hafta

**Hafta 5 — Nesne Yönelimli Programlama II ve Fonksiyonel Programlama:** Soyut sınıflar (`abstract`), arayüzler (`implements`), `mixin` ve `with`, `extension`, `enum`, `sealed` sınıflar; isimsiz fonksiyonlar (lambda), fonksiyonları parametre olarak göndermek ve `where`, `map`, `fold`, `sort` gibi koleksiyon metotları.

**Derse hazırlık:**
- Ödev 3'ü teslim edin. Çözümler derse ilk 15 dakikada birlikte yapılacak.
- Bu nottaki "Kendinizi Test Edin" sorularını çözün.
- Bölüm 10'daki 2. çözümde `Odeme` sınıfının aynı zamanda Cep Cüzdan ödemesi olarak kullanıldığına dikkat edin. "Kendi başına hiçbir anlamı olmayan, yalnızca alt sınıflara kalıp olan" bir sınıf nasıl yazılır? Gelecek haftanın ilk konusu bu.

---

*BMH309 Mobil Cihaz Programlama · Hafta 4 Ders Notu*
