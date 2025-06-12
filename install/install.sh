#!/bin/bash

NEOVIM_VERSION=0.11.0
# Addresses breaking changes
NEOVIM_FILENAME=nvim-linux64.tar.gz
NEOVIM_DIR=nvim-linux64

echo "[*] Installing dependencies..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        echo "Detected Linux: $ID"
        if [[ $ID == "ubuntu" ]]; then
          sudo apt update
          sudo apt install \
              wget \
              curl \
              git \
              python3 \
              python3-pip \
              python3-venv \
              -y
        elif [[ $ID == "arch" ]]; then
          sudo pacman -Syu --noconfirm
          sudo pacman -S --noconfirm \
              wget \
              curl \
              git \
              python \
              python-pip \
              python-virtualenv
        fi

    else
        echo "Linux detected, but /etc/os-release not found"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running on macOS"
else
    echo "Unknown OS: $OSTYPE"
fi

echo "[*] Installing neovim $NEOVIM_VERSION..."


# Check if version is v0.10.4 or above
if [[ "$(printf '%s\n' 0.10.4 "$NEOVIM_VERSION" | sort -V | head -n1)" = "0.10.4" ]]; then
  NEOVIM_FILENAME=nvim-linux-x86_64.tar.gz
  NEOVIM_DIR=nvim-linux-x86_64
fi

# Install neovim
wget "https://github.com/neovim/neovim/releases/download/v$NEOVIM_VERSION/$NEOVIM_FILENAME" -O /tmp/$NEOVIM_FILENAME
mkdir -p ~/.local/bin
tar xf /tmp/$NEOVIM_FILENAME -C ~/.local
ln -sf $(readlink -f ~/.local/$NEOVIM_DIR/bin/nvim) ~/.local/bin/nvim

# Add ~/.local/bin to PATH if it's not already in it
if ! [[ ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
    echo "[*] Adding ~/.local/bin to PATH"
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        SHELL_CONFIG_FILE=~/.zshrc
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        SHELL_CONFIG_FILE=~/.profile
    else
        echo "[-] Could not detect what shell you are using. Ensure to manually add ~/.local/bin to your PATH"
    fi
    echo -e '\nPATH="$HOME/.local/bin:$PATH"' >> $SHELL_CONFIG_FILE
    export PATH="$HOME/.local/bin:$PATH"
fi

# Cleanup any old nvim-linux64 or nvim-linux-x86_64 directory
echo "[*] Cleaning any previous neovim installs"
if [[ $NEOVIM_DIR == "nvim-linux64" ]]; then
  rm -rf ~/.local/nvim-linux-x86_64
elif [[ $NEOVIM_DIR == "nvim-linux-x86_64" ]]; then
  rm -rf ~/.local/nvim-linux64
fi

echo -e "[+] Done! Installation complete"
