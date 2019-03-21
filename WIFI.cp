#line 1 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI.c"
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 8 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
typedef void ( *T_WIFI4_handler )( char *buffer, uint8_t *evArgs );
#line 20 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_uartDriverInit( const uint8_t*  gpio, const uint8_t*  uart);
#line 31 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_coreInit(T_WIFI4_handler defaultHdl, uint32_t defaultWdog);
#line 43 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_cmdSingle(char* command,char *param);
#line 54 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_connectToAP(uint8_t* ssid,uint8_t *pass);

void WIFI4_putc(char c);
#line 64 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_modulePower(uint8_t powerState );

void WIFI4_setSSID(uint8_t *ssid);
void WIFI4_getSSID();
#line 74 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_tick();
#line 81 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_process();
#line 90 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_ping(uint8_t *ipAddr);
void WIFI4_createFile(uint8_t *name,uint16_t len);
#line 98 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
uint16_t WIFI4_setHandler( uint8_t *pCmd, uint32_t timeout, T_WIFI4_handler pHandler );


uint8_t WIFI4_socketOpen(uint8_t *host,uint32_t port,uint8_t protocol);
void WIFI4_socketClose(uint8_t id);
void WIFI4_socketWrite(uint8_t id,uint8_t *wdata);
#line 111 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_socketServerOpen(uint32_t port);
#line 116 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_socketServerWrite(uint8_t *txt);
#line 122 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
void WIFI4_socketServerClose();
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_timer.h"
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_click.h"
#line 2 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/wifi4_timer.h"
const uint8_t _WIFI4_CALLBACK_EN=0;

void InitTimer1(){
 T1CON = 0x8010;
 T1IP0_bit = 1;
 T1IP1_bit = 1;
 T1IP2_bit = 1;
 T1IF_bit = 0;
 T1IE_bit = 1;
 PR1 = 10000;
 TMR1 = 0;
}

void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
 T1IF_bit = 0;
 WIFI4_tick();
}
#line 9 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI.c"
const uint32_t _WIFI4_UART_CFG[ 1 ] =
{
 115200
};

void uartInterrupt()
{
 U2IP0_bit = 1;
 U2IP1_bit = 1;
 U2IP2_bit = 1;
 U2RXIE_bit = 1;
 EnableInterrupts();
}

void RX_ISR()iv IVT_UART_2 ilevel 7 ics ICS_SRS
{
 if( IFS1 & ( 1 << U2RXIF ))
 {
 char tmp = UART2_Read();
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

 strcpy(resp,resp+5);
 if(!strncmp(resp,"RELAY_R1",8))
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

 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_INPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_OUTPUT );
 mikrobus_uartInit(_MIKROBUS1,&_WIFI4_UART_CFG[0]);

 mikrobus_logInit(_LOG_USBUART_B,115200);


 mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
 mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
}

void appInit()
{
 WIFI4_uartDriverInit(( const uint8_t* )&_MIKROBUS1_GPIO,( const uint8_t* )&_MIKROBUS1_UART);
 relay_gpioDriverInit(( uint8_t* )&_MIKROBUS2_GPIO);

 InitTimer1();
 uartInterrupt();

 WIFI4_coreInit(defaultHandler,1500);
 WIFI4_setHandler("+WIND",1500,windHandler);
 Delay_100ms();


 WIFI4_modulePower(0);
 Delay_100ms();
 WIFI4_modulePower(1);
 Delay_ms(500);
 WIFI4_cmdSingle("AT","");

 nakacisena_gateway();
 Delay_ms(3000);




 WIFI4_cmdSingle("AT&V","");
 Delay_ms(1000);
 WIFI4_socketServerOpen(32000);
 Delay_ms(1500);


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
