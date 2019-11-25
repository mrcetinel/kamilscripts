#!/bin/bash
set -xeuo pipefail

yes | pacman -Sy --needed base base-devel git sudo

useradd builder
passwd -d builder
chown -R builder:builder .
chmod +w /etc/sudoers
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -w /etc/sudoers

pushd pkg/archlinux >/dev/null

sudo -u builder makepkg -f --syncdeps --noconfirm

ls -l *.pkg.tar.xz

popd

if (($# > 0)); then
	mkdir -v -p "$1"
	mv -v pkg/archlinux/*.pkg.tar.xz "$1"/
fi

