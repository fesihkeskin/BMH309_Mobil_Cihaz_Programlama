# <font color='blue'>**Hafta 1 · Giriş, Kurulum ve Değişkenler**</font>

---
**Ders:** BMH309 Mobil Cihaz Programlama
**Konular:** Dersin tanıtımı · Flutter ve Dart nedir? · Geliştirme ortamının kurulumu · İlk Dart programı · Değişkenler · Sayılar · Metinler (String) · Mantıksal değerler (bool) · Tür dönüşümleri · Null safety'ye ilk bakış
**Yazar:** Dr. Öğr. Üyesi Fesih Keskin

---

# Giriş

Bu dönem boyunca telefonunuza kurup arkadaşlarınıza gösterebileceğiniz gerçek mobil uygulamalar geliştireceğiz. Bunun için **Flutter** kullanacağız. Flutter'ın programlama dili ise **Dart**'tır.

Bu hafta üç iş yapacağız:

1. Dersin nasıl işleyeceğini, Flutter ve Dart'ın ne olduğunu öğreneceğiz.
2. Dönem boyunca kullanacağımız geliştirme ortamını kurup ilk Flutter uygulamamızı telefonda çalıştıracağız.
3. İlk Dart programlarımızı yazıp programlamanın en temel yapı taşını, **değişkenleri** ve **veri tiplerini** öğreneceğiz.

### Bu Haftanın Hedefleri

Bu haftanın sonunda şunları yapabiliyor olmalısınız:

1. Dersin işleyişini ve yapay zekâ kullanım kurallarını açıklamak.
2. Native ve çapraz platform geliştirme arasındaki farkı, Flutter'ın ve Dart'ın ne olduğunu ve Flutter'ın neden Dart'ı kullandığını açıklamak.
3. Geliştirme ortamını kurmak, ilk Flutter uygulamasını fiziksel cihazda veya emulatorde çalıştırmak ve GitHub'a göndermek.
4. İlk Dart programını yazıp VS Code'da iki farklı yolla çalıştırmak; temel hata mesajlarını okuyabilmek.
5. Değişken tanımlamak; `var`, `final` ve `const` arasındaki farkı bilmek; adlandırma kurallarına uymak.
6. `int`, `double`, `num`, `String` ve `bool` tiplerini ve temel metotlarını kullanmak; metinlere değişken gömmek (interpolation).
7. Tipler arasında dönüşüm yapmak; null safety'nin temel operatörlerini (`?`, `??`, `??=`, `?.`, `!`) tanımak.

### Bu Haftanın AI Kuralı

> **Hafta 1–5: "AI açıklar, siz yazarsınız."**
>
> - AI'ı kavram sormak, hata mesajlarını açıklatmak ve kodunuzu okutmak için kullanabilirsiniz.
> - AI'a kod yazdırmak veya dosyalarınızı değiştirtmek bu dönemde **yasaktır**. Claude Code'u plan modunda kullanınız.
> - Sınıf içi mini görevler AI kapalı yapılır.
> - AI'a şifre, kişisel bilgi, API anahtarı veya başkasına ait kod vermeyiniz.
> - AI yanılabilir. Şüphelendiğiniz her bilgiyi resmi dokümandan (docs.flutter.dev, dart.dev) doğrulayınız.
>
> Bu nottaki örnekleri kopyalayıp çalıştırabilirsiniz; ancak her örneği çalıştırdıktan sonra **değerleri değiştirip** tekrar deneyin ve sonucu önceden tahmin etmeye çalışın. Öğrenme, kodu değiştirdiğiniz anda başlar.

---

# İçindekiler

1. [Dersin Tanıtımı ve İşleyişi](#1-dersin-tanıtımı-ve-işleyişi)
2. [Mobil Uygulama Geliştirme, Flutter ve Dart](#2-mobil-uygulama-geliştirme-flutter-ve-dart)
3. [Geliştirme Ortamının Kurulumu](#3-geliştirme-ortamının-kurulumu)
4. [Bu Notu VS Code'da Nasıl Kullanacaksınız?](#4-bu-notu-vs-codeda-nasıl-kullanacaksınız)
5. [İlk Dart Programı: Merhaba Dünya](#5-ilk-dart-programı-merhaba-dünya)
6. [Değişken Kavramı](#6-değişken-kavramı)
7. [Sayılar: int, double, num](#7-sayılar-int-double-num)
8. [Metinler: String](#8-metinler-string)
9. [Mantıksal Değerler: bool](#9-mantıksal-değerler-bool)
10. [Tür Dönüşümleri](#10-tür-dönüşümleri)
11. [Null Safety'ye İlk Bakış](#11-null-safetyye-ilk-bakış)
12. [Hepsini Birleştirelim: Kartvizit ve Fiyat Hesaplama](#12-hepsini-birleştirelim-kartvizit-ve-fiyat-hesaplama)
13. [Örnek Problem ve Farklı Çözüm Yolları](#13-örnek-problem-ve-farklı-çözüm-yolları)
14. [Özet](#14-özet)
15. [Bölüm Sonu Soru ve Cevapları](#15-bölüm-sonu-soru-ve-cevapları)
16. [Alıştırmalar](#16-alıştırmalar)
17. [Bu Haftanın Teslimi](#17-bu-haftanın-teslimi)
18. [Kaynaklar](#18-kaynaklar)

---

# 1. Dersin Tanıtımı ve İşleyişi

## 1.1 Dersin amacı

Bu dersin sonunda her biriniz, gerçek bir ihtiyaca cevap veren, birden çok ekrandan oluşan, internetten veya yerel veritabanından veri okuyan ve telefonunuzda çalışan bir mobil uygulamayı **baştan sona** geliştirmiş olacaksınız.

## 1.2 Dersin genel akışı

| Aşama | İçerik |
|---|---|
| **Dart temelleri** | Değişkenler, kontrol yapıları, döngüler, fonksiyonlar, koleksiyonlar, nesne yönelimli programlama, hata yönetimi, asenkron programlama |
| **Flutter temelleri** | Widget'lar, ekran düzeni, durum (state), butonlar, görseller, listeler |
| **Veri ve etkileşim** | Form elemanları, sayfalar arası geçiş, internetten veri çekme, yerel veritabanı |
| **Uygulama mimarisi** | Durum yönetimi, servisler, tema, proje yapısı |

Haftalık konu planı ve değerlendirme ölçütleri Classroom'daki ders izlencesindedir.

> **Neden önce Dart?** Flutter'da karşılaşacağınız hataların büyük çoğunluğu aslında Flutter'dan değil, Dart'tan kaynaklanır. Dart'ı sağlam öğrenen öğrenci, Flutter'ı çok daha hızlı öğrenir.

## 1.3 Ders materyalleri ve iletişim

- Tüm duyurular, ders notları ve ödevler **Classroom** üzerinden paylaşılır.
- Her haftanın ders notu, o hafta derste yapılan her şeyi ve daha fazlasını içerir. Derste not tutmaya çalışmak yerine bilgisayarınızda kodu benimle birlikte yazın.
- Takıldığınız sorunları, hata mesajının **tamamıyla** birlikte Classroom'daki soru-cevap akışına yazın.

## 1.4 Haftalık çalışma düzeni

1. **Dersten önce:** Varsa ön hazırlığı (bu hafta kurulum) tamamlayın.
2. **Derste:** Kodu birlikte yazıyoruz; sınıf içi mini görevler AI kapalı yapılır.
3. **Dersten sonra:** Ders notunu baştan sona okuyun, **tüm kod örneklerini kendi bilgisayarınızda çalıştırın**, bölüm sonu sorularını çözün, ödevi teslim edin.

---

# 2. Mobil Uygulama Geliştirme, Flutter ve Dart

## 2.1 Mobil uygulama geliştirme yaklaşımları

| Yaklaşım | Nasıl çalışır? | Örnek teknolojiler | Artısı | Eksisi |
|---|---|---|---|---|
| **Native** | Her platform için o platformun kendi diliyle ayrı uygulama yazılır. | Android: Kotlin · iOS: Swift | Platformun tüm olanaklarına doğrudan erişim | İki ayrı kod tabanı, iki kat geliştirme ve bakım |
| **Çapraz platform** | Tek bir kod tabanı birden fazla platformda çalışır. | Flutter (Dart), React Native (JavaScript), Kotlin Multiplatform | Tek kod, hızlı geliştirme, tutarlı görünüm | Bazı platforma özgü özellikler için ek çalışma gerekebilir |
| **Web tabanlı** | Uygulama aslında bir web sayfasıdır. | PWA, WebView tabanlı uygulamalar | Kurulum gerektirmez | Performans ve cihaz özelliklerine erişim sınırlı |

```text
NATIVE YAKLAŞIM                    FLUTTER YAKLAŞIMI
Android → Kotlin                   Tek Dart kod tabanı
iOS     → Swift                      ├── Android
                                     ├── iOS
2 kod tabanı, 2 ekip,                ├── Web
2 kat bakım                          └── Windows / macOS / Linux
```

## 2.2 Flutter nedir?

**Flutter**, Google tarafından geliştirilen **açık kaynaklı bir arayüz (UI) araç takımıdır.** Kararlı ilk sürümü 2018'de yayımlanmıştır. Tek bir kod tabanından Android, iOS, web ve masaüstü uygulamaları üretilebilir.

> ⚠️ **Sık yapılan karışıklık:** Flutter bir programlama dili **değildir.** Dart **dildir**; Flutter, Dart ile yazılan ve Dart ile kullanılan bir **SDK**'dır (yazılım geliştirme kiti).

Flutter'ın öne çıkan özellikleri:

| Özellik | Anlamı |
|---|---|
| **Tek kod tabanı** | Aynı kod birçok platformda çalışır. |
| **Kendi çizim motoru** | Flutter, platformun hazır arayüz bileşenlerini kullanmaz; ekrandaki her pikseli kendi motoruyla çizer. Uygulama her platformda birebir aynı görünür. |
| **Her şey bir widget'tır** | Buton, yazı, resim, hatta iki eleman arasındaki boşluk bile bir widget'tır. Ekranlar widget'lar iç içe yerleştirilerek kurulur. |
| **Deklaratif arayüz** | Ekrana "şu butonu bul, rengini değiştir" demezsiniz; "veri bu durumdayken ekran böyle görünür" diye tarif edersiniz. |
| **Hot reload** | Koddaki bir değişiklik, uygulama yeniden başlamadan ve mevcut durum korunarak yaklaşık bir saniyede ekrana yansır. |
| **Zengin paket ekosistemi** | [pub.dev](https://pub.dev) üzerinde kamera, harita, veritabanı gibi pek çok işlev için hazır paket bulunur. |

## 2.3 Dart nedir?

**Dart**, Google tarafından geliştirilen ve 2011'de duyurulan genel amaçlı bir programlama dilidir. Bugün en yaygın kullanım alanı Flutter'dır.

| Özellik | Anlamı |
|---|---|
| **Statik tipli** | Her değişkenin bir tipi vardır ve tip hataları program çalışmadan önce yakalanır. |
| **Tip çıkarımı** | Tipi her zaman yazmak zorunda değilsiniz; Dart çoğu durumda tipi kendisi anlar. |
| **Sağlam null safety** | Bir değişken, açıkça izin verilmedikçe boş (`null`) olamaz. Mobil uygulamaların en sık çökme sebeplerinden biri derleme aşamasında engellenir. |
| **Nesne yönelimli** | Sayılar dahil her şey bir nesnedir. |
| **Asenkron programlama** | `async` / `await` ile ağdan veri beklerken arayüz donmaz. |
| **Tanıdık sözdizimi** | C, Java, C# veya JavaScript bilen biri Dart kodunu kolayca okur. |

## 2.4 Flutter neden Dart kullanır?

Dart, hem **JIT** hem de **AOT** derleme yapabilen nadir dillerden biridir:

| Aşama | Derleme | Ne sağlar? |
|---|---|---|
| **Geliştirme** | **JIT** (Just-In-Time): Kod, Dart sanal makinesinde anında çalıştırılır. | Hot reload, hızlı deneme-yanılma |
| **Yayın** | **AOT** (Ahead-Of-Time): Kod doğrudan işlemcinin makine koduna çevrilir. | Hızlı açılış, akıcı animasyonlar |
| **Web** | Dart kodu JavaScript'e veya WebAssembly'ye derlenir. | Tarayıcıda çalışma |

Ayrıca Flutter'da arayüz de Dart ile yazılır; XML veya HTML gibi ayrı bir işaretleme dili yoktur.

> 🔗 **Flutter'da:** Kurulum bölümünde oluşturacağınız ilk Flutter projesinde (3.15) `lib/main.dart` dosyasını açın. İlk satırlarda şunu göreceksiniz:
> ```dart
> void main() {
>   runApp(const MyApp());
> }
> ```
> Yani her Flutter uygulaması aslında bir **Dart programıdır**: `main` çalışır, `runApp` arayüzü başlatır. Bu hafta yazacağımız Dart programları da tam olarak `void main()` ile başlayacak.

---

# 3. Geliştirme Ortamının Kurulumu

Bu bölüm, dönem boyunca kullanacağımız geliştirme ortamının kurulum ve yapılandırma kılavuzudur. Dart programlarını yazıp çalıştırmak için **3.0–3.3** (ön hazırlık, Git, VS Code, Flutter SDK) yeterlidir; ancak kılavuzun tamamı bu haftanın teslimi için gereklidir (bkz. 3.18).

> **Derse gelmeden önce:** Bu kılavuzdaki temel kurulumları tamamlayınız ve son bölümdeki doğrulama adımlarını çalıştırınız.
>
> Ders kapsamında ağırlıklı olarak **Windows + fiziksel Android cihaz** kullanılacaktır. Emulator kullanımı zorunlu değildir; ancak Android telefonu olmayan (örneğin iPhone kullanan) öğrenciler için emulator gereklidir.
>
> **Tahmini süre:** 2–3 saat. Kurulum toplamda birkaç GB indirme yapar. İlk `flutter run` komutu da Gradle bağımlılıklarını indirdiği için 5–15 dakika sürebilir. **Kurulumu kampüs ağında değil, evde ve iyi bir internet bağlantısıyla yapınız.**

### Kurulum sırası

Aşağıdaki sıra önemlidir, çünkü sonraki araçlar öncekilere bağımlıdır:

```text
3.0 Ön hazırlık → 3.1 Git → 3.2 VS Code → 3.3 Flutter SDK → 3.4 Android Studio / SDK
→ 3.5 Telefon (veya 3.6 Emulator) → 3.7 Node.js → 3.8–3.9 Claude Code
→ 3.10–3.12 Antigravity → 3.13 Tasarım araçları → 3.14–3.16 Kontrol, ilk proje, ilk push
```

---

## 3.0 Başlamadan Önce

### 3.0.1 Donanım

| Bileşen | En az | Önerilen |
|---|---|---|
| İşletim sistemi | Windows 10/11 (64-bit), macOS veya Linux | Windows 11 / macOS |
| RAM | 8 GB | 16 GB (emulator kullanacaksanız) |
| Boş disk alanı | 25 GB | 40 GB, **SSD** |

### 3.0.2 Windows kullanıcı adınızı kontrol edin (önemli)

PowerShell'i açıp şu komutu çalıştırın:

```powershell
echo $env:USERPROFILE
```

Çıktı `C:\Users\Öğrenci` veya `C:\Users\Ali Veli` gibi **Türkçe karakter (ç, ğ, ı, ö, ş, ü) ya da boşluk** içeriyorsa, Android derleme araçları (Gradle) anlamsız yol hatalarıyla başarısız olabilir. Bu durumda aşağıdaki önlemleri **mutlaka** uygulayın:

- Flutter SDK'yı `C:\src\flutter` dizinine kurun (Bölüm 3.3).
- Android Studio kurulumunda SDK konumunu `C:\Android\Sdk` olarak değiştirin (Bölüm 3.4).
- Gradle önbelleğini kullanıcı klasörünün dışına taşıyın:

```powershell
[Environment]::SetEnvironmentVariable("GRADLE_USER_HOME", "C:\gradle", "User")
```

> Kullanıcı adınız sorunsuz olsa bile Flutter SDK için `C:\src\flutter`, projeleriniz için `C:\dev\bmh309` dizinlerini kullanmanızı öneriyoruz.

### 3.0.3 Çalışma klasörü

Tüm ders projelerinizi şu klasörde tutun:

```powershell
mkdir C:\dev\bmh309
```

**OneDrive ile senkronize edilen Masaüstü veya Belgeler klasörlerinde proje oluşturmayınız.** Derleme sırasında oluşan binlerce dosya senkronizasyonla çakışır; bu da dosya kilitlenmesine ve derleme hatalarına yol açar.

### 3.0.4 Windows Geliştirici Modu

Flutter'da eklenti (plugin) kullanan projeler sembolik bağlantı (symlink) desteği gerektirir. Bu nedenle Geliştirici Modu'nu açın:

```powershell
start ms-settings:developers
```

Açılan pencerede **Geliştirici Modu** seçeneğini etkinleştirin. Bu yapılmazsa ileriki haftalarda `Building with plugins requires symlink support` hatası alırsınız.

### 3.0.5 Derse getirmeniz gerekenler

- Dizüstü bilgisayar ve şarj aleti
- Android telefon
- **Veri aktarımını destekleyen** USB kablo (bazı kablolar yalnızca şarj eder; bu kablolarla telefon bilgisayarda görünmez)

---

## 3.1 Git ve GitHub

Dönem boyunca Git/GitHub; kod paylaşımı, branch yönetimi, Pull Request ve proje değerlendirmesi için kullanılacaktır.

> Windows'ta Git, hem Flutter hem de Claude Code için **ön koşuldur**. İlk olarak bunu kurun.

### 3.1.1 Git kurulumu

**Windows:** https://git-scm.com/downloads/win adresinden kurun. Kurulumda varsayılan seçenekler yeterlidir. Bu kurulum, GitHub'a giriş için kullanılan **Git Credential Manager** aracını da getirir.

**macOS:**

```bash
xcode-select --install   # Git dahil komut satırı araçları
# veya
brew install git
```

**Ubuntu/Debian:**

```bash
sudo apt update
sudo apt install git -y
```

Kurulum kontrolü:

```bash
git --version
```

### 3.1.2 Git kimliğinizi tanımlayın

```bash
git config --global user.name "Adınız Soyadınız"
git config --global user.email "ogrencino@siirt.edu.tr"
git config --global init.defaultBranch main
git config --global pull.rebase false
```

VS Code kurulduktan sonra (Bölüm 3.2), commit mesajlarını VS Code'da yazmak için:

```bash
git config --global core.editor "code --wait"
```

Kontrol:

```bash
git config --global --list
```

### 3.1.3 GitHub hesabı

- https://github.com adresinde hesap açın. Kullanıcı adınızı profesyonel seçin; bu hesap ileride portfolyonuz olacak.
- Kurumsal e-posta adresinizi hesabınıza ekleyip doğrulayın ve Git yapılandırmanızda aynı adresi kullanın. Böylece commit'leriniz profilinizle eşleşir.
- **İki adımlı doğrulamayı (2FA)** etkinleştirin.

> **İsteğe bağlı:** Kurumsal e-postanızla **GitHub Student Developer Pack** başvurusu yapabilirsiniz (https://education.github.com/pack). Paket, öğrencilere çeşitli geliştirici araçlarını ücretsiz sunar.

### 3.1.4 GitHub CLI (önerilen)

`gh`, terminalden repo oluşturma, Pull Request açma gibi işlemleri kolaylaştırır. İleriki haftalarda AI ajanları da PR işlemleri için bu aracı kullanabilir.

```powershell
winget install --id GitHub.cli -e
```

macOS: `brew install gh` · Ubuntu: `sudo apt install gh`

Yeni bir terminal açıp giriş yapın:

```bash
gh auth login
```

Sorulara sırasıyla **GitHub.com → HTTPS → Login with a web browser** yanıtlarını verin. Kontrol:

```bash
gh auth status
```

---

## 3.2 Visual Studio Code

VS Code'u https://code.visualstudio.com/ adresinden indirin.

### Zorunlu eklentiler

- **Flutter**
- **Dart**

Flutter eklentisi çoğu durumda Dart eklentisini de beraberinde kurar.

### Önerilen eklentiler

- GitLens
- Error Lens
- Material Icon Theme

> Bu üç eklenti yardımcı araçlardır; ders için zorunlu değildir.

---

## 3.3 Flutter SDK

Flutter'ın güncel **Stable** sürümünü kuracağız.

Resmi kurulum sayfası: https://docs.flutter.dev/install

> **Sürüm birliği:** Takım projelerinde herkesin aynı Flutter sürümüyle çalışması gerekir. Dersin kullanacağı sürüm Classroom'da duyurulacaktır. Dönem ortasında kendi başınıza `flutter upgrade` çalıştırmayınız.

### Yöntem A: Manuel kurulum (önerilen)

1. Resmi sayfadan Windows için Stable Flutter SDK `.zip` dosyasını indirin.
2. Zip dosyası içinde zaten `flutter` adlı bir klasör vardır. Bu yüzden dosyayı **`C:\src` içine** çıkarın:

```powershell
mkdir C:\src
Expand-Archive -Path "$env:USERPROFILE\Downloads\flutter_windows_<SURUM>-stable.zip" -DestinationPath "C:\src"
```

Sonuçta `C:\src\flutter\bin\flutter.bat` dosyası bulunmalıdır. `C:\src\flutter\flutter\bin` gibi iç içe bir yapı oluştuysa klasörü düzeltin.

3. `C:\src\flutter\bin` dizinini kullanıcı PATH'inize ekleyin. Windows aramasına **"ortam değişkenleri"** yazıp **Hesabınız için ortam değişkenlerini düzenleyin → Path → Düzenle → Yeni** adımlarını izleyebilir veya PowerShell'de şunu çalıştırabilirsiniz:

```powershell
$p = [Environment]::GetEnvironmentVariable("Path", "User")
[Environment]::SetEnvironmentVariable("Path", "$p;C:\src\flutter\bin", "User")
```

Flutter'ı `Program Files` gibi yönetici yetkisi gerektiren dizinlere **kurmayınız**.

### Yöntem B: VS Code üzerinden kurulum

VS Code'da **Ctrl+Shift+P → Flutter: New Project** komutunu çalıştırın. SDK bulunamazsa **Download SDK** seçeneğini seçin, konum olarak `C:\src` klasörünü gösterin ve sorulduğunda **Add SDK to PATH** seçeneğini onaylayın.

### Kontrol

**Tamamen yeni** bir terminal açın:

```bash
flutter --version
dart --version
```

> Dart'ı ayrıca kurmanıza gerek yoktur. Flutter SDK, Dart SDK'yı beraberinde getirir.

**macOS / Linux:** Resmi kurulum sayfasında işletim sisteminizi seçerek ilerleyin.

---

## 3.4 Android Geliştirme Ortamı

Kodlarımızı VS Code veya Antigravity'de yazacağız. Android Studio'yu esas olarak Android SDK, Platform Tools, Build Tools ve emulator/cihaz araçları için kullanacağız.

Android Studio: https://developer.android.com/studio

### 3.4.1 İlk açılış

Android Studio'yu ilk açtığınızda kurulum sihirbazında **Standard** seçeneğini seçin.

> Kullanıcı adınızda Türkçe karakter veya boşluk varsa (Bölüm 3.0.2), sihirbazda **Android SDK Location** alanını `C:\Android\Sdk` olarak değiştirin.

### 3.4.2 SDK Manager

Android Studio karşılama ekranında **More Actions → SDK Manager** yolunu izleyin.

**SDK Platforms** sekmesinde, Flutter dokümanının önerdiği güncel API seviyesinin kurulu olduğunu doğrulayın (bu kılavuzun yazıldığı tarihte API 36).

**SDK Tools** sekmesinde şunlar kurulu olmalıdır:

- Android SDK Build-Tools
- Android SDK Command-line Tools (latest)
- Android SDK Platform-Tools
- Android Emulator
- NDK (Side by side)
- CMake

> NDK ve CMake yer kaplar. Ancak birçok Flutter eklentisi bunlara ihtiyaç duyar. Şimdi kurmazsanız, ileride bir projeyi derlerken otomatik olarak ve uzun süre indirilirler. Bunun derste olmasını istemeyiz.

### 3.4.3 Lisanslar

Terminalde şu komutu çalıştırın ve tüm lisans sorularını `y` ile kabul edin:

```bash
flutter doctor --android-licenses
```

### 3.4.4 Java (JDK) hakkında

Flutter, Android Studio ile birlikte gelen JDK'yı otomatik olarak kullanır; **ayrıca Java kurmanıza gerek yoktur**. Bilgisayarınızda başka Java sürümleri kuruluysa ve `UnsupportedClassVersionError` gibi hatalar alırsanız, Flutter'a Android Studio'nun JDK'sını gösterin:

```powershell
flutter config --jdk-dir "C:\Program Files\Android\Android Studio\jbr"
```

---

## 3.5 Fiziksel Android Cihaz

Derste fiziksel Android cihaz kullanımı tavsiye edilmektedir.

### 3.5.1 Geliştirici seçeneklerini açın

Telefonda **Ayarlar → Telefon Hakkında → Yapım Numarası** bölümüne yaklaşık 7 kez dokunun.

Ardından **Geliştirici Seçenekleri → USB Hata Ayıklama** özelliğini etkinleştirin.

Telefonu bilgisayara bağladığınızda çıkan **"Bu bilgisayara USB hata ayıklama izni verilsin mi?"** sorusunu onaylayın. Bağlantı modu soruluyorsa **Dosya aktarımı** seçeneğini seçin.

Kontrol:

```bash
flutter devices
```

Telefonunuz listede görünmelidir.

### 3.5.2 Üreticiye özel notlar

| Üretici | Yapılması gereken |
|---|---|
| **Xiaomi / Redmi / POCO** | Geliştirici seçeneklerinde **USB ile yükle** ve **USB hata ayıklama (Güvenlik ayarları)** seçeneklerini de açın. Bu işlem SIM kart ve Mi hesabı gerektirebilir. Açılmazsa uygulama yüklemesi `INSTALL_FAILED_USER_RESTRICTED` hatasıyla başarısız olur. |
| **Samsung** | Windows cihazı görmezse Samsung Android USB sürücüsünü kurun. |
| **Diğer üreticiler** | Cihaz görünmüyorsa üreticinin Windows USB sürücüsünü kurun. |

### 3.5.3 Kablosuz hata ayıklama (isteğe bağlı, Android 11+)

Kablo sorunu yaşıyorsanız telefonu Wi-Fi üzerinden bağlayabilirsiniz:

1. Telefon ve bilgisayar **aynı ağda** olmalıdır.
2. **Geliştirici Seçenekleri → Kablosuz hata ayıklama → Eşleştirme koduyla cihaz eşle** adımını izleyin.
3. Ekranda görünen IP:PORT ve kodu kullanın:

```bash
adb pair <IP>:<ESLESTIRME_PORTU>
adb connect <IP>:<BAGLANTI_PORTU>
```

> `adb`, Android SDK'nın `platform-tools` klasöründedir (örneğin `C:\Android\Sdk\platform-tools`). Bu klasörü PATH'e ekleyebilirsiniz.
>
> Kampüs Wi-Fi ağları, cihazların birbiriyle iletişimini genellikle engeller. Böyle bir durumda bilgisayarı telefonunuzun kişisel erişim noktasına (hotspot) bağlayarak deneyin.

---

## 3.6 Android Emulator (İsteğe Bağlı)

Android telefonu olmayan öğrenciler için gereklidir.

**Ön koşullar:**

- BIOS/UEFI'de sanallaştırma açık olmalıdır (Intel VT-x veya AMD-V/SVM).
- **Windows Özellikleri'ni aç veya kapat** menüsünden **Windows Hiper Yönetici Platformu (Windows Hypervisor Platform)** etkinleştirilmelidir.
- En az 8 GB, tercihen 16 GB RAM gerekir.

**Kurulum:** Android Studio'da **Device Manager → Create Virtual Device** yolunu izleyin, bir **Pixel** cihaz seçin ve sistem imajı olarak **x86_64** mimarisinde, **Google Play** veya **Google APIs** içeren güncel bir imaj seçin. İleriki haftalarda Firebase ve Google ile giriş özellikleri için Google servisleri gereklidir.

Kontrol:

```bash
flutter emulators
flutter emulators --launch <emulator_id>
flutter devices
```

---

## 3.7 Node.js (LTS)

Node.js, AI araçlarının skill paketlerini kurmak için (`npx`, Bölüm 3.12) ve ileriki haftalarda Firebase komut satırı aracı için gereklidir.

```powershell
winget install OpenJS.NodeJS.LTS
```

macOS: `brew install node` · Diğer sistemler: https://nodejs.org (LTS sürümü)

Yeni bir terminal açıp kontrol edin:

```bash
node --version
npm --version
```

> PowerShell'de `npx.ps1 cannot be loaded because running scripts is disabled` hatası alırsanız şu komutu bir kez çalıştırın:
>
> ```powershell
> Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
> ```

---

## 3.8 Claude Code

Claude Code ders kapsamında AI destekli kod geliştirme, debugging, refactoring ve kod analizi için kullanılacaktır.

Resmi dokümantasyon: https://code.claude.com/docs

> Windows'ta Claude Code, Git for Windows ile gelen Git Bash'i kullanır. Bölüm 3.1'deki Git kurulumu tamamlanmış olmalıdır.

### Windows (PowerShell)

```powershell
irm https://claude.ai/install.ps1 | iex
```

Alternatif olarak:

```powershell
winget install Anthropic.ClaudeCode
```

### macOS / Linux

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

macOS Homebrew alternatifi:

```bash
brew install --cask claude-code
```

### Kurulum kontrolü

Yeni bir terminal açın:

```bash
claude --version
```

### Giriş

Bir proje klasöründe şu komutu çalıştırın:

```bash
claude
```

Ders kapsamında size tanımlanan **Claude Team hesabınızla** oturum açın. Gerekirse Claude Code içinde `/login` komutunu kullanın.

> Ders kapsamında Claude Team erişiminiz bulunduğu sürece ayrıca kişisel API anahtarı oluşturmanız beklenmemektedir.

### VS Code içinde kullanım

Claude Code'u VS Code'un entegre terminalinde (**Terminal → New Terminal**) çalıştırabilirsiniz. İsteğe bağlı olarak VS Code eklenti mağazasındaki resmi **Claude Code** eklentisini de kurabilirsiniz.

---

## 3.9 Claude Code için Resmi Dart + Flutter Eklentisi

Flutter ekibinin resmi Claude Code entegrasyonunu kuracağız.

Marketplace'i ekleyin:

```bash
claude plugin marketplace add flutter/agent-plugins
```

Flutter/Dart eklentisini kurun:

```bash
claude plugin install dart-flutter@dart-flutter
```

Kontrol:

```bash
claude plugin marketplace list
```

Bu eklenti Claude Code'a iki şey kazandırır:

- **Flutter/Dart skill'leri:** Responsive layout, widget testi, JSON serileştirme, go_router kurulumu gibi görevler için resmi yönergeler.
- **Dart MCP sunucusu:** Analyzer hatalarına, testlere, proje yapısına ve çalışan uygulamaya erişim.

> Eklenti, Claude Code için Dart MCP sunucusunu **otomatik olarak** yapılandırır; Claude Code için ayrıca MCP ayarı yapmanız gerekmez. Claude Code içinde `/mcp` yazarak sunucunun bağlı olduğunu görebilirsiniz.
>
> Resmi Flutter kuralları (rules) eklentiyle otomatik yüklenmez. Bunları AI araçlarını ayrıntılı ele aldığımız haftalarda projenin `CLAUDE.md` dosyasına ekleyeceğiz.

---

## 3.10 Google Antigravity

Ders kapsamında ikinci AI geliştirme ortamı olarak Google Antigravity kullanılacaktır.

İndirme: https://antigravity.google/download

Kurulumdan sonra Google hesabınızla giriş yapın.

### 3.10.1 Flutter ve Dart eklentileri

Antigravity, VS Code ile aynı altyapıyı (Code OSS) kullanır. Bu nedenle **Flutter** ve **Dart** eklentilerini Antigravity'nin eklenti bölümünden de ayrıca kurun.

### 3.10.2 Build with Google: Dart and Flutter entegrasyonu

1. **Settings** menüsünü açın (**Ctrl+,**).
2. **Customizations** sekmesine geçin.
3. **Build with Google Plugins** bölümünde **Customize** düğmesine tıklayın.
4. **Dart and Flutter** satırındaki **Download** düğmesine tıklayın.

Kontrol için **Agent** panelini açın (**Ctrl+L**) ve şunu sorun:

```text
Summarize the Dart and Flutter tools and skills available in this project.
```

---

## 3.11 Antigravity CLI ve Dart MCP

Antigravity'nin terminal aracı `agy` komutudur.

### Kurulum

Windows PowerShell:

```powershell
irm https://antigravity.google/cli/install.ps1 | iex
```

macOS / Linux:

```bash
curl -fsSL https://antigravity.google/cli/install.sh | bash
```

Kurulumdan sonra yeni bir terminal açın:

```bash
agy
```

İlk çalıştırmada Google hesabıyla oturum açma, tema ve çalışma alanına güvenme gibi başlangıç ayarları istenebilir.

### Dart MCP yapılandırması

Dart SDK içinde resmi bir Dart/Flutter MCP sunucusu bulunur. Bu sunucu AI ajanlarının analyzer sonuçlarını okumasını, kod hatalarını incelemesini, test çalıştırmasını ve çalışan Flutter uygulamasıyla doğrudan etkileşim kurmasını sağlar.

Antigravity CLI için proje klasöründe `.agents/mcp_config.json` dosyasını oluşturun (veya tüm projeler için genel olarak `%USERPROFILE%\.gemini\config\mcp_config.json` dosyasını kullanın):

```json
{
  "mcpServers": {
    "dart": {
      "command": "dart",
      "args": ["mcp-server"]
    }
  }
}
```

> Bu yapılandırmanın çalışması için `dart` komutunun terminalde çalışıyor olması gerekir (Bölüm 3.3).

---

## 3.12 Flutter/Dart Skill Paketleri (İsteğe Bağlı)

İleri düzey AI entegrasyonu için resmi Flutter ve Dart skill paketleri proje klasörüne kurulabilir. Bu adım Node.js gerektirir (Bölüm 3.7). Paketler projenin `.agents/skills` klasörüne kurulur.

Flutter:

```bash
npx skills add flutter/agent-plugins --skill '*' --agent universal --yes
```

Dart:

```bash
npx skills add dart-lang/skills --skill '*' --agent universal --yes
```

> Bu bölüm ilk ders için zorunlu değildir. AI geliştirme araçlarını ayrıntılı ele aldığımız haftalarda tekrar kullanılacaktır.

---

## 3.13 Tasarım Araçları

Tasarım araçları 5. haftada kullanılacaktır. Hesap onayları zaman alabildiği için **şimdiden** hazırlayınız.

- **Figma:** https://www.figma.com adresinde hesap açın. Kurumsal e-postanızla **Figma for Education** başvurusu yaparak eğitim planından yararlanabilirsiniz (https://www.figma.com/education/).
- **Google Stitch:** https://stitch.withgoogle.com adresine Google hesabınızla giriş yaparak erişebildiğinizi kontrol edin.

---

## 3.14 Sistem Kontrolü

Terminal açın:

```bash
flutter doctor -v
```

Ders açısından özellikle şu bileşenleri kontrol edin:

```text
[✓] Flutter
[✓] Android toolchain
[✓] Connected device
[✓] Network resources
```

> Ders Android ağırlıklı olduğu için **Chrome** (web) ve **Visual Studio** (Windows masaüstü uygulaması) satırlarında görülen eksiklikler kurulumun başarısız olduğu anlamına gelmez. Bunları kurmanıza gerek yoktur.

---

## 3.15 İlk Flutter Projesi

Projeyi çalışma klasörünüzde oluşturun:

```bash
cd C:\dev\bmh309
flutter create bmh309_ilk_adim
cd bmh309_ilk_adim
```

> **Proje adı kuralı:** Yalnızca küçük harf, rakam ve alt çizgi (`_`) kullanın. Türkçe karakter, boşluk ve tire (`-`) kullanmayın. Örneğin `BMH309-İlk Adım` geçersiz bir addır.

Bağlı cihazları kontrol edin ve projeyi çalıştırın:

```bash
flutter devices
flutter run
```

Telefonunuzda veya emulatorde varsayılan Flutter uygulaması açılmalıdır. **İlk derleme uzun sürer**; sonraki derlemeler çok daha hızlıdır.

### Hot reload denemesi

Uygulama çalışırken `lib/main.dart` dosyasındaki `'Flutter Demo Home Page'` başlığını değiştirip kaydedin ve terminalde `r` tuşuna basın. Değişiklik uygulama yeniden başlamadan ekrana yansımalıdır.

| Tuş | İşlev |
|---|---|
| `r` | Hot reload (durumu koruyarak yeniden yükle) |
| `R` | Hot restart (uygulamayı baştan başlat) |
| `q` | Çıkış |

> **VS Code ile:** Proje klasörünü **File → Open Folder** ile açın, sağ alt köşedeki durum çubuğundan cihazınızı seçin ve **F5** ile çalıştırın. Bu modda kaydettiğinizde hot reload otomatik yapılır.

---

## 3.16 GitHub'a İlk Push

`flutter create`, uygun bir `.gitignore` dosyasını otomatik oluşturur; ancak Git deposunu başlatmaz.

```bash
git init
git add .
git commit -m "Hafta 1: ilk Flutter projesi"
```

### GitHub CLI ile (önerilen)

```bash
gh repo create bmh309_ilk_adim --public --source=. --push
```

### GitHub CLI olmadan

GitHub web arayüzünde README içermeyen boş bir depo (`bmh309_ilk_adim`) oluşturun, ardından:

```bash
git remote add origin https://github.com/<kullanici_adiniz>/bmh309_ilk_adim.git
git push -u origin main
```

İlk push'ta tarayıcıda GitHub girişi istenebilir (Git Credential Manager).

---

## 3.17 İlk AI Testi

Proje klasöründe Claude Code'u **plan modunda** açın. Bu modda Claude kodu okuyabilir ve plan önerebilir, ancak dosyalarınızı değiştiremez:

```bash
claude --permission-mode plan
```

> Claude Code'u normal açtıysanız **Shift+Tab** tuşlarıyla modlar arasında geçip plan moduna geçebilirsiniz.

Örnek görev:

```text
Bu Flutter projesinin yapısını incele.
Henüz hiçbir dosyayı değiştirme.

lib/main.dart dosyasının ne yaptığını
Flutter'a yeni başlayan bir bilgisayar mühendisliği
öğrencisine açıklayarak anlat.
```

Ardından aynı soruyu Antigravity'nin **Agent** panelinde sorun ve iki cevabı karşılaştırın. Hangisi daha doğru, hangisi daha anlaşılır? Hangisi eksik ya da hatalı bir şey söyledi?

Buradaki önemli nokta: **AI'dan hemen kod yazmasını istemiyoruz.** Önce şu yaklaşımı kullanacağız:

**Read → Understand → Plan → Change → Test**

### İlk beş hafta için AI kullanım kuralları

> **Hafta 1–5: "AI açıklar, siz yazarsınız."**
>
> - AI'ı kavram sormak, hata mesajlarını açıklatmak ve kodunuzu okutmak için kullanabilirsiniz.
> - AI'a kod yazdırmak veya dosyalarınızı değiştirtmek bu dönemde **yasaktır**. Claude Code'u plan modunda kullanınız.
> - Sınıf içi mini görevler AI kapalı yapılır.
> - AI'a şifre, kişisel bilgi, API anahtarı veya başkasına ait kod vermeyiniz.
> - AI yanılabilir. Şüphelendiğiniz her bilgiyi resmi dokümandan (docs.flutter.dev, dart.dev) doğrulayınız.
>
> 6. haftadan itibaren AI kullanım kuralları genişleyecektir; ayrıntılar ders izlencesindedir.

---

## 3.18 Hafta 1 Classroom Teslimi

Aşağıdakileri Classroom'daki Hafta 1 ödevine yükleyiniz:

1. `flutter doctor -v` çıktısının ekran görüntüsü veya metin dosyası
2. Uygulamanın telefonunuzda veya emulatorde çalıştığını gösteren ekran görüntüsü (hot reload ile değiştirdiğiniz başlık görünür olmalı)
3. `bmh309_ilk_adim` GitHub deposunun bağlantısı
4. Kısa not (2–3 cümle): Kurulumda karşılaştığınız en önemli sorun neydi, nasıl çözdünüz?

---

## 3.19 Kurulum Tamamlama Kontrol Listesi

**Ön hazırlık**

- [ ] Windows kullanıcı adı kontrol edildi (gerekirse `GRADLE_USER_HOME` ayarlandı)
- [ ] `C:\dev\bmh309` çalışma klasörü oluşturuldu
- [ ] Windows Geliştirici Modu açıldı
- [ ] Veri aktarımı destekleyen USB kablo hazır

**Git ve GitHub**

- [ ] Git kuruldu ve kimlik bilgileri tanımlandı
- [ ] GitHub hesabı hazır, 2FA açık
- [ ] Kurumsal e-posta GitHub hesabına eklendi
- [ ] GitHub CLI kuruldu ve `gh auth status` başarılı (önerilen)

**Flutter ve Android**

- [ ] VS Code ve Flutter/Dart eklentileri kuruldu
- [ ] Flutter SDK kuruldu, `flutter --version` çalışıyor
- [ ] Android Studio ve SDK bileşenleri (Platform, Build-Tools, Command-line Tools, Platform-Tools, Emulator, NDK, CMake) kuruldu
- [ ] Android lisansları kabul edildi
- [ ] `flutter doctor -v` çalışıyor
- [ ] Android telefon veya emulator hazır, `flutter devices` cihazı görüyor
- [ ] İlk Flutter projesi oluşturuldu, `flutter run` başarılı
- [ ] Hot reload denendi
- [ ] Proje GitHub'a push edildi

**AI ve tasarım araçları**

- [ ] Node.js LTS kuruldu
- [ ] Claude Code kuruldu, `claude --version` çalışıyor
- [ ] Claude Team hesabıyla giriş yapıldı
- [ ] Dart/Flutter Claude Code eklentisi kuruldu
- [ ] Antigravity kuruldu ve Dart and Flutter entegrasyonu eklendi
- [ ] Figma hesabı açıldı (eğitim başvurusu yapıldı)
- [ ] Google Stitch erişimi kontrol edildi

**Teslim**

- [ ] Hafta 1 Classroom teslimi yapıldı

---

## 3.20 Sorun Giderme

| Sorun | Muhtemel neden | Çözüm |
|---|---|---|
| `flutter is not recognized` | Flutter PATH'e eklenmemiş | `C:\src\flutter\bin` dizinini PATH'e ekleyip **tüm** terminalleri kapatıp yeniden açın |
| `C:\src\flutter\flutter\bin` gibi iç içe klasör | Zip yanlış konuma çıkarılmış | Zip'i `C:\src` içine çıkarın; `flutter.bat` dosyası `C:\src\flutter\bin` içinde olmalı |
| `cmdline-tools component is missing` | Android CLI araçları eksik | SDK Manager → SDK Tools → Command-line Tools |
| `Unable to locate Android SDK` | SDK farklı konumda | `flutter config --android-sdk C:\Android\Sdk` |
| Android licenses hatası | Lisanslar kabul edilmemiş | `flutter doctor --android-licenses` |
| `Building with plugins requires symlink support` | Geliştirici Modu kapalı | `start ms-settings:developers` → Geliştirici Modu'nu açın |
| Gradle anlamsız yol hatalarıyla başarısız oluyor | Kullanıcı adında Türkçe karakter/boşluk veya proje OneDrive klasöründe | `GRADLE_USER_HOME=C:\gradle` ayarlayın, projeyi `C:\dev` altına taşıyın |
| İlk derleme çok uzun sürüyor veya `Could not resolve` hatası veriyor | Gradle bağımlılıkları indiriliyor; ağ yavaş veya engelli | Güçlü bir ağda tekrar deneyin; gerekirse `flutter clean` ve ardından `flutter run` |
| `UnsupportedClassVersionError` | Birden fazla Java sürümü çakışıyor | `flutter config --jdk-dir "C:\Program Files\Android\Android Studio\jbr"` |
| Telefon görünmüyor | USB hata ayıklama kapalı veya kablo yalnızca şarj ediyor | Geliştirici Seçenekleri → USB Hata Ayıklama; farklı bir veri kablosu deneyin |
| `unauthorized` | Telefon bilgisayara izin vermemiş | USB bağlantısını yenileyip izin penceresini onaylayın |
| Windows cihazı görmüyor | USB/OEM sürücü sorunu | Telefon üreticisinin Windows USB sürücüsünü kurun |
| `INSTALL_FAILED_USER_RESTRICTED` | Xiaomi/Redmi/POCO kısıtlaması | Geliştirici Seçenekleri → **USB ile yükle** seçeneğini açın |
| Emulator açılmıyor | Sanallaştırma kapalı | BIOS'ta VT-x/AMD-V'yi ve Windows Hypervisor Platform özelliğini açın |
| Kablosuz hata ayıklama bağlanmıyor | Kampüs ağı cihazları izole ediyor | Bilgisayarı telefonun hotspot'una bağlayarak deneyin |
| `npx.ps1 cannot be loaded` | PowerShell betik çalıştırma politikası | `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` |
| `claude: command not found` | PATH henüz güncellenmedi | Terminali tamamen kapatıp yeniden açın |
| Claude Code, Git Bash bulunamadı hatası veriyor | Git for Windows kurulu değil veya farklı konumda | Git'i kurun; gerekirse `CLAUDE_CODE_GIT_BASH_PATH` ortam değişkenini `C:\Program Files\Git\bin\bash.exe` olarak ayarlayın |
| `agy: command not found` | Antigravity CLI dizini PATH'te değil | Terminali yeniden başlatın ve CLI kurulumunu kontrol edin |
| `git push` kimlik hatası | GitHub oturumu açılmamış | `gh auth login` çalıştırın veya tarayıcıdaki giriş penceresini tamamlayın |
| Flutter uygulaması başlamıyor | Cihaz/SDK sorunu | Önce `flutter doctor -v`, ardından `flutter devices` çıktısını kontrol edin |

> Çözemediğiniz bir sorunla karşılaşırsanız hata mesajının **tamamını** ve `flutter doctor -v` çıktısını Classroom'daki soru-cevap akışına ekleyin. Hata mesajını Claude Code'a veya Antigravity'ye açıklatmak da iyi bir ilk adımdır.

---

## 3.21 Kurulum Başarı Kriteri

Aşağıdaki komutlar başarılıysa temel geliştirme ortamınız hazırdır:

```bash
git --version
flutter doctor -v
flutter devices
node --version
claude --version
```

Ardından şu adımları tamamlayabiliyorsanız **BMH309 geliştirme ortamınız hazırdır**:

```bash
cd C:\dev\bmh309
flutter create bmh309_ilk_adim
cd bmh309_ilk_adim
flutter run          # uygulama fiziksel Android cihazda veya emulatorde açılıyor
git init && git add . && git commit -m "Hafta 1: ilk Flutter projesi"
gh repo create bmh309_ilk_adim --public --source=. --push
```

---

## 3.22 İleriki Haftalarda Kurulacaklar (Şimdilik Gerekmez)

- **Firebase CLI** (Hafta 11): `npm install -g firebase-tools`
- **FlutterFire CLI** (Hafta 11): `dart pub global activate flutterfire_cli`. Bu komutun çalışması için `%LOCALAPPDATA%\Pub\Cache\bin` dizininin PATH'e eklenmesi gerekir.
- Proje paketleri (`go_router`, `flutter_riverpod`, `http` vb.) ilgili haftalarda `flutter pub add` komutuyla projelere eklenecektir.

---

# 4. Bu Notu VS Code'da Nasıl Kullanacaksınız?

Kurulumu tamamladıysanız artık Dart kodu yazmaya hazırsınız. Bu bölümde, bu nottaki ve sonraki haftaların notlarındaki kod örneklerini nasıl çalıştıracağınızı öğreneceğiz.

### 4.1 Haftalık çalışma klasörü

Kurulumda oluşturduğunuz `C:\dev\bmh309` klasörünün içine her hafta için bir klasör açın:

```text
C:\dev\bmh309\
├── bmh309_ilk_adim\        ← Kurulumda oluşturduğunuz Flutter projesi
└── hafta1\                 ← Bu haftanın Dart örnekleri
    ├── 05_01_merhaba.dart
    ├── 05_02_sira.dart
    └── ...
```

PowerShell'de:

```powershell
mkdir C:\dev\bmh309\hafta1
code C:\dev\bmh309\hafta1
```

İkinci komut klasörü VS Code'da açar. (`code` komutu çalışmazsa VS Code'da **File → Open Folder** ile açın.)

### 4.2 Kod bloklarını dosyaya dönüştürmek

Bu nottaki **her kod bloğu tek başına çalışan tam bir programdır** ve ilk satırında önerilen dosya adı yazar. Örneğin:

```text
// Dosya: 05_01_merhaba.dart
```

Yapmanız gerekenler:

1. VS Code'un sol tarafındaki **Explorer** panelinde, klasör adının yanındaki **New File** simgesine tıklayın.
2. Dosyaya kod bloğundaki adı verin. **Uzantı mutlaka `.dart` olmalıdır.**
3. Kod bloğunun **tamamını** kopyalayıp dosyaya yapıştırın ve kaydedin (`Ctrl + S`).

Dosyayı kaydettiğinizde VS Code'un sağ alt köşesinde **Dart** yazısını görmelisiniz. Bu, Dart eklentisinin dosyayı tanıdığını gösterir.

> **Neden her örnek ayrı dosya?** Dönem sonunda elinizde konu konu düzenlenmiş, çalışan bir örnek arşivi olur. Bir konuyu unuttuğunuzda dosyayı açıp çalıştırmanız yeterlidir.

### 4.3 Programı çalıştırmanın iki yolu

| Yol | Nasıl? | Çıktı nerede görünür? |
|---|---|---|
| **Run düğmesi** | `void main()` satırının hemen üstünde beliren **Run** yazısına tıklayın veya `F5` tuşuna basın. | VS Code'un alt panelindeki **Debug Console** |
| **Terminal** | `Ctrl` + `` ` `` ile terminali açın ve yazın: `dart run 05_01_merhaba.dart` | Terminal |

> Dosya adını terminale yazarken `Tab` tuşu otomatik tamamlama yapar: `dart run 05_` yazıp `Tab`'a basın.

### 4.4 Hatalı örnekler (❌)

Notta **❌ işaretli bloklar bilerek hatalı yazılmıştır.** Amaç, hata mesajını görmeniz ve okumayı öğrenmenizdir. Üç tür hata vardır:

| Hata türü | Ne olur? | Nerede görürsünüz? |
|---|---|---|
| **Derleme hatası** | Program hiç çalışmaz. | VS Code satırın altını **kırmızıyla** çizer. Fareyi üzerine getirin veya **Problems** panelini açın (`Ctrl + Shift + M`). |
| **Çalışma zamanı hatası** | Program çalışmaya başlar, hatalı satıra gelince durur. | Çıktıda `Unhandled exception` ile başlayan bir mesaj |
| **Mantık hatası** | Program hatasız çalışır ama **yanlış sonuç** üretir. | Hiçbir yerde; siz fark etmelisiniz. En tehlikeli hata türü budur. |

Hata mesajları İngilizcedir. Bu notta önemli hata mesajlarının Türkçesini de verdik. Hata mesajı okumayı öğrenmek, programlamanın en önemli becerilerinden biridir.

> **AI ile:** Anlamadığınız bir hata mesajını Claude Code'a veya Antigravity'ye **açıklatabilirsiniz**. Ama düzeltmeyi siz yapın (bkz. AI kuralı).

### 4.5 Faydalı kısayollar

| İşlem | Kısayol |
|---|---|
| Kodu otomatik biçimlendir | `Shift + Alt + F` (macOS: `Shift + Option + F`) |
| Satırı yorum yap / yorumu kaldır | `Ctrl + /` |
| Problems paneli | `Ctrl + Shift + M` |
| Terminali aç / kapat | `Ctrl` + `` ` `` |
| Çalışan programı durdur | Terminalde `Ctrl + C` · VS Code'da kırmızı kare (Stop) |

> **Windows'ta Türkçe karakterler bozuk görünürse** (`ÅŸ` gibi): Terminalde bir kez `chcp 65001` yazın veya VS Code'un kendi terminalini kullanın.

---

# 5. İlk Dart Programı: Merhaba Dünya

## 5.1 İlk program

```dart
// Dosya: 05_01_merhaba.dart
void main() {
  print('Merhaba Dünya!');
}
```

**Çıktı:**

```text
Merhaba Dünya!
```

**Çalıştırın:** Önce **Run** düğmesiyle, sonra terminalden `dart run 05_01_merhaba.dart` komutuyla çalıştırın. İki yolla da aynı çıktıyı görmelisiniz.

## 5.2 Satır satır açıklama

| Kod | Anlamı |
|---|---|
| `// Dosya: ...` | **Yorum satırı.** `//` işaretinden sonra yazılanları Dart çalıştırmaz; kodu okuyan insanlar için yazılır. |
| `void` | Bu fonksiyonun geriye bir değer **döndürmediğini** belirtir. Fonksiyonları 3. haftada ayrıntılı göreceğiz. |
| `main` | Programın **giriş noktası**. Dart, her programı `main` fonksiyonundan başlatır. Adı tam olarak `main` olmalıdır. |
| `()` | Parametre parantezi. `main` burada parametre almıyor. |
| `{ }` | Süslü parantezler arasına `main`'in **gövdesi**, yani çalışacak kodlar yazılır. |
| `print(...)` | Parantez içindeki değeri ekrana yazar ve **alt satıra geçer**. |
| `'Merhaba Dünya!'` | Bir **metin** (String). Metinler tek (`'...'`) veya çift (`"..."`) tırnak içinde yazılır. |
| `;` | **Noktalı virgül**, bir ifadenin bittiğini gösterir. Dart'ta zorunludur. |

> **Python'dan farklar:** Python'da satır sonunda bir işaret gerekmez ve blokları girinti belirler. Dart'ta her ifade `;` ile biter ve blokları `{ }` belirler. Girinti Dart için zorunlu değildir ama kodun okunabilmesi için şarttır; `Shift + Alt + F` ile otomatik düzeltebilirsiniz.

## 5.3 Satırlar sırayla çalışır

```dart
// Dosya: 05_02_sira.dart
void main() {
  print('1. Uygulama açılıyor...');
  print('2. Kullanıcı bilgileri yükleniyor...');
  print('3. Ana sayfa gösteriliyor.');
}
```

**Çıktı:**

```text
1. Uygulama açılıyor...
2. Kullanıcı bilgileri yükleniyor...
3. Ana sayfa gösteriliyor.
```

**Açıklama:** `main` içindeki satırlar **yukarıdan aşağıya** sırayla çalışır. Satırların yerini değiştirirseniz çıktının sırası da değişir.

> **Deneyin:** İkinci ve üçüncü satırın yerini değiştirip çalıştırın.

## 5.4 Yorum satırları

```dart
// Dosya: 05_03_yorumlar.dart

/// Belgeleme yorumu: Üç eğik çizgiyle başlar.
/// Fonksiyonların ve sınıfların üstüne, ne işe yaradıklarını anlatmak için yazılır.
void main() {
  // Tek satırlık yorum: Bu satır çalıştırılmaz.
  print('Yorumlar çıktıda görünmez.');

  /*
    Çok satırlı yorum.
    print('Bu satır da çalışmaz.');
  */

  print('Program bitti.'); // Satırın sonuna da yorum yazılabilir.
}
```

**Çıktı:**

```text
Yorumlar çıktıda görünmez.
Program bitti.
```

| Yorum türü | Yazımı | Kullanım |
|---|---|---|
| Tek satırlık | `// ...` | Kısa açıklamalar |
| Çok satırlı | `/* ... */` | Birden fazla satırı geçici olarak devre dışı bırakmak |
| Belgeleme | `/// ...` | Fonksiyon ve sınıfların açıklaması; VS Code'da fareyle üzerine gelindiğinde görünür |

> **İpucu:** Bir veya birkaç satırı seçip `Ctrl + /` tuşlarına basarsanız VS Code bu satırları yorum haline getirir. Tekrar basarsanız yorumu kaldırır. Kod denerken çok işinize yarayacak.

## 5.5 ❌ İlk hatalarımız

### Noktalı virgülü unutmak

```dart
// Dosya: 05_04_tuzak_noktali_virgul.dart
// ❌ DERLEME HATASI
void main() {
  print('Merhaba')
}
```

**Hata mesajı:**

```text
Expected ';' after this.
```

*Türkçesi: "Bundan sonra ';' bekleniyordu."* VS Code, noktalı virgülün eksik olduğu satırın altını kırmızıyla çizer.

### Büyük-küçük harf hatası

```dart
// Dosya: 05_05_tuzak_buyuk_harf.dart
// ❌ DERLEME HATASI
void main() {
  Print('Merhaba');
}
```

**Hata mesajı:**

```text
The function 'Print' isn't defined.
```

*Türkçesi: "'Print' adında bir fonksiyon tanımlı değil."* Dart **büyük-küçük harfe duyarlıdır** (case sensitive): `print` ile `Print` farklı isimlerdir.

### Tırnağı kapatmayı unutmak

```dart
// Dosya: 05_06_tuzak_tirnak.dart
// ❌ DERLEME HATASI
void main() {
  print('Merhaba);
}
```

**Hata mesajı (ilk satır):**

```text
Unterminated string literal.
```

*Türkçesi: "Sonlandırılmamış metin."* Açılan tırnak kapatılmadığı için Dart, metnin nerede bittiğini anlayamaz. Bu hata genellikle arkasından birkaç hata daha getirir. **Kural: Her zaman ilk hatadan başlayarak düzeltin**; çoğu zaman ilk hatayı düzeltince diğerleri de kaybolur.

### main'in adını yanlış yazmak

```dart
// Dosya: 05_07_tuzak_main.dart
// ❌ Program çalışmaz: main bulunamaz.
void mian() {
  print('Merhaba');
}
```

**Açıklama:** Bu dosyada sözdizimi hatası yoktur, ama Dart programı başlatmak için **`main`** adında bir fonksiyon arar. Bulamazsa programı çalıştıramaz ve `main` metodunun bulunamadığını bildiren bir hata verir. Ayrıca bu durumda VS Code, `main`'in üstünde beliren **Run** yazısını göstermez.

## 5.6 İsteğe bağlı: dart create ile Dart projesi

Bu notta tek dosyalarla çalışacağız. Daha büyük programlar için Dart bir **proje yapısı** da sunar:

```powershell
cd C:\dev\bmh309
dart create hafta1_proje
cd hafta1_proje
dart run
```

**Çıktı:**

```text
Hello world: 42!
```

Oluşan yapı:

```text
hafta1_proje\
├── bin\hafta1_proje.dart      ← Çalıştırılabilir program (main burada)
├── lib\hafta1_proje.dart      ← Tekrar kullanılabilir kodlar
├── test\                      ← Testler
├── analysis_options.yaml      ← Kod kalitesi kuralları
└── pubspec.yaml               ← Projenin kimlik kartı: adı, sürümü, kullandığı paketler
```

Bu yapı, kurulumda oluşturduğunuz Flutter projesine çok benzer: Flutter projesinde de `lib\` klasörü ve `pubspec.yaml` dosyası vardır. Bir projede `bin\` klasörüne başka dosyalar koyup `dart run bin\dosya_adi.dart` ile çalıştırabilirsiniz.

---

# 6. Değişken Kavramı

## 6.1 Değişken nedir?

Programlar veriyle çalışır: kullanıcının adı, sepetteki ürün sayısı, pil seviyesi, karanlık modun açık olup olmadığı... **Değişken**, bir veriyi bellekte saklamak için kullandığımız **isimlendirilmiş bir kutudur.**

```text
   ┌──────────────┐        ┌─────────┐        ┌────────┐
   │ 'Cep Market' │        │    1    │        │  true  │
   └──────────────┘        └─────────┘        └────────┘
     uygulamaAdi              surum              aktif
     (String)                 (int)              (bool)
```

Her kutunun bir **adı**, bir **tipi** (içine ne tür veri konabileceği) ve bir **değeri** vardır.

**Genel yapı:**

```dart
// ŞABLON: Bu blok tek başına çalışmaz, yalnızca yapıyı gösterir.
tip degiskenAdi = deger;
```

**Örnek:**

```dart
// Dosya: 06_01_degisken.dart
void main() {
  String uygulamaAdi = 'Cep Market';
  int surum = 1;
  bool aktif = true;

  print(uygulamaAdi);
  print(surum);
  print(aktif);
}
```

**Çıktı:**

```text
Cep Market
1
true
```

**Açıklama:** `String uygulamaAdi = 'Cep Market';` satırı şunu söyler: "`String` (metin) tipinde, adı `uygulamaAdi` olan bir değişken oluştur ve içine `'Cep Market'` değerini koy." `=` işareti matematikteki eşitlik değil, **atama** anlamına gelir: Sağdaki değer soldaki değişkene konur.

## 6.2 Ön bilgi: Metnin içinde değişken yazdırmak

Değişkenleri yazdırırken çoğu zaman yanına bir açıklama da eklemek isteriz. Dart'ta bunun için metnin içine **`$` işaretiyle** değişken adı yazılır:

```dart
// Dosya: 06_02_on_bilgi_interpolation.dart
void main() {
  String ad = 'Ayşe';
  int bildirim = 3;

  print('Merhaba $ad!');
  print('$bildirim yeni bildiriminiz var.');
}
```

**Çıktı:**

```text
Merhaba Ayşe!
3 yeni bildiriminiz var.
```

Bu yazıma **interpolation** (metne değer gömme) denir. Ayrıntılarını Bölüm 8.5'te göreceğiz; o zamana kadar örneklerde bu kolaylığı kullanacağız.

## 6.3 Değişkenin değerini değiştirmek

Değişkenin değeri program çalışırken değiştirilebilir. Bunun için tipi **tekrar yazmadan** yeni değer atanır:

```dart
// Dosya: 06_03_deger_degistirme.dart
void main() {
  int bildirimSayisi = 3;
  print('Başlangıç: $bildirimSayisi');

  bildirimSayisi = 5;
  print('Yeni bildirimler geldi: $bildirimSayisi');

  bildirimSayisi = bildirimSayisi + 1;
  print('Bir tane daha: $bildirimSayisi');

  bildirimSayisi = 0;
  print('Hepsi okundu: $bildirimSayisi');
}
```

**Çıktı:**

```text
Başlangıç: 3
Yeni bildirimler geldi: 5
Bir tane daha: 6
Hepsi okundu: 0
```

**Açıklama:** `bildirimSayisi = bildirimSayisi + 1;` satırı matematikte anlamsızdır, ama programlamada çok yaygındır. Atama **sağdan sola** çalışır: Önce sağ taraf hesaplanır (`5 + 1 = 6`), sonra sonuç soldaki değişkene konur.

### ❌ Aynı değişkeni iki kez tanımlamak

```dart
// Dosya: 06_04_tuzak_tekrar_tanimlama.dart
// ❌ DERLEME HATASI
void main() {
  int bildirimSayisi = 3;
  int bildirimSayisi = 5;
  print(bildirimSayisi);
}
```

**Hata mesajı:**

```text
The name 'bildirimSayisi' is already defined.
```

*Türkçesi: "'bildirimSayisi' adı zaten tanımlı."* Değeri değiştirmek için tipi tekrar yazmayın: `bildirimSayisi = 5;`

## 6.4 Önce tanımlamak, sonra değer vermek

Bir değişken önce tanımlanıp değeri sonra verilebilir. Ancak değer verilmeden **kullanılamaz**:

```dart
// Dosya: 06_05_sonra_deger_verme.dart
void main() {
  int puan;
  puan = 90;
  print('Puanınız: $puan');
}
```

**Çıktı:**

```text
Puanınız: 90
```

```dart
// Dosya: 06_06_tuzak_degersiz_kullanim.dart
// ❌ DERLEME HATASI
void main() {
  int puan;
  print(puan);
}
```

**Hata mesajı:**

```text
The non-nullable local variable 'puan' must be assigned before it can be used.
```

*Türkçesi: "'puan' değişkeni kullanılmadan önce bir değer almalı."* Dart, değeri belli olmayan bir değişkenin kullanılmasına izin vermez. Bu kuralın nedenini Bölüm 11'de (null safety) göreceğiz.

## 6.5 Temel veri tipleri

| Tip | Ne tutar? | Örnek değerler |
|---|---|---|
| `int` | Tam sayı | `42`, `-7`, `0` |
| `double` | Ondalıklı sayı | `3.14`, `149.90`, `-0.5` |
| `num` | Tam veya ondalıklı sayı | `10`, `12.5` |
| `String` | Metin | `'Merhaba'`, `''` |
| `bool` | Mantıksal değer | `true`, `false` |

Listeler (`List`), kümeler (`Set`) ve eşlemeler (`Map`) gibi **koleksiyon** tiplerini 3. haftada göreceğiz.

> **Dikkat:** `String`'in ilk harfi büyük, `int`, `double`, `bool`'un ilk harfi küçüktür.

## 6.6 var ve Tip Çıkarımı

Tipi açıkça yazmak yerine `var` kullanabilirsiniz. Dart, tipi **ilk atanan değerden** kendisi çıkarır. Buna **tip çıkarımı** (type inference) denir.

```dart
// Dosya: 06_07_var.dart
void main() {
  var urunAdi = 'Kablosuz Kulaklık';
  var stok = 42;
  var fiyat = 749.90;
  var stoktaVar = true;

  print(urunAdi.runtimeType);
  print(stok.runtimeType);
  print(fiyat.runtimeType);
  print(stoktaVar.runtimeType);
}
```

**Çıktı:**

```text
String
int
double
bool
```

**Açıklama:** `runtimeType`, bir değerin tipini gösterir. Dart, `'Kablosuz Kulaklık'` değerine bakıp `urunAdi`'nın `String`, `42`'ye bakıp `stok`'un `int` olduğunu anladı.

> **Deneyin:** VS Code'da fareyi `stok` değişkeninin üzerine getirin. Açılan kutucukta `int stok` yazdığını göreceksiniz.

### ❌ var, "her şeyi alabilir" demek değildir

```dart
// Dosya: 06_08_tuzak_var.dart
// ❌ DERLEME HATASI
void main() {
  var stok = 42;
  stok = 'kırk iki';
  print(stok);
}
```

**Hata mesajı:**

```text
A value of type 'String' can't be assigned to a variable of type 'int'.
```

*Türkçesi: "'String' tipindeki bir değer 'int' tipindeki bir değişkene atanamaz."*

**Açıklama:** `var` ile tanımlanan değişkenin tipi ilk atamada belirlenir ve **bir daha değişmez**. Python'da bir değişkene önce sayı sonra metin koyabilirsiniz; Dart'ta koyamazsınız. Dart **statik tipli** bir dildir ve bu hatayı program çalışmadan önce yakalar. Bir mobil uygulamada bu hatanın kullanıcının telefonunda değil, sizin ekranınızda ortaya çıkması büyük bir avantajdır.

### Tip mi yazmalı, var mı?

| Durum | Öneri |
|---|---|
| Değer hemen veriliyor ve tipi açıkça belli | `var` kullanılabilir: `var stok = 42;` |
| Değer sonra verilecek | Tip yazılmalı: `int puan;` |
| Tipin okuyana açıkça görünmesi önemli | Tip yazın |
| Emin değilseniz | **Tip yazın.** Zararı yoktur. |

Bu notta öğrenmeyi kolaylaştırmak için çoğunlukla tipi açıkça yazacağız.

> ⚠️ Başlangıç değeri vermeden `var x;` yazarsanız `x`'in tipi `dynamic` olur: Her şeyi kabul eder ve Dart tip denetimini kapatır. Hatalar derleme yerine çalışma anında ortaya çıkar. Bundan kaçının.

## 6.7 Değişmeyen değerler: final ve const

Bazı değerler bir kez belirlenir ve bir daha değişmez: uygulamanın adı, KDV oranı, sepete eklenebilecek en fazla ürün sayısı, uygulamanın açıldığı an...

```dart
// Dosya: 06_09_final_const.dart
void main() {
  const String uygulamaAdi = 'Cep Market';
  const double kdvOrani = 0.20;
  const int maksimumSepetAdedi = 20;
  final DateTime acilisZamani = DateTime.now();

  print('$uygulamaAdi açıldı.');
  print('Açılış zamanı: $acilisZamani');
  print('KDV oranı: $kdvOrani');
  print('Sepete en fazla $maksimumSepetAdedi ürün eklenebilir.');
}
```

**Çıktı** (açılış zamanı sizde farklı olacaktır):

```text
Cep Market açıldı.
Açılış zamanı: 2026-10-07 10:15:42.123456
KDV oranı: 0.2
Sepete en fazla 20 ürün eklenebilir.
```

**Açıklama:** `DateTime.now()`, programın çalıştığı andaki tarih ve saati verir. Programı her çalıştırdığınızda farklı bir değer görürsünüz.

### ❌ final ve const değişkenler değiştirilemez

```dart
// Dosya: 06_10_tuzak_final.dart
// ❌ DERLEME HATASI
void main() {
  final DateTime acilisZamani = DateTime.now();
  acilisZamani = DateTime.now();

  const double kdvOrani = 0.20;
  kdvOrani = 0.18;
}
```

**Hata mesajları:**

```text
The final variable 'acilisZamani' can only be set once.
Constant variables can't be assigned a value.
```

*Türkçesi: "Final değişkene yalnızca bir kez değer atanabilir." ve "Sabit değişkenlere değer atanamaz."*

### final ile const arasındaki fark

```dart
// Dosya: 06_11_tuzak_const_zaman.dart
// ❌ DERLEME HATASI
void main() {
  const DateTime acilisZamani = DateTime.now();
  print(acilisZamani);
}
```

**Hata mesajı:**

```text
Const variables must be initialized with a constant value.
```

*Türkçesi: "Sabit değişkenlere sabit bir değer verilmelidir."*

**Açıklama:** `const` değeri, program **derlenirken** bilinmelidir. Şu anki saat ise ancak program **çalışırken** bilinebilir. Bu yüzden `DateTime.now()` bir `const`'a atanamaz ama bir `final`'a atanabilir.

| | `final` | `const` |
|---|---|---|
| Değer ne zaman belirlenir? | Program **çalışırken** | Program **derlenirken** |
| Kaç kez atanabilir? | Bir kez | Bir kez (tanımlanırken) |
| `DateTime.now()` atanabilir mi? | Evet | Hayır |
| Örnek | Uygulamanın açılış zamanı, sunucudan gelen kullanıcı adı, cihazın ekran genişliği | KDV oranı, uygulama adı, sabit renk kodları |

> **Kural:** Değişmeyecek her değeri `final` veya `const` yapın. Değeri kodu yazarken biliyorsanız `const`, ancak program çalışınca öğrenebiliyorsanız `final`.

> 🔗 **Flutter'da:** `const Text('Merhaba')`, `const SizedBox(height: 16)` gibi ifadeleri çok sık göreceksiniz. Flutter, `const` ile oluşturulan arayüz parçalarını ekran yeniden çizilirken tekrar oluşturmaz; bu da performans demektir. VS Code size sık sık "buraya `const` ekleyin" önerisinde bulunacak.

## 6.8 Adlandırma kuralları

### Zorunlu kurallar (uyulmazsa kod derlenmez)

| Kural | Geçerli | Geçersiz |
|---|---|---|
| Harf, rakam, `_` ve `$` kullanılabilir | `urunAdi`, `adet2`, `_gizli` | `urun-adi`, `fiyat%` |
| Rakamla başlayamaz | `adet2` | `2adet` |
| Boşluk içeremez | `sepetTutari` | `sepet tutari` |
| **Türkçe karakter içeremez** | `urunAdi`, `sifre` | `ürünAdı`, `şifre` |
| Dart'ın anahtar kelimesi olamaz | `finalNotu`, `sinif` | `final`, `class`, `if`, `var` |

> ⚠️ **Türkçe karakter uyarısı:** Değişken adlarında `ç, ğ, ı, ö, ş, ü` kullanamazsınız. Ancak **tırnak içindeki metinlerde** istediğiniz Türkçe karakteri kullanabilirsiniz: `String urunAdi = 'Kaşar Peyniri';` ✓

```dart
// Dosya: 06_12_tuzak_turkce_ad.dart
// ❌ DERLEME HATASI: Değişken adında Türkçe karakter
void main() {
  String ürünAdı = 'Süt';
  print(ürünAdı);
}
```

VS Code bu satırları kırmızıyla çizer; hata mesajında değişken adındaki geçersiz karakterden söz edilir. Değişken adını `urunAdi` yaptığınızda hata kaybolur.

### Büyük-küçük harf duyarlılığı

```dart
// Dosya: 06_13_buyuk_kucuk_harf.dart
void main() {
  String ad = 'Ayşe';
  String Ad = 'Mehmet';

  print(ad);
  print(Ad);
}
```

**Çıktı:**

```text
Ayşe
Mehmet
```

**Açıklama:** `ad` ile `Ad` **iki farklı** değişkendir. Program çalışır, ama bu kafa karıştırıcıdır. Dart'ın stil kurallarına göre değişken adları küçük harfle başlar; `dart create` ile oluşturulan bir projede VS Code bu konuda sizi uyarır. Gerçek kodda böyle yazmayın.

### Stil kuralları (uyulmazsa kod çalışır ama okunması zorlaşır)

| Ne? | Kural | Örnek |
|---|---|---|
| Değişken, sabit, fonksiyon | **lowerCamelCase**: İlk kelime küçük, sonraki kelimelerin ilk harfi büyük | `urunAdi`, `sepetToplami`, `maksimumSepetAdedi` |
| Sınıf, tip | **UpperCamelCase** | `SepetEkrani`, `Urun` |
| Dosya adı | **snake_case**: Küçük harf ve alt çizgi | `sepet_ekrani.dart` |

- **Anlamlı isimler seçin:** `a`, `x`, `deger1` yerine `adet`, `fiyat`, `kullaniciAdi`.
- `bool` değişkenler soru gibi okunmalı: `aktifMi`, `girisYapti`, `stoktaVar`.
- Birçok dilde sabitler `MAKSIMUM_ADET` gibi büyük harfle yazılır; Dart'ın stil rehberi sabitler için de **lowerCamelCase** önerir: `maksimumAdet`.

---

# 7. Sayılar: int, double, num

## 7.1 Üç sayı tipi

| Tip | Ne tutar? | Örnek |
|---|---|---|
| `int` | Tam sayı (mobil ve masaüstünde 64 bit) | `42`, `-5`, `0` |
| `double` | Ondalıklı sayı (64 bit kayan noktalı) | `149.90`, `0.82`, `-3.5` |
| `num` | `int` ve `double`'ın **ortak üst tipi**; ikisini de tutabilir | `10`, `12.5` |

> Ondalık ayırıcı olarak **nokta** kullanılır: `149.90` ✓ — `149,90` ✗

```dart
// Dosya: 07_01_sayilar.dart
void main() {
  int stokAdedi = 42;
  int sicaklik = -5;
  double fiyat = 149.90;
  double pilOrani = 0.82;
  num indirim = 10;

  print(stokAdedi);
  print(sicaklik);
  print(fiyat);
  print(pilOrani);
  print(indirim);

  indirim = 12.5;
  print(indirim);
}
```

**Çıktı:**

```text
42
-5
149.9
0.82
10
12.5
```

**Açıklama:**
- `fiyat` için `149.90` yazdık ama çıktıda `149.9` göründü. Sondaki sıfır sayının bir parçası değil, yalnızca bir **yazım biçimidir**. Para gösterirken iki basamağı nasıl koruyacağımızı 7.5'te göreceğiz.
- `indirim` değişkeni `num` olduğu için önce tam sayı (`10`), sonra ondalıklı sayı (`12.5`) tutabildi.

## 7.2 Sayıların farklı yazımları

```dart
// Dosya: 07_02_sayi_yazimlari.dart
void main() {
  int nufus = 1_000_000;    // Basamak ayırıcı: okunabilirlik için
  int renk = 0xFF2196F3;    // Onaltılık (hexadecimal) yazım
  double kucuk = 1.5e-3;    // Bilimsel gösterim: 1.5 × 10⁻³
  double buyuk = 2e6;       // 2 × 10⁶

  print(nufus);
  print(renk);
  print(kucuk);
  print(buyuk);
}
```

**Çıktı:**

```text
1000000
4280391411
0.0015
2000000.0
```

**Açıklama:**
- `1_000_000` yazımındaki alt çizgiler yalnızca okunabilirlik içindir; değeri etkilemez. (Bu yazım Dart 3.6 ve sonrasında desteklenir.)
- `0x` ile başlayan sayılar **onaltılık** tabanda yazılmıştır. `print` her zaman onluk tabanda yazdırır.
- `e` harfi "10 üzeri" anlamına gelir. `2e6` her zaman bir `double`'dır; bu yüzden çıktı `2000000.0` oldu.

> 🔗 **Flutter'da:** Renkler onaltılık sayılarla yazılır: `Color(0xFF2196F3)`. İlk iki basamak (`FF`) saydamlığı, sonraki altı basamak (`2196F3`) kırmızı, yeşil ve mavi tonlarını belirtir.

## 7.3 int ile double arasında geçiş

```dart
// Dosya: 07_03_int_double.dart
void main() {
  double fiyat = 150;      // Doğrudan yazılan tam sayı double'a uyar: 150.0
  print(fiyat);

  int adet = 3;
  double adetDouble = adet.toDouble();
  print(adetDouble);

  double puan = 87.6;
  int puanTam = puan.toInt();
  int puanYuvarlak = puan.round();
  print(puanTam);
  print(puanYuvarlak);
}
```

**Çıktı:**

```text
150.0
3.0
87
88
```

**Açıklama:**
- `double` bir değişkene `150` gibi doğrudan yazılmış bir tam sayı verebilirsiniz; Dart onu `150.0` yapar.
- Ama `int` tipinde bir **değişkeni** `double` bir değişkene doğrudan atayamazsınız; `toDouble()` ile çevirmeniz gerekir.
- `toInt()` ondalık kısmı **atar** (87.6 → 87); `round()` en yakın tam sayıya **yuvarlar** (87.6 → 88).

### ❌ Otomatik dönüşüm yoktur

```dart
// Dosya: 07_04_tuzak_int_double.dart
// ❌ DERLEME HATASI
void main() {
  int adet = 3;
  double toplam = adet;

  double puan = 87.6;
  int sonuc = puan;
}
```

**Hata mesajları:**

```text
A value of type 'int' can't be assigned to a variable of type 'double'.
A value of type 'double' can't be assigned to a variable of type 'int'.
```

**Açıklama:** Dart, sayıları tipler arasında **kendiliğinden çevirmez**; bilgi kaybı olabilecek her dönüşümü açıkça yazmanızı ister. Düzeltme: `double toplam = adet.toDouble();` ve `int sonuc = puan.round();`

## 7.4 Dört işlem (ön bilgi)

Operatörleri 2. haftada ayrıntılı göreceğiz. Şimdilik dört işlem yeterli:

```dart
// Dosya: 07_05_dort_islem.dart
void main() {
  int adet = 3;
  double birimFiyat = 49.5;
  double toplam = adet * birimFiyat;

  print('Toplam: $toplam');
  print(10 + 5);
  print(10 - 5);
  print(10 * 5);
  print(10 / 4);
}
```

**Çıktı:**

```text
Toplam: 148.5
15
5
50
2.5
```

**Açıklama:** `int` ile `double`'ın işlem sonucu `double` olur. `/` (bölme) ise iki tam sayıyla bile kullanılsa **her zaman** `double` verir: `10 / 4 = 2.5`.

## 7.5 Sayıların faydalı özellikleri ve metotları

Dart'ta sayılar da birer **nesnedir**; üzerlerinde nokta (`.`) ile metot çağrılabilir.

```dart
// Dosya: 07_06_sayi_metotlari.dart
void main() {
  double fiyat = 149.957;
  int sicaklik = -7;
  int sayi = 14;

  print(fiyat.toStringAsFixed(2));
  print(fiyat.round());
  print(fiyat.floor());
  print(fiyat.ceil());
  print(sicaklik.abs());
  print(sayi.isEven);
  print(sayi.isOdd);
  print(sicaklik.isNegative);
  print(105.clamp(0, 100));
}
```

**Çıktı:**

```text
149.96
150
149
150
7
true
false
true
100
```

| Metot / özellik | Ne yapar? | Örnek → Sonuç |
|---|---|---|
| `toStringAsFixed(n)` | `n` ondalık basamaklı **metne** çevirir (yuvarlayarak) | `149.957.toStringAsFixed(2)` → `'149.96'` |
| `round()` | En yakın tam sayıya yuvarlar | `149.957` → `150` |
| `floor()` | Aşağı yuvarlar | `149.957` → `149` |
| `ceil()` | Yukarı yuvarlar | `149.957` → `150` |
| `toInt()` | Ondalık kısmı atar | `87.6` → `87` |
| `toDouble()` | `double`'a çevirir | `3` → `3.0` |
| `abs()` | Mutlak değer | `-7` → `7` |
| `isEven` / `isOdd` | Çift mi? / Tek mi? | `14.isEven` → `true` |
| `isNegative` | Negatif mi? | `-7` → `true` |
| `clamp(a, b)` | Değeri `[a, b]` aralığına sıkıştırır | `105.clamp(0, 100)` → `100` |

> 📱 **Mobil örnek:** Ekranda para gösterirken her zaman `toStringAsFixed(2)` kullanılır: `49.9` değil `49.90 TL`. Bir sensörden pil seviyesi hatalı olarak `105` gelirse `clamp(0, 100)` ile güvenli aralığa çekilir.

## 7.6 ⚠️ Ondalık sayılarda hassasiyet

```dart
// Dosya: 07_07_hassasiyet.dart
void main() {
  print(0.1 + 0.2);
  print((0.1 + 0.2).toStringAsFixed(2));

  // Para hesaplarında önerilen yol: tutarı kuruş cinsinden tam sayı olarak tutmak
  int fiyatKurus = 14990; // 149,90 TL
  int adet = 3;
  int toplamKurus = fiyatKurus * adet;
  print('Toplam: ${(toplamKurus / 100).toStringAsFixed(2)} TL');
}
```

**Çıktı:**

```text
0.30000000000000004
0.30
Toplam: 449.70 TL
```

**Açıklama:** `0.1 + 0.2`'nin `0.3` çıkmaması Dart'ın bir hatası değildir. Bilgisayarlar ondalık sayıları ikilik sistemde saklar ve `0.1` gibi bazı sayılar ikilik sistemde tam olarak ifade edilemez. Java, JavaScript ve Python'da da aynı sonucu alırsınız.

- Ekranda gösterirken `toStringAsFixed` bu farkı gizler.
- Gerçek bir ödeme uygulamasında para tutarları genellikle **kuruş cinsinden `int`** olarak saklanır; hesaplar tam sayıyla yapılır, yalnızca ekrana yazarken 100'e bölünür.

---

# 8. Metinler: String

## 8.1 Metin tanımlama

```dart
// Dosya: 08_01_string.dart
void main() {
  String urun = 'Kablosuz Kulaklık';
  String aciklama = "Dart'ta tek veya çift tırnak kullanılabilir.";
  String bosMetin = '';

  print(urun);
  print(aciklama);
  print(bosMetin);
  print('Son satır');
}
```

**Çıktı:**

```text
Kablosuz Kulaklık
Dart'ta tek veya çift tırnak kullanılabilir.

Son satır
```

**Açıklama:**
- Metinler tek (`'...'`) veya çift (`"..."`) tırnak arasına yazılır; ikisi arasında fark yoktur. Dart topluluğunda **tek tırnak** tercih edilir.
- Metnin içinde kesme işareti (`'`) varsa çift tırnak kullanmak işi kolaylaştırır.
- `''` **boş metindir**: Hiç karakter içermez. Yazdırıldığında boş bir satır görünür.

## 8.2 Kaçış karakterleri

Bazı karakterleri metnin içine yazmak için önüne ters eğik çizgi (`\`) konur:

| Yazım | Anlamı |
|---|---|
| `\'` | Tek tırnak |
| `\"` | Çift tırnak |
| `\n` | Yeni satır |
| `\t` | Sekme (tab) |
| `\\` | Ters eğik çizgi |
| `\$` | Dolar işareti |

```dart
// Dosya: 08_02_kacis_karakterleri.dart
void main() {
  print('Dart\'ta kaçış karakteri');
  print('Birinci satır\nİkinci satır');
  print('Ad:\tAyşe');
  print('Dosya yolu: C:\\dev\\bmh309');
  print('Fiyat: 50 \$');
}
```

**Çıktı:**

```text
Dart'ta kaçış karakteri
Birinci satır
İkinci satır
Ad:	Ayşe
Dosya yolu: C:\dev\bmh309
Fiyat: 50 $
```

**Açıklama:** `$` işaretinin önüne `\` koyduk, çünkü Dart'ta `$` metnin içine değişken gömmek için kullanılır (8.5).

## 8.3 Çok satırlı ve ham metinler

```dart
// Dosya: 08_03_cok_satirli_ham.dart
void main() {
  String bildirim = '''
Siparişiniz kargoya verildi.
Takip no: TR123456
Tahmini teslimat: 2 gün''';
  print(bildirim);

  String yol = r'C:\dev\bmh309\hafta1';
  print(yol);
}
```

**Çıktı:**

```text
Siparişiniz kargoya verildi.
Takip no: TR123456
Tahmini teslimat: 2 gün
C:\dev\bmh309\hafta1
```

**Açıklama:**
- Üç tırnak (`'''`) ile **çok satırlı** metin yazılır; satır sonları metne dahil olur. Açılış tırnaklarından hemen sonraki ilk satır sonu dikkate alınmaz.
- Başında `r` olan metin **ham metindir** (raw): `\` ve `$` özel anlam taşımaz, yazıldığı gibi kalır. Windows dosya yolları için kullanışlıdır.

## 8.4 Metin birleştirme

```dart
// Dosya: 08_04_birlestirme.dart
void main() {
  String ad = 'Ayşe';
  String soyad = 'Yılmaz';

  String tamAd = ad + ' ' + soyad;
  print(tamAd);

  String uzunMetin = 'Bu metin iki parçadan '
      'oluşuyor ama tek bir metindir.';
  print(uzunMetin);
}
```

**Çıktı:**

```text
Ayşe Yılmaz
Bu metin iki parçadan oluşuyor ama tek bir metindir.
```

**Açıklama:**
- `+` operatörü iki metni birleştirir.
- **Yan yana yazılan** iki metin (aralarında hiçbir operatör olmadan) Dart tarafından otomatik olarak birleştirilir. Uzun metinleri satırlara bölmenin temiz yoludur.

## 8.5 Interpolation: Metne Değer Gömme

Metnin içine bir değişkenin değerini yerleştirmenin Dart'taki önerilen yolu **interpolation**'dır:

| Yazım | Ne zaman? | Örnek |
|---|---|---|
| `$degisken` | Yalnızca bir değişken adı | `'Merhaba $ad'` |
| `${ifade}` | Bir özellik, metot çağrısı veya hesap | `'${ad.length} harf'`, `'${adet * 2}'` |

```dart
// Dosya: 08_05_interpolation.dart
void main() {
  String ad = 'Ayşe';
  int bildirim = 3;
  double bakiye = 1250.5;

  print('Merhaba $ad!');
  print('$ad, $bildirim yeni bildiriminiz var.');
  print('Bakiyeniz: ${bakiye.toStringAsFixed(2)} TL');
  print('Adınız ${ad.length} harfli.');
  print('İki katı: ${bildirim * 2}');
}
```

**Çıktı:**

```text
Merhaba Ayşe!
Ayşe, 3 yeni bildiriminiz var.
Bakiyeniz: 1250.50 TL
Adınız 4 harfli.
İki katı: 6
```

**Açıklama:** Interpolation, `+` ile birleştirmeye göre hem daha okunurdur hem de sayıları otomatik olarak metne çevirir. Karşılaştırın:

```dart
// Dosya: 08_06_interpolation_karsilastirma.dart
void main() {
  String ad = 'Ayşe';
  int bildirim = 3;

  print(ad + ', ' + bildirim.toString() + ' yeni bildiriminiz var.'); // + ile
  print('$ad, $bildirim yeni bildiriminiz var.');                     // interpolation
}
```

**Çıktı:**

```text
Ayşe, 3 yeni bildiriminiz var.
Ayşe, 3 yeni bildiriminiz var.
```

### ❌ Sık yapılan hata: Süslü parantezi unutmak

```dart
// Dosya: 08_07_tuzak_interpolation.dart
// ❌ MANTIK HATASI: Program çalışır ama yanlış sonuç üretir.
void main() {
  String ad = 'Ayşe';
  print('Adınız $ad.length harfli.');
}
```

**Çıktı:**

```text
Adınız Ayşe.length harfli.
```

**Açıklama:** Dart, `$` işaretinden sonra yalnızca **değişken adını** (`ad`) alır; `.length` kısmını sıradan metin sanar. Bir özelliğe, metoda veya hesaba erişiyorsanız mutlaka `${ad.length}` yazın.

> 🔗 **Flutter'da:** Ekrandaki yazıların neredeyse tamamı interpolation ile oluşturulur: `Text('Hoş geldin, $kullaniciAdi')`, `Text('${urun.fiyat.toStringAsFixed(2)} TL')`.

## 8.6 Metnin özellikleri

```dart
// Dosya: 08_08_metin_ozellikleri.dart
void main() {
  String urun = 'Kablosuz Kulaklık';

  print(urun.length);
  print(urun.isEmpty);
  print(urun.isNotEmpty);
  print(urun.toUpperCase());
  print(urun.toLowerCase());
  print(urun[0]);
  print(urun[urun.length - 1]);
}
```

**Çıktı:**

```text
17
false
true
KABLOSUZ KULAKLIK
kablosuz kulaklık
K
k
```

**Açıklama:**
- `length`, metindeki karakter sayısını verir; **boşluklar da sayılır**.
- `urun[0]` metnin **ilk** karakterini verir. Sıra numarası (indeks) **0'dan başlar**; son karakterin indeksi `length - 1`'dir.
- `toUpperCase()` ve `toLowerCase()` metnin **yeni bir kopyasını** döndürür; orijinal metin değişmez (8.10).

## 8.7 Metinde arama ve dönüştürme

```dart
// Dosya: 08_09_metin_arama.dart
void main() {
  String eposta = '  Ayse.Yilmaz@Ornek.com  ';

  String temiz = eposta.trim();
  print('[$temiz]');
  print(temiz.toLowerCase());
  print(temiz.contains('@'));
  print(temiz.startsWith('Ayse'));
  print(temiz.endsWith('.com'));
  print(temiz.indexOf('@'));
  print(temiz.substring(0, temiz.indexOf('@')));
  print(temiz.replaceAll('.', '_'));
}
```

**Çıktı:**

```text
[Ayse.Yilmaz@Ornek.com]
ayse.yilmaz@ornek.com
true
true
true
11
Ayse.Yilmaz
Ayse_Yilmaz@Ornek_com
```

| Metot | Ne yapar? | 📱 Mobil kullanım |
|---|---|---|
| `trim()` | Baştaki ve sondaki boşlukları siler | Form alanlarına yanlışlıkla yazılan boşlukları temizlemek |
| `toLowerCase()` / `toUpperCase()` | Küçük / büyük harfe çevirir | E-postaları karşılaştırmadan önce |
| `contains(x)` | `x` metnin içinde geçiyor mu? | E-postada `@` var mı? |
| `startsWith(x)` / `endsWith(x)` | Metin `x` ile mi başlıyor / bitiyor? | Bağlantı `https` ile mi başlıyor? |
| `indexOf(x)` | `x`'in ilk geçtiği indeks (yoksa `-1`) | Bir karakterin yerini bulmak |
| `substring(a, b)` | `a` indeksinden `b` indeksine **kadar** (b dahil değil) olan parça | E-postanın kullanıcı adı kısmı |
| `replaceAll(a, b)` | Tüm `a`'ları `b` ile değiştirir | Telefon numarasındaki boşlukları silmek |

**Açıklama:** `[$temiz]` yazımında köşeli parantezler yalnızca metnin nerede başlayıp bittiğini görmek içindir; böylece `trim()`'in boşlukları sildiği açıkça görünür.

## 8.8 Metni biçimlendirme

```dart
// Dosya: 08_10_metin_bicimlendirme.dart
void main() {
  String saat = '9';
  String dakika = '5';
  print('${saat.padLeft(2, '0')}:${dakika.padLeft(2, '0')}');

  print('Ürün'.padRight(12, '.') + '49.90 TL');
  print('Kargo'.padRight(12, '.') + '29.90 TL');

  print('=' * 20);

  String telefon = '0532 123 45 67';
  print(telefon.replaceAll(' ', ''));
}
```

**Çıktı:**

```text
09:05
Ürün........49.90 TL
Kargo.......29.90 TL
====================
05321234567
```

**Açıklama:**
- `padLeft(2, '0')`, metni **soldan** `'0'` ile doldurarak 2 karaktere tamamlar: `'9'` → `'09'`. Saat ve tarih gösteriminde çok kullanılır.
- `padRight(12, '.')`, metni **sağdan** doldurarak 12 karaktere tamamlar. Fiş ve tablo hizalamada işe yarar.
- `'=' * 20`, metni 20 kez tekrarlar.

## 8.9 ⚠️ Türkçe büyük-küçük harf dönüşümü

```dart
// Dosya: 08_11_turkce_harfler.dart
void main() {
  print('istanbul'.toUpperCase());
  print('IŞIK'.toLowerCase());
  print('Iğdır'.toLowerCase());
}
```

**Çıktı:**

```text
ISTANBUL
işik
iğdır
```

**Açıklama:** Beklenen sonuçlar `İSTANBUL`, `ışık` ve `ığdır` olmalıydı. Dart'ın `toUpperCase()` ve `toLowerCase()` metotları **dilden bağımsız** çalışır: Küçük `i`'yi `I`'ya, büyük `I`'yı `i`'ye çevirir. Türkçedeki `ı – I` ve `i – İ` eşleşmesini bilmez. Türkçe metinlerle çalışırken bu davranışı hesaba katın; özellikle büyük-küçük harf dönüşümü yapıp metin karşılaştırırken.

## 8.10 Metinler değiştirilemez

```dart
// Dosya: 08_12_metin_degismezligi.dart
void main() {
  String sehir = 'bursa';

  sehir.toUpperCase();   // Sonuç hiçbir yere atanmadı!
  print(sehir);

  sehir = sehir.toUpperCase();
  print(sehir);
}
```

**Çıktı:**

```text
bursa
BURSA
```

**Açıklama:** Metin metotları orijinal metni **değiştirmez**; değiştirilmiş **yeni bir metin** döndürür. İlk satırda üretilen `'BURSA'` hiçbir değişkene atanmadığı için kayboldu. Sonucu kullanmak istiyorsanız bir değişkene atamalısınız.

## 8.11 Metinleri karşılaştırma

```dart
// Dosya: 08_13_metin_karsilastirma.dart
void main() {
  String girilen = 'Flutter';
  String beklenen = 'flutter';

  print(girilen == beklenen);
  print(girilen.toLowerCase() == beklenen);
  print(girilen != beklenen);
}
```

**Çıktı:**

```text
false
true
true
```

**Açıklama:** `==` iki metnin **içeriğini** karşılaştırır ve büyük-küçük harfe duyarlıdır. Kullanıcı girdisini karşılaştırırken önce `trim()` ve `toLowerCase()` uygulamak güvenlidir.

---

# 9. Mantıksal Değerler: bool

`bool` tipi yalnızca iki değer alabilir: **`true`** (doğru) veya **`false`** (yanlış). İsmini mantıkçı George Boole'dan alır.

```dart
// Dosya: 09_01_bool.dart
void main() {
  bool girisYapti = true;
  bool karanlikMod = false;

  print(girisYapti);
  print('Karanlık mod açık mı? $karanlikMod');

  String sifre = 'abc';
  bool sifreYeterliMi = sifre.length >= 8;
  bool epostaGecerliMi = 'ayse@ornek.com'.contains('@');

  print('Şifre yeterince uzun mu? $sifreYeterliMi');
  print('E-posta geçerli mi? $epostaGecerliMi');
  print('Tersi: ${!epostaGecerliMi}');
}
```

**Çıktı:**

```text
true
Karanlık mod açık mı? false
Şifre yeterince uzun mu? false
E-posta geçerli mi? true
Tersi: false
```

**Açıklama:**
- `bool` değerler yalnızca doğrudan `true` / `false` yazılarak değil, **karşılaştırmalardan** (`sifre.length >= 8`) ve **metotlardan** (`contains('@')`) da elde edilir.
- `!` işareti bir `bool` değeri tersine çevirir. Mantıksal operatörleri 2. haftada ayrıntılı göreceğiz.
- `bool` değişkenlere soru gibi okunan isimler verin: `girisYapti`, `aktifMi`, `stoktaVar`.

> 🔗 **Flutter'da:** Karanlık mod açık mı, kullanıcı giriş yaptı mı, veri yükleniyor mu, butona tıklanabilir mi... Bir ekranın nasıl görüneceğine karar veren değerlerin çoğu `bool`'dur. 2. haftada bu değerlerle karar vermeyi (`if`) öğreneceğiz.

### ❌ bool yerine sayı veya metin kullanmak

```dart
// Dosya: 09_02_tuzak_bool.dart
// ❌ DERLEME HATASI
void main() {
  bool aktif = 1;
  bool bildirimAcik = 'true';
}
```

**Hata mesajları:**

```text
A value of type 'int' can't be assigned to a variable of type 'bool'.
A value of type 'String' can't be assigned to a variable of type 'bool'.
```

**Açıklama:** C veya Python'da `1` "doğru" kabul edilebilir; Dart'ta `bool` yalnızca `true` veya `false` olabilir. `'true'` ise tırnak içinde olduğu için bir **metindir**, `bool` değildir.

---

# 10. Tür Dönüşümleri

Mobil uygulamalarda veri çoğu zaman **metin** olarak gelir: Kullanıcının bir form alanına yazdığı adet, internetten gelen bir fiyat, ayarlardan okunan bir değer... Bu metinleri hesap yapabilmek için sayıya, sayıları da ekranda gösterebilmek için metne çevirmemiz gerekir.

| Dönüşüm | Yöntem | Örnek → Sonuç |
|---|---|---|
| `String` → `int` | `int.parse()` / `int.tryParse()` | `int.parse('25')` → `25` |
| `String` → `double` | `double.parse()` / `double.tryParse()` | `double.parse('49.90')` → `49.9` |
| `int` → `double` | `toDouble()` | `3.toDouble()` → `3.0` |
| `double` → `int` | `toInt()`, `round()`, `floor()`, `ceil()` | `87.6.round()` → `88` |
| Sayı → `String` | `toString()`, `toStringAsFixed(n)`, interpolation | `87.toString()` → `'87'` |
| `String` → `bool` | Karşılaştırma | `ayar == 'true'` → `true` |

## 10.1 Metin ile sayı arasında dönüşüm

```dart
// Dosya: 10_01_donusumler.dart
void main() {
  // Metinden sayıya
  String adetMetni = '25';
  String fiyatMetni = '49.90';
  int adet = int.parse(adetMetni);
  double fiyat = double.parse(fiyatMetni);
  print(adet + 1);
  print(fiyat * 2);

  // Sayıdan metne
  int puan = 87;
  String puanMetni = puan.toString();
  print(puanMetni + ' puan');
  print(3.14159.toStringAsFixed(2));

  // Metinden bool'a
  String ayar = 'true';
  bool bildirimAcik = ayar == 'true';
  print(bildirimAcik);
}
```

**Çıktı:**

```text
26
99.8
87 puan
3.14
true
```

**Açıklama:**
- `'25'` bir **metindir**; `'25' + 1` yazamazsınız. `int.parse('25')` ile sayıya çevirdikten sonra `25 + 1 = 26` hesaplanabilir.
- `toString()` her değeri metne çevirir. Interpolation (`'$puan puan'`) bunu sizin yerinize otomatik yapar.
- Metni `bool`'a çevirmek için karşılaştırma kullanılır: `ayar == 'true'` ifadesinin sonucu zaten bir `bool`'dur.

## 10.2 ❌ parse ile hatalı girdi

```dart
// Dosya: 10_02_tuzak_parse.dart
// ❌ ÇALIŞMA ZAMANI HATASI
void main() {
  int adet = int.parse('yirmi beş');
  print(adet);
}
```

**Çıktı (bir bölümü):**

```text
Unhandled exception:
FormatException: Invalid radix-10 number (at character 1)
```

**Açıklama:** `int.parse`, sayıya çeviremediği bir metinle karşılaşınca **program çöker**. VS Code bu hatayı önceden göremez; çünkü metnin içeriği ancak program çalışırken belli olur. Bir mobil uygulamada bu, uygulamanın kullanıcının elinde kapanması demektir.

## 10.3 tryParse: Güvenli dönüşüm

```dart
// Dosya: 10_03_tryparse.dart
void main() {
  int? adet1 = int.tryParse('25');
  int? adet2 = int.tryParse('yirmi beş');
  double? fiyat1 = double.tryParse('49.90');
  double? fiyat2 = double.tryParse('49,90');

  print(adet1);
  print(adet2);
  print(fiyat1);
  print(fiyat2);
}
```

**Çıktı:**

```text
25
null
49.9
null
```

**Açıklama:**
- `tryParse` çeviremediğinde programı çökertmez, **`null`** (değer yok) döndürür.
- Bu yüzden sonucun tipi `int` değil **`int?`**'dir. Tipin sonundaki soru işareti, "bu değişken `null` da olabilir" demektir. Bunu hemen sonraki bölümde göreceğiz.
- `'49,90'` çevrilemedi, çünkü Dart ondalık ayırıcı olarak **nokta** bekler. Türk kullanıcılar ise virgül yazar. Bu sorunun çözümünü 2. haftada kullanıcıdan veri alırken göreceğiz.

> **Kural:** Kullanıcıdan veya dış kaynaktan gelen verilerde `parse` yerine **`tryParse`** kullanın.

---

# 11. Null Safety'ye İlk Bakış

## 11.1 Sorun: "Değer yok" durumu

Bir sosyal medya uygulaması düşünün. Kullanıcı henüz profil fotoğrafı yüklememiş. Program fotoğrafın adresini kullanmaya çalışırsa ne olur? Birçok dilde bu durum, mobil uygulamaların en sık **çökme** sebeplerinden biridir.

Dart'ta "değer yok" durumu **`null`** ile ifade edilir ve Dart bu konuda çok katıdır:

> **Dart'ta sıradan bir değişken asla `null` olamaz.** Bir değişkenin `null` olabilmesine izin vermek için tipinin sonuna **`?`** eklenir. Böyle tiplere **nullable** (boş olabilir) tip denir.

Bu kurala **null safety** (null güvenliği) denir.

## 11.2 Nullable değişkenler

```dart
// Dosya: 11_01_nullable.dart
void main() {
  String ad = 'Ayşe';     // Asla null olamaz
  String? takmaAd;        // null olabilir; başlangıç değeri null
  int? dogumYili;         // null olabilir

  print(ad);
  print(takmaAd);
  print(dogumYili);

  takmaAd = 'Ayşo';
  dogumYili = 2004;
  print(takmaAd);
  print(dogumYili);
}
```

**Çıktı:**

```text
Ayşe
null
null
Ayşo
2004
```

**Açıklama:** `String?` tipindeki `takmaAd`'a başlangıçta değer verilmedi; değeri otomatik olarak `null` oldu. Daha sonra normal bir değer atanabilir.

### ❌ Sıradan bir değişkene null atamak

```dart
// Dosya: 11_02_tuzak_null_atama.dart
// ❌ DERLEME HATASI
void main() {
  String ad = null;
  print(ad);
}
```

**Hata mesajı:**

```text
A value of type 'Null' can't be assigned to a variable of type 'String'.
```

*Türkçesi: "'Null' tipindeki bir değer 'String' tipindeki bir değişkene atanamaz."*

### ❌ Nullable bir değişkeni doğrudan kullanmak

```dart
// Dosya: 11_03_tuzak_nullable_erisim.dart
// ❌ DERLEME HATASI
void main() {
  String? profilFoto;
  print(profilFoto.length);
}
```

**Hata mesajı:**

```text
The property 'length' can't be unconditionally accessed because the receiver can be 'null'.
```

*Türkçesi: "'length' özelliğine koşulsuz erişilemez, çünkü değer 'null' olabilir."*

**Açıklama:** Dart, "bu değişken null olabilir; null ise uzunluğu ne olacak?" diye soruyor ve programın **kullanıcının telefonunda çökmesini**, siz daha kodu yazarken engelliyor. Peki nullable değişkenleri nasıl kullanacağız? Bunun için özel operatörler var.

## 11.3 Null operatörleri

| Operatör | Adı | Anlamı | Örnek |
|---|---|---|---|
| `T?` | Nullable tip | Bu değişken null olabilir | `String? foto;` |
| `??` | If-null | Soldaki null ise **sağdakini** kullan | `foto ?? 'avatar.png'` |
| `??=` | Null ise ata | Değişken null ise bu değeri **ata** | `foto ??= 'avatar.png';` |
| `?.` | Null-aware erişim | Null ise dur ve null döndür; değilse eriş | `foto?.length` |
| `!` | Null assertion | "Bunun null olmadığından **eminim**" | `foto!.length` ⚠️ |

```dart
// Dosya: 11_04_null_operatorleri.dart
void main() {
  String? profilFoto;

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

**Açıklama:**
- `profilFoto ?? 'varsayilan_avatar.png'`: Fotoğraf yoksa varsayılan avatarı kullan. Değişkenin kendisi değişmez.
- `profilFoto?.length`: Fotoğraf null olduğu için `.length`'e hiç bakılmadı, sonuç `null` oldu. Program çökmedi.
- `profilFoto ??= '...'`: Değişken null olduğu için bu kez değer **değişkene atandı**.

### tryParse ile birlikte kullanmak

`??` operatörü, 10.3'teki `tryParse` ile mükemmel bir ikili oluşturur:

```dart
// Dosya: 11_05_tryparse_ve_null.dart
void main() {
  String adetMetni = 'iki';

  int adet = int.tryParse(adetMetni) ?? 1;
  print('Sepete eklenecek adet: $adet');

  int? yas = int.tryParse('21');
  print('Gelecek yıl: ${(yas ?? 0) + 1}');
}
```

**Çıktı:**

```text
Sepete eklenecek adet: 1
Gelecek yıl: 22
```

**Açıklama:** `int.tryParse('iki')` null döndürdü, `?? 1` sayesinde varsayılan değer olan `1` kullanıldı. `adet` değişkeninin tipi artık `int?` değil **`int`**'tir, çünkü `??` her durumda bir değer garanti eder. İkinci örnekte `yas ?? 0` ifadesini parantez içine aldık; böylece önce null kontrolü, sonra toplama yapıldı.

## 11.4 ⚠️ Ünlem (!) operatörü tehlikelidir

`!` operatörü Dart'a "bu değerin null olmadığından eminim, kontrol etme" der. Yanılırsanız program **çalışma sırasında çöker**:

```dart
// Dosya: 11_06_tuzak_unlem.dart
// ❌ ÇALIŞMA ZAMANI HATASI
void main() {
  int? adet = int.tryParse('on');
  print(adet! + 1);
}
```

**Çıktı (bir bölümü):**

```text
Unhandled exception:
Null check operator used on a null value
```

*Türkçesi: "Null kontrol operatörü null bir değer üzerinde kullanıldı."*

**Doğrusu:**

```dart
// Dosya: 11_07_unlem_yerine_varsayilan.dart
void main() {
  int? adet = int.tryParse('on');
  print((adet ?? 0) + 1);
}
```

**Çıktı:**

```text
1
```

> **Kural:** `!` kullanmadan önce kendinize sorun: "`??` ile bir varsayılan değer verebilir miyim?" Cevap neredeyse her zaman **evet**tir. 2. haftada `if` ile null kontrolü yapmayı da öğreneceğiz.

> 🔗 **Flutter'da:** İnternetten gelen bir kullanıcının profil fotoğrafı, biyografisi veya telefon numarası olmayabilir. Null safety sayesinde bu eksik alanları ele almayı **unutamazsınız**; Dart sizi derleme aşamasında uyarır.

---

# 12. Hepsini Birleştirelim: Kartvizit ve Fiyat Hesaplama

## 12.1 Dijital kartvizit

```dart
// Dosya: 12_01_kartvizit.dart
void main() {
  const String baslik = 'BMH309 Dijital Kartvizit';

  String ad = '  ayşe  ';
  String soyad = 'YILMAZ';
  String bolum = 'Bilgisayar Mühendisliği';
  int sinif = 3;
  double gano = 3.276;
  bool mezunMu = false;
  String? github;
  int? mezuniyetYili = int.tryParse('2027');

  String temizAd = ad.trim();
  String duzgunAd = temizAd[0].toUpperCase() + temizAd.substring(1);
  String cizgi = '-' * 34;

  print(cizgi);
  print(baslik);
  print(cizgi);
  print('Ad Soyad   : $duzgunAd $soyad');
  print('Bölüm      : $bolum');
  print('Sınıf      : $sinif');
  print('GANO       : ${gano.toStringAsFixed(2)}');
  print('Mezun mu   : $mezunMu');
  print('GitHub     : ${github ?? 'Belirtilmedi'}');
  print('Mezuniyet  : ${mezuniyetYili ?? 'Belirtilmedi'}');
  print('Ad uzunluğu: ${duzgunAd.length} harf');
  print(cizgi);
}
```

**Çıktı:**

```text
----------------------------------
BMH309 Dijital Kartvizit
----------------------------------
Ad Soyad   : Ayşe YILMAZ
Bölüm      : Bilgisayar Mühendisliği
Sınıf      : 3
GANO       : 3.28
Mezun mu   : false
GitHub     : Belirtilmedi
Mezuniyet  : 2027
Ad uzunluğu: 4 harf
----------------------------------
```

**Programda hangi konu nerede?**

| Kod parçası | Konu | Bölüm |
|---|---|---|
| `const String baslik` | Sabit değer | 6.7 |
| `int`, `double`, `bool`, `String` | Temel tipler | 6.5 |
| `String? github;` · `int? mezuniyetYili` | Nullable tipler | 11.2 |
| `int.tryParse('2027')` | Güvenli dönüşüm | 10.3 |
| `ad.trim()` | Boşluk temizleme | 8.7 |
| `temizAd[0].toUpperCase() + temizAd.substring(1)` | İndeks, büyük harf, alt metin, birleştirme | 8.4, 8.6, 8.7 |
| `'-' * 34` | Metin tekrarı | 8.8 |
| `gano.toStringAsFixed(2)` | Sayı biçimlendirme | 7.5 |
| `github ?? 'Belirtilmedi'` | If-null operatörü | 11.3 |
| `'${...}'` | Interpolation | 8.5 |

**Açıklama:** `duzgunAd` satırı, adın ilk harfini büyütür: `temizAd[0]` ilk harfi (`'a'`) alır ve büyük harfe çevirir (`'A'`); `substring(1)` ise 1. indeksten sonuna kadar olan kısmı (`'yşe'`) alır. İkisi birleşince `'Ayşe'` olur.

> **Deneyin:** Kartvizitteki bilgileri kendi bilgilerinizle değiştirin. `github` değişkenine kendi GitHub kullanıcı adınızı verin: `String? github = 'kullaniciadiniz';`

## 12.2 Fiyat hesaplama

```dart
// Dosya: 12_02_fiyat_hesaplama.dart
void main() {
  const double kdvOrani = 0.20;
  const double indirimOrani = 0.10;

  String urunAdi = 'Kablosuz Kulaklık';
  double birimFiyat = 749.90;
  int adet = 2;

  double araToplam = birimFiyat * adet;
  double indirim = araToplam * indirimOrani;
  double indirimliTutar = araToplam - indirim;
  double kdv = indirimliTutar * kdvOrani;
  double genelToplam = indirimliTutar + kdv;

  print('Ürün          : $urunAdi');
  print('Birim fiyat   : ${birimFiyat.toStringAsFixed(2)} TL');
  print('Adet          : $adet');
  print('Ara toplam    : ${araToplam.toStringAsFixed(2)} TL');
  print('İndirim (%${(indirimOrani * 100).round()}) : -${indirim.toStringAsFixed(2)} TL');
  print('KDV (%${(kdvOrani * 100).round()})     : ${kdv.toStringAsFixed(2)} TL');
  print('GENEL TOPLAM  : ${genelToplam.toStringAsFixed(2)} TL');
}
```

**Çıktı:**

```text
Ürün          : Kablosuz Kulaklık
Birim fiyat   : 749.90 TL
Adet          : 2
Ara toplam    : 1499.80 TL
İndirim (%10) : -149.98 TL
KDV (%20)     : 269.96 TL
GENEL TOPLAM  : 1619.78 TL
```

**Açıklama:**
- Hesabın her adımı ayrı bir değişkende tutuldu. Böylece hem kod okunur oldu hem de her ara sonucu yazdırıp kontrol edebildik.
- Oranlar `const` olarak programın en üstünde tanımlandı. KDV oranı değişirse yalnızca bir satırı değiştirmek yeterli.
- `(indirimOrani * 100).round()` ile `0.10` oranı ekranda `%10` olarak gösterildi.

> **Deneyin:** `adet` değerini `3`, `indirimOrani` değerini `0.15` yapın. Sonucu önce hesap makinesiyle tahmin edin, sonra programı çalıştırın.

> 🔗 **Flutter'da:** Bir alışveriş uygulamasının ödeme ekranındaki "Ara toplam / İndirim / KDV / Genel toplam" satırları tam olarak bu hesaplarla üretilir. İleride `print` yerine ekranda `Text` kullanacağız; hesap mantığı aynı kalacak.

---

# 13. Örnek Problem ve Farklı Çözüm Yolları

### **Problem:** İndirimli Ürün Etiketi

Bir alışveriş uygulamasında indirimli ürünler için etiket metni hazırlanacak. Aşağıdaki değişkenler veriliyor:

```dart
// ŞABLON: Bu blok tek başına çalışmaz; çözümlerde kullanılacak verileri gösterir.
String urunAdi = '  kablosuz kulaklık ';
double fiyat = 749.90;
double indirimOrani = 0.20;
```

Programınız:
1. Ürün adının başındaki ve sonundaki boşlukları temizleyip **tamamen büyük harfle** yazdırmalı.
2. Eski fiyatı, indirim yüzdesini, yeni fiyatı ve müşterinin kazancını yazdırmalı.
3. Tüm tutarlar **iki ondalık basamakla** gösterilmeli.

**İpuçları:**
1. Boşlukları silmek için `trim()`, büyük harf için `toUpperCase()` kullanın.
2. İndirim tutarı = `fiyat * indirimOrani`; yeni fiyat = `fiyat - indirim tutarı`.
3. Oranı yüzdeye çevirmek için `(indirimOrani * 100).round()` kullanın.
4. Tutarları `toStringAsFixed(2)` ile biçimlendirin.

**Beklenen ekran çıktısı:**

```text
Ürün       : KABLOSUZ KULAKLIK
Eski fiyat : 749.90 TL
İndirim    : %20
Yeni fiyat : 599.92 TL
Kazancınız : 149.98 TL
```

> **Önce kendiniz deneyin.** Çözümlere bakmadan önce en az 10 dakika kendi çözümünüz üzerinde çalışın.

### Çözüm Şekilleri

**1. Her adım için ayrı değişken kullanarak**

```dart
// Dosya: 13_01_etiket_adim_adim.dart
void main() {
  String urunAdi = '  kablosuz kulaklık ';
  double fiyat = 749.90;
  double indirimOrani = 0.20;

  String temizAd = urunAdi.trim();
  String buyukAd = temizAd.toUpperCase();
  int indirimYuzdesi = (indirimOrani * 100).round();
  double indirimTutari = fiyat * indirimOrani;
  double yeniFiyat = fiyat - indirimTutari;

  print('Ürün       : $buyukAd');
  print('Eski fiyat : ${fiyat.toStringAsFixed(2)} TL');
  print('İndirim    : %$indirimYuzdesi');
  print('Yeni fiyat : ${yeniFiyat.toStringAsFixed(2)} TL');
  print('Kazancınız : ${indirimTutari.toStringAsFixed(2)} TL');
}
```

**Açıklama:** Her ara sonuç anlamlı bir isimle ayrı bir değişkende tutuldu. En uzun ama **en okunur** çözümdür. Bir hesap yanlış çıkarsa hangi adımda hata olduğunu bulmak kolaydır; ara değişkenleri tek tek yazdırarak kontrol edebilirsiniz.

**2. Hesapları interpolation içinde yaparak**

```dart
// Dosya: 13_02_etiket_interpolation.dart
void main() {
  String urunAdi = '  kablosuz kulaklık ';
  double fiyat = 749.90;
  double indirimOrani = 0.20;

  double indirimTutari = fiyat * indirimOrani;

  print('Ürün       : ${urunAdi.trim().toUpperCase()}');
  print('Eski fiyat : ${fiyat.toStringAsFixed(2)} TL');
  print('İndirim    : %${(indirimOrani * 100).round()}');
  print('Yeni fiyat : ${(fiyat - indirimTutari).toStringAsFixed(2)} TL');
  print('Kazancınız : ${indirimTutari.toStringAsFixed(2)} TL');
}
```

**Açıklama:** Yalnızca iki yerde kullanılan `indirimTutari` bir değişkende tutuldu; geri kalan hesaplar doğrudan `${ }` içinde yapıldı. `urunAdi.trim().toUpperCase()` yazımında iki metot **art arda** (zincirleme) çağrıldı: Önce boşluklar silindi, sonra sonuç büyük harfe çevrildi. Daha kısadır, ama `${ }` içindeki ifadeler uzadıkça okunurluk azalır.

**3. Tek bir çok satırlı metin ile**

```dart
// Dosya: 13_03_etiket_cok_satirli.dart
void main() {
  String urunAdi = '  kablosuz kulaklık ';
  double fiyat = 749.90;
  double indirimOrani = 0.20;

  double indirimTutari = fiyat * indirimOrani;

  String etiket = '''
Ürün       : ${urunAdi.trim().toUpperCase()}
Eski fiyat : ${fiyat.toStringAsFixed(2)} TL
İndirim    : %${(indirimOrani * 100).round()}
Yeni fiyat : ${(fiyat - indirimTutari).toStringAsFixed(2)} TL
Kazancınız : ${indirimTutari.toStringAsFixed(2)} TL''';

  print(etiket);
}
```

**Açıklama:** Tüm etiket önce tek bir `String` değişkende hazırlandı, sonra **tek bir** `print` ile yazdırıldı. Çıktının ekranda nasıl görüneceği kodda da aynen görünür. Etiketi yazdırmak yerine ileride bir dosyaya kaydetmek veya ekranda göstermek isterseniz elinizde hazır bir metin olur. Kapanış tırnaklarını (`'''`) son satırın hemen sonuna yazdık; alt satıra yazsaydık çıktının sonuna boş bir satır eklenirdi.

**4. + ile birleştirerek (önerilmez)**

```dart
// Dosya: 13_04_etiket_arti.dart
void main() {
  String urunAdi = '  kablosuz kulaklık ';
  double fiyat = 749.90;
  double indirimOrani = 0.20;

  double indirimTutari = fiyat * indirimOrani;

  print('Ürün       : ' + urunAdi.trim().toUpperCase());
  print('Eski fiyat : ' + fiyat.toStringAsFixed(2) + ' TL');
  print('İndirim    : %' + (indirimOrani * 100).round().toString());
  print('Yeni fiyat : ' + (fiyat - indirimTutari).toStringAsFixed(2) + ' TL');
  print('Kazancınız : ' + indirimTutari.toStringAsFixed(2) + ' TL');
}
```

**Açıklama:** Aynı çıktıyı `+` ile de üretebiliriz; ama yüzde satırında olduğu gibi sayıları `toString()` ile metne çevirmeyi unutmamak gerekir ve tırnak–artı kalabalığı okumayı zorlaştırır. Dart'ın stil rehberi bu durumda **interpolation** kullanılmasını önerir.

**Hangisini seçmeli?** Dördü de aynı çıktıyı üretir. Öğrenirken ve hesap karmaşıkken **1. çözüm**, kısa ve basit çıktılar için **2. çözüm**, bir bütün olarak hazırlanması gereken metinler için **3. çözüm** uygundur.

---

# 14. Özet

| Konu | Sözdizimi | Not |
|---|---|---|
| Program başlangıcı | `void main() { ... }` | Her Dart programı `main`'den başlar |
| Ekrana yazma | `print('...');` | Her ifade `;` ile biter |
| Yorum | `//` · `/* */` · `///` | `Ctrl + /` ile aç/kapat |
| Değişken | `int adet = 3;` | `=` atamadır; değeri değiştirirken tip yazılmaz |
| Tip çıkarımı | `var stok = 42;` | Tip ilk değerden belirlenir ve **değişmez** |
| Sabitler | `final zaman = DateTime.now();` · `const kdv = 0.20;` | `final` çalışırken, `const` derlenirken belli olur |
| Adlandırma | `lowerCamelCase` | Türkçe karakter, boşluk, rakamla başlama, anahtar kelime yok |
| Sayılar | `int` · `double` · `num` | Otomatik dönüşüm yok: `toDouble()`, `toInt()`, `round()` |
| Sayı biçimi | `fiyat.toStringAsFixed(2)` | Para gösteriminde her zaman |
| Metin | `'...'` · `"..."` · `'''...'''` · `r'...'` | Kaçış: `\n`, `\t`, `\'`, `\$`, `\\` |
| Interpolation | `'$ad'` · `'${ad.length}'` | Özellik ve hesap için süslü parantez şart |
| Metin metotları | `length` `trim()` `toUpperCase()` `contains()` `substring()` `replaceAll()` `padLeft()` | Orijinal metni değiştirmez, yenisini döndürür |
| Türkçe harf | `'istanbul'.toUpperCase()` → `ISTANBUL` | Dilden bağımsız çalışır |
| bool | `true` · `false` | Karşılaştırmalar ve metotlar da `bool` üretir |
| Dönüşüm | `int.parse()` · `int.tryParse()` · `toString()` | Dış veride **`tryParse`** |
| Null safety | `String?` · `??` · `??=` · `?.` · `!` | `!` yerine `??` ile varsayılan değer verin |

---

# 15. Bölüm Sonu Soru ve Cevapları

Cevaplara bakmadan önce her soruyu çözmeye çalışın. Emin olamadığınız soruları VS Code'da deneyin. Sorulardaki kod parçaları tam program değildir; denemek için `void main() { ... }` içine yazın.

**1.** Çıktı nedir?
```dart
var x = 10;
x = x + 5;
print(x);
```

**Cevap:** `15`. Önce sağ taraf hesaplanır (`10 + 5`), sonuç `x`'e atanır.

**2.** Aşağıdaki değişken adlarından hangileri geçerlidir?
`2adet` · `adet2` · `_toplam` · `sepet-tutari` · `ürün` · `final` · `kullaniciAdi`

**Cevap:** Geçerli: `adet2`, `_toplam`, `kullaniciAdi`. Geçersiz: `2adet` (rakamla başlıyor), `sepet-tutari` (tire içeriyor), `ürün` (Türkçe karakter), `final` (anahtar kelime).

**3.** Aşağıdaki kod derlenir mi? Neden?
```dart
var stok = 5;
stok = 5.5;
```

**Cevap:** Derlenmez. `stok`'un tipi ilk değerden `int` olarak belirlendi; `double` bir değer atanamaz.

**4.** Uygulamanın açılış zamanını tutan değişken için `final` mı, `const` mı kullanılmalı? Neden?

**Cevap:** `final`. Açılış zamanı (`DateTime.now()`) ancak program **çalışırken** bilinebilir. `const` değerlerin program **derlenirken** bilinmesi gerekir.

**5.** Çıktı nedir? Sonucun tipi nedir?
```dart
print(7 / 2);
```

**Cevap:** `3.5`; tipi `double`. Bölme işlemi iki tam sayıyla yapılsa bile sonuç her zaman `double`'dır.

**6.** Çıktı nedir?
```dart
print(2.7.toInt());
print(2.5.round());
print(2.1.ceil());
print(-7.abs());
```

**Cevap:** `2`, `3`, `3`, `-7`. Son satıra dikkat: `-7.abs()` yazımında önce `7.abs()` hesaplanır (7), sonra başına eksi konur. Mutlak değer için parantez gerekir: `(-7).abs()` → `7`.

**7.** Çıktı nedir?
```dart
String s = 'Flutter';
print(s.length);
print(s[0]);
print(s.substring(1, 4));
```

**Cevap:** `7`, `F`, `lut`. `substring(1, 4)` 1, 2 ve 3. indekslerdeki karakterleri alır; 4. indeks dahil değildir.

**8.** Aşağıdaki kod neden `Ali.length` yazdırır? Nasıl düzeltilir?
```dart
String ad = 'Ali';
print('$ad.length');
```

**Cevap:** `$` işaretinden sonra yalnızca değişken adı (`ad`) alınır; `.length` sıradan metin kabul edilir. Doğrusu: `print('${ad.length}');` → `3`

**9.** Çıktı nedir?
```dart
print('5' + '5');
print(5 + 5);
```

**Cevap:** `55` ve `10`. İlkinde iki **metin** birleştirilir; ikincisinde iki **sayı** toplanır.

**10.** `'istanbul'.toUpperCase()` neden `İSTANBUL` değil `ISTANBUL` döndürür?

**Cevap:** Dart'ın büyük-küçük harf dönüşümü dilden bağımsızdır; küçük `i`'yi her zaman `I`'ya çevirir. Türkçedeki `i – İ` ve `ı – I` eşleşmesini bilmez.

**11.** Çıktı nedir?
```dart
print(0.1 + 0.2 == 0.3);
```

**Cevap:** `false`. `0.1 + 0.2` sonucu `0.30000000000000004`'tür; ondalık sayılar ikilik sistemde tam olarak saklanamaz. Ondalık sayıları `==` ile karşılaştırırken dikkatli olun.

**12.** Aşağıdaki iki satırın sonucu nedir?
```dart
int.parse('3.5');
double.tryParse('3,5');
```

**Cevap:** İlki **çalışma zamanı hatası** verir (`FormatException`), çünkü `'3.5'` bir tam sayı değildir. İkincisi `null` döndürür, çünkü Dart ondalık ayırıcı olarak nokta bekler.

**13.** Çıktı nedir?
```dart
String? not;
print(not ?? 'yok');
print(not?.length);
```

**Cevap:** `yok` ve `null`. `not` null olduğu için `??` sağdaki değeri kullanır; `?.` ise `.length`'e hiç bakmadan `null` döndürür.

**14.** `String ad = null;` satırı neden derlenmez? İki farklı düzeltme yazın.

**Cevap:** `String` tipi null olamaz. Düzeltmeler: Tipi nullable yapmak (`String? ad;`) veya null yerine gerçek bir değer vermek (`String ad = '';`).

---

# 16. Alıştırmalar

> **Sınıf içi mini görevler AI kapalı yapılır.** Evde çalışırken de AI'a kod yazdırmayın; takıldığınız bir hata mesajını açıklatabilirsiniz. Her alıştırmayı önce kendiniz çözün, sonra çözümle karşılaştırın.

### Alıştırma 1 — Profil bilgileri

Kendi bilgilerinizle aşağıdaki değişkenleri uygun tiplerle tanımlayın ve örnekteki gibi yazdırın:
- Ad soyad (değişmeyecek), yaş, boy (metre, ondalıklı), öğrenci mi (`bool`), hobi (henüz belirtilmemiş olabilir)
- Boyu iki ondalık basamakla yazdırın; hobi yoksa `Belirtilmedi` yazsın; adınızın kaç karakter olduğunu da yazdırın.

**Beklenen ekran çıktısı (örnek):**

```text
Ad Soyad : Mert Kaya
Yaş      : 21
Boy      : 1.78 m
Öğrenci  : true
Hobi     : Belirtilmedi
Ad soyad 9 karakterden oluşuyor.
```

**Örnek çözüm:**

```dart
// Dosya: 16_01_profil.dart
void main() {
  const String adSoyad = 'Mert Kaya';
  int yas = 21;
  double boy = 1.78;
  bool ogrenciMi = true;
  String? hobi;

  print('Ad Soyad : $adSoyad');
  print('Yaş      : $yas');
  print('Boy      : ${boy.toStringAsFixed(2)} m');
  print('Öğrenci  : $ogrenciMi');
  print('Hobi     : ${hobi ?? 'Belirtilmedi'}');
  print('Ad soyad ${adSoyad.length} karakterden oluşuyor.');
}
```

`'Mert Kaya'` 9 karakterdir; aradaki boşluk da sayılır.

### Alıştırma 2 — Birim dönüştürme

Bir koşu uygulaması mesafeleri kilometre ve mil cinsinden, sıcaklığı da hem Celsius hem Fahrenheit olarak gösteriyor.
- Mesafe: `42.195` km (maraton). `1 km = 0.621371 mil` (bu oranı `const` olarak tanımlayın).
- Vücut sıcaklığı: `36.6` °C. Formül: `F = C × 9 / 5 + 32`
- Sonuçları iki ondalık basamakla yazdırın.

**Beklenen ekran çıktısı:**

```text
42.20 km = 26.22 mil
36.60 °C = 97.88 °F
```

**Örnek çözüm:**

```dart
// Dosya: 16_02_birim_donusturme.dart
void main() {
  const double kmMilOrani = 0.621371;

  double mesafeKm = 42.195;
  double mesafeMil = mesafeKm * kmMilOrani;

  double sicaklikC = 36.6;
  double sicaklikF = sicaklikC * 9 / 5 + 32;

  print('${mesafeKm.toStringAsFixed(2)} km = ${mesafeMil.toStringAsFixed(2)} mil');
  print('${sicaklikC.toStringAsFixed(2)} °C = ${sicaklikF.toStringAsFixed(2)} °F');
}
```

`42.195` iki basamağa yuvarlanınca `42.20` olur. `sicaklikC * 9 / 5 + 32` ifadesinde önce çarpma ve bölme (soldan sağa), sonra toplama yapılır.

### Alıştırma 3 — Metin işlemleri

`String metin = '  Dart ve Flutter  ';` değişkeniyle aşağıdakileri sırasıyla yazdırın:
1. Boşlukları temizlenmiş hali (köşeli parantez içinde)
2. Temiz halin uzunluğu
3. Tamamen büyük harfli hali
4. `Flutter` kelimesini içeriyor mu?
5. `Flutter` kelimesinin başladığı indeks
6. İlk dört karakter
7. Boşlukların alt çizgiyle değiştirilmiş hali

**Beklenen ekran çıktısı:**

```text
[Dart ve Flutter]
15
DART VE FLUTTER
true
8
Dart
Dart_ve_Flutter
```

**Örnek çözüm:**

```dart
// Dosya: 16_03_metin_islemleri.dart
void main() {
  String metin = '  Dart ve Flutter  ';
  String temiz = metin.trim();

  print('[$temiz]');
  print(temiz.length);
  print(temiz.toUpperCase());
  print(temiz.contains('Flutter'));
  print(temiz.indexOf('Flutter'));
  print(temiz.substring(0, 4));
  print(temiz.replaceAll(' ', '_'));
}
```

Uzunluk ve indeks hesaplarını `metin` üzerinde değil, `temiz` üzerinde yaptık; aksi halde baştaki boşluklar da sayılırdı.

### Alıştırma 4 — Dijital saat

Saat, dakika ve saniyeyi `int` olarak tutan üç değişken tanımlayın: `7`, `5`, `9`. Bunları dijital saat biçiminde yazdırın.

**İpucu:** Önce `toString()` ile metne çevirin, sonra `padLeft(2, '0')` kullanın.

**Beklenen ekran çıktısı:**

```text
07:05:09
```

**Örnek çözüm:**

```dart
// Dosya: 16_04_dijital_saat.dart
void main() {
  int saat = 7;
  int dakika = 5;
  int saniye = 9;

  String ss = saat.toString().padLeft(2, '0');
  String dd = dakika.toString().padLeft(2, '0');
  String sn = saniye.toString().padLeft(2, '0');

  print('$ss:$dd:$sn');
}
```

`padLeft` bir **metin** metodudur; sayıya doğrudan uygulanamaz. Bu yüzden önce `toString()` çağrıldı.

### Alıştırma 5 — Null safety

Bir sosyal medya profilinde:
- `String? biyografi;` (kullanıcı henüz yazmamış)
- Takipçi sayısı sunucudan metin olarak `'1.250'` şeklinde geliyor.

Aşağıdakileri yazdırın:
1. Biyografi yoksa `Henüz biyografi eklenmedi`.
2. Takipçi sayısı `int.tryParse` ile çevrilsin; çevrilemezse `0` kullanılsın.
3. Biyografiye `??=` ile `Merhaba, ben yeni bir kullanıcıyım.` değerini atayıp yazdırın.

**Beklenen ekran çıktısı:**

```text
Biyografi: Henüz biyografi eklenmedi
Takipçi: 0
Biyografi: Merhaba, ben yeni bir kullanıcıyım.
```

**Örnek çözüm:**

```dart
// Dosya: 16_05_null_safety.dart
void main() {
  String? biyografi;
  String takipciMetni = '1.250';

  print('Biyografi: ${biyografi ?? 'Henüz biyografi eklenmedi'}');

  int takipci = int.tryParse(takipciMetni) ?? 0;
  print('Takipçi: $takipci');

  biyografi ??= 'Merhaba, ben yeni bir kullanıcıyım.';
  print('Biyografi: $biyografi');
}
```

`'1.250'` içindeki nokta, Türkçede **binlik ayırıcıdır**; ama `int.tryParse` bunu tanımaz ve `null` döndürür. Gerçek bir uygulamada önce `replaceAll('.', '')` ile noktaları silmek gerekirdi. Deneyin: `int.tryParse(takipciMetni.replaceAll('.', ''))` → `1250`.

### Alıştırma 6 — Kahve siparişi

Bir kahve dükkânının mobil uygulaması için sipariş özetini hesaplayın:
- Fiyatlar (`const`): küçük boy `65.0`, orta boy `80.0`, büyük boy `95.0`, ekstra şurup `12.5` TL
- Sipariş: **orta boy**, **2 adet**, her birine **1 ekstra şurup**
- Öğrenci indirimi: **%10** (`const`)
- En sonda diğer boyların fiyatlarını da bilgi olarak yazdırın.

**Beklenen ekran çıktısı:**

```text
Boy fiyatı     : 80.00 TL
Şurup          : 12.50 TL
Adet           : 2
Ara toplam     : 185.00 TL
Öğrenci ind.   : -18.50 TL
Ödenecek tutar : 166.50 TL
Diğer boylar   : küçük 65.00 TL · büyük 95.00 TL
```

**Örnek çözüm:**

```dart
// Dosya: 16_06_kahve_siparisi.dart
void main() {
  const double kucukFiyat = 65.0;
  const double ortaFiyat = 80.0;
  const double buyukFiyat = 95.0;
  const double surupFiyati = 12.5;
  const double ogrenciIndirimi = 0.10;

  double boyFiyati = ortaFiyat; // Seçilen boy
  int adet = 2;

  double araToplam = (boyFiyati + surupFiyati) * adet;
  double indirim = araToplam * ogrenciIndirimi;
  double odenecek = araToplam - indirim;

  print('Boy fiyatı     : ${boyFiyati.toStringAsFixed(2)} TL');
  print('Şurup          : ${surupFiyati.toStringAsFixed(2)} TL');
  print('Adet           : $adet');
  print('Ara toplam     : ${araToplam.toStringAsFixed(2)} TL');
  print('Öğrenci ind.   : -${indirim.toStringAsFixed(2)} TL');
  print('Ödenecek tutar : ${odenecek.toStringAsFixed(2)} TL');
  print('Diğer boylar   : küçük ${kucukFiyat.toStringAsFixed(2)} TL · '
      'büyük ${buyukFiyat.toStringAsFixed(2)} TL');
}
```

**Not:** Boyu değiştirmek için `boyFiyati = buyukFiyat;` gibi elle değiştirmeniz gerekiyor. Tanımlanıp hiç kullanılmayan bir değişken olsaydı VS Code "kullanılmayan değişken" uyarısı verirdi; son satır bu sabitleri de kullanıyor. Boy seçimine göre fiyatı **otomatik** belirlemeyi gelecek hafta `if` ve `switch` ile öğreneceğiz.

---

# 17. Bu Haftanın Teslimi

Bu haftanın Classroom teslimi **kurulumla ilgilidir** (ayrıntılar: Bölüm 3.18):

1. `flutter doctor -v` çıktısının ekran görüntüsü veya metin dosyası
2. Uygulamanın telefonunuzda veya emulatorde çalıştığını gösteren ekran görüntüsü (hot reload ile değiştirdiğiniz başlık görünür olmalı)
3. `bmh309_ilk_adim` GitHub deposunun bağlantısı
4. Kısa not (2–3 cümle): Kurulumda karşılaştığınız en önemli sorun neydi, nasıl çözdünüz?

**Dart çalışmaları:** Bu nottaki örnekler, bölüm sonu soruları ve alıştırmalar teslim edilmez. Ancak gelecek haftanın tüm konuları bunların üzerine kurulacağı için her örneği kendi bilgisayarınızda **çalıştırmış** ve alıştırmaları **kendiniz çözmüş** olmalısınız.

> **İsteğe bağlı:** `C:\dev\bmh309\hafta1` klasörünüzü de Git deposuna dönüştürüp GitHub'a gönderin (Bölüm 3.16'daki adımlar). Her hafta yeni örnekler ekleyip commit atarsanız dönem sonunda düzenli bir Dart arşiviniz olur ve Git'i de pekiştirmiş olursunuz.

---

# 18. Kaynaklar

| Kaynak | Adres | Konu |
|---|---|---|
| Dart dil turu | [dart.dev/language](https://dart.dev/language) | Dilin resmî anlatımı |
| Değişkenler | [dart.dev/language/variables](https://dart.dev/language/variables) | `var`, `final`, `const`, null safety |
| Yerleşik tipler | [dart.dev/language/built-in-types](https://dart.dev/language/built-in-types) | Sayılar, metinler, `bool` |
| Null safety | [dart.dev/null-safety](https://dart.dev/null-safety) | Null güvenliği ayrıntıları |
| Effective Dart: Stil | [dart.dev/effective-dart/style](https://dart.dev/effective-dart/style) | Adlandırma kuralları |
| Flutter dokümantasyonu | [docs.flutter.dev](https://docs.flutter.dev) | Kurulum ve Flutter rehberleri |

---

### Gelecek Hafta

**Hafta 2 — Kontrol ve Döngü Yapıları:** `if` / `else if` / `else`, üçlü operatör, `switch`, operatörler, `for` / `while` / `do-while`, `break` / `continue` / etiketler ve klavyeden veri alma. Programlarımız ilk kez **karar verecek** ve işleri **tekrar edecek**.

**Derse hazırlık:**
- Kurulumu tamamlayıp Hafta 1 teslimini yapın.
- Bu nottaki tüm örnekleri çalıştırın ve alıştırmaları çözün.
- Gelecek hafta klavyeden veri alacağız. VS Code ayarlarında (`Ctrl + ,`) `dart.cliConsole` ayarını bulup değerini **`terminal`** yapın; böylece Run düğmesiyle çalıştırdığınız programlar klavyeden veri alabilir.

---

*BMH309 Mobil Cihaz Programlama · Hafta 1 Ders Notu*
