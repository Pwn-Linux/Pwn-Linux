#!/bin/bash

set -ouex pipefail

#Install needed packages from the fedora repos
rpm-ostree install \
    binutils \
    binutils-devel \
    binutils-gold \
    make \
    automake \
    gcc \
    gcc-c++ \
    cmake \
    vala \
    meson \
    dbusmenu-qt \
    rust \
    krdp \
    gamemode \
    gnome-software \
    pamixer \
    playerctl \
    flatpak-builder \
    qt6-qt5compat \
    samba \
    cargo && \
ostree container commit

#Install steamdeck-kde-presets-desktop from Pwn Linux Repo
rpm-ostree install \
    steamdeck-kde-presets-desktop && \
ostree container commit

#Install libdbusmenu and libdbusmenu-gtk{2,3} from Pwn Linux Repo
# rpm-ostree install \
#     libdbusmenu \
#     libdbusmenu-devel \
#     libdbusmenu-gtk2 \
#     libdbusmenu-gtk2-devel \
#     libdbusmenu-gtk3 \
#     libdbusmenu-gtk3-devel && \
# ostree container commit

#Install appmenu-gtk-module from Pwn Linux Repo
rpm-ostree install \
    appmenu-gtk3-module \
    appmenu-gtk2-module && \
ostree container commit

#Install plasma applets from Pwn Linux Repo
# rpm-ostree install \
#     applet-window-buttons  && \
# ostree container commit

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

#Install Tela Circle Icons
cd /tmp && \
git clone https://github.com/vinceliuice/Tela-circle-icon-theme && \
cd Tela-circle-icon-theme && \
./install.sh && \
ostree container commit

#Install WhiteSur-cursors from Pwn Linux Repo
rpm-ostree install \
   WhiteSur-cursor-theme  && \
ostree container commit

#Install Pwn-Linux-KDE from Pwn Linux Repo
rpm-ostree install \
   Pwn-Linux-kde  && \
ostree container commit

#Install Pwn Linux gtk themes from Pwn Linux Repo
rpm-ostree install \
   Pwn-Linux-gtk-theme && \
ostree container commit

#Install Pwn Linux sddm theme from Pwn Linux Repo
rpm-ostree install \
   sddm-pwn-linux && \
ostree container commit