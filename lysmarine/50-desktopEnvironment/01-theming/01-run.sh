#!/bin/bash -e
install  -d -o 1000 -g 1000 -m 755 -d "${ROOTFS_DIR}/home/pi/.themes"
install  -d -o 1000 -g 1000 -m 755 -d "${ROOTFS_DIR}/home/pi/.icons"

on_chroot << EOF
rm -rf openbox-theme-collections
rm -rf flat-remix
rm -rf gtk-theme-collections
rm -rf Ant-Dracula
git clone -q --depth=1 https://github.com/addy-dclxvi/openbox-theme-collections
git clone -q --depth=1 https://github.com/daniruiz/flat-remix

cp -rf ./openbox-theme-collections/Numix-Clone /home/pi/.themes/
chown -R pi:pi /home/pi/.themes/Numix-Clone
cp -rf flat-remix/Flat-Remix-Blue /home/pi/.icons/Flat-Remix-Dark
chown -R pi:pi /home/pi/.icons/Flat-Remix-Dark

rm -rf openbox-theme-collections
rm -rf flat-remix

EOF



install -d -o 1000 -g 1000 -m 755 "${ROOTFS_DIR}/home/pi/.config/"
install -d -o 1000 -g 1000 -m 755 "${ROOTFS_DIR}/home/pi/.config/feh/"
install -d -o 1000 -g 1000 -m 755 "${ROOTFS_DIR}/home/pi/.config/gtk-3.0/"
install -d -o 1000 -g 1000 -m 755 "${ROOTFS_DIR}/home/pi/.config/openbox/"
install -d -o 1000 -g 1000 -m 755 "${ROOTFS_DIR}/home/pi/.config/terminator/"
install -d -o 1000 -g 1000 -m 755 "${ROOTFS_DIR}/home/pi/.config/pcmanfm/default"
install -d -o 1000 -g 1000 -m 755 "${ROOTFS_DIR}/home/pi/.config/libfm/"
install -o 1000 -g 1000  -v files/.gtkrc-2.0    "${ROOTFS_DIR}/home/pi/"
install -o 1000 -g 1000  -v files/water.jpg     "${ROOTFS_DIR}/home/pi/.config/feh/"
install -o 1000 -g 1000  -v files/settings.ini  "${ROOTFS_DIR}/home/pi/.config/gtk-3.0/"
install -o 1000 -g 1000  -v files/autostart     "${ROOTFS_DIR}/home/pi/.config/openbox/"
install -o 1000 -g 1000  -v files/rc.xml        "${ROOTFS_DIR}/home/pi/.config/openbox/"
install -o 1000 -g 1000  -v files/config        "${ROOTFS_DIR}/home/pi/.config/terminator/"
install -o 1000 -g 1000  -v files/pcmanfm.conf  "${ROOTFS_DIR}/home/pi/.config/pcmanfm/default/"
install -o 1000 -g 1000  -v files/libfm.conf  "${ROOTFS_DIR}/home/pi/.config/libfm/"
install -o 1000 -g 1000  -v files/.conkyrc      "${ROOTFS_DIR}/home/pi/.conkyrc"