DroidCam (x86_64) install/update script for Mageia Linux 7/8
---
DroidCam - GNU/Linux client for DroidCam  
URL: https://www.dev47apps.com/droidcam/linux/  
GitHub: https://github.com/dev47apps/droidcam

`su/password`  
`wget https://github.com/AKotov-dev/droidcam-install-update/raw/main/DroidCam.tar.gz`  
`tar xvzf DroidCam.tar.gz; cd ./DroidCam; ./droidcam-install-update.sh`

- Проверяется наличие подключения к сети Интернет
- Обновляются текущие зеркала
- Если ранее DroidCam уже был установлен - он удаляется, включая модуль ядра `v4l2loopback_dc`
- Устанавливаются необходимые пакеты в том числе и пакеты исходников ядра
- С GitHub разработчика скачивается версия `droidcam`, указанная в `version`
- Сборка модуля ядра, установка DroidCam, удаление установленных kernel-devel и kernel-source

Дополнительная информация
---
Запуск: Ярлык в "Меню-Аудио и Видео-DroidCam" или `droidcam` из под юзера

Удаление: `/opt/droidcam-uninstall`

**HD Mode – Change webcam resolution**

Note: If you are using the standard v4l2loopback module, close the droidcam window and update the size parameter in ~/.config/droidcam.
For the DroidCam v4l2loopback, you can change the webcam output resolution as follows:

- Close any programs using the droidcam webcam. Unload the device driver:  
`rmmod v4l2loopback_dc`

- Re-load it with new options (WIDTH and HEIGHT are numbers). :  
`modprobe v4l2loopback_dc width=WIDTH height=HEIGHT`

Standard sizes (Width x Height): 640×480, 960×720, 1280×720 (720p), 1920×1080 (1080p).

- Restart the droidcam client to reload the settings, and test it out. You can keep changing the resolution.

- Edit the text file `/etc/modprobe.d/droidcam.conf` with the new options to make the change stick.

It’s also possible to invert the video size (eg. 480×640, width=480 height=640), which will make the webcam vertical and rotate the video 90º. Not all programs may load the webcam with inverted parameters (eg. Discord does not) but many do (eg. Zoom and OBS).


Настройка смартфона
---
Источник: https://droidcamru.ru/podkluchenie/cherez-usb/

- Отключите устройство от компьютера.

- Установите драйверы для вашего устройства на компьютер (android-tools содержит adb). 

- Перейдите в «Настройки» -> «Параметры разработчика» и включите «Отладку USB» на устройстве. На Android 4.2 и выше экран параметров разработчика по умолчанию скрыт. Чтобы сделать его видимым, перейдите в «Настройки»> «О телефоне» и нажмите «Номер сборки» 7 раз. Вернитесь к предыдущему экрану, чтобы найти «Опции разработчика» внизу и включите «Отладку USB».  
Смотрите также: http://www.cnet.com/how-to/restore-the-developer-options-menu-in-android-4-2/

- Подключите устройство обратно к компьютеру через USB. Если появится диалоговое окно с запросом «Разрешить отладку по USB», нажмите «ОК». Иногда вам нужно открыть «Опции USB» в области уведомлений на устройстве и выбрать режим «PTP», чтобы он появился.

- Теперь ваш компьютер определит телефон как новое USB-устройство и свяжет его с драйверами, установленными на шаге 2. Это должно заставить работать DroidCam.


