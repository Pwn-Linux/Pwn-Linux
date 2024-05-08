ARG BASE_IMAGE_NAME="${BASE_IMAGE_NAME:-bazzite}"
ARG BASE_IMAGE_FLAVOR="${BASE_IMAGE_FLAVOR:-main}"
ARG IMAGE_FLAVOR="${IMAGE_FLAVOR:-main}"
ARG KERNEL_FLAVOR="${KERNEL_FLAVOR:-fsync}"
ARG IMAGE_BRANCH="${IMAGE_BRANCH:-main}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-$BASE_IMAGE_NAME-$BASE_IMAGE_FLAVOR}"
ARG BASE_IMAGE="ghcr.io/ublue-os/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

FROM ghcr.io/ublue-os/bazzite:stable AS pwnlinux

ARG IMAGE_NAME="${IMAGE_NAME:-pwnlinux}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-pwn-linux}"
ARG IMAGE_FLAVOR="${IMAGE_FLAVOR:-main}"
ARG KERNEL_FLAVOR="${KERNEL_FLAVOR:-fsync}"
ARG IMAGE_BRANCH="${IMAGE_BRANCH:-main}"
ARG BASE_IMAGE_NAME="${BASE_IMAGE_NAME:-bazzite}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

COPY system_files/desktop/kinoite /
COPY system_files/desktop/shared /
COPY system_files/overrides /
COPY scripts/setup.sh /tmp/setup.sh
COPY scripts/remove-packages.sh /tmp/remove-packages.sh
COPY scripts/install-packages.sh /tmp/install-packages.sh
COPY scripts/remove-files.sh /tmp/remove-files.sh
COPY scripts/finalize.sh /tmp/finalize.sh

RUN /tmp/setup.sh && \
        /tmp/remove-packages.sh && \
        /tmp/install-packages.sh && \
        /tmp/remove-files.sh && \
        /tmp/finalize.sh

FROM ghcr.io/ublue-os/bazzite-nvidia:stable AS pwnlinux-nvidia

ARG IMAGE_NAME="${IMAGE_NAME:-pwnlinux-nvidia}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-pwn-linux}"
ARG IMAGE_FLAVOR="${IMAGE_FLAVOR:-nvidia}"
ARG KERNEL_FLAVOR="${KERNEL_FLAVOR:-fsync}"
ARG IMAGE_BRANCH="${IMAGE_BRANCH:-main}"
ARG BASE_IMAGE_NAME="${BASE_IMAGE_NAME:-bazzite-nvidia}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

COPY system_files/desktop/kinoite /
COPY system_files/desktop/shared /
COPY system_files/nvidia/kinoite /
COPY system_files/overrides /
COPY scripts/setup.sh /tmp/setup.sh
COPY scripts/remove-packages.sh /tmp/remove-packages.sh
COPY scripts/install-packages.sh /tmp/install-packages.sh
COPY scripts/remove-files.sh /tmp/remove-files.sh
COPY scripts/finalize.sh /tmp/finalize.sh

RUN /tmp/setup.sh && \
        /tmp/remove-packages.sh && \
        /tmp/install-packages.sh && \
        /tmp/remove-files.sh && \
        /tmp/finalize.sh