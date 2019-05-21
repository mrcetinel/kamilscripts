#!/bin/bash
set -xeuo pipefail
pacman -Sy --needed --noconfirm base-devel git sudo
chown -R nobody:nobody .
chmod +w /etc/sudoers
printf "nobody ALL=(ALL) NOPASSWD:"" ALL" >> /etc/sudoers
chmod -w /etc/sudoers

cd pkg/archlinux
sudo -u nobody makepkg -f --syncdeps --noconfirm

ls -l *.pkg.tar.xz

if (($# > 0)); then
	mkdir -v -p "$1"
	mv -v *.pkg.tar.xz "$1"/
fi
