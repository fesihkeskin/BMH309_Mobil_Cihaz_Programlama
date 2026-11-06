# BMH309 Mobil Cihaz Programlama · Soru Bankası (Hafta 1–5)

---
**Kapsam:** Dart temelleri, kontrol yapıları ve döngüler, fonksiyonlar ve koleksiyonlar, nesne yönelimli programlama (I ve II), fonksiyonel programlama

**Soru tipi:** Çoktan seçmeli, 5 seçenek, tek doğru cevap

**Soru sayısı:** 100 (34 kolay · 34 orta · 32 zor)

**Hazırlayan:** Dr. Öğr. Üyesi Fesih Keskin

---

## Sınav Yönergesi

- Sınav yapay zekâ araçları ve bilgisayar kullanılmadan yapılır.
- Tüm kodlar Dart 3 sürümüne göre yazılmıştır. Sorularda verilen kod parçaları, aksi belirtilmedikçe bir `void main() { ... }` fonksiyonunun içinde çalıştırılmaktadır; sınıflar ve fonksiyonlar dosyanın üst düzeyinde tanımlıdır.
- "Çıktı nedir?" sorularında birden fazla satır üreten çıktılar, seçeneklerde satırlar ` / ` ile ayrılarak gösterilmiştir.
- Her sorunun yalnızca bir doğru cevabı vardır.

---

# Sorular

## Karma Sorular · Hafta 1–5 (Soru 1–12)

### Soru 1 · *Kolay*

Aşağıdaki değişken tanımlarından hangisi **derleme hatası** verir?

A) `int yas = 21;`  
B) `double fiyat = 10;`  
C) `String? takmaAd;`  
D) `String ad = null;`  
E) `final liste = <int>[];`

---

### Soru 2 · *Kolay*

```dart
int a = 17;
print('${a ~/ 5} ${a % 5} ${a / 5}');
```

Yukarıdaki kodun çıktısı nedir?

A) `3.4 2 3`  
B) `3 2 3`  
C) `3 2 3.4`  
D) `3.0 2 3.4`  
E) `3 3 3.4`

---

### Soru 3 · *Kolay*

```dart
Map<String, int> stok = {'Süt': 5, 'Ekmek': 0};
print(stok['Çay']);
print(stok['Ekmek'] ?? 10);
```

Yukarıdaki kodun çıktısı nedir?

A) `null / 0`  
B) `0 / 10`  
C) `null / 10`  
D) Program çalışma zamanında hata verir.  
E) Program derlenmez.

---

### Soru 4 · *Kolay*

```dart
List<int> puanlar = [3, 8, 1, 6];
print(puanlar.where((p) => p > 2));
```

Yukarıdaki kodun çıktısı nedir?

A) `[3, 8, 6]`  
B) `(3, 8, 6)`  
C) `[8, 6]`  
D) `(8, 6)`  
E) `true`

---

### Soru 5 · *Orta*

```dart
int a = 5;
int b = a++ + ++a;
a *= 2;
print('$a $b');
```

Yukarıdaki kodun çıktısı nedir?

A) `12 12`  
B) `14 11`  
C) `12 11`  
D) `14 13`  
E) `14 12`

---

### Soru 6 · *Orta*

```dart
void ekle(List<int> liste, int sayi) {
  liste.add(sayi);
  sayi++;
}

void main() {
  List<int> a = [1, 2];
  List<int> b = a;
  int n = 3;
  ekle(b, n);
  print('$a $n');
}
```

Yukarıdaki programın çıktısı nedir?

A) `[1, 2] 3`  
B) `[1, 2] 4`  
C) `[1, 2, 3] 4`  
D) `[1, 2, 3] 3`  
E) Program derlenmez; çünkü `a` ve `b` aynı listeyi gösteremez.

---

### Soru 7 · *Orta*

```dart
abstract class A {
  A() {
    print('A');
  }

  String ad() => 'A';
}

class B extends A {
  B() {
    print('B');
  }

  @override
  String ad() => 'B${super.ad()}';
}

void main() {
  A x = B();
  print(x.ad());
}
```

Yukarıdaki programın çıktısı nedir?

A) `A / B / BA`  
B) `B / A / BA`  
C) `A / B / B`  
D) `A / B / AB`  
E) Program derlenmez; çünkü soyut bir sınıfın kurucusu olamaz.

---

### Soru 8 · *Orta*

Bir dosyada aşağıdaki tanımların bulunduğunu varsayın:

```dart
class B {}
abstract class I {}
mixin M {}
```

Bu tanımlarla birlikte aşağıdakilerden hangisi **hatasız derlenir**?

A) `class A extends B, I {}`  
B) `class A implements I with M {}`  
C) `class A extends B with M implements I {}`  
D) `mixin N { N(); }`  
E) `extension E on String { int sayac = 0; }`

---

### Soru 9 · *Zor*

```dart
int sayac = 0;

dis:
for (int i = 1; i <= 3; i++) {
  for (int j = 1; j <= 3; j++) {
    if (j == i) continue dis;
    if (i + j == 5) break dis;
    sayac += i * j;
  }
}
print(sayac);
```

Yukarıdaki kodun çıktısı nedir?

A) `2`  
B) `5`  
C) `7`  
D) `11`  
E) Program sonsuz döngüye girer.

---

### Soru 10 · *Zor*

```dart
class Renk {
  static final Map<String, Renk> _onbellek = {};
  static int olusturulan = 0;

  final String ad;

  Renk._(this.ad) {
    olusturulan++;
  }

  factory Renk(String ad) => _onbellek.putIfAbsent(ad, () => Renk._(ad));
}

void main() {
  Renk a = Renk('mavi');
  Renk b = Renk('mavi');
  Renk c = Renk('kırmızı');
  print('${identical(a, b)} ${identical(a, c)} ${Renk.olusturulan}');
}
```

Yukarıdaki programın çıktısı nedir?

A) `true false 2`  
B) `true false 3`  
C) `false false 3`  
D) `true true 1`  
E) Program derlenmez; çünkü bir `factory` kurucu başka bir kurucuyu çağıramaz.

---

### Soru 11 · *Zor*

```dart
sealed class Sonuc {}

class Basarili extends Sonuc {
  final int veri;
  Basarili(this.veri);
}

class Hata extends Sonuc {
  final String mesaj;
  Hata(this.mesaj);
}

class Bekliyor extends Sonuc {}

String goster(Sonuc s) => switch (s) {
      Basarili b when b.veri > 10 => 'Büyük',
      Basarili _ => 'Küçük',
      Hata h => h.mesaj,
    };
```

Bu kodla ilgili aşağıdakilerden hangisi **doğrudur**?

A) Derlenir; `goster(Bekliyor())` çağrısı `null` döndürür.  
B) Derlenir; `goster(Bekliyor())` çağrısı çalışma zamanında hata verir.  
C) Derlenmez; çünkü `when` koruması sealed sınıflarla kullanılamaz.  
D) Derlenmez; çünkü `Basarili _` kolu, `Basarili b when ...` kolundan önce yazılmalıdır.  
E) Derlenmez; çünkü `Bekliyor` durumu `switch` içinde ele alınmamıştır.

---

### Soru 12 · *Zor*

```dart
int Function(int) carpanOlustur(int c) => (x) => x * c;

void main() {
  List<int Function(int)> islemler = [carpanOlustur(2), carpanOlustur(3)];

  int sonuc = [1, 2, 3, 4, 5]
      .where((x) => x.isOdd)
      .map((x) => islemler[x % 2](x))
      .fold(0, (toplam, x) => toplam + x);

  print(sonuc);
}
```

Yukarıdaki programın çıktısı nedir?

A) `9`  
B) `27`  
C) `18`  
D) `45`  
E) Program derlenmez; çünkü fonksiyonlar bir listede saklanamaz.

---

---

## Hafta 1 · Dart Temelleri (Soru 13–26)

### Soru 13 · *Kolay*

Bir Flutter uygulaması mağazada yayınlanmak üzere (release modunda) derlendiğinde Dart kodu nasıl derlenir?

A) Java bayt koduna çevrilip Android sanal makinesinde çalışır.  
B) JIT (Just-in-Time) ile derlenir; hot reload açık kalır.  
C) AOT (Ahead-of-Time) ile doğrudan makine koduna derlenir.  
D) Telefonda bir yorumlayıcı tarafından satır satır çalıştırılır.  
E) Önce JavaScript'e çevrilir, sonra telefonun tarayıcısında çalışır.

---

### Soru 14 · *Kolay*

Flutter'daki **hot reload** özelliği için aşağıdakilerden hangisi doğrudur?

A) Yalnızca derleme hatalarını listeler, uygulamayı değiştirmez.  
B) Kodu AOT ile derleyip uygulamayı hızlandırır.  
C) Uygulamayı Google Play'e yükler.  
D) Uygulamayı kapatır, telefona sıfırdan yükler ve tüm verileri siler.  
E) Kod değişikliklerini çalışan uygulamaya uygular ve uygulamanın mevcut durumunu çoğunlukla korur.

---

### Soru 15 · *Kolay*

Aşağıdakilerden hangisi Dart'ta **geçerli** bir değişken adıdır?

A) `class`  
B) `2sepet`  
C) `ürünAdı`  
D) `sepetTutari`  
E) `sepet-tutari`

---

### Soru 16 · *Kolay*

`var fiyat = 3.0;` tanımından sonra `fiyat` değişkeninin tipi nedir?

A) `String`  
B) `int`  
C) `double`  
D) `dynamic`  
E) `num`

---

### Soru 17 · *Kolay*

```dart
String ad = 'Ayşe';
int yas = 21;
print('$ad ${yas + 1} yaşında');
```

Yukarıdaki kodun çıktısı nedir?

A) `Ayşe 21 + 1 yaşında`  
B) `Ayşe yas + 1 yaşında`  
C) `Ayşe 22 yaşında`  
D) `$ad 22 yaşında`  
E) Derleme hatası: `String` ile `int` birleştirilemez.

---

### Soru 18 · *Orta*

Aşağıdaki tanımlardan hangisi **derleme hatası** verir?

A) `const DateTime simdi = DateTime.now();`  
B) `const int saniye = 60 * 60;`  
C) `const String s = 'Cep ' 'Market';`  
D) `final List<int> l = [1]; l.add(2);`  
E) `final DateTime simdi = DateTime.now();`

---

### Soru 19 · *Orta*

`print(0.1 + 0.2 == 0.3);` satırının çıktısı nedir?

A) `0.30000000000000004`  
B) `0.3`  
C) Derleme hatası: `double` değerler `==` ile karşılaştırılamaz.  
D) `true`  
E) `false`

---

### Soru 20 · *Orta*

`print(42.196.toStringAsFixed(2));` satırının çıktısı nedir?

A) `42.19`  
B) `42.196`  
C) `42.2`  
D) `42`  
E) `42.20`

---

### Soru 21 · *Orta*

```dart
int? a = int.tryParse('12');
int? b = int.tryParse('12.5');
int? c = int.tryParse('on iki');
print('$a $b $c');
```

Yukarıdaki kodun çıktısı nedir?

A) `12 12 null`  
B) `12 13 null`  
C) `12 12.5 null`  
D) `12 null null`  
E) Program çalışma zamanında hata verir.

---

### Soru 22 · *Orta*

```dart
String? takmaAd;
print(takmaAd?.length);
takmaAd ??= 'Mert';
takmaAd ??= 'Ayşe';
print(takmaAd);
```

Yukarıdaki kodun çıktısı nedir?

A) `null / Ayşe`  
B) Çalışma zamanı hatası / `Mert`  
C) `0 / Ayşe`  
D) `0 / Mert`  
E) `null / Mert`

---

### Soru 23 · *Zor*

`print('istanbul'.toUpperCase() == 'İSTANBUL');` satırının çıktısı nedir?

A) `İSTANBUL`  
B) `ISTANBUL`  
C) `false`  
D) Derleme hatası: Türkçe karakter içeren metinler karşılaştırılamaz.  
E) `true`

---

### Soru 24 · *Zor*

```dart
String s = '  Flutter Dart  ';
print('${s.length} ${s.trim().substring(8)}');
```

Yukarıdaki kodun çıktısı nedir?

A) `16  Dart`  
B) `14 Dart`  
C) `16 Flutter`  
D) `16 Dart`  
E) `12 Dart`

---

### Soru 25 · *Zor*

```dart
String? kod;
print(kod!.length);
```

Bu kodla ilgili aşağıdakilerden hangisi doğrudur?

A) Derlenir ve `null` yazdırır.  
B) Derlenir ve `0` yazdırır.  
C) Derlenmez; çünkü nullable bir değişkene `!` uygulanamaz.  
D) Derlenir; ama çalışırken "Null check operator used on a null value" hatasıyla durur.  
E) Derlenmez; çünkü `kod` değişkenine değer verilmemiştir.

---

### Soru 26 · *Zor*

```dart
String girdi = '49,90';
double? f = double.tryParse(girdi);
double g = double.tryParse(girdi.replaceAll(',', '.')) ?? 0;
print('${f == null} ${(g * 2).toStringAsFixed(1)}');
```

Yukarıdaki kodun çıktısı nedir?

A) `true 99.80`  
B) `false 49.9`  
C) `true 99.8`  
D) `true 0.0`  
E) `false 99.8`

---

## Hafta 2 · Kontrol Yapıları, Operatörler ve Döngüler (Soru 27–44)

### Soru 27 · *Kolay*

```dart
int pil = 15;
if (pil <= 50) {
  print('Orta');
} else if (pil <= 20) {
  print('Düşük');
} else {
  print('İyi');
}
```

Yukarıdaki kodun çıktısı nedir?

A) `Düşük`  
B) `Orta`  
C) `Orta / Düşük`  
D) Hiçbir şey yazdırılmaz.  
E) `İyi`

---

### Soru 28 · *Kolay*

```dart
int adet = 0;
print(adet == 0 ? 'Sepet boş' : '$adet ürün');
```

Yukarıdaki kodun çıktısı nedir?

A) `0 ürün`  
B) `Sepet boş`  
C) `Sepet boş 0 ürün`  
D) Derleme hatası: `print` içinde koşul yazılamaz.  
E) `true`

---

### Soru 29 · *Kolay*

```dart
for (int i = 0; i < 10; i += 3) {
  print(i);
}
```

Bu döngü kaç satır yazdırır?

A) 9  
B) Döngü sonsuza kadar döner.  
C) 3  
D) 4  
E) 10

---

### Soru 30 · *Kolay*

```dart
int x = 10;
do {
  print(x);
  x++;
} while (x < 5);
```

Yukarıdaki kodun çıktısı nedir?

A) Döngü sonsuza kadar döner.  
B) Hiçbir şey yazdırılmaz.  
C) `10 / 11 / 12 / 13 / 14`  
D) `10`  
E) `5`

---

### Soru 31 · *Kolay*

`stdin.readLineSync()` metodunun dönüş tipi nedir?

A) `String?`  
B) `int?`  
C) `void`  
D) `dynamic`  
E) `String`

---

### Soru 32 · *Kolay*

```dart
int gun = 6;
switch (gun) {
  case 6 || 7:
    print('Hafta sonu');
  case 1:
    print('Pazartesi');
  default:
    print('Hafta içi');
}
```

Yukarıdaki kodun çıktısı nedir?

A) `Hafta sonu / Pazartesi / Hafta içi`  
B) `Hafta içi`  
C) `Hafta sonu`  
D) `Hafta sonu / Hafta içi`  
E) Derleme hatası: `case` sonlarında `break` yok.

---

### Soru 33 · *Orta*

```dart
int sayac = 0;

bool kontrol() {
  sayac++;
  return true;
}

void main() {
  bool a = false && kontrol();
  bool b = true || kontrol();
  bool c = true && kontrol();
  print('$a $b $c $sayac');
}
```

Yukarıdaki programın çıktısı nedir?

A) `false true true 2`  
B) `false false true 1`  
C) `false true true 1`  
D) `true true true 1`  
E) `false true true 3`

---

### Soru 34 · *Orta*

```dart
int puan = 85;
String harf = switch (puan) {
  >= 90 => 'AA',
  >= 85 => 'BA',
  >= 80 => 'BB',
  _ => 'FF',
};
print(harf);
```

Yukarıdaki kodun çıktısı nedir?

A) `BA`  
B) Derleme hatası: Switch ifadesinde karşılaştırma operatörü kullanılamaz.  
C) `AA`  
D) `FF`  
E) `BB`

---

### Soru 35 · *Orta*

`print(2 + 3 * 4 % 5 - 1);` satırının çıktısı nedir?

A) `8`  
B) `0`  
C) `3`  
D) `19`  
E) `4`

---

### Soru 36 · *Orta*

```dart
int n = 4072;
int t = 0;
while (n > 0) {
  t += n % 10;
  n ~/= 10;
}
print(t);
```

Yukarıdaki kodun çıktısı nedir?

A) `11`  
B) `4072`  
C) Döngü sonsuza kadar döner.  
D) `13`  
E) `2704`

---

### Soru 37 · *Orta*

```dart
int toplam = 0;
for (int i = 1; i <= 6; i++) {
  if (i % 3 == 0) continue;
  toplam += i;
}
print(toplam);
```

Yukarıdaki kodun çıktısı nedir?

A) `3`  
B) `15`  
C) `12`  
D) `21`  
E) `9`

---

### Soru 38 · *Orta*

```dart
Object o = 'Flutter';
print(o is String && o.length > 5);
```

Yukarıdaki kodun çıktısı nedir?

A) Derleme hatası: `Object` tipinde `length` yoktur.  
B) `false`  
C) `true`  
D) `7`  
E) Çalışma zamanı hatası

---

### Soru 39 · *Zor*

```dart
int sayac = 0;
for (int i = 0; i < 4; i++) {
  for (int j = 0; j < 4; j++) {
    if (j > i) break;
    sayac++;
  }
}
print(sayac);
```

Yukarıdaki kodun çıktısı nedir?

A) `16`  
B) `6`  
C) `1`  
D) `4`  
E) `10`

---

### Soru 40 · *Zor*

```dart
int x = 50;
x ~/= 3;
x %= 7;
x *= x - 1;
print(x);
```

Yukarıdaki kodun çıktısı nedir?

A) `3`  
B) `4`  
C) `1`  
D) `16`  
E) `2`

---

### Soru 41 · *Zor*

```dart
String kargo(double tutar, bool premium) => switch (tutar) {
      _ when premium => 'Ücretsiz',
      >= 300 => 'Ücretsiz',
      >= 150 => '19,90 TL',
      _ => '39,90 TL',
    };

void main() {
  print('${kargo(120, true)} | ${kargo(200, false)} | ${kargo(80, false)}');
}
```

Yukarıdaki programın çıktısı nedir?

A) Derleme hatası: Aynı switch'te iki `_` kolu olamaz.  
B) `Ücretsiz | 19,90 TL | 39,90 TL`  
C) `Ücretsiz | 19,90 TL | Ücretsiz`  
D) `Ücretsiz | Ücretsiz | 39,90 TL`  
E) `39,90 TL | 19,90 TL | 39,90 TL`

---

### Soru 42 · *Zor*

```dart
List<String> girdiler = ['2', 'x', '1', '0', '2'];
int toplam = 0;
int i = 0;

menu:
while (true) {
  String secim = girdiler[i++];
  switch (secim) {
    case '0':
      break menu;
    case '1' || '2':
      toplam += int.parse(secim);
    default:
      toplam += 10;
  }
}
print('$toplam $i');
```

Yukarıdaki kodun çıktısı nedir?

A) `3 4`  
B) Program sonsuz döngüye girer (veya liste dışına çıkıp çöker).  
C) `15 5`  
D) `13 4`  
E) `13 3`

---

### Soru 43 · *Zor*

`print((6 & 3) | (1 << 3));` satırının çıktısı nedir?

A) `11`  
B) `15`  
C) `8`  
D) `2`  
E) `10`

---

### Soru 44 · *Zor*

```dart
int? a;
int b = 3;
print(a ?? b + 2 * b);
```

Yukarıdaki kodun çıktısı nedir?

A) `null`  
B) `15`  
C) `5`  
D) Derleme hatası: `a`'ya değer verilmemiş.  
E) `9`

---

## Hafta 3 · Fonksiyonlar ve Koleksiyonlar (Soru 45–62)

### Soru 45 · *Kolay*

```dart
int kare(int x) => x * x;
// main içinde:
print(kare(3) + kare(2));
```

Yukarıdaki kodun çıktısı nedir?

A) `13`  
B) `25`  
C) `10`  
D) Derleme hatası: `=>` ile yazılan fonksiyon değer döndüremez.  
E) `94`

---

### Soru 46 · *Kolay*

`void bildir({required String baslik, int adet = 1}) { ... }` fonksiyonu için aşağıdaki çağrılardan hangisi **geçerlidir**?

A) `bildir(baslik: 'Kargo');`  
B) `bildir();`  
C) `bildir(baslik: 'Kargo', 3);`  
D) `bildir('Kargo');`  
E) `bildir(adet: 2);`

---

### Soru 47 · *Kolay*

`List<String> g = ['Pzt', 'Sal', 'Çar'];` için `print(g[g.length - 1]);` satırının çıktısı nedir?

A) `3`  
B) `Sal`  
C) `Pzt`  
D) `RangeError`  
E) `Çar`

---

### Soru 48 · *Kolay*

```dart
Set<int> s = {1, 2};
print(s.add(2));
print(s.length);
```

Yukarıdaki kodun çıktısı nedir?

A) `false / 2`  
B) Çalışma zamanı hatası: Set'e var olan bir eleman eklenemez.  
C) `true / 3`  
D) `false / 3`  
E) `true / 2`

---

### Soru 49 · *Kolay*

```dart
List<int> l = List.filled(3, 0);
l[1] = 5;
print(l);
```

Yukarıdaki kodun çıktısı nedir?

A) `[0, 5, 0]`  
B) Çalışma zamanı hatası: Sabit uzunluklu liste değiştirilemez.  
C) `[0, 0, 0, 5]`  
D) `[5, 0, 0]`  
E) `[0, 0, 0]`

---

### Soru 50 · *Kolay*

`void selam() => print('Merhaba');` tanımına göre aşağıdaki satırlardan hangisi **derleme hatası** verir?

A) `selam();`  
B) `void Function() f = selam;`  
C) `if (true) selam();`  
D) `print(selam());`  
E) `selam(); selam();`

---

### Soru 51 · *Orta*

```dart
String fiyatYaz(double tutar, [String paraBirimi = 'TL']) =>
    '${tutar.toStringAsFixed(2)} $paraBirimi';
// main içinde:
print(fiyatYaz(5));
print(fiyatYaz(5, 'USD'));
```

Yukarıdaki kodun çıktısı nedir?

A) Derleme hatası: `double` parametreye `5` gönderilemez.  
B) `5.00 TL / 5.00 USD`  
C) `5 TL / 5 USD`  
D) `5.00 / 5.00 USD`  
E) `5.00 TL / 5.00 TL`

---

### Soru 52 · *Orta*

```dart
int toplam = 0;

void ekle(int toplam) {
  toplam += 5;
}

void main() {
  ekle(toplam);
  ekle(toplam);
  print(toplam);
}
```

Yukarıdaki programın çıktısı nedir?

A) `5`  
B) `null`  
C) `0`  
D) Derleme hatası: Parametre ile üst düzey değişken aynı adı taşıyamaz.  
E) `10`

---

### Soru 53 · *Orta*

```dart
List<String> l = ['a', 'b', 'c', 'd'];
l.insert(1, 'x');
l.removeAt(3);
l.remove('a');
print(l);
```

Yukarıdaki kodun çıktısı nedir?

A) `[b, d]`  
B) `[x, c, d]`  
C) `[x, b, c, d]`  
D) `[x, b, d]`  
E) `[a, x, d]`

---

### Soru 54 · *Orta*

```dart
Map<String, int> m = {};
for (String k in ['a', 'b', 'a', 'c', 'a']) {
  m[k] = (m[k] ?? 0) + 1;
}
print(m);
```

Yukarıdaki kodun çıktısı nedir?

A) `{c: 1, b: 1, a: 3}`  
B) `{a: 3, b: 1, c: 1}`  
C) `{a: 3, b: 1, a: 1, c: 1}`  
D) Çalışma zamanı hatası: Olmayan anahtar okunamaz.  
E) `{a: 1, b: 1, c: 1}`

---

### Soru 55 · *Orta*

```dart
List<String> l = ['elma', 'Armut', 'çilek', 'Muz'];
l.sort();
print(l);
```

Yukarıdaki kodun çıktısı nedir?

A) `[Armut, çilek, elma, Muz]`  
B) Derleme hatası: Türkçe karakter içeren listeler sıralanamaz.  
C) `[elma, Armut, çilek, Muz]`  
D) `[Armut, Muz, elma, çilek]`  
E) `[Armut, elma, Muz, çilek]`

---

### Soru 56 · *Orta*

```dart
String s = 'yeni,indirim,kargo';
List<String> l = s.split(',');
print(l.sublist(1).join(' | '));
```

Yukarıdaki kodun çıktısı nedir?

A) `yeni`  
B) `indirim | kargo`  
C) `yeni | indirim | kargo`  
D) `[indirim, kargo]`  
E) `indirim,kargo`

---

### Soru 57 · *Zor*

```dart
bool giris = false;
List<String> kategoriler = ['A', 'B'];
List<String> menu = [
  'Ana',
  for (var k in kategoriler) 'K-$k',
  if (giris) 'Profil' else 'Giriş',
  ...['Ayar'],
];
print(menu.length);
print(menu[3]);
```

Yukarıdaki kodun çıktısı nedir?

A) `5 / Giriş`  
B) `6 / Giriş`  
C) `4 / Ayar`  
D) `5 / Profil`  
E) `5 / K-B`

---

### Soru 58 · *Zor*

```dart
List<int> a = [1, 2, 3];
List<int> b = a;
List<int> c = List.of(a);
b.add(4);
c.remove(1);
print('${a.length} ${b.length} ${c.length} ${a == b} ${a == c}');
```

Yukarıdaki kodun çıktısı nedir?

A) `4 4 4 true false`  
B) `4 4 2 true false`  
C) `3 4 2 false false`  
D) `4 4 2 true true`  
E) `4 4 3 true false`

---

### Soru 59 · *Zor*

```dart
Set<int> a = {1, 2, 3, 4};
Set<int> b = {3, 4, 5};
print(a.difference(b).union(b.difference(a)));
```

Yukarıdaki kodun çıktısı nedir?

A) `{5, 1, 2}`  
B) `{1, 2, 3, 4, 5}`  
C) `{3, 4}`  
D) `{1, 2}`  
E) `{1, 2, 5}`

---

### Soru 60 · *Zor*

```dart
int f(int n) => n <= 1 ? 1 : n * f(n - 2);
// main içinde:
print(f(7));
```

Yukarıdaki kodun çıktısı nedir?

A) `105`  
B) `15`  
C) `35`  
D) `5040`  
E) `Stack Overflow` hatası

---

### Soru 61 · *Zor*

```dart
Map<String, int?> m = {'a': null, 'b': 2};
print(m.containsKey('a'));
print(m['a'] ?? -1);
print(m.remove('c'));
print(m.length);
```

Yukarıdaki kodun çıktısı nedir?

A) `false / -1 / null / 2`  
B) `true / -1 / null / 1`  
C) `true / null / null / 2`  
D) `true / -1 / Çalışma zamanı hatası`  
E) `true / -1 / null / 2`

---

### Soru 62 · *Zor*

```dart
String etiket(String ad, double fiyat, {int indirim = 0, bool yeni = false}) {
  double son = fiyat * (100 - indirim) / 100;
  return '${yeni ? '[YENİ] ' : ''}$ad ${son.toStringAsFixed(0)}';
}
// main içinde:
print(etiket('Saat', 2400, yeni: true, indirim: 25));
```

Yukarıdaki kodun çıktısı nedir?

A) `Saat 1800`  
B) `[YENİ] Saat 600`  
C) `[YENİ] Saat 1800`  
D) Derleme hatası: İsimli argümanlar tanımdaki sırayla verilmelidir.  
E) `[YENİ] Saat 2400`

---

## Hafta 4 · Sınıflar ve Nesneler (Soru 63–81)

### Soru 63 · *Kolay*

Sınıf ve nesne kavramları için aşağıdakilerden hangisi **doğrudur**?

A) Bir sınıftan yalnızca bir nesne oluşturulabilir.  
B) Nesne oluşturmak için Dart'ta `new` anahtar kelimesi zorunludur.  
C) Sınıflar yalnızca veri (alan) içerebilir; metotlar sınıfın dışında yazılır.  
D) Sınıf bir kalıptır; nesne o kalıptan üretilen somut bir örnektir ve aynı sınıftan farklı verili birçok nesne oluşturulabilir.  
E) Nesne bir kalıptır; sınıf o kalıptan üretilen örnektir.

---

### Soru 64 · *Kolay*

```dart
class Urun {}
// main içinde:
print(Urun());
```

Yukarıdaki kodun çıktısı nedir?

A) Derleme hatası: Boş bir sınıftan nesne oluşturulamaz.  
B) Boş satır  
C) `null`  
D) `Urun`  
E) `Instance of 'Urun'`

---

### Soru 65 · *Kolay*

```dart
class Nokta {
  int x, y;
  Nokta(this.x, this.y);
}
// main içinde:
Nokta p = Nokta(3, 4);
print(p.x + p.y);
```

Yukarıdaki kodun çıktısı nedir?

A) `0`  
B) `12`  
C) `34`  
D) `7`  
E) Derleme hatası: Alanlara başlangıç değeri verilmemiş.

---

### Soru 66 · *Kolay*

```dart
class Daire {
  double r;
  Daire(this.r);
  double get cap => 2 * r;
}
```

`Daire d = Daire(5);` tanımından sonra aşağıdaki satırlardan hangisi **derleme hatası** verir?

A) `print(d.cap);`  
B) `print(d.cap * 2);`  
C) `d.r = 3;`  
D) `print(d.cap());`  
E) `double c = d.cap;`

---

### Soru 67 · *Kolay*

Dart'ta bir sınıf `extends` ile **en fazla kaç** sınıftan kalıtım alabilir?

A) Sınırsız  
B) 1  
C) `extends` yazılmayan sınıflar hiçbir sınıftan kalıtım almaz.  
D) 2  
E) 0

---

### Soru 68 · *Kolay*

`@override` etiketi için aşağıdakilerden hangisi **doğrudur**?

A) Yazılmazsa override edilen metot çalışmaz.  
B) Üst sınıftaki metodu siler.  
C) Metodun üst sınıftaki bir metodu yeniden tanımladığını belirtir; metot adında yazım hatası varsa VS Code uyarı verir.  
D) Metodu private yapar.  
E) Yalnızca `toString` metodunda kullanılabilir.

---

### Soru 69 · *Orta*

```dart
class Sayac {
  int deger = 0;

  void ayarla(int deger) {
    deger = deger * 2;
  }
}
// main içinde:
Sayac s = Sayac();
s.ayarla(5);
print(s.deger);
```

Yukarıdaki kodun çıktısı nedir?

A) `null`  
B) `5`  
C) `10`  
D) `0`  
E) Derleme hatası: Parametre alanla aynı adı taşıyamaz.

---

### Soru 70 · *Orta*

```dart
class Urun {
  final String ad;
  final double fiyat;

  Urun(this.ad, this.fiyat);
  Urun.ucretsiz(String ad) : this(ad, 0);
}
// main içinde:
Urun u = Urun.ucretsiz('Çanta');
print('${u.ad} ${u.fiyat}');
```

Yukarıdaki kodun çıktısı nedir?

A) `Çanta 0`  
B) Derleme hatası: İsimli kurucu başka bir kurucuyu çağıramaz.  
C) `Çanta 0.00`  
D) `Çanta null`  
E) `Çanta 0.0`

---

### Soru 71 · *Orta*

```dart
class Siparis {
  static int sayac = 0;
  final int no;

  Siparis() : no = ++sayac;
}
// main içinde:
Siparis a = Siparis();
Siparis b = Siparis();
Siparis c = Siparis();
print('${a.no} ${c.no} ${Siparis.sayac}');
```

Yukarıdaki kodun çıktısı nedir?

A) `0 2 3`  
B) `1 3 1`  
C) `1 1 1`  
D) Derleme hatası: Başlatıcı listesinde static alan kullanılamaz.  
E) `1 3 3`

---

### Soru 72 · *Orta*

```dart
class Termostat {
  int _derece = 22;

  int get derece => _derece;

  set derece(int d) {
    if (d >= 16 && d <= 30) {
      _derece = d;
    }
  }
}
// main içinde:
Termostat t = Termostat();
t.derece = 35;
t.derece = 18;
t.derece = 10;
print(t.derece);
```

Yukarıdaki kodun çıktısı nedir?

A) `22`  
B) `35`  
C) `18`  
D) `10`  
E) Derleme hatası: Getter ve setter aynı adı taşıyamaz.

---

### Soru 73 · *Orta*

```dart
class Hayvan {
  String ses() => '...';
}

class Kedi extends Hayvan {
  @override
  String ses() => 'Miyav';
}

class Kopek extends Hayvan {
  @override
  String ses() => 'Hav';
}
// main içinde:
List<Hayvan> liste = [Kedi(), Hayvan(), Kopek()];
for (Hayvan h in liste) {
  print(h.ses());
}
```

Yukarıdaki kodun çıktısı nedir?

A) `Miyav / ... / Hav`  
B) `Miyav / Miyav / Hav`  
C) `Kedi / Hayvan / Kopek`  
D) `... / ... / ...`  
E) Derleme hatası: `List<Hayvan>` içine `Kedi` konamaz.

---

### Soru 74 · *Orta*

```dart
class Hayvan {
  String ses() => '...';
}

class Kedi extends Hayvan {
  @override
  String ses() => 'Miyav';
  String tirmala() => 'Tırmaladı';
}
// main içinde:
Hayvan h = Kedi();
print(h.tirmala());
```

Bu kodla ilgili aşağıdakilerden hangisi **doğrudur**?

A) Derlenir ve `Miyav` yazdırır.  
B) Derlenmez; çünkü `Hayvan` tipindeki bir değişkene `Kedi` nesnesi atanamaz.  
C) Derlenir ve `Tırmaladı` yazdırır.  
D) Derlenir, ama çalışırken hata verir.  
E) Derlenmez; çünkü `h`'nin tanımlanan tipi `Hayvan`'dır ve `Hayvan`'da `tirmala` metodu yoktur.

---

### Soru 75 · *Orta*

```dart
class Arac {
  final int teker;
  Arac(this.teker);
}

class Bisiklet extends Arac {
  final bool elektrikli;
  Bisiklet(this.elektrikli) : super(2);
}
// main içinde:
Bisiklet b = Bisiklet(true);
print('${b.teker} ${b.elektrikli}');
```

Yukarıdaki kodun çıktısı nedir?

A) `2 true`  
B) `0 true`  
C) `null true`  
D) Derleme hatası: Alt sınıf, üst sınıfın kurucusuna sabit bir değer gönderemez.  
E) `true 2`

---

### Soru 76 · *Zor*

`cuzdan.dart` dosyasında şu sınıf tanımlıdır:

```dart
class Cuzdan {
  double _bakiye = 0;
  void yatir(double t) => _bakiye += t;
  double get bakiye => _bakiye;
}
```

Bu dosyayı `import` eden `main.dart` dosyasında aşağıdakilerden hangisi **derleme hatası** verir?

A) `c.yatir(500);`  
B) `c._bakiye = 500;`  
C) `print(c.bakiye);`  
D) `Cuzdan c = Cuzdan();`  
E) Hiçbiri; aynı projedeki tüm dosyalar private alanlara erişebilir.

---

### Soru 77 · *Zor*

```dart
abstract class Bildirim {
  Bildirim._();

  factory Bildirim(String tur) => switch (tur) {
        'mesaj' => Mesaj(),
        _ => Sistem(),
      };

  String goster();
}

class Mesaj extends Bildirim {
  Mesaj() : super._();

  @override
  String goster() => 'Yeni mesaj';
}

class Sistem extends Bildirim {
  Sistem() : super._();

  @override
  String goster() => 'Sistem bildirimi';
}

void main() {
  Bildirim a = Bildirim('mesaj');
  Bildirim b = Bildirim('guncelleme');
  print('${a.goster()} | ${b.goster()} | ${a is Mesaj} ${b.runtimeType}');
}
```

Yukarıdaki programın çıktısı nedir?

A) Derleme hatası: Soyut sınıftan `Bildirim('mesaj')` ile nesne oluşturulamaz.  
B) `Yeni mesaj | Sistem bildirimi | true Sistem`  
C) `Yeni mesaj | Yeni mesaj | true Mesaj`  
D) `Sistem bildirimi | Sistem bildirimi | false Sistem`  
E) `Yeni mesaj | Sistem bildirimi | false Bildirim`

---

### Soru 78 · *Zor*

```dart
class Kayit {
  String iz = '1';
  String ek;

  Kayit(String x) : ek = x + '2' {
    iz += ek + '3';
  }
}
// main içinde:
print(Kayit('a').iz);
```

Yukarıdaki kodun çıktısı nedir?

A) `1a2`  
B) Derleme hatası: `ek` alanına başlangıç değeri verilmemiş.  
C) `13`  
D) `a23`  
E) `1a23`

---

### Soru 79 · *Zor*

```dart
class Kutu {
  Object icerik;
  Kutu(this.icerik);
}

void main() {
  Kutu k = Kutu('Merhaba');
  if (k.icerik is String) {
    print(k.icerik.length);
  }
}
```

Yukarıdaki programla ilgili aşağıdakilerden hangisi **doğrudur**?

A) Derlenir, ama çalışırken hata verir.  
B) Derlenir ve `7` yazdırır.  
C) Derlenmez; çünkü `Object` tipindeki bir alana metin atanamaz.  
D) Derlenir ve `Merhaba` yazdırır.  
E) Derlenmez; çünkü `k.icerik` bir nesnenin public alanıdır ve `is` kontrolünden sonra tipi yükseltilmez.

---

### Soru 80 · *Zor*

```dart
class A {
  String ad() => 'A';
}

class B extends A {
  @override
  String ad() => '${super.ad()}B';
}

class C extends B {
  @override
  String ad() => 'C${super.ad()}';
}

void main() {
  A x = C();
  print(x.ad());
}
```

Yukarıdaki programın çıktısı nedir?

A) `CAB`  
B) `A`  
C) `CBA`  
D) `ABC`  
E) `C`

---

### Soru 81 · *Zor*

```dart
class Urun {}
class Elektronik extends Urun {}
class Telefon extends Elektronik {}

String tur(Urun u) => switch (u) {
      Elektronik _ => 'Elektronik',
      Telefon _ => 'Telefon',
      _ => 'Urun',
    };

void main() {
  print('${tur(Telefon())} ${tur(Urun())}');
}
```

Yukarıdaki programın çıktısı nedir?

A) `Telefon Elektronik`  
B) `Elektronik Elektronik`  
C) `Elektronik Urun`  
D) Derleme hatası: `Telefon _` koluna hiçbir zaman ulaşılamaz.  
E) `Telefon Urun`

---

## Hafta 5 · OOP II ve Fonksiyonel Programlama (Soru 82–100)

### Soru 82 · *Kolay*

```dart
abstract class Sekil {
  double alan();
}
// main içinde:
Sekil s = Sekil();
```

Son satırla ilgili aşağıdakilerden hangisi **doğrudur**?

A) Derleme hatası verir; çünkü soyut sınıflardan doğrudan nesne oluşturulamaz.  
B) Derleme hatası verir; çünkü soyut sınıfların kurucusu olamaz.  
C) Derlenir; çünkü değişkenin tipi `Sekil` olarak belirtilmiştir.  
D) Derlenir; ama `s.alan()` çağrıldığında çalışma zamanı hatası verir.  
E) Derlenir; `s.alan()` çağrıldığında 0 döner.

---

### Soru 83 · *Kolay*

`mixin Begenilebilir { ... }` olarak tanımlanan bir mixin, bir sınıfa hangi anahtar kelimeyle eklenir?

A) `with`  
B) `extends`  
C) `import`  
D) `mixin`  
E) `implements`

---

### Soru 84 · *Kolay*

```dart
enum Renk { kirmizi, yesil, mavi }
// main içinde:
print('${Renk.mavi.index} ${Renk.yesil.name}');
```

Yukarıdaki kodun çıktısı nedir?

A) `1 yesil`  
B) `3 yesil`  
C) `2 yesil`  
D) `mavi yesil`  
E) `2 Renk.yesil`

---

### Soru 85 · *Kolay*

```dart
var topla = (int a, int b) => a + b;
print(topla(2, 3) * 2);
```

Yukarıdaki kodun çıktısı nedir?

A) `(2, 3) * 2`  
B) `10`  
C) Derleme hatası: İsimsiz fonksiyon bir değişkene atanamaz.  
D) `8`  
E) `7`

---

### Soru 86 · *Kolay*

```dart
List<int> l = [2, 4, 6, 7];
print('${l.any((x) => x.isOdd)} ${l.every((x) => x.isEven)}');
```

Yukarıdaki kodun çıktısı nedir?

A) `false false`  
B) `false true`  
C) `true true`  
D) `true false`  
E) `[7] [2, 4, 6]`

---

### Soru 87 · *Kolay*

`print([1, 2, 3].map((x) => x * x).toList());` satırının çıktısı nedir?

A) `(1, 4, 9)`  
B) `[1, 2, 3]`  
C) `14`  
D) `[2, 4, 6]`  
E) `[1, 4, 9]`

---

### Soru 88 · *Kolay*

```dart
extension IlkHarf on String {
  String get ilk => this[0];
}
// main içinde:
print('Dart'.ilk + 'art'.ilk);
```

Yukarıdaki kodun çıktısı nedir?

A) `DA`  
B) `Dartart`  
C) `Dart art`  
D) `Da`  
E) Derleme hatası: `String` sınıfına yeni üye eklenemez.

---

### Soru 89 · *Orta*

```dart
List<int> notlar = [70, 80, 90];
double ort = notlar.fold(0, (t, n) => t + n) / notlar.length;
print(ort);
```

Yukarıdaki kodun çıktısı nedir?

A) Derleme hatası: `fold` sonucu bölünemez.  
B) `80.0`  
C) `80.00`  
D) `80`  
E) `240`

---

### Soru 90 · *Orta*

```dart
List<String> l = ['kivi', 'muz', 'ananas', 'elma'];
l.sort((a, b) => b.length.compareTo(a.length));
print(l.first + l.last);
```

Yukarıdaki kodun çıktısı nedir?

A) `muzananas`  
B) `ananasmuz`  
C) `ananaselma`  
D) Derleme hatası: Metinler uzunluğa göre sıralanamaz.  
E) `kivielma`

---

### Soru 91 · *Orta*

```dart
int Function() olustur() {
  int n = 0;
  return () => n++;
}

void main() {
  var f = olustur();
  f();
  f();
  print(f());
}
```

Yukarıdaki programın çıktısı nedir?

A) `2`  
B) `1`  
C) `3`  
D) Derleme hatası: Döndürülen fonksiyon, bitmiş bir fonksiyonun değişkenini kullanamaz.  
E) `0`

---

### Soru 92 · *Orta*

```dart
List<String> l = ['Kablo', 'Kılıf', 'Saat'];
print(l.firstWhere((s) => s.startsWith('T'), orElse: () => 'Yok'));
```

Yukarıdaki kodun çıktısı nedir?

A) Çalışma zamanı hatası: `Bad state: No element`  
B) `Saat`  
C) `null`  
D) `Yok`  
E) `Kablo`

---

### Soru 93 · *Orta*

```dart
enum Beden {
  kucuk(36),
  orta(40),
  buyuk(44);

  const Beden(this.numara);
  final int numara;

  bool uyarMi(int olcu) => olcu <= numara;
}
// main içinde:
print(Beden.values.where((b) => b.uyarMi(39)).map((b) => b.name).toList());
```

Yukarıdaki kodun çıktısı nedir?

A) `[kucuk, orta, buyuk]`  
B) `[orta, buyuk]`  
C) `[orta]`  
D) `[kucuk]`  
E) `[40, 44]`

---

### Soru 94 · *Orta*

```dart
class A {
  String selam() => 'Merhaba';
}

class B implements A {}

void main() {
  print(B().selam());
}
```

Yukarıdaki programla ilgili aşağıdakilerden hangisi **doğrudur**?

A) Derlenir, ama çalışırken hata verir.  
B) Derlenmez; çünkü `implements` kod getirmez ve `B`, `selam` metodunu kendisi yazmak zorundadır.  
C) Derlenir ve boş satır yazdırır.  
D) Derlenmez; çünkü yalnızca soyut sınıflar `implements` ile kullanılabilir.  
E) Derlenir ve `Merhaba` yazdırır.

---

### Soru 95 · *Zor*

```dart
sealed class Durum {}

class Yukleniyor extends Durum {}

class Veri extends Durum {
  final List<int> l;
  Veri(this.l);
}

class Hata extends Durum {
  final int kod;
  Hata(this.kod);
}

String ekran(Durum d) => switch (d) {
      Yukleniyor _ => 'Y',
      Veri v when v.l.isEmpty => 'Boş',
      Veri v => 'V${v.l.length}',
      Hata h when h.kod == 404 => 'Bulunamadı',
      Hata h => 'H${h.kod}',
    };

void main() {
  List<Durum> durumlar = [Veri([]), Hata(404), Veri([1, 2]), Hata(500), Yukleniyor()];
  print(durumlar.map(ekran).join(','));
}
```

Yukarıdaki programın çıktısı nedir?

A) `Boş,Bulunamadı,V2,Bulunamadı,Y`  
B) Derleme hatası: `map`'e isimli bir fonksiyon parantezsiz gönderilemez.  
C) `Boş,Bulunamadı,V2,H500,Y`  
D) Derleme hatası: `Durum` tipinin tüm durumları ele alınmamıştır.  
E) `V0,H404,V2,H500,Y`

---

### Soru 96 · *Zor*

```dart
mixin Begenilebilir {
  int begeni = 0;
  void begen() => begeni++;
}

class Gonderi with Begenilebilir {}
class Urun with Begenilebilir {}

void main() {
  Gonderi g1 = Gonderi();
  Gonderi g2 = Gonderi();
  Urun u = Urun();
  g1.begen();
  g1.begen();
  g2.begen();
  u.begen();
  u.begen();
  u.begen();
  print('${g1.begeni} ${g2.begeni} ${u.begeni}');
}
```

Yukarıdaki programın çıktısı nedir?

A) Derleme hatası: Mixin'ler alan tanımlayamaz.  
B) `2 1 3`  
C) `6 6 6`  
D) `1 1 1`  
E) `3 3 3`

---

### Soru 97 · *Zor*

```dart
typedef Kural = double Function(double);

Kural birlestir(Kural ilk, Kural ikinci) => (x) => ikinci(ilk(x));

void main() {
  Kural indirim = (f) => f - 20;
  Kural kdv = (f) => f * 1.5;
  print(birlestir(indirim, kdv)(100));
  print(birlestir(kdv, indirim)(100));
}
```

Yukarıdaki programın çıktısı nedir?

A) Derleme hatası: Bir fonksiyon başka bir fonksiyon döndüremez.  
B) `120.0 / 130.0`  
C) `130.0 / 120.0`  
D) `120 / 130`  
E) `120.0 / 120.0`

---

### Soru 98 · *Zor*

```dart
List<String> kelimeler = ['dart', 'flutter', 'dil', 'fonksiyon', 'dizi'];
Map<String, int> m = {};
for (String k in kelimeler) {
  m.update(k[0], (n) => n + k.length, ifAbsent: () => k.length);
}
print(m);
```

Yukarıdaki kodun çıktısı nedir?

A) `{d: 11, f: 16}`  
B) `{d: 11, f: 16, dil: 3}`  
C) `{f: 16, d: 11}`  
D) `{d: 3, f: 2}`  
E) `{d: 4, f: 7}`

---

### Soru 99 · *Zor*

```dart
List<int> fiyatlar = [120, 45, 300, 80];
List<int> sirali = List.of(fiyatlar);
sirali.sort((a, b) => b.compareTo(a));
int sonuc = sirali.skip(1).take(2).reduce((a, b) => a - b);
print('${fiyatlar.first} $sonuc');
```

Yukarıdaki kodun çıktısı nedir?

A) `120 -40`  
B) `120 175`  
C) `120 40`  
D) `300 40`  
E) `45 40`

---

### Soru 100 · *Zor*

```
extension Toplam on List<num> {
  num get toplam =>
      fold<num>(0, (t, x) => t + x);
}

void main() {
  List<Object> karisik = [3, 'a', 2.5, true, 4];
  print(karisik.whereType<num>().toList().toplam);
}
```

Yukarıdaki programın çıktısı nedir?

A) `9.5`\
B) `10.5`\
C) `7`\
D) Derleme hatası: `List<Object>` üzerinde `toplam` tanımlı değildir.\
E) `9`

---

# Cevap Anahtarı

| Soru | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **D** | **C** | **A** | **B** | **E** | **D** | **A** | **C** | **B** | **A** |

| Soru | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **E** | **B** | **C** | **E** | **D** | **C** | **C** | **A** | **E** | **E** |

| Soru | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **D** | **E** | **C** | **D** | **D** | **C** | **B** | **B** | **D** | **D** |

| Soru | 31 | 32 | 33 | 34 | 35 | 36 | 37 | 38 | 39 | 40 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **A** | **C** | **C** | **A** | **C** | **D** | **C** | **C** | **E** | **E** |

| Soru | 41 | 42 | 43 | 44 | 45 | 46 | 47 | 48 | 49 | 50 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **B** | **D** | **E** | **E** | **A** | **A** | **E** | **A** | **A** | **D** |

| Soru | 51 | 52 | 53 | 54 | 55 | 56 | 57 | 58 | 59 | 60 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **B** | **C** | **D** | **B** | **D** | **B** | **A** | **B** | **E** | **A** |

| Soru | 61 | 62 | 63 | 64 | 65 | 66 | 67 | 68 | 69 | 70 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **E** | **C** | **D** | **E** | **D** | **D** | **B** | **C** | **D** | **E** |

| Soru | 71 | 72 | 73 | 74 | 75 | 76 | 77 | 78 | 79 | 80 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **E** | **C** | **A** | **E** | **A** | **B** | **B** | **E** | **E** | **A** |

| Soru | 81 | 82 | 83 | 84 | 85 | 86 | 87 | 88 | 89 | 90 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **C** | **A** | **A** | **C** | **B** | **D** | **E** | **D** | **B** | **B** |

| Soru | 91 | 92 | 93 | 94 | 95 | 96 | 97 | 98 | 99 | 100 |
|---|---|---|---|---|---|---|---|---|---|---|
| **Cevap** | **A** | **D** | **B** | **B** | **C** | **B** | **B** | **A** | **C** | **A** |

---

# Çözümler ve Çeldirici Açıklamaları

## Karma Sorular · Hafta 1–5

### Soru 1 · Cevap: **D**

`String` tipi null olamaz; bu değişkene `null` atanırsa derleyici hata verir: *"A value of type 'Null' can't be assigned to a variable of type 'String'."*

- **A)** Geçerli: `int` tipine tam sayı atanmış.
- **B)** Geçerli: Bir tam sayı değeri (`10`), `double` tipindeki bir değişkene atanabilir; değer `10.0` olur. Öğrencilerin sık takıldığı bir noktadır.
- **C)** Geçerli: `String?` null olabilen bir tiptir; değer verilmezse başlangıç değeri `null`'dır.
- **E)** Geçerli: Tipi belirtilmiş boş bir liste; `final` olması içine eleman eklenmesini engellemez.

### Soru 2 · Cevap: **C**

`~/` tam sayı bölmesidir ve `int` döndürür (17 ~/ 5 = 3). `%` kalanı verir (17 % 5 = 2). `/` ise her zaman `double` döndürür (17 / 5 = 3.4).

- **A)** Sıralama yanlış: İlk değer `~/`, son değer `/` işlemine aittir.
- **B)** `/` işlemi tam sayılarda da ondalıklı sonuç verir; `3` değil `3.4`.
- **D)** `~/` işleminin sonucu `int`'tir; `3.0` değil `3` yazılır.
- **E)** 17'nin 5'e bölümünden kalan 3 değil, 2'dir.

### Soru 3 · Cevap: **A**

Map'te bulunmayan bir anahtar okunduğunda program çökmez; `null` döner. `'Ekmek'` anahtarının değeri `0`'dır. `0` null olmadığı için `??` operatörü varsayılan değeri (`10`) kullanmaz.

- **B)** Olmayan anahtar `0` değil `null` döndürür.
- **C)** `??` yalnızca sol taraf **null** ise sağ tarafı kullanır; `0` null değildir. Öğrencilerin "0 = boş" yanılgısını ölçer.
- **D)** Listelerden farklı olarak Map'te olmayan bir anahtarı okumak hata vermez.
- **E)** `print` her tipten değer alabilir; `int?` değeri yazdırmak geçerlidir.

### Soru 4 · Cevap: **B**

`where` bir `List` değil bir `Iterable` döndürür. Iterable yazdırıldığında köşeli parantez yerine normal parantez görünür. Liste olarak görmek için `.toList()` eklenmesi gerekirdi.

- **A)** Elemanlar doğru ama `toList()` çağrılmadığı için köşeli parantez görünmez.
- **C) ve D)** `3 > 2` doğrudur; `3` de seçilir.
- **E)** `where` bir koşulu sağlayan **elemanları** döndürür; `bool` döndüren `any` metodudur.

### Soru 5 · Cevap: **E**

İfade soldan sağa değerlendirilir:
1. `a++` (sonek): Önce mevcut değer **kullanılır** (5), sonra `a` 6 olur.
2. `++a` (önek): Önce `a` **artırılır** (7), sonra yeni değer kullanılır (7).
3. `b = 5 + 7 = 12`.
4. `a *= 2` → `a = 7 * 2 = 14`.

- **A)** İki artırmadan yalnızca biri sayılmış: `a`'nın son değeri 6 sanılmış ve 6 × 2 = 12 bulunmuş. `a++` ve `++a`'nın **ikisi de** `a`'yı birer artırır.
- **B)** `++a`'nın 6 verdiği düşünülmüş (b = 5 + 6 = 11); oysa önceki `a++`, `a`'yı zaten 6'ya çıkarmıştı.
- **C)** A ve B seçeneklerindeki iki hata birlikte yapılmış.
- **D)** `a++`'nın artırılmış değeri kullandığı düşünülmüş (b = 6 + 7 = 13); sonek önce **eski** değeri kullanır.

### Soru 6 · Cevap: **D**

`b = a` yeni bir liste oluşturmaz; ikisi de aynı listeyi gösterir. Fonksiyona gönderilen liste de aynı listedir; `liste.add(sayi)` bu yüzden `a`'da da görünür. `int` parametre ise değerin **kopyasını** alır; fonksiyonun içindeki `sayi++` dışarıdaki `n`'yi değiştirmez.

- **A)** `b`'nin `a`'nın kopyası olduğu düşünülmüş (referans tuzağı).
- **B) ve C)** `int` parametrenin değiştirilmesinin dışarıdaki değişkeni etkilediği düşünülmüş.
- **E)** İki değişkenin aynı listeyi göstermesi tamamen geçerlidir; Dart'ta nesneler zaten referansla tutulur.

### Soru 7 · Cevap: **A**

`B()` çağrıldığında önce üst sınıfın kurucusu çalışır (`B`'nin kurucusu `super` yazmasa da Dart üst sınıfın parametresiz kurucusunu otomatik çağırır): `A` yazılır. Sonra `B`'nin gövdesi çalışır: `B` yazılır. `x.ad()` çağrısında `x`'in tanımlanan tipi `A` olsa da gerçek tipi `B`'dir (polimorfizm); `B`'deki sürüm çalışır ve `'B' + super.ad()` = `'BA'` döndürür.

- **B)** Alt sınıfın kurucu gövdesinin önce çalıştığı düşünülmüş; ev temelden kurulur, önce üst sınıf.
- **C)** `super.ad()` çağrısı gözden kaçırılmış.
- **D)** Birleştirme sırası ters okunmuş: Metin `'B${super.ad()}'`, yani önce `B` sonra `A`.
- **E)** Soyut sınıflardan doğrudan nesne oluşturulamaz, ama **kurucuları olabilir**; alt sınıflar bu kurucuyu `super` ile kullanır.

### Soru 8 · Cevap: **C**

Doğru sıra `extends` → `with` → `implements`'tir. `I` hiç üyesi olmayan bir soyut sınıf olduğu için `implements I` hiçbir metodu zorunlu kılmaz; tanım hatasız derlenir.

- **A)** Dart'ta tek kalıtım vardır; `extends` yalnızca bir sınıf alabilir. Birden fazla sözleşme için `implements` kullanılır.
- **B)** Sıra yanlış: `with`, `implements`'ten önce gelmelidir.
- **D)** Mixin'ler kurucu tanımlayamaz: *"Mixins can't declare constructors."*
- **E)** Extension'lar yeni alan (veri) ekleyemez, yalnızca metot ve getter ekleyebilir: *"Extensions can't declare instance fields."*

### Soru 9 · Cevap: **B**

Adım adım:

| `i` | `j` | Ne olur? | `sayac` |
|---|---|---|---|
| 1 | 1 | `j == i` → `continue dis`: Dış döngünün bir sonraki turuna geç | 0 |
| 2 | 1 | `2 + 1 = 3` → `sayac += 2 * 1` | 2 |
| 2 | 2 | `j == i` → `continue dis` | 2 |
| 3 | 1 | `3 + 1 = 4` → `sayac += 3 * 1` | 5 |
| 3 | 2 | `3 + 2 = 5` → `break dis`: İki döngüden birden çık | 5 |

- **A)** Döngünün `i = 2`'den sonra bittiği düşünülmüş.
- **C)** `continue dis` yerine etiketsiz `continue` gibi düşünülmüş (yalnızca iç döngünün turu atlanmış). Bu durumda `i = 1` için `j = 2, 3` de işlenir ve sonuç 7 olur.
- **D)** `break dis` görmezden gelinmiş; bu durumda `i = 3, j = 2` turu da eklenir ve sonuç 11 olur.
- **E)** Her iki döngünün de sayacı düzenli olarak artıyor; sonsuz döngü yoktur.

### Soru 10 · Cevap: **A**

`factory` kurucu her çağrıda yeni nesne oluşturmak zorunda değildir. `putIfAbsent`, anahtar önbellekte yoksa verilen fonksiyonu çalıştırıp (yeni nesne oluşturup) ekler; varsa **mevcut** nesneyi döndürür.

- `Renk('mavi')` → önbellekte yok → `Renk._('mavi')` çalışır, `olusturulan = 1`.
- `Renk('mavi')` → önbellekte var → aynı nesne döner; kurucu çalışmaz.
- `Renk('kırmızı')` → önbellekte yok → yeni nesne, `olusturulan = 2`.

`a` ve `b` aynı nesnedir (`true`); `a` ve `c` farklıdır (`false`).

- **B) ve C)** Her `Renk(...)` çağrısında yeni nesne oluşturulduğu düşünülmüş; factory'nin farkı tam olarak budur.
- **D)** `a` ile `c` farklı anahtarlardır (`'mavi'`, `'kırmızı'`); aynı nesne olamazlar.
- **E)** Factory kurucu başka bir kurucuyu (burada private `Renk._`) çağırabilir; tekil nesne ve önbellek desenleri bu sayede yazılır. Factory'nin kullanamadığı şey `this`'tir.

### Soru 11 · Cevap: **E**

Sealed bir sınıfın tüm alt sınıfları derleyici tarafından bilindiği için, `_` kolu olmayan bir `switch` ifadesinin **her** alt sınıfı ele alması gerekir. `Bekliyor` alt sınıfı ele alınmadığı için kod derlenmez: *"The type 'Sonuc' isn't exhaustively matched by the switch cases since it doesn't match 'Bekliyor()'."* Sealed sınıfların varlık sebebi, unutulan bir durumu çalışma zamanına bırakmadan derleme sırasında yakalamaktır.

- **A) ve B)** Dart, eksiksiz olmayan bir `switch` ifadesini zaten derlemez; çalışma zamanına ulaşılmaz.
- **C)** `when` koruması her türlü desenle, sealed sınıflarla da kullanılabilir.
- **D)** Sıra doğrudur: Özel durum (`when` koşullu) önce, genel durum (`Basarili _`) sonra yazılır. Ters yazılsaydı `when`'li kola hiç ulaşılamazdı.

### Soru 12 · Cevap: **B**

1. `carpanOlustur(2)` → "×2 yapan fonksiyon"; `carpanOlustur(3)` → "×3 yapan fonksiyon". Her biri kendi `c` değerini hatırlar (kapanış).
2. `where((x) => x.isOdd)` → `1, 3, 5`.
3. `map((x) => islemler[x % 2](x))`: Tek sayılar için `x % 2 = 1`, yani her zaman `islemler[1]` (×3) seçilir → `3, 9, 15`.
4. `fold(0, (toplam, x) => toplam + x)` → `0 + 3 + 9 + 15 = 27`.

- **A)** `map` adımı atlanmış; yalnızca tek sayılar toplanmış (1 + 3 + 5 = 9).
- **C)** Yanlış fonksiyon seçilmiş: `islemler[0]` (×2) ile çarpılmış (2 + 6 + 10 = 18).
- **D)** `where` adımı atlanmış; tüm sayılar ×3 ile çarpılmış (3 + 6 + 9 + 12 + 15 = 45).
- **E)** Dart'ta fonksiyonlar birer değerdir; değişkenlerde, listelerde ve sınıf alanlarında saklanabilir. `List<int Function(int)>` geçerli bir tiptir.

## Hafta 1 · Dart Temelleri

### Soru 13 · Cevap: **C**

Geliştirme sırasında Dart **JIT** ile derlenir; bu sayede hot reload mümkündür. Yayın sürümünde ise **AOT** ile doğrudan işlemcinin anlayacağı makine koduna derlenir; uygulama hızlı açılır ve akıcı çalışır.

- **A)** Bu, Kotlin/Java ile yazılan native Android uygulamalarının yöntemidir; Flutter makine kodu üretir.
- **B)** JIT ve hot reload **geliştirme** sırasında kullanılır; yayın sürümünde kullanılmaz.
- **D)** Dart, yayın sürümünde yorumlanmaz; önceden derlenir. Hızlı açılışın nedeni budur.
- **E)** JavaScript'e derleme yalnızca Flutter **web** hedefinde kullanılır.

### Soru 14 · Cevap: **E**

Hot reload, kaydedilen değişikliği saniyeler içinde çalışan uygulamaya uygular. Ekranda girilmiş veriler, açık olan sayfa gibi **durum** bilgileri çoğunlukla korunur.

- **A)** Hataları Problems paneli gösterir; hot reload ise değişikliği uygular.
- **B)** Hot reload JIT derlemesi sayesinde mümkündür; AOT yayın sürümü içindir.
- **C)** Hot reload yalnızca geliştirme sırasında çalışan uygulamayı günceller; yayınla ilgisi yoktur.
- **D)** Bu tanım, uygulamanın tamamen yeniden yüklenmesine (yeniden başlatma) daha yakındır; hot reload durumu korur.

### Soru 15 · Cevap: **D**

`sepetTutari`, derste önerilen `lowerCamelCase` biçimine de uyar: ilk kelime küçük, sonraki kelimelerin ilk harfi büyük.

- **A)** `class` ayrılmış bir anahtar kelimedir.
- **B)** Değişken adları rakamla başlayamaz.
- **C)** Dart'ta değişken adlarında yalnızca İngilizce harfler, rakamlar, `_` ve `$` kullanılabilir; `ü` ve `ı` derleme hatası verir.
- **E)** `-` bir operatördür (çıkarma); adlarda kullanılamaz.

### Soru 16 · Cevap: **C**

`var` ile tanımlanan değişkenin tipi, ilk değerden çıkarılır (tip çıkarımı) ve bir daha değişmez. Bu değişkene sonradan bir metin atanırsa derleme hatası alınır.

- **A)** Tırnak içinde olmadığı için metin değildir.
- **B)** `3.0` ondalık noktası içerdiği için bir `double` değerdir; değeri tam sayı gibi görünse de tipi `int` değildir.
- **D)** `var`, değişkenin tipini ilk değerden **çıkarır** ve sabitler; `dynamic` gibi her türlü değeri kabul etmez.
- **E)** `num`, `int` ve `double`'ın ortak üst tipidir; ama `var` en özel tipi, yani `double`'ı seçer.

### Soru 17 · Cevap: **C**

Tek bir değişken için `$ad`, bir **ifade** için `${yas + 1}` kullanılır. Interpolation, değeri otomatik olarak metne çevirdiği için `int` değerlerle de sorunsuz çalışır.

- **A)** `${...}` içindeki ifade **hesaplanır**; `21 + 1` yazdırılmaz, 22 yazdırılır.
- **B)** Süslü parantez kullanıldığı için içerideki ifade Dart kodu olarak değerlendirilir.
- **D)** `$ad`, değişkenin değeriyle yer değiştirir; dolar işareti yazdırılmaz.
- **E)** `+` ile birleştirme hata verirdi; interpolation ise her tipi metne çevirir.

### Soru 18 · Cevap: **A**

`const`, değerin **derleme zamanında** bilinmesini ister. `DateTime.now()` programın çalıştığı anın saatini verdiği için derleme sırasında bilinemez. Bu tür değerler için `final` kullanılır.

- **B)** İki sabitin çarpımı da derleme zamanında hesaplanabilir; geçerlidir.
- **C)** Yan yana yazılan metin sabitleri derleme zamanında birleştirilir; geçerlidir.
- **D)** `final` yalnızca değişkenin başka listeye bağlanmasını engeller; listenin içeriği değiştirilebilir.
- **E)** `final` değerin **çalışma zamanında** bir kez verilmesine izin verir; geçerlidir.

### Soru 19 · Cevap: **E**

`0.1 + 0.2` işleminin sonucu `0.30000000000000004`'tür. Bu yüzden `0.3` ile karşılaştırma `false` verir. Para gibi hassas hesaplarda sonuç gösterilirken `toStringAsFixed(2)` ile yuvarlanır.

- **A)** Bu, `0.1 + 0.2` ifadesinin değeridir; soruda ise bu değerin `0.3` ile karşılaştırması yazdırılıyor.
- **B)** `==` bir karşılaştırmadır; sonucu `bool`'dur, sayı değildir.
- **C)** `==` her tipte kullanılabilir; ancak ondalık sayılarda sonucu yanıltıcı olabilir.
- **D)** Matematikte doğru; ama bilgisayarda 0.1 ve 0.2 ikili sistemde tam olarak temsil edilemez.

### Soru 20 · Cevap: **E**

`toStringAsFixed(n)`, sayıyı `n` ondalık basamağa yuvarlayıp **metin** olarak döndürür. `42.196` sayısı iki ondalık basamağa yuvarlandığında `42.20` elde edilir. Üçüncü ondalık basamak 6 olduğu için ikinci basamak yukarı yuvarlanır. Fiyatların her zaman `42.20 TL` gibi iki basamakla gösterilmesi bu yüzden kolaydır.

- **A)** `toStringAsFixed` kesme değil **yuvarlama** yapar; üçüncü ondalık basamak 6 olduğu için sonuç `42.19` değil, `42.20` olur.
- **B)** Basamak sayısı 2 ile sınırlandırıldığı için üçüncü ondalık basamak korunmaz.
- **C)** `toStringAsFixed(2)` her zaman **iki** ondalık basamak yazar; sondaki 0 atılmaz.
- **D)** Bu, `toStringAsFixed(0)` sonucudur.

### Soru 21 · Cevap: **D**

`tryParse`, kullanıcı girdisi gibi geçersiz olabilecek metinler için güvenli yoldur: Çeviremezse program çökmez, `null` döner. Ondalıklı metinler için `double.tryParse` kullanılır.

- **A)** `int.tryParse` ondalık bir metni kesip tam sayıya çevirmez; geçerli bir tam sayı değilse `null` döndürür.
- **B)** `tryParse` yuvarlama yapmaz.
- **C)** `int?` tipindeki bir değişken `12.5` değerini tutamaz.
- **E)** Hata veren `int.parse`'tır; `tryParse` geçersiz girdide hata yerine `null` döndürür.

### Soru 22 · Cevap: **E**

`?.` null değerde güvenle `null` döndürür. `??=` "null ise ata" demektir; ilk `??=` atama yapar, ikincisi yapmaz. VS Code ikinci satır için "sol taraf null olamaz" uyarısı gösterir.

- **A)** `??=` yalnızca değişken null ise atama yapar; ikinci satırda değişken artık `'Mert'` olduğu için atama yapılmaz.
- **B)** `?.` operatörü null değerde hata vermez; hata veren `!` operatörüdür.
- **C)** İki hata birlikte yapılmış.
- **D)** `?.` değer null ise özelliğe erişmez ve **null** döndürür; 0 değil.

### Soru 23 · Cevap: **C**

`toUpperCase()`, `i` harfini İngilizcedeki gibi `I` yapar ve sonuç `ISTANBUL` olur; `İSTANBUL` ile eşit değildir. Hafta 5'te bu sorunu `trBuyuk` adında bir extension ile çözdük.

- **A)** Satır bir karşılaştırmanın sonucunu yazdırıyor; sonuç `bool`'dur.
- **B)** Bu, `'istanbul'.toUpperCase()` ifadesinin değeridir; ama satırda bu değerin karşılaştırması yazdırılıyor.
- **D)** Metinlerin içinde Türkçe karakter kullanılabilir; yalnızca değişken **adlarında** kullanılamaz.
- **E)** `toUpperCase()` Türkçe kurallarını bilmez.

### Soru 24 · Cevap: **D**

`s.length` = 2 + 12 + 2 = 16. `s.trim()` → `'Flutter Dart'`; bu metinde `F` 0., boşluk 7., `D` 8. indekstedir. `substring(8)` → `'Dart'`.

- **A)** `trim()` önce uygulandığı için indeks 8, `Dart`'ın ilk harfine denk gelir.
- **B)** Baştaki **iki** ve sondaki **iki** boşluk sayılmalıdır: 2 + 12 + 2 = 16.
- **C)** `substring(8)` 8. indeksten **sonuna kadar** olan kısmı verir.
- **E)** `s.length` metnin **kırpılmamış** halinin uzunluğudur; baştaki ve sondaki boşluklar da sayılır.

### Soru 25 · Cevap: **D**

`!` operatörü derleyiciye "bu değer null değil" sözü verir; derleme bu yüzden geçer. Çalışma anında değer gerçekten null olduğu için söz bozulur ve program çöker. `!` yalnızca değerin null olmadığından **gerçekten** emin olunan yerlerde kullanılmalıdır.

- **A)** `null` döndüren `?.` operatörüdür; `!` ise "bu değer kesinlikle null değil" iddiasıdır.
- **B)** Null bir değerin uzunluğu 0 değildir; null değerin hiçbir özelliği yoktur.
- **C)** `!` tam olarak nullable değişkenler için vardır; derleyiciye "bana güven" der.
- **E)** Nullable değişkenler değer verilmezse otomatik olarak `null` ile başlar; kullanılabilir.

### Soru 26 · Cevap: **C**

`'49,90'` doğrudan çevrilemez (`f == null` → `true`). Virgül noktaya çevrilince `49.9` elde edilir; `49.9 * 2 = 99.8`. Mobil uygulamalarda Türk kullanıcıların virgülle yazdığı fiyatlar bu yüzden önce `replaceAll(',', '.')` ile düzeltilir.

- **A)** `toStringAsFixed(1)` **bir** ondalık basamak yazar.
- **B)** `g * 2` yazdırılıyor; ayrıca `f` null'dır.
- **D)** `replaceAll` virgülü noktaya çevirdiği için ikinci çeviri başarılı olur; `?? 0` devreye girmez.
- **E)** `double.tryParse` Türkçedeki ondalık virgülünü tanımaz; `'49,90'` için `null` döndürür.

## Hafta 2 · Kontrol Yapıları, Operatörler ve Döngüler

### Soru 27 · Cevap: **B**

`else if` zincirinde koşullar yukarıdan aşağıya denenir ve **ilk doğru** kol çalışır. Bu kodda koşulların sırası hatalıdır: Daha dar olan koşul (`<= 20`) önce yazılmalıydı; aksi halde "Düşük" koluna hiç ulaşılamaz.

- **A)** 15 ≤ 20 doğrudur; ama zincirde **ilk doğru kol** çalışır ve zincir orada biter.
- **C)** `else if` zincirinde yalnızca bir kol çalışır; bağımsız `if`'ler olsaydı ikisi de yazılırdı.
- **D)** 15 ≤ 50 doğru olduğu için ilk kol çalışır.
- **E)** `else` yalnızca yukarıdaki koşulların hiçbiri doğru değilse çalışır.

### Soru 28 · Cevap: **B**

`kosul ? a : b` → koşul doğruysa `a`, yanlışsa `b`. İki değerden birini seçmek için en kısa yoldur.

- **A)** Koşul (`adet == 0`) doğru olduğu için `?` ile `:` arasındaki ilk değer seçilir.
- **C)** Üçlü operatör iki değerden **yalnızca birini** seçer.
- **D)** Üçlü operatör bir **ifadedir** ve bir değer üretir; bu yüzden `print` içinde kullanılabilir. `if` ise kullanılamaz.
- **E)** Üçlü operatör koşulun kendisini değil, seçilen **değeri** döndürür.

### Soru 29 · Cevap: **D**

Sayaç 0, 3, 6, 9 değerlerini alır; 12 olduğunda `12 < 10` yanlış olur ve döngü biter.

- **A)** Döngü 9 kez değil, sayacın aldığı her değer için bir kez döner.
- **B)** `i += 3` her turda sayacı artırdığı için koşul bir noktada yanlış olur.
- **C)** `i` değerleri 0, 3, 6 ve 9'dur; 9 < 10 olduğu için son tur da çalışır.
- **E)** Sayaç birer değil, üçer artıyor.

### Soru 30 · Cevap: **D**

`do-while`'da koşul gövdeden **sonra** kontrol edilir. Gövde bir kez çalışır (10 yazılır), sonra `11 < 5` yanlış olduğu için döngü biter.

- **A)** `x` artıyor ve koşul zaten yanlış.
- **B)** Bu, `while` döngüsü olsaydı doğru olurdu; `do-while` gövdeyi koşula bakmadan **en az bir kez** çalıştırır.
- **C)** Koşul (`x < 5`) ilk kontrolde yanlış olduğu için döngü tekrar etmez.
- **E)** `x` 10 ile başlıyor; 5 hiçbir zaman yazdırılmaz.

### Soru 31 · Cevap: **A**

Bu yüzden derste güvenli kalıp olarak `(stdin.readLineSync() ?? '').trim()` kullandık: Null gelirse boş metin kabul edilir, sonra boşluklar temizlenir.

- **B)** Klavyeden gelen her şey **metin** olarak gelir; sayıya çevirmek için `int.tryParse` gerekir.
- **C)** Metot, okunan satırı geri döndürür.
- **D)** Dönüş tipi kesin olarak bellidir.
- **E)** Girdi akışı kapanırsa (ör. Ctrl + D) okunacak satır kalmaz ve `null` döner; bu yüzden tip nullable'dır.

### Soru 32 · Cevap: **C**

`case 6 || 7:` → "6 veya 7 ise". Dart 3'te her dolu `case` kendiliğinden biter. Birden fazla değer aynı kodu çalıştıracaksa `||` ile birleştirilir.

- **A)** Dart 3'te içi dolu bir `case` bittiğinde bir sonrakine **geçilmez**; `break` yazmak gerekmez.
- **B)** 6, `case 6 || 7` ile eşleşir; `default` yalnızca hiçbir `case` eşleşmezse çalışır.
- **D)** Eşleşen `case` çalıştıktan sonra `switch` biter; `default`'a geçilmez.
- **E)** Eski dillerde (ve Dart'ın eski sürümlerinde) gerekiyordu; Dart 3'te gerekmez.

### Soru 33 · Cevap: **C**

`false && x` ifadesinde sonuç `x`'e bakmadan `false`'tur; `true || x` ifadesinde de sonuç `x`'e bakmadan `true`'dur. Bu durumlarda sağ taraf **çalıştırılmaz**. Yalnızca üçüncü satırda `kontrol()` çağrılır; `sayac` 1 olur.

- **A)** `true || ...` ifadesinde de sağ taraf çalışmaz; sonuç zaten `true`'dur.
- **B)** `true || ...` her zaman `true`'dur.
- **D)** `false && ...` her zaman `false`'tur.
- **E)** `kontrol()` her satırda çağrılmaz; sonucun zaten belli olduğu yerde sağ taraf hiç çalışmaz.

### Soru 34 · Cevap: **A**

Kollar sırayla denenir; `>= 85` ilk eşleşen koldur. Aralıklarla çalışırken kolları büyükten küçüğe sıralamak gerekir.

- **B)** Dart 3'teki ilişkisel desenler (`>=`, `<` ...) tam olarak bunun içindir.
- **C)** 85 ≥ 90 yanlıştır.
- **D)** `_` yalnızca yukarıdaki kolların hiçbiri eşleşmezse seçilir.
- **E)** 85 ≥ 80 de doğrudur; ama kollar yukarıdan aşağıya denenir ve **ilk** eşleşen kol seçilir.

### Soru 35 · Cevap: **C**

Önce `3 * 4 = 12`, sonra `12 % 5 = 2`; ardından soldan sağa `2 + 2 - 1 = 3`. Emin olmadığınızda parantez kullanın: `2 + ((3 * 4) % 5) - 1`.

- **A)** `*` ve `%` aynı önceliktedir ve soldan sağa uygulanır: önce `3 * 4`, sonra `% 5`.
- **B)** `12 % 5` = 2'dir, 0 değil.
- **D)** Çarpma ve kalan işlemleri toplamadan **önce** yapılır; ayrıca `% 5` atlanmış.
- **E)** Sondaki `- 1` atlanmış.

### Soru 36 · Cevap: **D**

`n % 10` son basamağı verir, `n ~/= 10` son basamağı atar. Sırasıyla 2, 7, 0, 4 toplanır: 13.

- **A)** 4 + 0 + 7 + 2 = 13; hiçbir basamak atlanmamalı.
- **B)** `t` basamakların **toplamıdır**, sayının kendisi değil.
- **C)** `n ~/= 10` her turda sayıyı küçültür; sonunda 0 olur.
- **E)** Basamaklar ters sırayla birleştirilmiyor, toplanıyor.

### Soru 37 · Cevap: **C**

`continue`, turun geri kalanını atlayıp bir sonraki tura geçer. 3 ve 6 atlanır: 1 + 2 + 4 + 5 = 12.

- **A)** `continue` döngüyü bitirmez; yalnızca o turu atlar. Bu sonuç `break` kullanılsaydı çıkardı (1 + 2).
- **B)** Yalnızca 6 atlanmış gibi hesaplanmış.
- **D)** 1'den 6'ya kadar tüm sayıların toplamıdır; 3 ve 6 atlanmalı.
- **E)** 3'e bölünen sayıların (3 + 6) toplamıdır; bunlar atlanan sayılardır.

### Soru 38 · Cevap: **C**

`is` kontrolü doğru çıktığı yerde Dart, değişkenin tipini otomatik olarak yükseltir. `&&`'nin sağ tarafı yalnızca sol taraf doğruysa çalıştığı için orada `o` bir `String`'dir.

- **A)** `o is String` doğruysa `&&`'nin sağ tarafında `o` otomatik olarak `String` kabul edilir (tip yükseltme).
- **B)** `'Flutter'` 7 karakterdir ve 7 > 5.
- **D)** `&&` bir `bool` döndürür.
- **E)** Kısa devre sayesinde `o` String değilse `o.length` hiç çalıştırılmaz.

### Soru 39 · Cevap: **E**

`i = 0` için 1, `i = 1` için 2, `i = 2` için 3, `i = 3` için 4 kez `sayac++` çalışır: 10. `break` yalnızca en yakın (iç) döngüden çıkar.

- **A)** `break` olmasaydı 4 × 4 = 16 olurdu; `j > i` olduğunda iç döngü erken biter.
- **B)** Her `i` için `i + 1` tur yapılır: 1 + 2 + 3 + 4.
- **C)** İlk `break`'te tüm döngülerin bittiği düşünülmüş; bunun için etiketli `break` gerekirdi.
- **D)** `break` yalnızca **iç** döngüyü bitirir; dış döngü devam eder.

### Soru 40 · Cevap: **E**

50 ~/ 3 = 16 → 16 % 7 = 2 → x = 2 * (2 - 1) = 2. Bileşik atamada sağ taraf **önce tamamen** hesaplanır, sonra işlem uygulanır.

- **A)** `x *= x - 1` ifadesi `x = (x * x) - 1` değil, `x = x * (x - 1)` demektir.
- **B)** `x *= x` gibi hesaplanmış.
- **C)** `x - 1` sonucu (1) yazdırılmaz; `x` bu değerle çarpılır.
- **D)** Yalnızca ilk satır uygulanmış: 50 ~/ 3 = 16.

### Soru 41 · Cevap: **B**

`when`, desen eşleşse bile ek bir koşul sorar. `_ when premium` tutara bakmaksızın premium üyeleri yakalar; diğerleri tutara göre sıralanan kollara düşer.

- **A)** `_ when ...` bir koruma koşulu taşıdığı için son `_` kolundan farklıdır.
- **C)** Üçüncü çağrıda `premium` yanlıştır ve 80 hiçbir aralığa girmez.
- **D)** 200 ≥ 300 yanlıştır; `>= 150` kolu seçilir.
- **E)** İlk kol `_ when premium`: Her tutarla eşleşir, ama yalnızca `premium` doğruysa seçilir.

### Soru 42 · Cevap: **D**

`'2'` → 2, `'x'` → +10 (12), `'1'` → +1 (13), `'0'` → `break menu`. Dört eleman okunduğu için `i` = 4. Etiket olmasaydı `break` yalnızca switch'ten çıkardı.

- **A)** Geçersiz seçim (`'x'`) `default` koluna düşer ve toplama 10 ekler.
- **B)** Etiketli `break menu`, switch'ten değil `while` döngüsünden çıkar.
- **C)** `'0'` okunduğunda `break menu` döngüyü bitirir; son `'2'` hiç okunmaz.
- **E)** `girdiler[i++]` önce `i`'yi indeks olarak kullanır, **sonra** artırır; `'0'` okunduktan sonra `i` 4'tür.

### Soru 43 · Cevap: **E**

`6 & 3` → 110 & 011 = 010 = 2. `1 << 3` → 1000 = 8. `2 | 8` → 0010 | 1000 = 1010 = 10.

- **A)** `6 & 3` = 2'dir (110 & 011 = 010); 3 değil.
- **B)** `|` toplama değil, bit düzeyinde VEYA işlemidir; ayrıca `6 & 3` yanlış hesaplanmış.
- **C)** `1 << 3` = 8; ama sonuç `2 | 8` işlemidir.
- **D)** Yalnızca parantezlerin ilki hesaplanmış.

### Soru 44 · Cevap: **E**

Önce `2 * b = 6`, sonra `b + 6 = 9` hesaplanır; `??` en son uygulanır. `a` null olduğu için sonuç 9'dur. Öncelik tablosunda `??`, aritmetik ve karşılaştırma operatörlerinden sonra gelir.

- **A)** `a` null olduğu için `??` sağ tarafı kullanır.
- **B)** Bu sonuç `(b + 2) * b` hesaplanırsa çıkar; oysa çarpma toplamadan **önce** yapılır: `b + (2 * b)`.
- **C)** `2 * b` = 6'dır; `b + 6` = 9.
- **D)** Nullable değişkenler otomatik olarak `null` ile başlar.

## Hafta 3 · Fonksiyonlar ve Koleksiyonlar

### Soru 45 · Cevap: **A**

`kare(3)` = 9, `kare(2)` = 4; toplam 13. Fonksiyon çağrısı, döndürdüğü değerle yer değiştirir ve bir hesapta kullanılabilir.

- **B)** Bu, `kare(3 + 2)` olurdu; burada iki ayrı çağrının sonuçları toplanıyor: 9 + 4.
- **C)** `kare` çarpım değil kare hesaplar: 3 × 3 ve 2 × 2.
- **D)** `=> ifade`, "bu ifadeyi hesapla ve döndür" demektir.
- **E)** Sonuçlar metin olarak değil, sayı olarak toplanır.

### Soru 46 · Cevap: **A**

`required` olan isimli parametre mutlaka verilmeli; varsayılan değeri olan `adet` ise verilmezse 1 olur. Flutter'daki bileşenlerin neredeyse tamamı bu şekilde çağrılır.

- **B)** Zorunlu `baslik` parametresi eksik.
- **C)** Fonksiyonun konumsal parametresi yok; `3` hiçbir parametreye gitmez.
- **D)** İsimlendirilmiş parametreler **adlarıyla** verilmelidir.
- **E)** `baslik` parametresi `required` olduğu için verilmek zorundadır.

### Soru 47 · Cevap: **E**

İndeksler 0'dan başlar. Son eleman her zaman `liste[liste.length - 1]`'dir.

- **A)** İndeksle erişim elemanın kendisini verir, uzunluğu değil.
- **B)** `g.length - 1` = 2; 2. indeks **üçüncü** elemandır.
- **C)** İlk eleman `g[0]`'dır.
- **D)** Hata `g[g.length]` yazılsaydı (`g[3]`) alınırdı; `g.length - 1` son geçerli indekstir.

### Soru 48 · Cevap: **A**

Set'in `add` metodu, eleman gerçekten eklendiyse `true`, zaten varsa `false` döndürür. Tekrar istenmeyen veriler (favoriler, etiketler) için Set kullanılır.

- **B)** Var olan elemanı eklemek hata vermez; yalnızca hiçbir şey değişmez.
- **C)** Set'te her eleman yalnızca bir kez bulunabilir; 2 zaten var.
- **D)** Eleman eklenmediği için uzunluk değişmez.
- **E)** `add`, eleman **eklenmediği** için `false` döndürür.

### Soru 49 · Cevap: **A**

`List.filled(3, 0)` üç elemanlı, hepsi 0 olan **sabit uzunluklu** bir liste oluşturur. Elemanlar değiştirilebilir; `add` ve `remove` ise çalışma zamanı hatası verir.

- **B)** Hata `l.add(5)` yazılsaydı alınırdı.
- **C)** Atama bir eleman eklemez, var olanı değiştirir.
- **D)** İndeksler 0'dan başlar; `l[1]` **ikinci** elemandır.
- **E)** Sabit uzunluklu listelerde de elemanlar **değiştirilebilir**; yalnızca uzunluk değişemez.

### Soru 50 · Cevap: **D**

`void` bir fonksiyon değer döndürmez; sonucu yazdırılamaz veya bir değişkene atanamaz: *"This expression has a type of 'void' so its value can't be used."*

- **A)** Fonksiyonu çağırmak geçerlidir.
- **B)** Fonksiyonun kendisini bir değişkene atamak geçerlidir (Hafta 5).
- **C)** Tek satırlık `if` geçerlidir.
- **E)** Bir fonksiyon istediğiniz kadar çağrılabilir.

### Soru 51 · Cevap: **B**

Köşeli parantez içindeki parametreler isteğe bağlıdır; verilmezse varsayılan değer kullanılır. Sıra önemlidir: İkinci argüman her zaman `paraBirimi`'ne gider.

- **A)** Tam sayı değeri `double` parametreye gönderilebilir; `5.0` olarak kullanılır.
- **C)** `toStringAsFixed(2)` her zaman iki ondalık basamak yazar.
- **D)** Parametre verilmediğinde varsayılan değer (`'TL'`) kullanılır.
- **E)** İkinci çağrıda verilen `'USD'` varsayılan değerin yerine geçer.

### Soru 52 · Cevap: **C**

Parametre, aynı adlı üst düzey değişkeni gölgeler. `toplam += 5` yalnızca parametrenin **kopyasını** değiştirir. Ayrıca `int` değerler fonksiyona kopyalanarak gönderilir.

- **A)** Hiçbir çağrı üst düzey `toplam`'ı değiştirmez.
- **B)** `toplam` 0 değeriyle başlatıldı.
- **D)** Taşıyabilir; parametre üst düzey değişkeni **gölgeler** (fonksiyonun içinde onu görünmez kılar).
- **E)** Fonksiyonun içindeki `toplam` üst düzey değişken değil, **aynı adlı parametredir**.

### Soru 53 · Cevap: **D**

`insert(1, 'x')` → `[a, x, b, c, d]`; `removeAt(3)` → `[a, x, b, d]`; `remove('a')` → `[x, b, d]`. Her işlem bir öncekinin sonucuna uygulanır.

- **A)** `insert` ile eklenen `x` silinmez.
- **B)** `removeAt(3)` uygulanırken indeksler `insert`'ten önceki listeye göre hesaplanmış.
- **C)** `removeAt(3)`, `insert`'ten **sonraki** listeye uygulanır: `[a, x, b, c, d]` listesinde 3. indeks `c`'dir.
- **E)** `remove('a')` değere göre siler; `a` listeden çıkar.

### Soru 54 · Cevap: **B**

"Mevcut sayıyı al, hiç yoksa 0 kabul et, bir artır, geri yaz." Hafta 5'te aynı iş `m.update(k, (n) => n + 1, ifAbsent: () => 1)` ile de yapılabilir.

- **A)** Map, anahtarları **ilk eklenme** sırasıyla tutar.
- **C)** Map'te bir anahtar yalnızca bir kez bulunabilir.
- **D)** Olmayan anahtar `null` döndürür; `?? 0` bunu 0'a çevirir.
- **E)** Aynı anahtar tekrar geldiğinde değeri **artırılır**; yeni bir değer yazılmaz.

### Soru 55 · Cevap: **D**

Parametresiz `sort()` metinleri **karakter kodlarına** göre sıralar: önce büyük harfler (A, M), sonra küçük harfler (e), en sonda Türkçe harfler (ç). Türkçe sıralama için Hafta 5'teki `trKarsilastir` gibi bir karşılaştırma fonksiyonu gerekir.

- **A)** Bu, Türk alfabesine göre ve büyük-küçük harf ayrımı yapılmadan sıralamadır; `sort()` bunu yapmaz.
- **B)** Sıralanabilir; yalnızca sonuç Türk alfabesine uygun olmaz.
- **C)** `sort()` listeyi değiştirir; orijinal sıra korunmaz.
- **E)** Büyük harfler, karakter kodlarında küçük harflerden **önce** gelir; `Muz`, `elma`'dan öncedir.

### Soru 56 · Cevap: **B**

`split` metni listeye, `join` listeyi metne çevirir. `sublist(a)` → a'dan sona kadar; `sublist(a, b)` → a'dan b'ye kadar (b hariç).

- **A)** `sublist(1)` tek bir eleman değil, 1. indeksten sona kadar olan parçayı verir.
- **C)** `sublist(1)` 1. indeksten başlar; `yeni` (0. indeks) dahil edilmez.
- **D)** `join` listeyi **tek bir metne** çevirir; köşeli parantez yazılmaz.
- **E)** Birleştirmede ayırıcı olarak `' | '` kullanıldı.

### Soru 57 · Cevap: **A**

Liste: `[Ana, K-A, K-B, Giriş, Ayar]`. `...` başka bir listenin elemanlarını döker. Flutter'da ekranlar `children: [...]` içinde tam olarak bu şekilde, veriye göre kurulur.

- **B)** `if-else` yalnızca **bir** eleman ekler.
- **C)** `for` iki eleman ekler (`K-A`, `K-B`): Liste `[Ana, K-A, K-B, Giriş, Ayar]` olur.
- **D)** `giris` yanlış olduğu için `else` kolundaki değer eklenir.
- **E)** `K-B` 2. indekstedir; 3. indeks `Giriş`'tir.

### Soru 58 · Cevap: **B**

`a` ve `b` aynı listedir: `[1, 2, 3, 4]`. `c` ayrı bir kopyadır: `[2, 3]`. `a == b` aynı nesne olduğu için `true`; `a == c` farklı nesneler olduğu için `false`.

- **A)** `c`, `b.add(4)`'ten önce kopyalandı ve ardından `1` silindi: `[2, 3]`.
- **C)** `b = a` kopya değildir; `b`'ye eklenen eleman `a`'da da görünür ve ikisi aynı listedir.
- **D)** Listelerde `==` içeriği değil, **aynı liste nesnesi** olup olmadığını karşılaştırır; ayrıca içerikler de farklı.
- **E)** `List.of` gerçek bir kopya oluşturur; `c`'den silinen eleman yalnızca `c`'yi etkiler.

### Soru 59 · Cevap: **E**

`a − b` = `{1, 2}`, `b − a` = `{5}`; birleşimleri `{1, 2, 5}`. Bu işlem "yalnızca birinde olanlar" (simetrik fark) demektir.

- **A)** `union`, önce kendi elemanlarını (1, 2), sonra diğer kümenin yeni elemanlarını (5) sıralar.
- **B)** Bu, `a.union(b)` olurdu; ortak elemanlar (3, 4) farklarda yer almaz.
- **C)** Bu, kesişimdir (`intersection`); ifade ise iki farkın birleşimini alıyor.
- **D)** Yalnızca `a.difference(b)` hesaplanmış; `b.difference(a)` = `{5}` de eklenmelidir.

### Soru 60 · Cevap: **A**

f(7) = 7 × f(5) = 7 × 5 × f(3) = 7 × 5 × 3 × f(1) = 7 × 5 × 3 × 1 = 105.

- **B)** 7 ile başlanması gerekirken 5'ten başlanmış.
- **C)** Son adım (`f(1)` → 1) ve 3 çarpanı atlanmış.
- **D)** Bu, 7! (7 × 6 × 5 × ... × 1) olurdu; fonksiyon her adımda 2 azaltıyor.
- **E)** `n <= 1` durma koşulu 7 → 5 → 3 → 1 adımlarında sağlanır; sonsuz çağrı yoktur.

### Soru 61 · Cevap: **E**

`containsKey` anahtarın varlığına bakar, değerine bakmaz. `remove` silinen değeri, anahtar yoksa `null` döndürür.

- **A)** `'a'` anahtarı Map'te **vardır**; yalnızca değeri `null`'dır.
- **B)** Olmayan bir anahtarı silmek Map'i değiştirmez.
- **C)** `m['a']` null olduğu için `??` sağ taraftaki `-1`'i kullanır.
- **D)** Olmayan bir anahtarı `remove` ile silmek hata vermez; `null` döndürür.

### Soru 62 · Cevap: **C**

2400 × 75 / 100 = 1800. İsimli parametreler herhangi bir sırayla verilebilir; konumsal parametreler (`ad`, `fiyat`) ise tanımdaki sırayla verilmelidir.

- **A)** `yeni: true` verildiği için başa `[YENİ] ` eklenir.
- **B)** Bu, indirim **tutarıdır**; fiyattan düşülmesi gerekir: 2400 − 600.
- **D)** İsimli argümanların sırası önemli değildir.
- **E)** `indirim: 25` verildiği için fiyat %25 indirimli hesaplanır.

## Hafta 4 · Sınıflar ve Nesneler

### Soru 63 · Cevap: **D**

Sınıf, bir şeyin hangi verilere sahip olacağını ve neler yapabileceğini tanımlar. Nesneler bu tanıma uyan somut örneklerdir; her birinin kendi verisi vardır.

- **A)** Bir sınıftan istenildiği kadar nesne oluşturulabilir; yalnızca tekil nesne (singleton) deseni bunu bilerek kısıtlar.
- **B)** Dart'ta `new` isteğe bağlıdır ve kullanılmaz: `Urun()`.
- **C)** Sınıflar hem veriyi (alanlar) hem davranışı (metotlar) bir arada tutar; NYP'nin temel fikri budur.
- **E)** Tam tersi: Sınıf kalıp (mimari plan), nesne örnektir (o plana göre yapılmış ev).

### Soru 64 · Cevap: **E**

`print`, nesnenin `toString()` metodunu çağırır. Kendi sürümünüzü yazmadıysanız `Object`'ten gelen sürüm `Instance of 'Urun'` döndürür. Hata ayıklamayı kolaylaştırmak için her sınıfa bir `toString` yazmak iyi bir alışkanlıktır.

- **A)** Kurucu yazılmayan sınıflara Dart parametresiz bir varsayılan kurucu ekler.
- **B)** `toString()` yazılmamış olsa da `Object`'ten gelen varsayılan sürüm çalışır.
- **C)** `Urun()` geçerli bir nesne oluşturur.
- **D)** Sınıfın adı yalnızca `runtimeType` ile yazdırılır; `print` ise `toString()`'i çağırır.

### Soru 65 · Cevap: **D**

`Nokta(this.x, this.y)`: İlk argüman `x` alanına, ikincisi `y` alanına atanır. Atama, kurucunun gövdesinden önce yapılır.

- **A)** `this.x` ve `this.y`, argümanları doğrudan alanlara atar.
- **B)** Toplama yapılıyor, çarpma değil.
- **C)** `p.x + p.y` iki tam sayının toplamıdır, metin birleştirme değildir.
- **E)** Kurucudaki `this.x, this.y` alanlara değer verdiği için null safety kuralı sağlanır.

### Soru 66 · Cevap: **D**

Getter, dışarıdan bir alan gibi görünen ve **parantezsiz** çağrılan bir metottur. `d.cap()` yazılırsa önce getter çalışır, dönen `double` değer ise bir fonksiyon olmadığı için çağrılamaz.

- **A)** Getter'lar parantezsiz okunur; geçerlidir.
- **B)** Getter'ın değeri bir hesapta kullanılabilir.
- **C)** `r` sıradan bir alandır; değiştirilebilir.
- **E)** Getter'ın döndürdüğü değer bir değişkene atanabilir.

### Soru 67 · Cevap: **B**

Dart'ta **tek kalıtım** vardır. Ortak davranışları birden fazla kaynaktan almak için Hafta 5'te gördüğümüz `implements` (arayüz) ve `with` (mixin) kullanılır.

- **A)** Birden fazla kaynaktan özellik almanın yolları `implements` ve `with`'tir; `extends` değil.
- **C)** `extends` yazılmasa da her sınıf `Object`'ten kalıtım alır.
- **D)** Dart'ta çoklu kalıtım yoktur.
- **E)** Bir sınıf bir başka sınıfı genişletebilir: `class Elektronik extends Urun`.

### Soru 68 · Cevap: **C**

`@override` yazıldığında, adı yanlış yazılan bir metot için VS Code "The method doesn't override an inherited method." uyarısı verir. Yazılmazsa yanlış adlı metot sessizce **yeni bir metot** olur ve hata gözden kaçar.

- **A)** `@override` yazılmasa da override gerçekleşir; etiket yalnızca niyeti belirtir ve hataları yakalatır.
- **B)** Üst sınıfın metodu silinmez; `super.metot()` ile hâlâ çağrılabilir.
- **D)** Private yapan, adın `_` ile başlamasıdır.
- **E)** Override edilen her metotta ve getter'da kullanılır.

### Soru 69 · Cevap: **D**

Ad çakışması olduğunda metodun içindeki ad **parametreyi** ifade eder. Doğrusu: `this.deger = deger * 2;`. Program hata vermeden çalıştığı için bu bir mantık hatasıdır.

- **A)** `deger` alanı 0 ile başlatıldı.
- **B)** Parametrenin değeri alana atanmıyor.
- **C)** Metodun içindeki iki `deger` de **parametredir**; nesnenin alanı değişmez. Alan için `this.deger` yazılmalıydı.
- **E)** Taşıyabilir; bu durumda metodun içinde parametre, alanı gölgeler.

### Soru 70 · Cevap: **E**

`Urun.ucretsiz('Çanta')`, `Urun('Çanta', 0)` çağrısına yönlendirilir. Asıl kurulum mantığı tek bir yerde (ana kurucuda) kalır.

- **A)** `fiyat` alanının tipi `double`'dır; 0 değeri `0.0` olarak saklanır ve öyle yazdırılır.
- **B)** `: this(...)` ile yönlendirme tam olarak bunun içindir.
- **C)** `toStringAsFixed(2)` kullanılmadığı için iki basamak yazılmaz.
- **D)** Yönlendiren kurucu fiyata 0 değerini veriyor.

### Soru 71 · Cevap: **E**

Her `Siparis()` çağrısında ortak `sayac` bir artar ve yeni değer siparişin numarası olur. Static üyelere sınıf adıyla erişilir: `Siparis.sayac`.

- **A)** `++sayac` önek artırmadır: önce artırır, sonra yeni değeri kullanır.
- **B)** Sayaç her nesne oluşturulduğunda artar; üç nesneden sonra 3'tür.
- **C)** `static` alan her nesneye değil **sınıfa** aittir; tüm nesneler aynı sayacı paylaşır.
- **D)** Static alanlar başlatıcı listesinde kullanılabilir; kullanılamayan `this`'tir.

### Soru 72 · Cevap: **C**

`t.derece = ...` yazıldığında setter çalışır ve yalnızca 16–30 aralığındaki değerleri kabul eder. Kurallar sınıfın içinde olduğu için programın neresinden atama yapılırsa yapılsın aynı kontrol uygulanır.

- **A)** 18 aralıktadır ve kabul edilir.
- **B)** 35 aralık dışıdır; ayrıca sonraki atamalar da var.
- **D)** 10, 16–30 aralığında olmadığı için setter değeri reddeder.
- **E)** Taşıyabilir; dışarıdan bakan için `derece` sıradan bir alan gibidir.

### Soru 73 · Cevap: **A**

Döngü hangi elemanın hangi türde olduğunu bilmez; her nesneye "sesini çıkar" der ve her nesne kendi bildiği gibi cevap verir. Buna **polimorfizm** denir.

- **B)** Listenin ikinci elemanı düz bir `Hayvan` nesnesidir; kendi `ses()` metodu çalışır.
- **C)** `ses()` metodunun döndürdüğü metinler yazdırılıyor, sınıf adları değil.
- **D)** Değişkenin tipi `Hayvan` olsa da çalışan metot nesnenin **gerçek** tipine göre seçilir.
- **E)** Her `Kedi` aynı zamanda bir `Hayvan`'dır; üst sınıf tipindeki listeye konabilir.

### Soru 74 · Cevap: **E**

**Hangi üyelere erişilebileceğini** statik tip (`Hayvan`), **hangi sürümün çalışacağını** gerçek tip (`Kedi`) belirler. `tirmala`'ya erişmek için önce `if (h is Kedi)` ile kontrol gerekir.

- **A)** Çağrılan metot `ses()` değil, `tirmala()`'dır.
- **B)** Atanabilir; her kedi bir hayvandır. Sorun ataması değil, erişilen metottur.
- **C)** Derleyici, hangi üyelere erişilebileceğine değişkenin **tanımlanan** tipine bakarak karar verir.
- **D)** Hata çalışma zamanına bırakılmaz; derleme sırasında yakalanır.

### Soru 75 · Cevap: **A**

Alt sınıfın kurucusu, nesnenin üst sınıftan gelen kısmını kurmak için `super(...)` ile üst sınıfın kurucusunu çağırır. Değer bir parametreden gelmek zorunda değildir.

- **B)** `: super(2)` üst sınıfın kurucusuna 2 değerini gönderir.
- **C)** `teker` alanı `final` ve null olamayan bir alandır; üst sınıfın kurucusunda değer alır.
- **D)** Gönderebilir; bisikletlerin teker sayısı her zaman 2 olduğu için bu, mantıklı bir tasarımdır.
- **E)** Önce `teker`, sonra `elektrikli` yazdırılıyor.

### Soru 76 · *Zor*

`cuzdan.dart` dosyasında şu sınıf tanımlıdır:

```
class Cuzdan {
  double _bakiye = 0;
  void yatir(double t) => _bakiye += t;
  double get bakiye => _bakiye;
}
```

Bu dosyayı `import` eden `main.dart` dosyasında aşağıdaki kod bulunmaktadır:

```
import 'cuzdan.dart';

void main() {
  Cuzdan c = Cuzdan();

  // Seçenekler bu noktada ayrı ayrı
  // değerlendirilir.
}
```

Aşağıdaki seçeneklerden hangisi, belirtilen noktaya eklendiğinde **derleme hatası** verir?

A) `c.yatir(500);`\
B) `c._bakiye = 500;`\
C) `print(c.bakiye);`\
D) `Cuzdan b = Cuzdan();`\
E) Hiçbiri; aynı projedeki tüm dosyalar private alanlara erişebilir.

### Soru 77 · Cevap: **B**

Soyut sınıftan doğrudan nesne oluşturulamaz; ama soyut sınıfın **factory** kurucusu, gelen veriye göre uygun alt sınıfın nesnesini döndürebilir. Alt sınıflar, üst sınıfın private `Bildirim._()` kurucusunu `super._()` ile çağırır.

- **A)** `Bildirim('mesaj')` bir **factory** kurucu çağrısıdır ve soyut sınıfın değil, alt sınıfların nesnelerini döndürür; geçerlidir.
- **C)** `'guncelleme'`, `'mesaj'` koluyla eşleşmez; `_` koluna düşer.
- **D)** `'mesaj'` metni ilk kolla eşleşir.
- **E)** Factory, `Mesaj` ve `Sistem` nesneleri döndürür; nesnelerin gerçek tipi bunlardır.

### Soru 78 · Cevap: **E**

Sıra: **1)** alanların başlangıç değerleri (`iz = '1'`) → **2)** başlatıcı listesi (`ek = 'a2'`) → **3)** kurucunun gövdesi (`iz = '1' + 'a2' + '3'`).

- **A)** Gövdede `ek`'in yanına `'3'` de eklenir.
- **B)** Null olamayan `ek` alanına başlatıcı listesinde değer veriliyor; bu yeterlidir.
- **C)** Gövde çalıştığında `ek` başlatıcı listesinde zaten `'a2'` olmuştur.
- **D)** `iz` alanının başlangıç değeri (`'1'`) kurucudan **önce** verilir ve korunur.

### Soru 79 · Cevap: **E**

Dart'ın gözünde `k.icerik` kontrol ile kullanım arasında değişebilir (örneğin bir alt sınıf onu getter'la her seferinde farklı döndürebilir). Çözüm: Değeri önce yerel bir değişkene almak: `Object i = k.icerik; if (i is String) print(i.length);`

- **A)** Hata derleme sırasında yakalanır.
- **B)** `is` ile tip yükseltme yalnızca **yerel değişkenlerde** çalışır; nesnenin alanında çalışmaz.
- **C)** Her değer bir `Object`'tir; atama geçerlidir.
- **D)** Yazdırılmaya çalışılan, metnin uzunluğudur.

### Soru 80 · Cevap: **A**

`C.ad()` → `'C' + B.ad()`; `B.ad()` → `A.ad() + 'B'` = `'AB'`. Sonuç: `'C' + 'AB'` = `'CAB'`. Her `super.ad()` bir üstteki sınıfın sürümünü çağırır.

- **B)** `x`'in tanımlanan tipi `A` olsa da gerçek tipi `C`'dir; `C`'deki sürüm çalışır.
- **C)** `B`'nin sürümü `A`'nın metnini **önce**, kendi harfini **sonra** yazar: `AB`.
- **D)** `C`'nin sürümü kendi harfini başa koyar: `C` + `AB`.
- **E)** `super.ad()` çağrısı üst sınıfların sürümlerini de çalıştırır.

### Soru 81 · Cevap: **C**

`Telefon` bir `Elektronik` olduğu için ilk kol onu yakalar; `Telefon _` koluna hiç ulaşılmaz. Özel tipler genel tiplerden **önce** yazılmalıdır: `Telefon _`, `Elektronik _`, `_`.

- **A)** İki hata birlikte yapılmış.
- **B)** Düz bir `Urun` nesnesi `Elektronik` değildir; `_` koluna düşer.
- **D)** VS Code bu kol için "önceki kollar tarafından zaten karşılanıyor" **uyarısı** verir, ama program derlenir.
- **E)** Kollar yukarıdan aşağıya denenir; her telefon aynı zamanda bir `Elektronik` olduğu için ilk kol eşleşir.

## Hafta 5 · OOP II ve Fonksiyonel Programlama

### Soru 82 · Cevap: **A**

Hata mesajı: *"Abstract classes can't be instantiated."* Soyut sınıf bir kalıptır; nesneler onun somut alt sınıflarından (`Kare`, `Daire`...) oluşturulur.

- **B)** Soyut sınıfların kurucusu olabilir; alt sınıflar onu `super` ile çağırır. Sorun, nesnenin doğrudan oluşturulmasıdır.
- **C)** Değişkenin tipi değil, oluşturulan nesnenin sınıfı önemlidir.
- **D)** Dart bu hatayı çalışma zamanına bırakmaz; derleme sırasında yakalar.
- **E)** Soyut metodun gövdesi yoktur; çalıştırılacak bir kod olmadığı için nesne oluşturmaya hiç izin verilmez.

### Soru 83 · Cevap: **A**

`class Gonderi with Begenilebilir { ... }`. Birden fazla mixin virgülle eklenir: `with Begenilebilir, Yorumlanabilir`.

- **B)** `extends` kalıtım içindir ve yalnızca bir sınıf alır.
- **C)** `import` başka bir dosyayı kullanılabilir hale getirir.
- **D)** `mixin` kelimesi mixin'i **tanımlarken** kullanılır, eklerken değil.
- **E)** `implements` bir sözleşme uygulatır; kod getirmez. Mixin'in amacı ise hazır kodu eklemektir.

### Soru 84 · Cevap: **C**

Her enum değerinin hazır iki özelliği vardır: `index` (0'dan başlayan sıra) ve `name` (adı, metin olarak). Tüm değerlerin listesi `Renk.values` ile alınır.

- **A)** `mavi` üçüncü değerdir ve indeksi 2'dir.
- **B)** `index` 0'dan başlar: kirmizi 0, yesil 1, mavi 2.
- **D)** `index` bir sayıdır.
- **E)** `name` yalnızca değerin adını verir; `Renk.yesil` ise değerin kendisi yazdırıldığında görünür.

### Soru 85 · Cevap: **B**

`(int a, int b) => a + b` adı olmayan bir fonksiyondur; `topla` değişkeni onu tutar. `topla(2, 3)` = 5, `5 * 2` = 10.

- **A)** Fonksiyon çağrılıyor ve sonucu hesaplanıyor.
- **C)** Dart'ta fonksiyonlar birer değerdir; değişkenlere atanabilir.
- **D)** Çarpma, fonksiyonun **sonucuna** (5) uygulanır: 5 × 2.
- **E)** `topla(2, 3)` 5 döndürür; `* 2` bu değeri ikiye katlar.

### Soru 86 · Cevap: **D**

`any` → "en az biri sağlıyor mu?", `every` → "hepsi sağlıyor mu?". İkisi de `bool` döndürür.

- **A)** `any` için tek bir eşleşen eleman yeterlidir.
- **B)** Listede bir tek sayı (7) var: `any` doğru, `every` yanlıştır.
- **C)** 7 çift olmadığı için "hepsi çift mi?" sorusunun cevabı hayırdır.
- **E)** `any` ve `every` eleman değil, `bool` döndürür.

### Soru 87 · Cevap: **E**

`map` her elemanı dönüştürür; eleman sayısı aynı kalır. Flutter'da veri listesi ekran parçalarına tam olarak böyle dönüştürülür: `urunler.map((u) => UrunKarti(u)).toList()`.

- **A)** `toList()` çağrıldığı için sonuç bir listedir ve köşeli parantezle yazdırılır.
- **B)** `map` her elemanı verilen fonksiyondan geçirir; liste değişmeden kalmaz.
- **C)** Bu, karelerin toplamı olurdu (`fold`); `map` eleman sayısını korur.
- **D)** Fonksiyon `x * 2` değil, `x * x`.

### Soru 88 · Cevap: **D**

Extension'ın içindeki `this`, getter'ın çağrıldığı metindir. `'Dart'.ilk` → `'D'`, `'art'.ilk` → `'a'`.

- **A)** Extension harfleri büyük harfe çevirmez; `'art'` küçük `a` ile başlar.
- **B)** Birleştirilen, iki metnin **ilk harfleridir**.
- **C)** `ilk` getter'ı yalnızca ilk karakteri döndürür.
- **E)** Extension, kodunu değiştiremediğimiz tiplere dışarıdan yeni metot ve getter eklemenin yoludur.

### Soru 89 · Cevap: **B**

`fold(0, (t, n) => t + n)` → 0 + 70 + 80 + 90 = 240. `240 / 3` → `80.0`. `double` değerler, ondalık kısmı 0 olsa da `.0` ile yazdırılır.

- **A)** `fold` burada bir `int` (240) döndürür; bölünebilir.
- **C)** `toStringAsFixed(2)` kullanılmadığı için iki basamak yazılmaz.
- **D)** `/` operatörü her zaman `double` döndürür; değer `80.0` olarak yazdırılır.
- **E)** `fold` toplamı (240) hesaplar; sonra `/ notlar.length` ile 3'e bölünür.

### Soru 90 · Cevap: **B**

Karşılaştırma `(a, b) => b.length.compareTo(a.length)` uzunluğa göre azalan sıralar: ananas (6), kivi/elma (4), muz (3). Eşit uzunluktakilerin sırası sonucu etkilemez.

- **A)** `b` ile `a`'nın yeri değiştirildiği için sıralama **azalan** uzunluğa göredir: En uzun önce.
- **C)** En kısa metin `muz`'dur (3 harf); listenin sonuna o gelir.
- **D)** Karşılaştırma fonksiyonu sayesinde herhangi bir ölçüte göre sıralanabilir.
- **E)** Liste sıralandıktan sonra ilk ve son elemanlar alınıyor.

### Soru 91 · Cevap: **A**

Çağrılar sırasıyla 0, 1, 2 döndürür. Döndürülen isimsiz fonksiyon, `olustur` bitmiş olsa bile `n` değişkenini hatırlamaya ve değiştirmeye devam eder.

- **B)** Üç çağrı yapılıyor; ilk ikisinin sonucu yazdırılmasa da `n` artar.
- **C)** `n++` sonek artırmadır: Önce **eski** değeri döndürür, sonra artırır. Üçüncü çağrı 2 döndürür (n 3 olur).
- **D)** Kullanabilir; buna **kapanış** (closure) denir.
- **E)** Fonksiyon `n` değişkenini hatırlar (kapanış); her çağrıda aynı `n` artar.

### Soru 92 · Cevap: **D**

`firstWhere` koşulu sağlayan ilk elemanı döndürür; bulamazsa `orElse` verilmişse onun döndürdüğü değeri, verilmemişse hata verir. Diğer güvenli yol: `l.where(...).firstOrNull`.

- **A)** Bu hata `orElse` verilmeseydi alınırdı; `orElse` bulunamama durumunda çalışır.
- **B)** `firstWhere` son elemanı değil, koşulu sağlayan **ilk** elemanı döndürür.
- **C)** Bulunamadığında `orElse` fonksiyonunun döndürdüğü değer kullanılır.
- **E)** Hiçbir eleman `T` ile başlamıyor.

### Soru 93 · Cevap: **B**

Her enum değeri kendi `numara`'sını taşır; `uyarMi` metodu her değer için ayrı çalışır. Orta (40) ve büyük (44) için 39 ≤ numara doğrudur.

- **A)** `where` yalnızca `uyarMi(39)` doğru olan değerleri seçer.
- **C)** 39 ≤ 44 de doğrudur.
- **D)** 39 ≤ 36 yanlıştır; küçük beden uymaz.
- **E)** `map((b) => b.name)` numaraları değil, değerlerin **adlarını** verir.

### Soru 94 · Cevap: **B**

`extends` → kod miras alınır. `implements` → yalnızca "bu üyelere sahip olacağım" sözü verilir; her üye yeniden yazılmalıdır.

- **A)** Eksik uygulama derleme sırasında yakalanır: *"Missing concrete implementation of 'A.selam'."*
- **C)** Gövdesiz bir `selam` metodu yoktur; metot hiç yazılmamıştır.
- **D)** Dart'ta her sınıf aynı zamanda bir arayüzdür; normal sınıflar da `implements` edilebilir.
- **E)** Bu, `extends` kullanılsaydı doğru olurdu; `implements` yalnızca **sözleşmeyi** alır.

### Soru 95 · Cevap: **C**

Her durum için kollar yukarıdan aşağı denenir. `when` koşulu sağlanmazsa aynı türün sonraki koluna geçilir. `durumlar.map(ekran)`, `ekran` fonksiyonunu her duruma uygular.

- **A)** 500 ≠ 404; `when` koşulu sağlanmadığı için bir sonraki `Hata h` koluna geçilir.
- **B)** `map(ekran)`, fonksiyonun kendisini gönderir; geçerlidir.
- **D)** Üç alt sınıfın hepsi için en az bir korumasız kol var: `Yukleniyor _`, `Veri v`, `Hata h`.
- **E)** `when` korumalı kollar daha önce yazıldığı için boş liste ve 404 kodu önce onlarla eşleşir.

### Soru 96 · Cevap: **B**

Mixin'in alanları, mixin'i alan sınıfın her nesnesine ayrı ayrı eklenir. g1 iki, g2 bir, u üç kez beğenildi.

- **A)** Mixin'ler alan tanımlayabilir; tanımlayamadıkları şey **kurucudur**. Alan tanımlayamayanlar extension'lardır.
- **C)** Mixin'deki alan `static` değildir; her **nesnenin** kendi `begeni` alanı vardır.
- **D)** `begeni++` her `begen()` çağrısında sayacı bir artırır; yalnızca ilk çağrıda değil.
- **E)** Aynı sınıftan nesneler de alanı paylaşmaz.

### Soru 97 · Cevap: **B**

`birlestir(indirim, kdv)` → `(x) => kdv(indirim(x))` → kdv(80) = 120.0. `birlestir(kdv, indirim)` → indirim(150) = 130.0. Kampanya kurallarının **sırası** bu yüzden önemlidir.

- **A)** Fonksiyonlar birer değerdir; bir fonksiyondan döndürülebilir.
- **C)** `birlestir(ilk, ikinci)` önce `ilk`'i uygular: İlk çağrıda önce indirim (80), sonra KDV (120).
- **D)** Kurallar `double` döndürür; değerler `.0` ile yazdırılır.
- **E)** Kuralların uygulanma sırası sonucu değiştirir: 100 × 1.5 − 20 = 130.

### Soru 98 · Cevap: **A**

d → dart (4) + dil (3) + dizi (4) = 11; f → flutter (7) + fonksiyon (9) = 16. `ifAbsent` anahtar ilk kez görüldüğünde, `update` fonksiyonu sonraki görülmelerde çalışır.

- **B)** Anahtar olarak kelimenin tamamı değil, ilk harfi (`k[0]`) kullanılıyor.
- **C)** Map, anahtarları ilk eklenme sırasıyla tutar; ilk kelime `dart` olduğu için `d` önce gelir.
- **D)** Bu, kelime **sayıları** olurdu; değerlere her kelimenin **uzunluğu** ekleniyor.
- **E)** `ifAbsent` yalnızca ilk kelimede çalışır; sonraki kelimelerde `update` fonksiyonu değeri artırır.

### Soru 99 · Cevap: **C**

`sirali` → `[300, 120, 80, 45]`; `skip(1)` → `[120, 80, 45]`; `take(2)` → `[120, 80]`; `reduce((a, b) => a - b)` → 40. `List.of` ile kopya alındığı için `fiyatlar` bozulmadı.

- **A)** Azalan sıralı listede `skip(1).take(2)` → `[120, 80]`; `120 - 80` = 40.
- **B)** `reduce` burada toplama değil, çıkarma yapıyor; ayrıca yalnızca iki eleman alınıyor.
- **D)** `sort` yalnızca `sirali` kopyasını değiştirdi; `fiyatlar` listesinin ilk elemanı hâlâ 120'dir.
- **E)** `List.of` sayesinde orijinal liste değişmedi; sıralanmamış listenin ilk elemanı 120'dir.

### Soru 100 · Cevap: **A**

`whereType<num>()` yalnızca `num` türündeki elemanları seçer. Dart'ta `int` ve `double`, `num` türünün alt türleridir. Bu nedenle `karisik` listesinden `3`, `2.5` ve `4` değerleri seçilir.

`toList()` ile bu elemanlardan bir `List<num>` oluşturulur. Böylece `List<num>` için tanımlanan `Toplam` extension'ının `toplam` getter'ı kullanılabilir. `fold<num>(0, (t, x) => t + x)` ifadesi, başlangıç değeri 0 olacak şekilde elemanları toplar:

`0 + 3 + 2.5 + 4 = 9.5`

`fold<num>` kullanımı, biriktirme işleminin türünü açıkça `num` olarak belirtir.

- **B)** `true` bir sayı değildir; `whereType<num>()` tarafından filtrelenir.
- **C)** `2.5` de toplama dahil edilmelidir: `3 + 2.5 + 4 = 9.5`.
- **D)** `toplam`, doğrudan `List<Object>` üzerinde değil, `whereType<num>().toList()` sonucunda oluşan `List<num>` üzerinde çağrılır. Bu nedenle extension geçerlidir.
- **E)** `2.5` bir `double`'dır ve `double` da `num` türünün alt türüdür; toplama dahil edilir.


---

*BMH309 Mobil Cihaz Programlama · Soru Bankası (Hafta 1–5)*
