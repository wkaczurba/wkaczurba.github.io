# Arduino and ESP32 setups

## Arduino-ttyUSB0:

https://ubuntu.com/tutorials/install-the-arduino-ide#3-first-launch - DIALOUT GROUP

Starting stuff:
```
sudo chmod a+rw /dev/ttyUSB0
sudo usermod -a -G dialout wkaczurba
```

Finished at https://www.youtube.com/watch?v=mC2a-_LdYNc&ab_channel=anErik [3:29]


Arduino here: https://docs.arduino.cc/built-in-examples/basics/AnalogReadSerial ; try this one: https://docs.arduino.cc/built-in-examples/basics/AnalogReadSerial 

## UART over USB setup:

22.04: 
    Brltty needs disabling:
    https://askubuntu.com/questions/1408192/can-not-connect-arduino-ide-with-arduino-board-on-ubuntu-22-04 

```
    systemctl stop brltty-udev.service sudo systemctl mask brltty-udev.service systemctl stop brltty.service systemctl disable brltty.service
```

Add dialout group:
```bash
sudo usermod -a -G dialout wkaczurba
sudo chmod a+rw /dev/ttyUSB0
```

## Arduino

Arduino:

baseboard: https://botland.com.pl/arduino-seria-podstawowa-oryginalne-plytki/1060-arduino-uno-rev3-a000066-7630049200050.html?cd=18298825651&ad=&kd=&gclid=Cj0KCQiA-JacBhC0ARIsAIxybyNjdUCc5L1H9SozuDcPvP9QfZ8maUljaciIM0xy7sBW0B1ULZRFxNEaAq6CEALw_wcB 

See above -> Brltty needs disabling + add dialout group for USB Uart setup.

Arduino Kit: https://botland.com.pl/arduino-edukacja-oryginalne-zestawy/4796-arduino-starterkit-k000007-oficjalny-zestaw-startowy-z-plytka-arduino-uno-7630049200081.html 

Arduino - youtube links: https://www.youtube.com/watch?v=Sww1mek5rHU&ab_channel=DroneBotWorkshop , https://www.youtube.com/watch?v=HSBUnXQN120&ab_channel=ElektroMaras

Ultrasonic sensor: https://lastminuteengineers.com/arduino-sr04-ultrasonic-sensor-tutorial/#:~:text=An%20HC%2DSR04%20ultrasonic%20distance,listens%20for%20the%20transmitted%20pulses.

## ESP32 LoLin (NodeMCU v3, ESP8266):

Packages:
    - https://dl.espressif.com/dl/package_esp32_dev_index.json 
    - https://arduino.esp8266.com/stable/package_esp8266com_index.json


**Lolin: Setup** -> select board: NodeMCU 1.0 (ESP-12E)

Tried stuff: 
 - ESP8266-WIFI->"HelloServer" - works all well; registers with wifi, etc
 - ["Wire" (how they call it I guess is I2C) -> Master Read / Master Write]: I2C, and can be used for bus expander/switches
 - **SONAR**: https://randomnerdtutorials.com/esp8266-nodemcu-hc-sr04-ultrasonic-arduino/ 


    

