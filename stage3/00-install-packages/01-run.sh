#!/bin/bash -e

on_chroot << EOF
update-alternatives --install /usr/bin/x-www-browser \
  x-www-browser /usr/bin/chromium-browser 86
update-alternatives --install /usr/bin/gnome-www-browser \
  gnome-www-browser /usr/bin/chromium-browser 86
cd /opt
echo "Cloning Current Arduino Build"
git clone --depth 1 https://github.com/arduino/Arduino.git arduino
echo "Cloned..."
cd arduino/build
echo "Changed directory..."
yes "" | ant dist
