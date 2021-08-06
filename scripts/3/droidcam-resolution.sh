#!/bin/bash

# Select DroidCam resolution script
# Requires root privileges (pkexec) and zenity

if [ "$EUID" != "0" ] ; then pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY "$0"; exit; fi;

a=$(zenity --list --radiolist --title="Droidcam resolution (v4l2loopback_dc)" --width=350 --height=250 \
--column="#" --column="Width" --column="Height" 640 640 "480" 960 960 "720" 1280 1280 "720" 1920 1920 "1080")

case $a in
    640)
       w=640; h=480
      ;;
    960)
       w=960; h=720
      ;;
   1280)
       w=1280; h=720
      ;;
   1920)
       w=1920; h=1080
      ;;
    *)
       exit 0
      ;;
esac

sed -i "s/width=*[0-9]*/width=$w/g" /etc/modprobe.d/droidcam.conf
sed -i "s/height=*[0-9]*/height=$h/g" /etc/modprobe.d/droidcam.conf

# Kill droidcam if running & v4l2loopback_dc is busy
[[ $(pidof droidcam) ]] && killall droidcam
rmmod -f v4l2loopback_dc && modprobe v4l2loopback_dc

zenity --info --no-wrap --text="Droidcam resolution: "$w"x"$h""

exit 0;
