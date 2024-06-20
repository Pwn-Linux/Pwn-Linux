#!/bin/bash

set -ouex pipefail

rpm-ostree override remove pipewire-pulseaudio --install pulseaudio && \
ostree container commit