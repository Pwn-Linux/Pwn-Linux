#!/bin/bash

set -ouex pipefail

mkdir -p /var/lib/alternatives && \
    rpm-ostree override remove \
    ptyxis \
    discover-overlay \
    input-remapper \
    kcharselect \
    krfb \
    krfb-libs \
    kmousetool \
    rom-properties-kf6 \
    protontricks \
    steamdeck-kde-presets-desktop \
    qsynth && \
    ostree container commit