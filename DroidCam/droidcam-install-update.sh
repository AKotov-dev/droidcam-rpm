#!/bin/bash

#DroidCam (x86_64) install/update script for Mageia Linux 7/8
#Author Alex Kotov aka alex_q_2000 (C) 2021
#---DroidCam - GNU/Linux client for DroidCam---
#URL: https://www.dev47apps.com/droidcam/linux/
#GitHub: https://github.com/dev47apps/droidcam

clear
#Версия DroidCam
version="1.7.1"

#Проверка наличия интернет и обновление зеркал
ping -c 1 -q google.com >&/dev/null
if [ "$?" -ne "0" ]; then
  read -p "Интернет не подключен! Enter - Выход..."
  exit 1
    else
  urpmi.update -a
fi;

#Удаление предыдущей установки
if [ -f /opt/droidcam-uninstall ]; then
  [ $(pidof adb) ] && killall adb
  [ $(pidof droidcam) ] && killall droidcam
  /opt/droidcam-uninstall
fi;

#Для сборки модуля ядра
urpmi --auto wget make gcc android-tools
urpmi --auto kernel-source-$(uname -r | sed 's/-desktop//')
urpmi --auto kernel-desktop-devel-$(uname -r | sed 's/-desktop//')

#Для работы
urpmi --auto ffmpeg speex usbmuxd libplist

wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_$version.zip
unzip -o droidcam_latest.zip -d droidcam
cd droidcam && ./install-client && ./install-video && ./install-sound

#Удаление kernel-devel и kernel-source
dnf -y remove kernel-source* kernel-desktop-devel*

exit 0;

