Running Nexus Termux

````markdown
# Nexus-cli-termux
````
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
proot-distro install ubuntu
proot-distro login ubuntu
```

---

## Step 3: Install Dependencies di Ubuntu

Update dan upgrade paket Ubuntu, lalu install tools yang dibutuhkan:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential pkg-config libssl-dev libcrypto++-dev gcc libc6-dev zlib1g-dev curl wget
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

Mulai node Nexus dengan perintah berikut (ganti `<Your-id>` dengan node ID kamu):

```bash
nexus-network start --node-id <Your-id>
```

---
