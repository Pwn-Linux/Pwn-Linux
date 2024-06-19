#!/bin/bash

set -ouex pipefail

curl -Lo /etc/yum.repos.d/tohur-Pwn-fedora-40.repo https://copr.fedorainfracloud.org/coprs/tohur/Pwn/repo/fedora-40/tohur-Pwn-fedora-40.repo && \
sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/tohur-Pwn-fedora-40.repo && \
curl -Lo /etc/yum.repos.d/mullvad.repo https://repository.mullvad.net/rpm/stable/mullvad.repo && \
sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/mullvad.repo && \
mkdir -p /var/lib/alternatives && \
ostree container commit
