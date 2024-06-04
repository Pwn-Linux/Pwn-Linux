#!/bin/sh

rsync -avu "/usr/share/themes/" "$HOME/.themes"

flatpak remote-delete --user flathub
