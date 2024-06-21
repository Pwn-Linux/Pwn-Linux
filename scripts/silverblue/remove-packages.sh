#!/bin/bash

set -ouex pipefail

rpm-ostree override remove \
    ptyxis \
    discover-overlay \
    input-remapper \
    lutris \
    steam \
    fcitx5-mozc \
    fcitx5 \
    fcitx5-data \
    fcitx5-gtk \
    protontricks && \
ostree container commit
