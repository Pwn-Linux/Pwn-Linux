#!/bin/bash

set -ouex pipefail

rm /usr/share/applications/com.gerbilsoft.rom-properties.rp-config.desktop && \
    rm /usr/share/applications/org.gnome.Prompt.desktop && \
    ostree container commit