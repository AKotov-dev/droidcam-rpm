Droidcam rpm-packages for Mageia Linux
---
URL: https://www.dev47apps.com/droidcam/linux/  
GitHub: https://github.com/dev47apps/droidcam  

Note: The original *.spec's are borrowed from openSUSE Tumbleweed (droidcam-1.7-8.3.src.rpm) and Mageia-8-RC (dkms-vhba-20200106-2.mga8.src.rpm).

![](https://github.com/AKotov-dev/droidcam-rpm/blob/main/scripts/screenshots/screenshot.png)

Testing:
---
The test was conducted on a smartphone ZTE Blade A3 2016. The USB port was already in debugging mode, DroidCam-v6.4.7 was installed on the smartphone. The DroidCam-Client was installed on the computer (Mageia-8-x86_64) and adb was restarted: `adb kill-server; adb start-server`. After connecting the smartphone via USB, the offer "Accept the authorization code" (Ok) came out on it. At the command of `adb devices`, the computer showed a list of authorized devices (smartphone). DroidCam and DroidCam-Client were launched on the smartphone and computer. In the client on the computer, USB (Android) and Connect were selected. Then Skype is launched, which has a Droidcam camera and a microphone (droidcam_audio) in the settings. After about 3-5 seconds, an image appeared. The list of authorization keys is stored on the computer in the ~/.android folder.

DroidCam-Client rpm-packages:
---
dkms-v4l2loopback_dc-0.0.X-X.mrx8.noarch.rpm  
droidcam-cli-1.X.X-X.mrx8.x86_64.rpm  
droidcam-1.X.X-X.mrx8.x86_64.rpm  

To completely remove DroidCam-Client:
```
su/password
urpme --auto dkms-v4l2loopback_dc
```
...and restart the computer.

Microphone and WebCam test:
---
WebCam: https://webcammictest.com  
Microphone: https://webcammictest.com/check-mic.html

