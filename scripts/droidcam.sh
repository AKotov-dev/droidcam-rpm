#!/usr/bin/bash

# DroidCam start with mic "droidcam_audio"

# Kill droidcam if running
for ((i=1; i < 10; i++)); do
   if [[ $(pidof droidcam) ]]; then
     killall droidcam; sleep 1
   else
     break
   fi
done | zenity --progress --pulsate --auto-close

droidcam &

# Mic Up (droidcam_audio)
for ((i=1; i < 10; i++)); do
  if [[ -z $(pactl list | grep droidcam_audio) ]]; then
    sleep 1;
    pacmd load-module module-alsa-source device=hw:Loopback,1,0 source_properties=device.description=droidcam_audio
  else
# Set droidcam_audio as Default Mic
    pacmd set-default-source 'alsa_input.hw_Loopback_1_0'
    break;
  fi;
done | zenity --progress --pulsate --auto-close

exit 0;
