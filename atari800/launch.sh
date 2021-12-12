#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`
homedir=`dirname "$1"`

# input remap to Atari joystick 
mkdir -p /mnt/SDCARD/RetroArch/.retroarch/config/remaps/Atari800/
cp -rf $progdir/Atari800.rmp /mnt/SDCARD/RetroArch/.retroarch/config/remaps/Atari800/Atari800.rmp
# core config file
mkdir -p /mnt/SDCARD/RetroArch/.retroarch/config/Atari800/
cp -rf $progdir/Atari800.opt /mnt/SDCARD/RetroArch/.retroarch/config/Atari800/

# if 
if [ ! -f /mnt/SDCARD/RetroArch/.retroarch/system/5200.rom ]; then
  cp -rf $progdir/bios/5200.rom /mnt/SDCARD/RetroArch/.retroarch/system/5200.rom
fi

cd /mnt/SDCARD/RetroArch/
HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/atari800_libretro.so "$1"
