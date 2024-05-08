#!/bin/bash

set -ouex pipefail

mkdir -p /var/lib/alternatives && \
curl -Lo /etc/yum.repos.d/tohur-Pwn-fedora-40.repo https://copr.fedorainfracloud.org/coprs/tohur/Pwn/repo/fedora-40/tohur-Pwn-fedora-40.repo && \
sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/tohur-Pwn-fedora-40.repo && \
ostree container commit