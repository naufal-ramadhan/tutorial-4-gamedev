# Latihan Mandiri Tutorial 4 - Basic 2D Level Design

**Nama:** Muhammad Naufal Ramadhan

**NPM:** 2306241700

## Deskripsi Level 2
Pada latihan mandiri ini, saya membuat sebuah level baru. Level ini menggunakan tema visual yang berbeda (Berada di luar angkasa setelah naik roket di level 1).

## Proses Pengerjaan dan Implementasi

Berikut adalah langkah-langkah dan fitur yang saya implementasikan pada Level 2:

### 1. Pembuatan TileMap Baru
* Saya membuat *scene* baru dengan *root node* `Node2D` bernama `Level2`.
* Saya menambahkan node `TileMapLayer` dan membuat `TileSet` baru menggunakan *spritesheet* yang berbeda dari Level 1 (Sekarang di planet baru).
* Saya mengatur **Physics Layer** pada tab `TileSet`, sehingga objek `Player` dapat berpijak di atasnya tanpa tembus.

### 2. Implementasi Spawner
* Berbeda dengan Level 1 yang menggunakan objek ikan, saya membuat *scene* rintangan baru (Beban jatuh) menggunakan *root node* `RigidBody2D`.
* Agar rintangan dapat mendeteksi tabrakan dengan tanah dan pemain, saya mengaktifkan properti **Contact Monitor** menjadi `On` dan **Max Contacts Reported** menjadi `1` pada *Inspector* `RigidBody2D`.
* Melalui *signal* `body_entered`, saya mengatur logika di dalam skrip: jika yang ditabrak adalah `Player`, maka akan memicu pemindahan *scene* ke `LoseScreen`. Jika yang ditabrak adalah tanah (objek lain), maka akan memanggil `queue_free()` untuk menghancurkan objek yang jatuh tersebut agar memori tidak penuh dan map tidak diisi dengan object tersebut.
* Saya memasang *node* `Spawner` (dari tipe `Node2D`) di atas langit level dan memuat *scene* rintangan baru agar rintangan berjatuhan secara acak di sumbu X setiap detik.

### 3. Jurang
* Saya meletakkan *node* `Area2D` di bagian bawah map sebagai area jurang. Jika pemain jatuh ke area ini, sistem akan memicu transisi ke `LoseScreen`.

### 4. Moving Platform
* Untuk menambah variasi tantangan, saya mengimplementasikan pijakan bergerak menggunakan *node* `AnimatableBody2D`. Penggunaan *node* ini bertujuan agar karakter pemain bergerak bersama *platform* tanpa tergelincir.
* Di dalamnya, terdapat *child node* `Sprite2D` untuk visualisasi dan `CollisionShape2D`.
* Saya membuat skrip agar bergerak seperti ping-pong pada fungsi `_physics_process(delta)` menggunakan variabel `@export var speed` dan `distance`. *Platform* akan mencatat titik koordinat X awalnya, lalu bergerak bolak-balik dalam radius jarak yang ditentukan dengan arah (`direction`) yang berbalik ketika menyentuh batas.

## Referensi
1. Modul Tutorial 4 Game Development - *Basic 2D Level Design*.