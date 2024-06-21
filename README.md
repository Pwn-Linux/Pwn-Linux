# Pwn Linux

Pwn Linux is a immutable gaming centric desktop built upon Fedora Atomic Desktops and Bazzite tweaked and fine tuned for your desktop needs.

# Features

Pwn Linux features unparalleled out of the box configuration and integration of flatpak into the Desktop. 
We are a flatpak first desktop focused distribution which is what sets us apart from Bazzite. We only
use fedora system packages where we must for GUI apps and as soon as we can migrate a app to flatpak we
do. We also have support for distrobox, brew and snap (optional) so you can expand your sources of software
beyond flatpak.

## Packages

In addition to the packages included in [Bazzite](https://github.com/ublue-os/bazzite), we include the following installed/changed by default:

### Package changes

- Swap Pulseaudio in for Pipewire-Pulseaudio on some image variants
- removed various packages in favor of using flatpak. See the Containerfiles for what is removed. will list them here later.

## Using the Image

If you do decide you want to try Pwn Linux, for AMD/Intel you will want to rebase from Fedora Kinoite/Bazzite using this command:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/pwn-linux/pwnlinux:latest
```

If you do decide you want to try Pwn Linux with Pulsesudio, for AMD/Intel you will want to rebase from Fedora Kinoite/Bazzite using this command:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/pwn-linux/pwnlinux-pa:latest
```

For Nvidia you will want to rebase from Fedora Kinoite/Bazzite using this command:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/pwn-linux/pwnlinux-nvidia:latest
```

For Nvidia with Pulseaudio you will want to rebase from Fedora Kinoite/Bazzite using this command:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/pwn-linux/pwnlinux-pa-nvidia:latest
```
## ISO Downloads (testing best to use Fedora Kinoite/Bazzite to install atm)

Latest AMD/Intel ISO avilable at [Pwn Linux](https://pwn-linux.xyz/releases/pwnlinux/pwnlinux-stable.iso)

Latest Nvidia ISO avilable at [Pwn Linux Nvidia](https://pwn-linux.xyz/releases/pwnlinux-nvidia/pwnlinux-nvidia-stable.iso)

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/Pwn-Linux/Pwn-Linux
```

## Special Thanks

The contributors at Universal Blue, Bazzite, and Fedora are amazing. This image would not exist without the incredible work they do every day!
