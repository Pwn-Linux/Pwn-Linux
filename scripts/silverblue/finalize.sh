#!/bin/bash

set -ouex pipefail

# Disable Repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/tohur-Pwn-fedora-40.repo && \
ostree container commit

# Remove uneeded files
rm /usr/share/applications/org.gnome.Prompt.desktop && \
rm /usr/share/applications/bazzite-documentation.desktop && \
rm /usr/share/applications/bazzite-landing.desktop && \
ostree container commit

# Update the initramfs
KERNEL_FLAVOR=fsync /usr/libexec/containerbuild/build-initramfs && \
/usr/libexec/containerbuild/image-info && \
ostree container commit

# Set os-release info
sed -i 's/Fedora Linux/Pwn Linux/g' /usr/lib/os-release && \
sed -i 's/Bazzite GNOME/GNOME/g' /usr/lib/os-release && \
ostree container commit

# Fix Passwaord
sed -i 's:/var/home:/home:' /etc/passwd && \
ostree container commit

#create steam flatpak wrapper
touch /usr/bin/steam && \
echo '#!/bin/bash' >> /usr/bin/steam && \
echo 'flatpak run com.valvesoftware.Steam $@' >> /usr/bin/steam && \
chmod +x /usr/bin/steam && \
ostree container commit

#configure Pwn-Linux initial setups
chmod +x /usr/libexec/pwn-linux-initial-setup && \
chmod +x /usr/libexec/pwn-linux-user-setup && \
systemctl enable pwn-linux-initial-setup.service && \
systemctl --global enable pwn-linux-user-setup.service && \
ostree container commit

#remove build scripts
rm -vr /scripts
