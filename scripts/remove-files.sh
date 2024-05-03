#!/bin/bash

set -ouex pipefail

rm /usr/share/applications/com.gerbilsoft.rom-properties.rp-config.desktop && \
ostree container committ