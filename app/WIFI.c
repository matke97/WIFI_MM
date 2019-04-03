/**
Example for Wifi4 Click network socket functionality
    Date          : mar 2019.
    Author        : Milos Matic
Test configuration PIC32 :
    MCU                : P32MX795F512L
    Dev. Board         : EasyPIC Fusion v7
    PIC32 Compiler ver : v4.0.0.0
---
Description :
The application is composed of three sections :
- System Initialization - Initializes all necessary GPIO pins, UART used for
the communcation with Wifi4 click.
- Application Initialization - Initializes driver, power on module.
Commands are sent to prepare the module for communication with the g2c.
- Application Task - running in parallel core state machine and checks for the URC
message from Wifi4.
Additional Functions :
All additional functions such as timer initialization and default handler.

To see all at commands for WIFI module visit url:
  https://www.st.com/content/ccc/resource/technical/document/user_manual/4e/4d/c3/82/43/f1/4c/24/DM00100306.pdf/files/DM00100306.pdf/jcr:content/translations/en.DM00100306.pdf
*/

#include "WIFI4_CLICK.h"
#include "WIFI4_timer.h"
#define T_RELAY_P uint8_t*
const uint32_t _WIFI4_UART_CFG[ 1 ] =
{
        115200
};
//UART INTERRUPT INIT
void uartInterrupt()
{
   U2IP0_bit    = 1;
   U2IP1_bit    = 1;
   U2IP2_bit    = 1;
   U2RXIE_bit   = 1;
   EnableInterrupts();
}
//UART INTERRUPT ROUTINE
void RX_ISR()iv IVT_UART_2 ilevel 7 ics ICS_SRS
{
    if( IFS1 & ( 1 << U2RXIF ))
    {
      char  tmp = UART2_Read();
      WIFI4_putc(tmp);
      U2RXIF_bit = 0;
    }
}

// Flags for relay control
uint8_t state;
uint8_t oldstate;
uint8_t state2;
uint8_t oldstate2;

//ssid and password for connection to AP
static uint8_t ssid[]     =    "MikroE Public";
static uint8_t password[] =    "mikroe.guest";

/**
    @brief Connect to gateway command set
*/
void nakacisena_gateway()
{
    mikrobus_logWrite( "KACENJE NA GATEWAY ....", _LOG_TEXT );

    wifi4_connectToAP(ssid,pass);
    Delay_ms(4000);
    mikrobus_logWrite( "GOTOVO", _LOG_LINE );
}
/**
    @brief Command for recive ipAddress
*/
void vidiipadresu()
{
    wifi4_cmdSingle( "AT+S.STS=", "ip_ipaddr" );

}

/**
  *  @brief Default response handler
*/
void defaultHandler(uint8_t *resp,uint8_t *args)
{
    mikrobus_logWrite(resp,_LOG_LINE);
}

/**
  *  @brief Handler for +ACT: actuation commands
*/
void ACThandler(uint8_t *resp,uint8_t *args)
{
 if( !strncmp( resp, "+ACT:", 5) )
 {
  uint8_t read;
  // act signal
  strcpy( resp, resp+5 );
  if( !strncmp( resp, "RELAY_R1", 8 ) )
  {
    strcpy( resp, resp+9 );
    if(resp[0] == 0x30)
     {
      read = 0;
     }
     else  if( resp[0] == 0x31 )
     {
      read = 1;
     }
     if(0 != read)
     {
      state = 1;
     }
     else
     {
      state = 0;
     }
  }
  else 
  {
    if( !strncmp(resp, "RELAY_R2", 8) )
    {
       strcpy( resp, resp+9 );
       if(resp[0] == 0x30)
       {
          read = 0;
       }
       else if( resp[0] == 0x31 )
       {
          read = 1;
       }
       if( 0 != read )
       {
          state2 = 1;
       }
       else
       {
          state2 = 0;
       }
    }
  }
 }
}

/*
 * @brief Relays controling based on state/state2 variable
*/
void relayControl()
{
    if(state == 1 && oldstate == 0)
    {
        oldstate = 1;
        relay_relay1Control(1);
    }
    if(state == 0 && oldstate == 1)
    {
        oldstate = 0;
        relay_relay1Control(0);
    }
    if(state2 == 1 && oldstate2 == 0)
    {
        oldstate2 = 1;
        relay_relay2Control(1);
    }
    if(state2 == 0 && oldstate2 == 1)
    {
        oldstate2 = 0;
        relay_relay2Control(0);
    }
}


void systemInit()
{
    //setting pins for WIFI4 click
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_INPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_OUTPUT );
    mikrobus_uartInit( _MIKROBUS1, &_WIFI4_UART_CFG[0] );

    mikrobus_logInit(_LOG_USBUART_B,115200);
    
    //setting pins for RELAY click
    mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
}

void appInit()
{
    wifi4_uartDriverInit( (T_WIFI4_P)&_MIKROBUS1_GPIO, (T_WIFI4_P)&_MIKROBUS1_UART );
    relay_gpioDriverInit( (T_RELAY_P)&_MIKROBUS2_GPIO );
    
    //init interrupts
    InitTimer1();
    uartInterrupt();
    
    //core init WIFI4click
    wifi4_coreInit( defaultHandler, 1500 );
    wifi4_setHandler( "+ACT", 1500, ACThandler );
    Delay_100ms();

    //reset device
    wifi4_modulePower(0);
    Delay_100ms();
    wifi4_modulePower(1);
    Delay_ms(500);
    wifi4_cmdSingle( "AT", "" );
    
    //connect to AP
    nakacisena_gateway();
    
    //open network socket on port 32000
    wifi4_socketServerOpen(32000);
    Delay_ms(1500);
    vidiipadresu();
  
    //relay default states config
    state     =    0;
    state2    =    0;
    oldstate  =    0;
    oldstate2 =    0;
    relay_relay1Control(0);
    relay_relay2Control(0);

}

void appTask()
{
  wifi4_process();
  relayControl();
  Delay_100ms();
}


void main() 
{
 systemInit();
 appInit();
 mikrobus_logWrite( "INTI DONE", _LOG_LINE );
 while(1)
  {
   appTask();
  }
}