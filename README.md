# Latihan Mandiri Tutorial 4 & 6

**Nama:** Muhammad Naufal Ramadhan  
**NPM:** 2306241700

---

<details>
<summary><b>Tutorial 4 (Basic 2D Level Design)</b></summary>

## Deskripsi Level 2
Pada latihan mandiri ini, saya membuat sebuah level baru. Level ini menggunakan tema visual yang berbeda (Berada di luar angkasa setelah naik roket di level 1).

## Proses Pengerjaan dan Implementasi Level 2

### 1. Pembuatan TileMap Baru
* Saya membuat *scene* baru dengan *root node* `Node2D` bernama `Level2`.
* Saya menambahkan node `TileMapLayer` dan membuat `TileSet` baru menggunakan *spritesheet* yang berbeda dari Level 1 (Sekarang di planet baru).
* Saya mengatur **Physics Layer** pada tab `TileSet`, sehingga objek `Player` dapat berpijak di atasnya tanpa tembus.

### 2. Implementasi Spawner
* Berbeda dengan Level 1 yang menggunakan objek ikan, saya membuat *scene* rintangan baru (Beban jatuh) menggunakan *root node* `RigidBody2D`.
* Agar rintangan dapat mendeteksi tabrakan dengan tanah dan pemain, saya mengaktifkan properti **Contact Monitor** menjadi `On` dan **Max Contacts Reported** menjadi `1` pada *Inspector* `RigidBody2D`.
* Melalui *signal* `body_entered`, saya mengatur logika di dalam skrip: jika yang ditabrak adalah `Player`, maka akan memicu pemindahan *scene* ke `LoseScreen`. Jika yang ditabrak adalah tanah (objek lain), maka akan memanggil `queue_free()` untuk menghancurkan objek yang jatuh tersebut.

### 3. Jurang
* Saya meletakkan *node* `Area2D` di bagian bawah map sebagai area jurang. Jika pemain jatuh ke area ini, sistem akan memicu transisi ke `LoseScreen`.

### 4. Moving Platform
* Mengimplementasikan pijakan bergerak menggunakan *node* `AnimatableBody2D`. 
* Saya membuat skrip agar bergerak seperti ping-pong pada fungsi `_physics_process(delta)` menggunakan variabel `@export var speed` dan `distance`. Platform akan bergerak bolak-balik dalam radius jarak yang ditentukan.
</details>

---

## Tutorial 6 - Menu and In-Game Graphical User Interface

Pada tutorial ini, saya mengimplementasikan antarmuka grafis (GUI) untuk meningkatkan *User Experience* (UX) di dalam permainan.

### 1. Pembuatan Layar Utama (Main Menu)
* **Layouting:** Menggunakan `MarginContainer`, `HBoxContainer`, dan `VBoxContainer` untuk menyusun tata letak tombol dan judul agar responsif dan rapi.
* **Interaktivitas:** Tombol diimplementasikan menggunakan `LinkButton`. Saya melakukan kustomisasi *font* menggunakan `ThemeOverrides` (font: CC Wild Words Roman).
* **Fungsi:** Tombol dihubungkan menggunakan *signal* `pressed()` untuk berpindah ke scene level 1 atau scene Stage Select.

### 2. Implementasi Life Counter & Global Autoload
* **Global Script:** Menggunakan `Global.gd` (Autoload) untuk menyimpan variabel `lives` dan `current_level_path`. Variabel ini tetap tersimpan meskipun *scene* berganti.
* **CanvasLayer:** Memasang GUI *Life Counter* di dalam `CanvasLayer` agar tampilan nyawa selalu berada di atas (overlay) dan tidak ikut bergerak mengikuti kamera pemain.
* **Logika Nyawa:** Setiap kali pemain jatuh ke jurang atau terkena rintangan, nyawa berkurang 1.

### 3. Layar Game Over dan Transisi
* Jika `Global.lives` mencapai 0, game akan memanggil *scene* `LoseScreen.tscn`.

---

## Latihan Mandiri Tutorial 6

Saya mengimplementasikan 2 (dua) fitur tambahan berikut:

### Fitur Tambahan 1: Layar Game Over Interaktif (Retry & Back to Main Menu)
* Memberikan kontrol kepada pemain melalui tombol UI di `LoseScreen.tscn`.
* **Tombol Retry:** Mereset nyawa menjadi 3 dan mengembalikan pemain ke level terakhir yang dimainkan menggunakan variabel `Global.current_level_path`.
* **Tombol Main Menu:** Memungkinkan pemain untuk menyerah dan kembali ke layar judul.

### Fitur Tambahan 2: Fitur Stage Select
* Membuat *scene* navigasi baru `SelectStage.tscn`.
* Pemain dapat memilih untuk langsung memainkan **Level 1** atau **Level 2** melalui tombol yang tersedia.
* Fitur ini diakses melalui tombol **Stage Select** yang ada di Main Menu.

## Referensi
1. Modul Tutorial 4 Game Development - *Basic 2D Level Design*.
2. Modul Tutorial 6 Game Development - *Menu and In-Game Graphical User Interface*.