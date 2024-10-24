# Cara Pemakaian

## Prasyarat:
1. **Docker** harus sudah terinstal.
2. Bebaskan beberapa port berikut karena Docker container tidak akan berjalan jika port tersebut sudah dipakai:

   **KONG PORT:**
   - 8000
   - 8443
   - 8001
   - 8444
   - 8002
   - 8445
   - 8003
   - 8004

   **KONG-DB:**
   - 5433

   **MONGO-DB:**
   - 27018

   **APP-BE:**
   - 3001

   **APP-FE:**
   - 3000
3. Terhubung ke internet. Karena image akan pull dari repo docker saya(https://hub.docker.com/u/ffiuca).

## Cara Penggunaan:
1. Clone repository ini:
    ```bash
    git clone https://github.com/FFiuca/test_ptlnk_docker.git
    ```
2. Arahkan terminal anda ke direktori repository yang telah di-clone.
3. Jalankan perintah berikut untuk memulai aplikasi:
    ```bash
    docker compose up
    ```
4. Buka browser anda dan akses `http://localhost:8000` untuk mengakses aplikasi Front-End (FE).

## Daftar Repo
### Docker Image :
1. BackEnd aplikasi : https://hub.docker.com/r/ffiuca/test_ptlnk_be
2. FrontEnd  aplikasi : https://hub.docker.com/r/ffiuca/test_ptlnk_fe
3. Init konfigurasi Kong : https://hub.docker.com/r/ffiuca/test_ptlnk_kong_init
### Github Project :
1. Backend Aplikasi : https://github.com/FFiuca/test_ptlnk_be
2. FrontEnd Aplikasi : https://github.com/FFiuca/test_ptlnk_fe
3. Raw image init konfigurasi kong : https://github.com/FFiuca/test_ptlnk_docker


# Overview

## Tech Stack:
1. **Express.js**
2. **ReactJS**
3. **MongoDB**
4. **Kong API Gateway** + **PostgreSQL**

## Mapping Routing Gateway:
1. **Path `/`** -> Arahkan ke: `http://localhost:3000` (APP-FE)
2. **Path `/lnk/be`** -> Arahkan ke: `http://localhost:3001` (APP-BE)

> *Catatan*: Path file konfigurasi Kong bisa dilihat di folder `kong`.

## Penggunaan Container:
1. **lnk-kong-database**: Untuk Kong database.
2. **lnk-kong-api-gateway-init**: Untuk setup awal Kong sesuai dokumentasi.
3. **lnk-kong-api-gateway**: Container Kong Gateway itu sendiri.
4. **lnk-mongo-database**: Untuk database aplikasi.
5. **lnk-app-be**: Backend aplikasi dan migration database Mongo.
6. **lnk-app-fe**: Frontend aplikasi.
7. **lnk-kong-init**: Untuk setup awal konfigurasi Kong (service dan routing).
   > *Seharusnya masih bisa menggunakan fitur JWT dan Consumer untuk autentikasi di Kong, dan service hanya menerima `user_id` dari Kong. Tetapi, karena keterbatasan waktu, autentikasi saat ini dilimpahkan ke backend aplikasi.*
8. **lnk-curl**: Container yang dibuat khusus untuk keperluan debugging.
