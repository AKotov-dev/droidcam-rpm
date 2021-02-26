#!/bin/bash

#DroidCam (x86_64) install/update script for Mageia Linux 7/8
#Author Alex Kotov aka alex_q_2000 (C) 2021
#---DroidCam - GNU/Linux client for DroidCam---
#URL: https://www.dev47apps.com/droidcam/linux/
#GitHub: https://github.com/dev47apps/droidcam

clear
#Версия DroidCam
version="1.7.1"

#Имена текущих пакетов kernel-devel и kernel-source
devel="kernel-source-$(uname -r | sed 's/-desktop//')"
source="kernel-desktop-devel-$(uname -r | sed 's/-desktop//')"

#Проверка наличия интернет и обновление зеркал
ping -c 1 -q google.com >&/dev/null
if [ "$?" -ne "0" ]; then
  read -p "Интернет не подключен! Enter - Выход..."
  exit 1;
fi;

urpmi.update -a

#Удаление предыдущей установки
if [ -f /opt/droidcam-uninstall ]; then
  killall adb; killall droidcam;
  /opt/droidcam-uninstall
fi;

#Установка (пример для версии droidcam_1.7.1.zip)
#---
#Для сборки модуля ядра
urpmi --auto wget make gcc android-tools
#urpmi --auto kernel-source-latest kernel-devel-latest
urpmi --auto $devel $source

#Для работы
urpmi --auto ffmpeg speex usbmuxd libplist

wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_$version.zip
unzip -o droidcam_latest.zip -d droidcam
cd droidcam && ./install-client && ./install-video && ./install-sound

#Удаление kernel-devel и kernel-source
#dnf -y remove kernel-source* kernel-devel*
urpme --auto $devel $source

exit 0;

