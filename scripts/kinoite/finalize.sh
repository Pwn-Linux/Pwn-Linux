#!/bin/bash

set -ouex pipefail

# Disable Repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/Pwn-Linux.repo && \
ostree container commit

# Remove uneeded files
rm /usr/share/applications/com.gerbilsoft.rom-properties.rp-config.desktop && \
rm /usr/share/applications/org.gnome.Prompt.desktop && \
rm /usr/share/applications/Documentation.desktop && \
rm /usr/share/applications/org.kde.krdp.desktop && \
rm -r /usr/share/plasma/look-and-feel/org.fedoraproject.fedora.desktop && \
ostree container commit

# Update the initramfs
KERNEL_FLAVOR=fsync /usr/libexec/containerbuild/build-initramfs && \
/usr/libexec/containerbuild/image-info && \
ostree container commit

# Set os-release info
sed -i 's/Fedora Linux/Pwn Linux/g' /usr/lib/os-release && \
sed -i 's/Bazzite/KDE Plasma/g' /usr/lib/os-release && \
ostree container commit

# Fix Passwaord
sed -i 's:/var/home:/home:' /etc/passwd && \
ostree container commit

#Revert to default task manager settings
sed -i '/<entry name="launchers" type="StringList">/,/<\/entry>/ s/<default>[^<]*<\/default>/<default>preferred:\/\/browser,applications:org.kde.discover.desktop,preferred:\/\/filemanager<\/default>/' /usr/share/plasma/plasmoids/org.kde.plasma.taskmanager/contents/config/main.xml && \
ostree container commit

#Configure Favorites
sed -i '/<entry name="favorites" type="StringList">/,/<\/entry>/ s/<default>[^<]*<\/default>/<default>preferred:\/\/browser,systemsettings.desktop,org.kde.dolphin.desktop,org.kde.discover.desktop,system-update.desktop<\/default>/' /usr/share/plasma/plasmoids/org.kde.plasma.kickoff/contents/config/main.xml && \
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

#Move sddm folder from /usr/share to /usr/share/pwn-linux and sym link /usr/share/sddm to var
mv /usr/share/sddm /usr/share/pwn-linux/sddm && \
rm -r /usr/share/pwn-linux/sddm/themes/01-breeze-fedora && \
ln -s /var/sddm /usr/share/sddm && \
ostree container commit

#manually remove konsole for flatpak use and create a wrapper
rm /usr/share/applications/org.kde.konsole.desktop && \
rm /usr/bin/konsole && \
rm /usr/bin/konsoleprofile && \
rm /usr/lib64/kconf_update_bin/konsole_globalaccel && \
rm /usr/lib64/kconf_update_bin/konsole_show_menubar && \
rm /usr/share/kconf_update/konsole.upd && \
rm /usr/share/kconf_update/konsole_add_hamburgermenu_to_toolbar.sh && \
rm /usr/share/knotifications6/konsole.notifyrc && \
rm /usr/share/knsrcfiles/konsole.knsrc && \
rm /usr/share/metainfo/org.kde.konsole.appdata.xml && \
rm /usr/share/qlogging-categories6/konsole.categories && \
rm /usr/share/zsh/site-functions/_konsole && \
rm /etc/xdg/konsolerc && \
rm /usr/lib64/libkonsoleapp.so* && \
rm /usr/lib64/qt6/plugins/kf6/parts/konsolepart.so && \
rm /usr/lib64/qt6/plugins/konsoleplugins/konsole_quickcommandsplugin.so && \
rm /usr/lib64/qt6/plugins/konsoleplugins/konsole_sshmanagerplugin.so && \
rm -r /usr/share/konsole && \
touch /usr/bin/konsole && \
echo '#!/bin/bash' >> /usr/bin/konsole && \
echo 'flatpak run --branch=stable --arch=x86_64 --command=konsole org.kde.konsole $@' >> /usr/bin/konsole && \
chmod +x /usr/bin/konsole && \
ostree container commit

#remove build scripts
rm -vr /scripts