#!/bin/bash

set -ouex pipefail

rpm-ostree override remove \
    ptyxis \
    discover-overlay \
    input-remapper \
    lutris \
    steam \
    protontricks && \
ostree container commit
