#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

rpm-ostree override remove pipewire-pulseaudio --install pulseaudio && \
ostree container commit && \
rpm-ostree override remove \
ptyxis \
discover-overlay \
input-remapper \
kde-connect-libs \
kdeconnectd \
kde-connect \
kcharselect \
krfb \
krfb-libs \
kmousetool \
rom-properties-kf6 \
protontricks \
qsynth && \
ostree container committ