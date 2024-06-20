#!/bin/bash

set -ouex pipefail

rpm-ostree override remove piewire-pulseaudio --install pulseaudio && \
ostree container commit