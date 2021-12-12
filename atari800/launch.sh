#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`
homedir=`dirname "$1"`

# create game rom dir.
mkdir -p /mnt/SDCARD/RRoms/atari800

# input remap to Atari joystick 
mkdir -p /mnt/SDCARD/RetroArch/.retroarch/config/remaps/Atari800/
cp -rf $progdir/Atari800.rmp /mnt/SDCARD/RetroArch/.retroarch/config/remaps/Atari800/Atari800.rmp

# core config file
mkdir -p /mnt/SDCARD/RetroArch/.retroarch/config/Atari800/
cp -rf $progdir/Atari800.opt /mnt/SDCARD/RetroArch/.retroarch/config/Atari800/

# if bios not exists, copy it.
if [ ! -f /mnt/SDCARD/RetroArch/.retroarch/system/5200.rom ]; then
  cp -rf $progdir/bios/5200.rom /mnt/SDCARD/RetroArch/.retroarch/system/5200.rom
fi

cd /mnt/SDCARD/RetroArch/
HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/atari800_libretro.so "$1"
