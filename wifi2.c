/* EXAMPLE WIFI4 CLICK
  to see all at commands for WIFI module visit url:
  https://www.st.com/content/ccc/resource/technical/document/user_manual/4e/4d/c3/82/43/f1/4c/24/DM00100306.pdf/files/DM00100306.pdf/jcr:content/translations/en.DM00100306.pdf

*/
#include "WIFI4_CLICK.h"
#include "WIFI4_timer.h"
#include "WIFI4_uart.h"
#include "page.h"
#define T_RELAY_P uint8_t*



uint8_t state,oldstate,state2,oldstate2;
void uploadujFajlove()
{
  wifi4_cmdSingle("AT+S.FSL","");
  Delay_100ms();
  wifi4_createFile("/proba.html",html);
  Delay_100ms();
  wifi4_createFile("/layout.css",layout);
  Delay_100ms();
  wifi4_createFile("/logic.js",js);
  Delay_100ms();
  wifi4_cmdSingle("AT+S.FSL","");
}
void nakacisena_gateway()
{
    mikrobus_logWrite( "KACENJE NA GATEWAY ....", _LOG_TEXT );
    wifi4_connectToAP("MikroE Public","mikroe.guest") ;
    Delay_ms(4000);

    mikrobus_logWrite( "GOTOVO", _LOG_LINE );
}
void vidiipadresu()
{
    wifi4_cmdSingle("AT+S.STS=","ip_ipaddr");

}
void pisiWIFIstatus()
{
    wifi4_cmdSingle("AT+S.STS=","wifi_state");

}
void ACThandler(uint8_t *resp,uint8_t *args)
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

     if(resp[0] == 0x30)
     {
      read=0;
     }
     else if(resp[0] == 0x31)
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
 wifi4_uartDriverInit((T_WIFI4_P)&_MIKROBUS1_GPIO,(T_WIFI4_P)&_MIKROBUS1_UART);
 relay_gpioDriverInit((T_RELAY_P)&_MIKROBUS2_GPIO);
 //init interrupts
 InitTimer1();
 uartInterrupt();
 //core init WIFI4click
 wifi4_coreInit(defaultHandler,1500);
 wifi4_setHandler("+ACT",1500,ACThandler);
 Delay_100ms();

 //reset device
 wifi4_modulePower(0);
 Delay_100ms();
 wifi4_modulePower(1);
 Delay_ms(1500);
 wifi4_cmdSingle("AT","");
 
  //connect to AP
 nakacisena_gateway();
  vidiipadresu();
  
   Delay_ms(1000);
   uploadujFajlove();
   
   
  //relay default states config
  state=0;
  state2=0;
  oldstate=0;
  oldstate2=0;
  relay_relay1Control(0);
  relay_relay2Control(0);
  mikrobus_logWrite("PROBA",_LOG_LINE);
}

void appTask()
 {
  wifi4_process();
  mikrobus_logWrite("PROBA",_LOG_LINE);
 Delay_ms(3000);
  //RELAY ACT
  if(state == 1 && oldstate == 0)
  {
   oldstate=1;
   relay_relay1Control(1);
   wifi4_socketServerWrite("REL1 ON\n");
  }
   if(state == 0 && oldstate == 1)
  {
   oldstate=0;
   relay_relay1Control(0);
   wifi4_socketServerWrite("REL1 OFF\n");
  }
   if(state2 == 1 && oldstate2 == 0)
  {
   oldstate2=1;
   relay_relay2Control(1);
   wifi4_socketServerWrite("REL2 ON\n");
  }
   if(state2 == 0 && oldstate2 == 1)
  {
   oldstate2=0;
   relay_relay2Control(0);
   wifi4_socketServerWrite("REL2 OFF\n");
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