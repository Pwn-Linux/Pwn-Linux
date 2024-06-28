#!/bin/bash

set -ouex pipefail

curl -Lo /etc/yum.repos.d/Pwn-Linux.repo https://download.opensuse.org/repositories/home:/tohur:/Pwn-Linux/Fedora_40/home:tohur:Pwn-Linux.repo && \
sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/Pwn-Linux.repo && \
curl -Lo /etc/yum.repos.d/mullvad.repo https://repository.mullvad.net/rpm/stable/mullvad.repo && \
sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/mullvad.repo && \
mkdir -p /var/lib/alternatives && \
ostree container commit
