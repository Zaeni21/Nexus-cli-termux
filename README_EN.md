---

Guide to Installing and Setting Up Nexus CLI in Termux with Ubuntu proot-distro

---

## Step 1: Install Termux

Install the Termux app from Google Play Store:
[https://play.google.com/store/apps/details?id=com.termux](https://play.google.com/store/apps/details?id=com.termux)

---

## Step 2: Set Up Termux

Update packages and install basic dependencies:

```bash
pkg update && pkg upgrade -y
pkg install proot-distro curl wget
```

Install and log in to the Ubuntu distro:

```bash
pkg install proot-distro
```
```bash
proot-distro install ubuntu
proot-distro login ubuntu
```

---

## Step 3: Install Dependencies in Ubuntu

Update and upgrade Ubuntu packages, then install the required tools:

```bash
apt update && apt upgrade -y
apt install -y build-essential pkg-config libssl-dev libcrypto++-dev gcc libc6-dev zlib1g-dev curl wget
```

---

## Step 4: Install Rust and Cargo

Install the Rust environment using the official script:

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

## Step 6: Verify Installation

Check the Nexus CLI version to make sure the installation was successful:

```bash
nexus --version
```

```bash
source /root/.profile
```

or

```bash
source /root/.bashrc
```

Replace `<Your-wallet>` with your Nexus wallet:

```bash
nexus-cli register-user --wallet-address <Your-wallet>
```

Start the Nexus node with the following command (replace `<Your-id>` with your node ID):

```bash
nexus-network start --node-id <Your-id>
```

---

I noticed the problem is unique — `nexus-network --version` works, but when you type
`‎nexus-network start --node-id 25802459` you get `command not found`.
This usually happens because of **invisible characters** (Zero Width No-Break Space) in front of the command.

**Signs:**

* `--version` works when typed manually.
* `start` fails because you likely copied it from chat/web containing hidden characters.

---

### 🔹 How to Fix It

1. **Type the command manually** (don’t copy-paste):

   ```bash
   nexus-network start --node-id <your-id>
   ```

2. **Check the binary location** to ensure PATH is correct:

   ```bash
   which nexus-network
   ```

   If the output is `/root/.nexus/bin/nexus-network` or `/usr/local/bin/nexus-network`, it’s correct.

3. **(Optional) Create an alias for convenience**:

   ```bash
   echo "alias nnstart='nexus-network start --node-id <Your-id>'" >> ~/.bashrc
   source ~/.bashrc
   ```

   Then simply run:

   ```bash
   nnstart
   ```

---

This issue often happens when copying commands from websites or chat messages that contain characters like **U+200E / U+FEFF**.
Typing the command manually should fix it instantly.

---
# Ubuntu Proot-Distro on Termux

Ubuntu proot-distro is a tool that allows you to run the Ubuntu Linux distribution (and other Linux distros) inside an isolated, containerized environment on Android using Termux. It uses **Proot**, a system that emulates a root environment without requiring actual root access.

## What is Proot?

Proot enables running a root-like environment without needing real root permissions. This is useful on Termux, which runs without root access.

## What is Termux?

Termux is a terminal emulator and Linux environment app for Android. It lets you run Linux commands and applications on your Android device.

## What is a Linux Distro?

A Linux distribution (distro) is a version of Linux such as Ubuntu, Debian, or Kali Linux.

## What is Ubuntu Proot-Distro?

Ubuntu proot-distro uses Proot to manage and run Ubuntu (and other distros) within Termux. This lets you run a full Ubuntu environment on Android without rooting your device.

## Benefits

- **Full Linux Environment:** Access Ubuntu apps and tools without root.  
- **Security:** Runs isolated, increasing system safety.  
- **Flexibility:** Easily switch between supported Linux distros.

---

Feel free to use and customize this tool to get the power of Linux on your Android device!

