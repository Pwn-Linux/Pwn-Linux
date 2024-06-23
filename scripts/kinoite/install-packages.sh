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
    glib2 \
    glib2-devel \
    glibc \
    glibc-devel \
    gtk2 \
    gtk2-devel \
    gtk3 \
    gtk3-devel \
    vala \
    meson \
    libvala \
    libvala-devel \
    libdbusmenu-gtk2
    rust \
    krdp \
    gamemode \
    gnome-software \
    pamixer \
    playerctl \
    flatpak-builder \
    samba \
    cargo && \
rpm-ostree install \
    steamdeck-kde-presets-desktop  && \
ostree container commit

#Install libdbusmenu and libdbusmenu-gtk3 from rpm due to broken packaging in the repos
cd /tmp && \
mkdir libdbusmenu && \
mkdir libdbusmenu-gtk3 && \
wget https://kojipkgs.fedoraproject.org//packages/libdbusmenu/16.04.0/27.fc40/x86_64/libdbusmenu-16.04.0-27.fc40.x86_64.rpm && \
wget https://kojipkgs.fedoraproject.org//packages/libdbusmenu/16.04.0/27.fc40/x86_64/libdbusmenu-gtk3-16.04.0-27.fc40.x86_64.rpm && \
rpm2cpio libdbusmenu-16.04.0-27.fc40.x86_64.rpm | (cd libdbusmenu && cpio -idmv) && \
rpm2cpio libdbusmenu-gtk3-16.04.0-27.fc40.x86_64.rpm | (cd libdbusmenu-gtk3 && cpio -idmv) && \
cp /tmp/libdbusmenu/usr/ /usr/ && \
cp /tmp/libdbusmenu-gtk3/usr/ /usr/ && \
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

#Install Plasma Control Hub applet for macOS like control hub
cd /tmp && \
git clone https://github.com/boraerciyas/kde_controlcentre && \
mv /tmp/kde_controlcentre/package /usr/share/plasma/plasmoids/com.github.boraerciyas.controlcentre && \
ostree container commit

#Install Toggle Overview Widget
cd /usr/share/plasma/plasmoids && \
git clone https://github.com/HimDek/Overview-Widget-for-Plasma com.himdek.kde.plasma.overview && \
ostree container commit

#Install Uswitch Widget
cd /tmp && \
git clone https://gitlab.com/divinae/uswitch && \
mv /tmp/uswitch/package /usr/share/plasma/plasmoids/com.dv.uswitcher && \
ostree container commit