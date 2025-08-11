Panduan install dan setup Nexus CLI di Termux dengan Ubuntu proot-distro

---

## Step 1: Install Termux

Install aplikasi Termux dari Google Play Store:  
https://play.google.com/store/apps/details?id=com.termux

---

## Step 2: Set Up Termux

Update package dan install dependensi dasar:

```bash
pkg update && pkg upgrade -y
pkg install proot-distro curl wget
```

Install dan login ke Ubuntu distro:
```bash
pkg install proot-distro
```
```bash
proot-distro install ubuntu
proot-distro login ubuntu
```

---

## Step 3: Install Dependencies di Ubuntu

Update dan upgrade paket Ubuntu, lalu install tools yang dibutuhkan:

```bash
apt update && apt upgrade -y
apt install -y build-essential pkg-config libssl-dev libcrypto++-dev gcc libc6-dev zlib1g-dev curl wget
```

---

## Step 4: Install Rust dan Cargo

Install Rust environment dengan script resmi:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

---

## Step 5: Install Nexus CLI

Install Nexus CLI via curl:

```bash
curl https://cli.nexus.xyz/ | sh
```

---

## Step 6: Verifikasi Instalasi

Cek versi Nexus CLI untuk memastikan instalasi berhasil:

```bash
nexus --version
```

```bash
source /root/.profile
```
atau 
```bash
source /root/.bashrc
```

Mulai node Nexus dengan perintah berikut (ganti `<Your-id>` dengan node ID kamu):
```bash
nexus-network start --node-id <Your-id>
```
Aku lihat masalahnya unik—`nexus-network --version` bisa jalan, tapi kalau kamu ketik `‎nexus-network start --node-id 25802459` malah `command not found`.
Itu biasanya terjadi karena ada **karakter tak terlihat** (invisible character / Zero Width No-Break Space) di depan perintah.

Ciri-cirinya:

* `--version` jalan kalau ketik manual.
* `start` gagal karena kamu kemungkinan copy-paste dari chat/web yang nyelip karakter khusus.

---

### 🔹 Cara memperbaiki

1. **Ketik ulang manual** perintahnya (jangan copy-paste):

   ```bash
   nexus-network start --node-id <your-id>
   ```

2. **Cek lokasi binary** untuk memastikan PATH benar:

   ```bash
   which nexus-network
   ```

   Kalau hasilnya `/root/.nexus/bin/nexus-network` atau `/usr/local/bin/nexus-network`, berarti sudah benar.

3. **Kalau mau, bikin alias biar gampang**:

   ```bash
   echo "alias nnstart='nexus-network start --node-id <Your-id>'" >> ~/.bashrc
   source ~/.bashrc
   ```

   Lalu jalankan cukup:

   ```bash
   nnstart
   ```

---

Masalah ini sering kejadian kalau copy-paste dari web atau chat yang mengandung karakter **U+200E / U+FEFF**.
Kalau kamu ketik ulang manual, harusnya langsung jalan.


---
# Ubuntu Proot-Distro di Termux

Ubuntu proot-distro adalah alat yang memungkinkan kamu menjalankan distribusi Linux Ubuntu (dan distribusi Linux lainnya) di dalam lingkungan terisolasi dan terkontainerisasi pada perangkat Android menggunakan Termux. Alat ini menggunakan **Proot**, sebuah sistem yang meniru lingkungan root tanpa memerlukan akses root sesungguhnya.

## Apa itu Proot?

Proot memungkinkan menjalankan lingkungan yang menyerupai root tanpa perlu izin root asli. Ini sangat berguna di Termux, yang berjalan tanpa akses root.

## Apa itu Termux?

Termux adalah aplikasi emulator terminal dan lingkungan Linux untuk Android yang memungkinkan kamu menjalankan berbagai perintah dan aplikasi Linux di perangkat Android.

## Apa itu Distribusi Linux?

Distribusi Linux (distro) adalah versi Linux seperti Ubuntu, Debian, Kali Linux, dan lain-lain.

## Apa itu Ubuntu Proot-Distro?

Ubuntu proot-distro menggunakan Proot untuk mengelola dan menjalankan Ubuntu (dan distro lainnya) di dalam Termux. Dengan ini, kamu bisa menjalankan lingkungan Ubuntu lengkap di Android tanpa perlu root perangkat.

## Manfaat

- **Lingkungan Linux Lengkap:** Akses aplikasi dan alat Ubuntu tanpa root.  
- **Keamanan:** Berjalan dalam isolasi, meningkatkan keamanan sistem.  
- **Fleksibilitas:** Mudah berpindah antar distro Linux yang didukung.

---

Silakan gunakan dan sesuaikan alat ini untuk mendapatkan kekuatan Linux di perangkat Android kamu!
