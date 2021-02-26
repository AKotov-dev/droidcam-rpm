#!/bin/bash

#Standard sizes (Width x Height): 640×480, 960×720, 1280×720 (720p), 1920×1080 (1080p).

clear
echo "\
1. 640x480
2. 960x720
3. 1280x720 (720p)
4. 1920x1080 (1080p)
"
read -p "Select camera resolution: " a

case $a in
    1)
       sed -i 's/width=*[0-9]*/width=640/g' /etc/modprobe.d/droidcam.conf
       sed -i 's/height=*[0-9]*/height=480/g' /etc/modprobe.d/droidcam.conf
      ;;
    2)
       sed -i 's/width=*[0-9]*/width=960/g' /etc/modprobe.d/droidcam.conf
       sed -i 's/height=*[0-9]*/height=720/g' /etc/modprobe.d/droidcam.conf
      ;;
    3)
       sed -i 's/width=*[0-9]*/width=1280/g' /etc/modprobe.d/droidcam.conf
       sed -i 's/height=*[0-9]*/height=720/g' /etc/modprobe.d/droidcam.conf
      ;; 
    4)
       sed -i 's/width=*[0-9]*/width=1920/g' /etc/modprobe.d/droidcam.conf
       sed -i 's/height=*[0-9]*/height=1080/g' /etc/modprobe.d/droidcam.conf
      ;;
    *)
       sed -i 's/width=*[0-9]*/width=640/g' /etc/modprobe.d/droidcam.conf
       sed -i 's/height=*[0-9]*/height=480/g' /etc/modprobe.d/droidcam.conf
      ;;
esac

echo ""
cat /etc/modprobe.d/droidcam.conf

[ $(pidof adb) ] && killall adb
[ $(pidof droidcam) ] && killall droidcam
rmmod v4l2loopback_dc; modprobe v4l2loopback_dc
sleep 2
