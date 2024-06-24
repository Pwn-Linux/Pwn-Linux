#!/bin/bash

set -ouex pipefail

rpm-ostree override remove \
    ark \
    ark-libs \
    ptyxis \
    discover-overlay \
    filelight \
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
    fcitx5-data \
    fcitx5-qt \
    fcitx5-qt5 \
    rom-properties-kf6 \
    protontricks \
    steamdeck-kde-presets-desktop \
    qsynth && \
ostree container commit
