#!/usr/bin/env bash

echo "tell the system that we're running headless"
export DEBIAN_FRONTEND=noninteractive

echo "update apt cache..."
apt-get update

echo "install packages from apt repo..."
apt-get install -y --no-install-recommends \
  apt-transport-https \
  ca-certificates \
  curl \
  git \
  gnupg \
  jq \
  neovim \
  nodejs \
  python3 \
  tmux \
  tree \
  wget \
  zsh

echo "install yarn..."
wget -q 'https://dl.yarnpkg.com/debian/pubkey.gpg'
apt-key add pubkey.gpg
apt-get install -y yarn

echo "install bat (cat replacement)..."
wget -q 'https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb'
dpkg -i bat_0.17.1_amd64.deb

echo "install lsd (ls replacement)..."
wget -q 'https://github.com/Peltoche/lsd/releases/download/0.19.0/lsd_0.19.0_amd64.deb'
dpkg -i lsd_0.19.0_amd64.deb
