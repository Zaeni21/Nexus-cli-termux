# Nexus-cli-termux
zkgm

‎# Step 1: Install Termux 

‎https://play.google.com/store/apps/details?id=com.termux

‎# Step 2: Set Up Termux 
‎
‎pkg update && pkg upgrade -y
‎pkg install proot-distro curl wget
‎proot-distro install ubuntu
‎proot-distro login ubuntu
‎
‎# Step 3: Launch Ubuntu and Install Dependencies
‎
‎sudo apt update && sudo apt upgrade -y
‎sudo apt install -y build-essential pkg-config libssl-dev libcrypto++-dev gcc libc6-dev zlib1g-dev curl wget
‎
# ‎Step 4: Install Rust and Cargo
‎
‎curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
‎source $HOME/.cargo/env
‎
# ‎Step 5: Install Nexus CLI
‎
‎curl https://cli.nexus.xyz/ | sh
‎
# ‎Step 6: Verify Installation
‎
‎nexus --version

‎nexus-network start --node-id <Your-id>
