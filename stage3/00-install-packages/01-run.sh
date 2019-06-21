#!/bin/bash -e

on_chroot << EOF
update-alternatives --install /usr/bin/x-www-browser \
  x-www-browser /usr/bin/chromium-browser 86
update-alternatives --install /usr/bin/gnome-www-browser \
  gnome-www-browser /usr/bin/chromium-browser 86
cd /opt
echo "Cloning Current Arduino Build"
wget https://github.com/arduino/Arduino/archive/master.zip -O arduino-master.zip
unzip arduino-master.zip
echo "Cloned..."
cd Arduino-master/build
echo "Changed directory..."
yes "" | ant dist
