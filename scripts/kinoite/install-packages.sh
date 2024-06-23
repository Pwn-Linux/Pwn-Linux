#!/bin/bash

set -ouex pipefail

rpm-ostree install \
    make \
    automake \
    gcc \
    gcc-c++ \
    cmake \
    glib \
    glib-devel \
    gtk2 \
    gtk2-devel \
    gtk3 \
    gtk3-devel \
    vala \
    meson \
    libvala \
    libvala-devel \
    dbusmenu-qt \
    rust \
    krdp \
    gamemode \
    pamixer \
    playerctl \
    flatpak-builder \
    samba \
    cargo && \
rpm-ostree install \
    steamdeck-kde-presets-desktop  && \
ostree container commit

#Install Tela Circle Icons
cd /tmp && \
git clone https://github.com/vinceliuice/Tela-circle-icon-theme && \
cd Tela-circle-icon-theme && \
./install.sh && \
ostree container commit

#Install Window Title applet for macOS like layouts
cd /usr/share/plasma/plasmoids && \
git clone https://github.com/dhruv8sh/plasma6-window-title-applet org.kde.windowtitle
ostree container commit

#Install appmenu-gtk-module
cd /tmp && \
git clone https://gitlab.com/vala-panel-project/vala-panel-appmenu
cd vala-panel-appmenu
meson build vala-panel-appmenu/subprojects/appmenu-gtk-module --prefix=/usr
ninja -C build
ninja install -C build
ostree container commit