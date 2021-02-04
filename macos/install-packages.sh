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

echo "brew installing formulae..."
brew bundle install

echo "installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

