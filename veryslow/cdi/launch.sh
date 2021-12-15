#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`
homedir=`dirname "$1"`

# create game rom dir.
mkdir -p /mnt/SDCARD/RRoms/cdi

# cfg to remap mouse to joystick 
if [ ! -f /mnt/SDCARD/RRoms/cdi/cdimono1.cfg ]; then
    cp -rf $progdir/cdimono1.cfg /mnt/SDCARD/RRoms/cdi/cdimono1.cfg
fi

# bios
if [ ! -f /mnt/SDCARD/RRoms/cdi/cdimono1.zip ]; then
    cp -rf $progdir/cdimono1.zip /mnt/SDCARD/RRoms/cdi/cdimono1.zip
fi

./cpufreq.sh
cd /mnt/SDCARD/RetroArch/
HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/cdi_libretro.so "$1"
