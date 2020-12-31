# Vince's Dotfiles

This is a universal source for my Dotfiles for both macOS and Debian based systems. There
is a shared `base` set of configs and then Debian and macOS specific configs.

## Usage

The `install.sh` script will determine what OS you're running and symlink the base configs
and then symlink the OS specific configs.

Typical usage is:

```bash
$ ./install.sh
```

If you want to ensure the base set of packages are installed on your system:

```bash
$ ./install.sh --install-packages
```

If you're running this in a Docker container:

```bash
$ ./install.sh --docker
```
