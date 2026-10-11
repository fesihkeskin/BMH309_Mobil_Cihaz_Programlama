# BMH309 – Mobil Cihaz Programlama

Siirt Üniversitesi Bilgisayar Mühendisliği lisans programı **BMH309 Mobil Cihaz Programlama** dersinin ders notları ve slaytlarının yer aldığı depo.

| | |
| --- | --- |
| **Ders** | BMH309 – Mobil Cihaz Programlama (*Mobile Device Programming*) |
| **Yarıyıl / AKTS** | 5. yarıyıl / 6 AKTS |
| **Tür** | Zorunlu, yüz yüze, Türkçe |
| **Ön koşul** | Algoritmalar ve Programlama I–II |
| **Dersi veren** | Dr. Öğr. Üyesi Fesih KESKİN – fesih.keskin@siirt.edu.tr |
| **Teknolojiler** | Flutter, Dart, Firebase, Riverpod, go_router, Figma, Git/GitHub |

## Dersin Amacı

Öğrencilere Flutter ve Dart ile platformlar arası mobil uygulama geliştirme yetkinliği kazandırmak; arayüz tasarımı, durum yönetimi, yönlendirme, ağ ve bulut servisleri, cihaz özellikleri, test ve yayın süreçlerini uygulamalı öğretmek. Ayrıca yapay zekâ destekli geliştirme araçlarının eleştirel ve etik kullanımını ve Git/GitHub ile takım çalışmasını deneyimletmektir.

Dönem boyunca 3–4 kişilik takımlar, gerçek bir kullanıcı problemine yönelik, Figma'da tasarlanmış, Firebase destekli ve yapay zekâ özelliği içeren bir mobil uygulama geliştirir.

## Depo Yapısı

```text
.
├── Ders notları/   # Haftalık ders notları ve ders bilgi paketi (Markdown)
├── Slaytlar/       # Haftalık sunumlar (PDF)
├── LICENSE
└── README.md
```

## İçerik

### Ders notları

| Hafta | Konu | Not |
| --- | --- | --- |
| – | Ders bilgi paketi | [BMH309_Ders_Bilgi_Paketi.md](<Ders notları/BMH309_Ders_Bilgi_Paketi.md>) |
| 0 | Ders tanıtımı | [BMH309_Hafta00_Ders_Tanitimi.md](<Ders notları/BMH309_Hafta00_Ders_Tanitimi.md>) |
| 1 | Giriş, kurulum, değişkenler | [BMH309_Hafta01_Giris_Kurulum_Degiskenler.md](<Ders notları/BMH309_Hafta01_Giris_Kurulum_Degiskenler.md>) |
| 2 | Kontrol yapıları ve döngüler | [BMH309_Hafta02_Kontrol_ve_Donguler.md](<Ders notları/BMH309_Hafta02_Kontrol_ve_Donguler.md>) |
| 3 | Fonksiyonlar ve koleksiyonlar | [BMH309_Hafta03_Fonksiyonlar_ve_Koleksiyonlar.md](<Ders notları/BMH309_Hafta03_Fonksiyonlar_ve_Koleksiyonlar.md>) |

### Slaytlar

| Hafta | Sunum |
| --- | --- |
| 2 | [Kontrol ve Döngüler](Slaytlar/hafta2/BMH309_Hafta02_Kontrol_ve_Donguler_Sunum.pdf) |
| 3 | [Fonksiyonlar ve Koleksiyonlar](Slaytlar/hafta3/BMH309_Hafta03_Fonksiyonlar_ve_Koleksiyonlar_Sunum.pdf) |
| 4 | [Sınıflar ve Nesneler](Slaytlar/hafta4/BMH309_Hafta04_Siniflar_ve_Nesneler_Sunum.pdf) |

Yeni haftalar işlendikçe notlar ve slaytlar eklenecektir.

## Haftalık Ders Akışı

| Hafta | Konular |
| --- | --- |
| 1 | Mobil platformlar, Flutter mimarisi, JIT/AOT ve hot reload; geliştirme ortamı; Git/GitHub'a giriş; yapay zekâ kullanım politikası |
| 2 | Dart: tür sistemi, null safety, koleksiyonlar, fonksiyonlar, sınıflar, records ve pattern matching, asenkron programlamaya giriş; Git ile takım çalışması; takımların kurulması |
| 3 | Widget ağacı, StatelessWidget, BuildContext; yerleşim sistemi (Row, Column, Stack, Expanded); DevTools; proje fikri ve BM Sürdürülebilir Kalkınma Amaçları |
| 4 | StatefulWidget ve yaşam döngüsü; setState; form doğrulama; ListView/GridView; kullanıcı hikâyeleri ve GitHub Projects |
| 5 | Navigator; mobil UX ilkeleri; Material 3, karanlık mod, erişilebilirlik; Figma ve Google Stitch ile prototipleme |
| 6 | Tasarımdan koda dönüşüm; yapay zekâ kodlama ajanlarıyla iş akışı; çıktıların doğrulanması |
| 7 | go_router, parametreli rotalar, alt navigasyon; katmanlı mimari ve özellik tabanlı klasör yapısı |
| 8 | Future/Stream; REST API ve JSON; http paketi; model sınıfları; yükleniyor/hata/boş durumları |
| 9 | **Ara sınav** |
| 10 | Riverpod; repository deseni; yerel veri saklama; çevrimdışı öncelikli tasarım; MVP sunumları |
| 11 | Firebase Authentication, Cloud Firestore, güvenlik kuralları, Storage; KVKK |
| 12 | Cihaz özellikleri ve izinler; yapay zekâ entegrasyonu (Firebase AI Logic, ML Kit); API anahtarı güvenliği |
| 13 | Statik analiz, birim/widget testleri, GitHub Actions ile CI; performans; imzalama ve yayın |
| 14–15 | Proje sunumları (Demo Day), akran değerlendirmesi ve retrospektif |
| 16 | **Yarıyıl sonu sınavı:** final proje teslimi ve bireysel sözlü savunma |

Ayrıntılı haftalık plan, öğrenme çıktıları ve program çıktıları ilişkisi için [ders bilgi paketine](<Ders notları/BMH309_Ders_Bilgi_Paketi.md>) bakınız.

## Değerlendirme

| Bileşen | Katkı (%) |
| --- | --- |
| Ara sınav (yazılı, yapay zekâ araçları kapalı) | 20 |
| Mini görevler (10 adet) | 10 |
| Dönem projesi ara teslimleri (5 adet) | 10 |
| Yarıyıl sonu sınavı (final proje, sunum, bireysel sözlü savunma) | 60 |

Proje ara teslimleri: Figma prototipi (5. hafta), gezilebilir statik uygulama (7. hafta), MVP sunumu (10. hafta), Firebase/cihaz/yapay zekâ özellikli sürüm (12. hafta), test ve CI içeren son sürüm (13. hafta).

## Yapay Zekâ Kullanım Politikası

- 1–5. haftalarda yapay zekâ araçları yalnızca açıklayıcı olarak kullanılır; 6. haftadan itibaren eşli programcı olarak kullanılabilir.
- Ara sınav ve bireysel sözlü savunma yapay zekâ araçları kullanılmadan yapılır.
- Projedeki yapay zekâ kullanımı `AI_LOG.md` dosyasında belgelenir; kullanımın gizlenmesi akademik etik ihlalidir.

## Kaynaklar

- [Flutter documentation](https://docs.flutter.dev)
- [Dart documentation](https://dart.dev)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter)
- [Riverpod](https://riverpod.dev)
- [go_router](https://pub.dev/packages/go_router)
- [Material Design 3](https://m3.material.io)
- Chacon, S., & Straub, B. (2014). [Pro Git](https://git-scm.com/book/tr/v2) (2. bs.). Apress.

## Lisans

Bu depo [MIT Lisansı](LICENSE) ile paylaşılmaktadır.
