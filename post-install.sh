#!/bin/bash

chroot $1 sed -i 's/^\(.*localhost.*\)$/#&/g' /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu natty main universe multiverse restricted' | tee -a $1/etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu natty-updates main universe multiverse restricted' | tee -a $1/etc/apt/sources.list
chroot $1 sed -i 's/^[^#].*$/#&/g' /etc/init/tty1.conf

chroot $1 addgroup airi bluetooth
chroot $1 addgroup airi messagebus
chroot $1 apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B85B0133
