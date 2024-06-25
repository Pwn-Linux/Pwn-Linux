#!/bin/bash

set -ouex pipefail

rpm-ostree override remove \
    ark \
    ark-libs \
    ptyxis \
    discover-overlay \
    filelight \
    firewall-config \
    plasma-discover \
    plasma-discover-libs \
    plasma-discover-notifier \
    plasma-discover-flatpak \
    input-remapper \
    kdebugsettings \
    kcharselect \
    kfind\
    krfb \
    krfb-libs \
    kmousetool \
    kwrite \
    lutris \
    steam \
    fcitx5-mozc \
    fcitx5 \
    fcitx5-chinese-addons \
    fcitx5-chinese-addons-data \
    fcitx5-data \
    fcitx5-lua \
    fcitx5-qt \
    fcitx5-qt5 \
    rom-properties-kf6 \
    protontricks \
    steamdeck-kde-presets-desktop \
    sddm-wayland-plasma \
    sddm-wayland-generic \
    qsynth && \
ostree container commit
