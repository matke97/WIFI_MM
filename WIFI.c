/* EXAMPLE WIFI4 CLICK
  to see all at commands for WIFI module visit url: 
  https://www.st.com/content/ccc/resource/technical/document/user_manual/4e/4d/c3/82/43/f1/4c/24/DM00100306.pdf/files/DM00100306.pdf/jcr:content/translations/en.DM00100306.pdf

*/
#include "WIFI4_CLICK.h"
#include "WIFI4_timer.h"
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
void systemInit()
{

    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_INPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_OUTPUT );
    mikrobus_uartInit(_MIKROBUS1,&_WIFI4_UART_CFG[0]);

    mikrobus_logInit(_LOG_USBUART_B,115200);
}
void defaultHandler(uint8_t *resp,uint8_t *args)
{
 mikrobus_logWrite(resp,_LOG_LINE);
 }
 
 uint16_t socket;
void appInit()
{
 InitTimer1();
 uartInterrupt();
 WIFI4_coreInit(defaultHandler,1500);


 Delay_ms(500);
 
 //reset device
 WIFI4_modulePower(0);
 Delay_100ms();
 WIFI4_modulePower(1);
 Delay_ms(1000);

  mikrobus_logWrite("POCETAK....",_LOG_LINE);

  WIFI4_cmdSingle("AT","");
  nakacisena_gateway();
  WIFI4_cmdSingle("AT&V","");
   //socket=WIFI4_socketOpen("10.101.22.202",32000,'t');
  Delay_ms(1500);

}

void appTask()
{
 uint8_t pok=0;
 uint8_t slanje[10];
WIFI4_process();
while(pok++<10)
{
  mikrobus_logWrite("Saljem podatke na soket....",_LOG_TEXT);
  strcpy(slanje,"TEST");
  strcat(slanje,pok);
  //WIFI4_socketWrite(socket,slanje);
  
}
if(pok == 10)
{
   //WIFI4_socketClose(socket);
   pok++;
}
 Delay_ms(4000);

}


void main() {
 systemInit();
 appInit();

 mikrobus_logWrite("PROBA",_LOG_LINE);
  while(1)
  {
   appTask();
  }



}