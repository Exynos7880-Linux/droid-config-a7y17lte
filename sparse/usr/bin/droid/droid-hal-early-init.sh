#!/bin/bash

if ! grep -q hybris /system/etc/ld.config.29.txt; then
    mount -o bind /usr/libexec/droid-hybris/system/etc/ld.config.29.txt /system/etc/ld.config.29.txt
fi
mount -o bind /opt/vendor/etc/init/init.samsungexynos7880.rc /vendor/etc/init/hw/init.samsungexynos7880.rc
mount -o bind /system/lib64/hw/audio.hidl_compat.default.so /vendor/lib64/hw/audio.primary.default.so
#mount -o bind /dev/null /vendor/etc/init/hw/init.samsungexynos7880.usb.rc
mknod /dev/tun c 10 200
chmod 660 /dev/tun
chown system:vpn /dev/tun

if [[ ! -e /mnt/vendor ]]; then
    mkdir -p /mnt/vendor
    ln -s /efs /mnt/vendor/
fi
