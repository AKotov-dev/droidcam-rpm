#!/bin/bash

#Скрипт для установки разрешения камеры
#Requires: zenity & root privileges (su/password)

#Запуск скрипта с привилегиями root
if [ "$EUID" != "0" ] ; then
    echo "$(zenity --password --title="Введите пароль root")" | su -c "$0"
    exit
fi

a=$(zenity --list --radiolist --title="DroidCam Resolution" --width=350 --height=250 \
--column="#" --column="Width" --column="Height" 640 640 "480" 960 960 "720" 1280 1280 "720" 1920 1920 "1080")

case $a in
    640)
       sed -i 's/width=*[0-9]*/width=640/g' /etc/modprobe.d/droidcam.conf
       sed -i 's/height=*[0-9]*/height=480/g' /etc/modprobe.d/droidcam.conf
      ;;
    960)
       sed -i 's/width=*[0-9]*/width=960/g' /etc/modprobe.d/droidcam.conf
       sed -i 's/height=*[0-9]*/height=720/g' /etc/modprobe.d/droidcam.conf
      ;;
   1280)
       sed -i 's/width=*[0-9]*/width=1280/g' /etc/modprobe.d/droidcam.conf
       sed -i 's/height=*[0-9]*/height=720/g' /etc/modprobe.d/droidcam.conf
      ;; 
   1920)
       sed -i 's/width=*[0-9]*/width=1920/g' /etc/modprobe.d/droidcam.conf
       sed -i 's/height=*[0-9]*/height=1080/g' /etc/modprobe.d/droidcam.conf
      ;;
    *)
       exit 0
      ;;
esac

echo ""
cat /etc/modprobe.d/droidcam.conf

[ $(pidof adb) ] && killall adb
[ $(pidof droidcam) ] && killall droidcam
rmmod v4l2loopback_dc; modprobe v4l2loopback_dc

exit 0;


