#!/bin/bash

#Standard sizes (Width x Height): 640×480, 960×720, 1280×720 (720p), 1920×1080 (1080p).

clear

if [ "$EUID" != "0" ] ; then
    echo "Required root privileges..."
    su -c "$0"
    exit
fi

echo "\
1. 640x480
2. 960x720
3. 1280x720 (720p)
4. 1920x1080 (1080p)
"
read -p "Select camera resolution (1-4): " a

case $a in
    1)
       sed -i 's/-size=*[0-9]*x*[0-9]*/-size=640x480/g' /usr/bin/droidcam.sh
      ;;
    2)
       sed -i 's/-size=*[0-9]*x*[0-9]*/-size=960x720/g' /usr/bin/droidcam.sh
      ;;
    3)
       sed -i 's/-size=*[0-9]*x*[0-9]*/-size=1280x720/g' /usr/bin/droidcam.sh
      ;;
    4)
       sed -i 's/-size=*[0-9]*x*[0-9]*/-size=1920x1080/g' /usr/bin/droidcam.sh
      ;;
    *)
       exit 0
      ;;
esac

exit 0;
