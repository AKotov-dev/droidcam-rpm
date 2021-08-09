#!/usr/bin/bash

# DroidCam Resolution
# Requires pkexec and zenity

if [ "$EUID" != "0" ]; then pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY "$0"; exit; fi;

w=$(zenity --list --radiolist --title="DroidCam Resolution v0.2" --width=400 --height=270 \
--column="#" --column="Width" --column="Height" 640 640 "480" 960 960 "720" 1280 1280 "720" 1920 1920 "1080")

case $w in
    640)
       h=480
      ;;
    960)
       h=720
      ;;
   1280)
       h=720
      ;;
   1920)
       h=1080
      ;;
    *)
       exit 0
      ;;
esac

sed -i "s/width=*[0-9]*/width=$w/g" /etc/modprobe.d/droidcam.conf
sed -i "s/height=*[0-9]*/height=$h/g" /etc/modprobe.d/droidcam.conf

# Kill droidcam if running & v4l2loopback_dc is busy
for ((i=1; i < 10; i++)); do
   if [[ $(pidof droidcam) ]]; then
     killall droidcam; sleep 1
   else
     break
   fi
done | zenity --progress --pulsate --auto-close

rmmod -f v4l2loopback_dc; modprobe v4l2loopback_dc

zenity --info --no-wrap --text="Resolution changed: ${w}x${h}\n\n\
v4l2loopback_dc module has been reloaded..."

exit 0;