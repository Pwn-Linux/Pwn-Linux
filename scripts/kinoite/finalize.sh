#!/bin/bash

set -ouex pipefail

# Disable Repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/tohur-Pwn-fedora-40.repo && \
ostree container commit

# Remove uneeded files
rm /usr/share/applications/com.gerbilsoft.rom-properties.rp-config.desktop && \
rm /usr/share/applications/org.gnome.Prompt.desktop && \
rm /usr/share/applications/bazzite-documentation.desktop && \
rm /usr/share/applications/bazzite-landing.desktop && \
ostree container commit

# Update the initramfs
KERNEL_FLAVOR=fsync /usr/libexec/containerbuild/build-initramfs && \
/usr/libexec/containerbuild/image-info && \
ostree container commit

# Finalize rest of the build
sed -i 's/Fedora Linux/Pwn Linux/g' /usr/lib/os-release && \
sed -i 's/Bazzite/KDE Plasma/g' /usr/lib/os-release && \
sed -i 's:/var/home:/home:' /etc/passwd && \
sed -i '/<entry name="launchers" type="StringList">/,/<\/entry>/ s/<default>[^<]*<\/default>/<default>preferred:\/\/browser,applications:org.kde.discover.desktop,preferred:\/\/filemanager<\/default>/' /usr/share/plasma/plasmoids/org.kde.plasma.taskmanager/contents/config/main.xml && \
touch /usr/bin/steam && \
echo '#!/bin/bash' >> /usr/bin/steam && \
echo 'flatpak run com.valvesoftware.Steam $@' >> /usr/bin/steam && \
chmod +x /usr/bin/steam && \
chmod +x /usr/libexec/pwn-linux-initial-setup && \
chmod +x /usr/libexec/pwn-linux-user-setup && \
systemctl enable pwn-linux-initial-setup.service && \
systemctl --global enable pwn-linux-user-setup.service && \
mv /usr/share/sddm /usr/share/pwn-linux/sddm && \
ln -s /var/sddm /usr/share/sddm && \
rm /usr/share/applications/org.kde.konsole.desktop && \
rm /usr/bin/konsole && \
rm /usr/bin/konsoleprofile && \
ostree container commit
rm -vr /scripts