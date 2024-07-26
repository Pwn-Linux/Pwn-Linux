#!/bin/bash

set -ouex pipefail

rpm-ostree override remove \
    ark \
    ark-libs \
    ptyxis \
    discover-overlay \
    filelight \
    firewall-config \
    kdebugsettings \
    kcharselect \
    kfind \
    kjournald \
    kjournald-libs \
    krfb \
    krfb-libs \
    kwrite \
    lutris \
    steam \
    fcitx5-mozc \
    fcitx5 \
    fcitx5-chinese-addons \
    fcitx5-chinese-addons-data \
    fcitx5-data \
    fcitx5-hangul \
    fcitx5-lua \
    fcitx5-qt \
    fcitx5-qt5 \
    input-remapper \
    rom-properties-kf6 \
    protontricks \
    webapp-manager \
    steamdeck-kde-presets-desktop && \
ostree container commit
