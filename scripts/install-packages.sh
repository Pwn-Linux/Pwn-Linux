#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

rpm-ostree install \
konsole \
rust \
pamixer \
playerctl \
cargo && \
ostree container commit