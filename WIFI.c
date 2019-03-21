/* EXAMPLE WIFI4 CLICK
  to see all at commands for WIFI module visit url: 
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
uint8_t state,oldstate,state2,oldstate2;
void nakacisena_gateway()
{
    mikrobus_logWrite( "KACENJE NA GATEWAY ....", _LOG_TEXT );
    WIFI4_connectToAP("MikroE Public","mikroe.guest") ;
    Delay_ms(4000);

    mikrobus_logWrite( "GOTOVO", _LOG_LINE );
}
void vidiipadresu()
{
    WIFI4_cmdSingle("AT+S.STS=","ip_ipaddr");

}
void pisiWIFIstatus()
{
    WIFI4_cmdSingle("AT+S.STS=","wifi_state");

}
void ispitajACT(uint8_t *resp)
{
 if(!strncmp(resp,"+ACT:",5))
 {
  uint8_t read;
  // act signal
  strcpy(resp,resp+5);
  if(!strncmp(resp,"RELAY_R1",8))
  {
    strcpy(resp,resp+9);
  if(resp[0] == 0x30)
     {
      read=0;
     }
     else  if(resp[0] == 0x31)
     {
      read=1;
     }
     if(0 != read)
     {
      state=1;
     }else
     {
      state=0;
     }
  }else {
  if(!strncmp(resp,"RELAY_R2",8))
  {
    strcpy(resp,resp+9);

     if(resp[0] == '0')
     {
      read=0;
     }
     else if(resp[0] == '1')
     {
      read=1;
     }
     if(0 != read)
     {
      state2=1;
     }else
     {
      state2=0;
     }
  }
  }
 }
}
void defaultHandler(uint8_t *resp,uint8_t *args)
{
 mikrobus_logWrite(resp,_LOG_LINE);
 ispitajACT(resp);

 }
 
void windHandler(uint8_t *resp,uint8_t *args)
{
   mikrobus_logWrite("AAAA",_LOG_LINE);
}
void systemInit()
{
    //setting pins for WIFI4 click
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_INPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_OUTPUT );
    mikrobus_uartInit(_MIKROBUS1,&_WIFI4_UART_CFG[0]);

    mikrobus_logInit(_LOG_USBUART_B,115200);
    
    //setting pins for RELAY click
    mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
}

void appInit()
{
 WIFI4_uartDriverInit((T_WIFI4_P)&_MIKROBUS1_GPIO,(T_WIFI4_P)&_MIKROBUS1_UART);
 relay_gpioDriverInit((T_RELAY_P)&_MIKROBUS2_GPIO);
 //init interrupts
 InitTimer1();
 uartInterrupt();
 //core init WIFI4click
 WIFI4_coreInit(defaultHandler,1500);
 WIFI4_setHandler("+WIND",1500,windHandler);
 Delay_100ms();

 //reset device
 WIFI4_modulePower(0);
 Delay_100ms();
 WIFI4_modulePower(1);
 Delay_ms(500);
 WIFI4_cmdSingle("AT","");
  //connect to AP
 nakacisena_gateway();
 Delay_ms(3000);
    
    


  WIFI4_cmdSingle("AT&V","");
  Delay_ms(1000);
  WIFI4_socketServerOpen(32000);
  Delay_ms(1500);

  //relay default states config
  state=0;
  state2=0;
  oldstate=0;
  oldstate2=0;
  relay_relay1Control(0);
  relay_relay2Control(0);
}

void appTask()
{
  WIFI4_process();
  
  //RELAY ACT
  if(state == 1 && oldstate == 0)
  {
   oldstate=1;
   relay_relay1Control(1);
   WIFI4_socketServerWrite("REL1 ON\n");
  }
   if(state == 0 && oldstate == 1)
  {
   oldstate=0;
   relay_relay1Control(0);
   WIFI4_socketServerWrite("REL1 OFF\n");
  }
   if(state2 == 1 && oldstate2 == 0)
  {
   oldstate2=1;
   relay_relay2Control(1);
   WIFI4_socketServerWrite("REL2 ON\n");
  }
   if(state2 == 0 && oldstate2 == 1)
  {
   oldstate2=0;
   relay_relay2Control(0);
   WIFI4_socketServerWrite("REL2 OFF\n");
  }
  Delay_100ms();
}


void main() 
{
 systemInit();
 appInit();
 mikrobus_logWrite("PROBA",_LOG_LINE);
  while(1)
  {
   appTask();
  }



}