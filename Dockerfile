FROM rafaelsoares/archlinux

RUN pacman -Syy --noconfirm --asdeps vim && \
    pacman -Syy --noconfirm lynx wget sudo unzip libisoburn squashfs-tools p7zip arch-install-scripts xxd base-devel git
RUN useradd -m -G wheel -s /bin/bash build && \
    echo "build ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/build && \
    chmod 0440 /etc/sudoers.d/build

USER build
WORKDIR /build
CMD ./arch-anywhere-creator.sh
