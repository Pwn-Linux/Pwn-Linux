# Pwn Linux

Pwn Linux is a immutable gaming centric desktop built upon Fedora Atomic Desktops and Bazzite tweaked and fine tune for your desktop needs.

# Features

These are the features included in Pwn Linux!

## Packages

In addition to the packages included in [Bazzite](https://github.com/ublue-os/bazzite), I include the following installed/changed by default:

### Package changes

- Swap Pulseaudio in for Pipewire-Pulseaudio
- removed various packages in favor of using flatpak. See the Containerfiles for what is removed. will list them here later.

## Using the Image

If you do decide you want to try Pwn Linux, for AMD/Intel you will want to rebase from Fedora Kinoite/Bazzite using this command:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/pwn-linux/pwn-linux/pwnlinux:latest
```

For Nvidia you will want to rebase from Fedora Kinoite/Bazzite using this command:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/pwn-linux/pwnlinux-nvidia:latest
```
## ISO Downloads

Latest AMD/Intel ISO avilable at [Pwn Linux](https://pwn-linux.xyz/releases/pwnlinux/pwnlinux-stable.iso)

Latest Nvidia ISO avilable at [Pwn Linux Nvidia](https://pwn-linux.xyz/releases/pwnlinux-nvidia/pwnlinux-nvidia-stable.iso)

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/Pwn-Linux/Pwn-Linux
```

## Special Thanks

The contributors at Universal Blue, Bazzite, and Fedora are amazing. This image would not exist without the incredible work they do every day!
