#!/usr/bin/env bash

echo ""
echo "  INSTALLING MACOS PACKAGES"
echo "............................."


if ! command -v brew &>/dev/null; then
  echo "ensuring xcode cmd line tools installed..."
  xcode-select -install

  echo "downloading and running brew setup script..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "brew tapping casks..."
brew tap homebrew/cask
brew tap homebrew/cask-fonts

echo "brew installing formulae..."
brew install \
  bash \
  bat \
  git \
  jq \
  lsd \
  neovim \
  node \
  pinentry-mac \
  "python@3.9" \
  tag \
  tmux \
  tree \
  zsh

brew install --cask font-hack-nerd-font
brew install --cask gpg-suite
brew install --cask rectangle
