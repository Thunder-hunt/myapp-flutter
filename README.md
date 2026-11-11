<div align="center">

# 📱 MyApp Flutter (OOP & Widget Showcase)

Sebuah aplikasi pembelajaran komprehensif berbasis **Flutter & Dart** yang mendemonstrasikan implementasi berbagai widget fundamental, tata letak layout kompleks, integrasi hardware kamera, hingga mini-games interaktif.

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android-green?style=for-the-badge&logo=android&logoColor=white)](https://www.android.com/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)

</div>

---

## 📌 Daftar Isi

- [Tentang Proyek](#-tentang-proyek)
- [Fitur Utama](#-fitur-utama)
- [Struktur Proyek](#-struktur-proyek)
- [Teknologi & Dependensi](#-teknologi--dependensi)
- [Panduan Memulai](#-panduan-memulai)
  - [Prasyarat](#prasyarat)
  - [Instalasi](#instalasi)
  - [Menjalankan Aplikasi](#menjalankan-aplikasi)
- [Build APK Release](#-build-apk-release)
- [Kontributor](#-kontributor)

---

## 📖 Tentang Proyek

Proyek ini dibangun sebagai sarana eksplorasi mendalam konsep UI/UX, penataan layout, serta logika pemrograman pada Flutter. Mencakup contoh implementasi mulai dari komponen widget dasar hingga studi kasus UI e-commerce nyata pada menu Evaluasi/Tugas.

---

## ✨ Fitur Utama

### 🧱 1. Basic & Utility Widgets
- **Text & Container**: Eksplorasi tipografi, styling, box decoration, border, dan gradient.
- **Center, Padding & SizedBox**: Manajemen tata letak dan whitespace presisi.
- **Image Widget**: Dukungan gambar jaringan (*network URL*) dan gambar lokal (*offline assets*).
- **Icon Widget**: Pemanfaatan Material & Cupertino icons.
- **Calculator**: Kalkulator interaktif berbasis state management sederhana.
- **Lorem Ipsum**: Contoh handling teks panjang dan scroll behavior.

### 📐 2. Layout Exploration
- **Row & Column**: 30+ variasi perataan (`mainAxisAlignment`, `crossAxisAlignment`, `Expanded`, `Spacer`).
- **Stack & Positioned**: Contoh badge notifikasi, status online avatar, card diskon, banner promo gradien, dan overlay gambar.
- **Flexible, Align & Wrap**: Penataan layout responsif yang menyesuaikan ukuran layar.
- **ListView & GridView**: Menampilkan data koleksi secara dinamis dan efisien.

### 🎮 3. Interactive & Mini Games
- **Camera Integration**: Pengambilan foto langsung menggunakan sensor kamera perangkat dan penyimpanan ke galeri via plugin `gal`.
- **Dino Jump Game**: Game arkade sederhana berbasis kalkulasi gravitasi dan jump physics.
- **Game Catur (Chess)**: Board game interaktif dengan validasi langkah bidak catur.

### 🛒 4. Evaluasi / Tugas Praktikum
- **Halaman Produk E-Commerce (Tugas 1)**: Halaman detail produk (Minyakita) lengkap dengan card carousel, pemilihan varian, hitung subtotal otomatis, serta navigasi checkout.

---

## 📂 Struktur Proyek

```plaintext
oopdart/
├── android/                   # Konfigurasi native Android & manifest
├── assets/
│   └── images/                # Asset gambar lokal & launcher icon
├── lib/
│   ├── main.dart              # Entry point aplikasi
│   └── widgets/
│       ├── menu.dart          # Navigasi utama katalog widget
│       ├── text_widget.dart
│       ├── container_widget.dart
│       ├── row_widget.dart
│       ├── column_widget.dart
│       ├── stack_widget.dart
│       ├── camera_widget.dart
│       ├── dino_game_widget.dart
│       ├── chess_widget.dart
│       ├── tugas1_widget.dart
│       └── ...
├── pubspec.yaml               # Manajemen package & dependensi
└── README.md
```

---

## 🛠 Teknologi & Dependensi

| Package | Kegunaan |
|---|---|
| [`flutter`](https://flutter.dev) | Framework UI multi-platform |
| [`camera`](https://pub.dev/packages/camera) | Akses modul kamera native Android/iOS |
| [`gal`](https://pub.dev/packages/gal) | Manajemen penyimpanan media galeri |
| [`url_launcher`](https://pub.dev/packages/url_launcher) | Membuka tautan eksternal browser/aplikasi |
| [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons) | Otomatisasi generate app launcher icon |

---

## 🚀 Panduan Memulai

### Prasyarat

Pastikan perangkat Anda telah terpasang:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.12+ direkomendasikan)
- [Android Studio](https://developer.android.com/studio) / VS Code beserta ekstensi Flutter & Dart
- Android SDK Platform Tools (API level 21+)
- Git

### Instalasi

1. Clone repositori:
   ```bash
   git clone https://github.com/Thunder-hunt/myapp-flutter.git
   ```

2. Masuk ke direktori proyek:
   ```bash
   cd myapp-flutter
   ```

3. Unduh seluruh dependensi proyek:
   ```bash
   flutter pub get
   ```

### Menjalankan Aplikasi

Jalankan pada perangkat fisik atau emulator yang sedang terhubung:

```bash
flutter run
```

---

## 📦 Build APK Release

Untuk menghasilkan berkas instalasi APK yang teroptimasi:

```bash
flutter build apk --release
```

Berkas output biner akan berada pada direktori:
```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 📄 Lisensi

Didistribusikan di bawah lisensi MIT. Lihat berkas `LICENSE` untuk informasi lebih lanjut.
