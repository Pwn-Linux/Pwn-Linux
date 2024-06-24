#!/bin/bash

set -ouex pipefail

rpm-ostree install \
    binutils \
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
    libdbusmenu-gtk2 \
    libdbusmenu-gtk2-devel \
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
mkdir libdbusmenu-devel && \
mkdir libdbusmenu-gtk3 && \
mkdir libdbusmenu-gtk3-devel && \
wget https://kojipkgs.fedoraproject.org//packages/libdbusmenu/16.04.0/27.fc40/x86_64/libdbusmenu-16.04.0-27.fc40.x86_64.rpm && \
wget https://kojipkgs.fedoraproject.org//packages/libdbusmenu/16.04.0/27.fc40/x86_64/libdbusmenu-devel-16.04.0-27.fc40.x86_64.rpm && \
wget https://kojipkgs.fedoraproject.org//packages/libdbusmenu/16.04.0/27.fc40/x86_64/libdbusmenu-gtk3-16.04.0-27.fc40.x86_64.rpm && \
wget https://kojipkgs.fedoraproject.org//packages/libdbusmenu/16.04.0/27.fc40/x86_64/libdbusmenu-gtk3-devel-16.04.0-27.fc40.x86_64.rpm && \
rpm2cpio libdbusmenu-16.04.0-27.fc40.x86_64.rpm | (cd libdbusmenu && cpio -idmv) && \
rpm2cpio libdbusmenu-devel-16.04.0-27.fc40.x86_64.rpm | (cd libdbusmenu-devel && cpio -idmv) && \
rpm2cpio libdbusmenu-gtk3-16.04.0-27.fc40.x86_64.rpm | (cd libdbusmenu-gtk3 && cpio -idmv) && \
rpm2cpio libdbusmenu-gtk3-devel-16.04.0-27.fc40.x86_64.rpm | (cd libdbusmenu-gtk3-devel && cpio -idmv) && \
cp -r /tmp/libdbusmenu/usr/ /usr/ && \
cp -r /tmp/libdbusmenu-devel/usr/ /usr/ && \
cp -r /tmp/libdbusmenu-gtk3/usr/ /usr/ && \
cp -r /tmp/libdbusmenu-gtk3-devel/usr/ /usr/ && \
ostree container commit

#Install appmenu-gtk-module
cd /tmp && \
git clone https://gitlab.com/vala-panel-project/vala-panel-appmenu && \
cd vala-panel-appmenu && \
meson build subprojects/appmenu-gtk-module --prefix=/usr && \
ninja -C build && \
ninja install -C build && \
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