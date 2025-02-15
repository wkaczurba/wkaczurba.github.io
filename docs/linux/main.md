# Linux - related scripts etc.

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

# Midi over bluetooth installation

As based on:
 - https://linuxmusicians.com/viewtopic.php?t=23610
 - https://tttapa.github.io/Pages/Ubuntu/Software-Installation/BlueZ.html
 - 