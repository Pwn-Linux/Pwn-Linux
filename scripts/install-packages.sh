#!/bin/bash

set -ouex pipefail

rpm-ostree install \
    konsole \
    rust \
    pamixer \
    playerctl \
    samba \
    cargo && \
rpm-ostree install \
    steamdeck-kde-presets-desktop  && \
    ostree container commit

#Install Tela Circle Icon theme
cd /tmp && \
    git clone https://github.com/vinceliuice/Tela-circle-icon-theme && \
    cd Tela-circle-icon-theme && \
    ./install.sh && \
    ostree container commit