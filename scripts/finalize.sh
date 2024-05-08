#!/bin/bash

set -ouex pipefail

KERNEL_FLAVOR=fsync /usr/libexec/containerbuild/build-initramfs && \
    /usr/libexec/containerbuild/image-info && \
    ostree container commit

# Finalize the build
sed -i 's/Fedora Linux/Pwn Linux/g' /usr/lib/os-release && \
    sed -i 's/Bazzite/KDE Plasma/g' /usr/lib/os-release && \
    ostree container commit

sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/tohur-Pwn-fedora-40.repo && \
ostree container commit