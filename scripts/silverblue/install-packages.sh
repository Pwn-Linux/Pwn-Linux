#!/bin/bash

set -ouex pipefail

rpm-ostree install \
    rust \
    gamemode \
    pamixer \
    playerctl \
    flatpak-builder \
    samba \
    cargo && \
ostree container commit

cd /tmp && \
git clone https://github.com/vinceliuice/Tela-circle-icon-theme && \
cd Tela-circle-icon-theme && \
./install.sh && \
ostree container commit
