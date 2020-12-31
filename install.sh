#!/usr/bin/env bash


function info {
  echo -e "\033[2m$1\033[0m"
}


function warn {
  echo -e "\033[33m$1\033[0m"
}


home=$HOME
packs=false

while [ ! $# -eq 0 ]; do
  case "$1" in
    --docker)
      home=/root
      packs=true
      ;;
    --install-packages)
      packs=true
      ;;
  esac
  shift
done


echo -e "\033[1;36m"
echo -e "----------------------"
echo -e "  DOTFILES INSTALLER"
echo -e "----------------------\033[0m"
echo -e "* home dir = $home"
echo -e "* install packages = $packs"
echo -e ""


function handle_path {
  src="$home/Dotfiles/$1"

  dirpath=$(dirname $1 | sed "s/base\///" | sed "s/debian\///" | sed "s/macos\///")
  fname=$(basename $1)

  if [[ $dirpath =~ ^home(\/|$) ]]; then
    chopped=$(echo -e $dirpath | sed "s/home//")
    dirpath="$home$chopped"
  fi

  if [[ ! -d $dirpath ]]; then
    warn "$dirpath doesn't exist"
    info "creating it"
    mkdir -p $dirpath
  fi

  symlink_path="$dirpath/$fname"

  if [[ -L $symlink_path ]]; then
    warn "$symlink_path is already a symlink to $(realpath $symlink_path)"
    info "renaming it to $symlink_path.old"
    mv $symlink_path $symlink_path.old

  elif [[ -f $symlink_path ]]; then
    warn "$symlink_path is already a file"
    info "renaming it to $symlink_path.old"
    mv $symlink_path $symlink_path.old

  elif [[ -d $symlink_path ]]; then
    warn "$symlink_path is already a directory"
    info "skipping operation"
    return 1

  fi

  echo -e "\033[1;32mcreating symlink at $symlink_path to $src\033[0m"
  ln -s $src $symlink_path

  echo ""
}


handle_path "base/home/.alacritty.yml"
handle_path "base/home/.bash_profile"
handle_path "base/home/.bashrc"
handle_path "base/home/.config/nvim/init.vim"
handle_path "base/home/.gitmux.conf"
handle_path "base/home/.inputrc"
handle_path "base/home/.local/share/nvim/site/"
handle_path "base/home/.ssh/config"
handle_path "base/home/.tmux.conf"
handle_path "base/home/.zshrc"

if [[ $OSTYPE =~ darwin* ]]; then
  handle_path "macos/home/.gitconfig"

  [[ $packs = true ]] && ./macos/install-packages.sh

elif [[ $OSTYPE =~ linux-gnu* ]]; then
  handle_path "debian/home/.gitconfig"

  [[ $packs = true ]] && ./debian/install-packages.sh
fi
