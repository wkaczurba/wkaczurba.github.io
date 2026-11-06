# Linux - related scripts etc.

- [Linux - related scripts etc.](#linux---related-scripts-etc)
  - [Kernel](#kernel)
    - [Upgrading kernel to the latest:](#upgrading-kernel-to-the-latest)
  - [Ubuntu:](#ubuntu)
    - [turning off screen after 30 seconds.](#turning-off-screen-after-30-seconds)
    - [ubuntu-gnome shortcuts for apps, like Arduino.](#ubuntu-gnome-shortcuts-for-apps-like-arduino)
  - [Raspberry PI - faulty (corrupted) MMC card:](#raspberry-pi---faulty-corrupted-mmc-card)
- [Midi over bluetooth installation](#midi-over-bluetooth-installation)

## Kernel 

### Upgrading kernel to the latest:

https://ubuntuhandbook.org/index.php/2020/08/mainline-install-latest-kernel-ubuntu-linux-mint/

Using mainline:

```
sudo add-apt-repository ppa:cappelikan/ppa
sudo apt update
sudo apt install mainline
mainline --install-latest
```

## Ubuntu:

### turning off screen after 30 seconds.

```bash
xset -dpms
```

### ubuntu-gnome shortcuts for apps, like Arduino.

```bash
vi ~/.local/share/applications/arduino-ide.desktop
```
File itself:
```
[Desktop Entry]
Name=Arduino IDE
Comment=Arduino IDE 2.0.2
Exec=/home/wkaczurba/arduino-ide_2.0.2_Linux_64bit/arduino-ide
Icon=/home/wkaczurba/arduino-ide_2.0.2_Linux_64bit/resources/app/node_modules/arduino-ide-extension/src/browser/style/ide-logo.png
Terminal=false
Type=Application
Categories=Development;Electronics;
StartupWMClass=arduino-ide
```

```bash
chmod +x file ~/.local/share/applications/arduino-ide.desktop
update-desktop-database ~/.local/share/applications/
```


## Raspberry PI - faulty (corrupted) MMC card:

 - from: https://forums.raspberrypi.com/viewtopic.php?t=12245 : `e2fsck -f -v /dev/mmcblk0p2` to fix raspberry pi sd card


# Midi over bluetooth installation

As based on:
 - https://linuxmusicians.com/viewtopic.php?t=23610
 - https://tttapa.github.io/Pages/Ubuntu/Software-Installation/BlueZ.html

