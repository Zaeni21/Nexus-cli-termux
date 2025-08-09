#!/bin/bash

echo "=== Nexus CLI Full Auto Setup for Termux + Ubuntu proot-distro ==="

# Step 1: Install Termux dependencies
echo "[1/8] Updating Termux packages..."
pkg update && pkg upgrade -y

echo "[2/8] Installing proot-distro, curl, and wget..."
pkg install -y proot-distro curl wget

# Step 2: Install Ubuntu
echo "[3/8] Installing Ubuntu in Termux..."
proot-distro install ubuntu

# Step 3: Login into Ubuntu and run setup
echo "[4/8] Logging into Ubuntu..."
proot-distro login ubuntu <<'EOF'
echo "=== Inside Ubuntu Environment ==="

# Update Ubuntu packages
echo "[5/8] Updating Ubuntu packages..."
apt update && apt upgrade -y

# Install build dependencies
echo "[6/8] Installing build dependencies..."
apt install -y build-essential pkg-config libssl-dev libcrypto++-dev gcc libc6-dev zlib1g-dev curl wget nano

# Install Rust and Cargo
echo "[7/8] Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Install Nexus CLI
echo "[8/8] Installing Nexus CLI..."
curl https://cli.nexus.xyz/ | sh

# Reload shell
source ~/.profile 2>/dev/null || source ~/.bashrc 2>/dev/null || true

# ===== Save Config =====
CONFIG_FILE="$HOME/.nexus_config"

if [ ! -f "$CONFIG_FILE" ]; then
    read -p "Enter your Nexus wallet address: " wallet
    read -p "Enter your Nexus node ID: " node_id
    echo "WALLET=$wallet" > "$CONFIG_FILE"
    echo "NODE_ID=$node_id" >> "$CONFIG_FILE"
else
    echo "Config file already exists: $CONFIG_FILE"
    echo "If you want to change it, type: nano ~/.nexus_config"
fi

# Register wallet
source "$CONFIG_FILE"
nexus-cli register-user --wallet-address "$WALLET"

# Create alias startnode with auto-restart
if ! grep -q "alias startnode=" ~/.bashrc; then
    echo "alias startnode='source ~/.nexus_config && while true; do nexus-network start --node-id \$NODE_ID; echo \"Node stopped. Restarting in 5 seconds...\"; sleep 5; done'" >> ~/.bashrc
    source ~/.bashrc
fi

# Start the node with auto-restart
startnode
EOF
