Droidcam rpm-packages for Mageia Linux
---
URL: https://www.dev47apps.com/droidcam/linux/  
GitHub: https://github.com/dev47apps/droidcam  

Note: The original *.spec's are borrowed from openSUSE Tumbleweed (droidcam-1.7-8.3.src.rpm) and Mageia-8-RC (dkms-vhba-20200106-2.mga8.src.rpm).

Testing:
---
The test was conducted on a smartphone ZTE Blade A3 2016. The USB port was already in debugging mode, DroidCamX-v6.4.7 was installed on the smartphone. The DroidCam client was installed on the computer (Mageia-8-x86_64) and adb was restarted: `adb kill-server; adb start-server`. After connecting the smartphone via USB, the offer "Accept the authorization code" (Ok) came out on it. At the command of `adb devices`, the computer showed a list of authorized devices (smartphone). DroidCamX and DroidCam were launched on the smartphone and computer. In the client on the computer, USB (Android) and Connect were selected. Then Skype is launched, which has a Droidcam camera and a microphone in the settings. After about 5 seconds, an image appeared. The list of authorization keys is stored on the computer in the ~/.android folder.

Start droidcam with the microphone (experimental):
---
https://github.com/dev47apps/droidcam/issues/54  
https://github.com/dev47apps/droidcam/issues/60

v1.7.3-3  
1. install the droidcam packages  
2. su/password; sed -i '/droidcam_audio/d' /etc/pulse/default.pa; reboot  
3. The mic is working. Need to check the video broadcast over WiFi (it works via USB)  

Microphone and WebCam test:
---
WebCam: https://webcammictest.com  
Microphone: https://webcammictest.com/check-mic.html
