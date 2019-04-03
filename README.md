
# WIFI_4 Click
---
[Wifi4](https://www.mikroe.com/wifi-4-click) click libary with examples.
Libary and examples are tested on EasyPIC Fusion v7 board and PIC P32MX795F512L MCU.

---

- **Author**    : Milos Matic
- **Version**   : 1.0.0
- **Date**      : Mar 2019.

---
## Library Description

Library carries generic command parser adopted for AT command based modules. 
Wifi 4 click is based on ST SPWF01SA module, list of all AT commands is [here](https://www.st.com/content/ccc/resource/technical/document/user_manual/4e/4d/c3/82/43/f1/4c/24/DM00100306.pdf/files/DM00100306.pdf/jcr:content/translations/en.DM00100306.pdf).
Project is separated into 3 layers- HAL, Driver and App layer. For more information about layers and mikroSDK standard, read [this](https://download.mikroe.com/documents/mikrosdk/mikrosdk-manual-v100.pdf) document.


Key functions :
- ```wifi4_uartDriverInit``` - Driver Initialization
- ``` wifi4_coreInit``` - Core initialization of wifi4 click 
- ``` wifi4_setHandler ``` - Handler assignation to the provied command
- ``` wifi4_cmdSingle ``` - Sends provided command to the module
- ``` wifi4_modulePower ``` - Turn on module

### Declarations and description of other libary functions can be read in ```WIFI4_CLICK.h``` header file. 

---

## Examples Description
In this repository, we have 2 examples.

**Web Aplication example**

In branch ``` wifi4_webServ ``` is example how to control relays on [RELAY click](https://www.mikroe.com/relay-click) with simple web page which is uploaded on WIFI4 click.

The application is composed of three sections :
- System Initialization  - Initializes all necessary GPIO pins, UART used for
the communcation with Wifi4 click and RELAY click.
- Application Initialization (appInit fun) - Initializes driver , power on module, init interrupts for timer and UART.

Establish communication with AP-> ``` wifi4_connectToAP(ssid,pass);``` command.

Upload files(http,css and js) to web server of WIfi4 click-
```
wifi4_createFile( "/proba.html" ,html ); 
wifi4_createFile( "/style.css", layout );
wifi4_createFile( "/logic.js", js );
``` 
Content of webPage files(html, layout and js) is in ```page.h``` header.   
- Application Task(appTask) - running in parallel core state machine and checks for the URC
message from Wifi4. When recives actuation message from web service, change states of relays.This function calls in infinte loop

In browser, type ip_addr/proba.html to open a web page, where ip_addr is ip address of wifi4 clcik.

**Network socket example**

In branch ``` wifi4_relay ``` is example how to open network socket on specified port and control relays on [RELAY click](https://www.mikroe.com/relay-click) sending simple +ACT commands from client socket to wifi4.

The application is composed of three sections :
- System Initialization  - Initializes all necessary GPIO pins, UART used for
the communcation with Wifi4 click and RELAY click.
- Application Initialization (appInit fun) - Initializes driver , power on module, init interrupts for timer and UART.
Establish communication with AP-> ``` wifi4_connectToAP(ssid,pass)``` command.

Open network socket on port 32000-> ``` wifi4_socketServerOpen(32000)```.

- Application Task(appTask) - running in parallel core state machine and checks for the URC
message from Wifi4. When recives actuation message from web service, change states of relays.This function calls in infinte loop

This app waits for client to connect on socket, and waits specified command to recive from client(+ACT:RELAY_R0,1 is command to turn relay0 on).






