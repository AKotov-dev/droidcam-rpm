#!/bin/bash

#Select DroidCam trsolution script
#Requires: zenity & root privileges (su/password)

#Run script with root privileges
if [ "$EUID" != "0" ] ; then
    echo "$(zenity --password --title="Input root password:")" | su -c "$0"
    exit
fi

a=$(zenity --list --radiolist --title="DroidCam Resolution" --width=350 --height=250 \
--column="#" --column="Width" --column="Height" 640 640 "480" 960 960 "720" 1280 1280 "720" 1920 1920 "1080")

case $a in
    640)
       sed -i 's/-size=*[0-9]*x*[0-9]*/-size=640x480/g' /usr/bin/droidcam.sh
      ;;
    960)
       sed -i 's/-size=*[0-9]*x*[0-9]*/-size=960x720/g' /usr/bin/droidcam.sh
      ;;
   1280)
       sed -i 's/-size=*[0-9]*x*[0-9]*/-size=1280x720/g' /usr/bin/droidcam.sh
      ;;
   1920)
       sed -i 's/-size=*[0-9]*x*[0-9]*/-size=1920x1080/g' /usr/bin/droidcam.sh
      ;;
    *)
       exit 0
      ;;
esac

exit 0;
