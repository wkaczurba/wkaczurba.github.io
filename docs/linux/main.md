# Linux - related scripts etc.

- [Linux - related scripts etc.](#linux---related-scripts-etc)
  - [Kernel](#kernel)
    - [Upgrading kernel to the latest:](#upgrading-kernel-to-the-latest)
  - [Ubuntu:](#ubuntu)
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

turning off screen after 30 seconds.

```bash
xset -dpms
```

## Raspberry PI - faulty (corrupted) MMC card:

 - from: https://forums.raspberrypi.com/viewtopic.php?t=12245 : `e2fsck -f -v /dev/mmcblk0p2` to fix raspberry pi sd card


# Midi over bluetooth installation

As based on:
 - https://linuxmusicians.com/viewtopic.php?t=23610
 - https://tttapa.github.io/Pages/Ubuntu/Software-Installation/BlueZ.html

