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


void WIFI4_uartDriverInit( const uint8_t*  gpio, const uint8_t*  uart);
void WIFI4_writeText(uint8_t *txt,uint8_t nBytes);
void WIFI4_cmdSingle(char* command,char *param);

void WIFI4_connectToAP(uint8_t* ssid,uint8_t *pass);

void WIFI4_putc(char c);

void WIFI4_modulePower(uint8_t powerState );
void WIFI4_setSSID(uint8_t *ssid);
void WIFI4_getSSID();
void WIFI4_tick();
void WIFI4_process();
void WIFI4_ping(uint8_t *ipAddr);
void WIFI4_coreInit(T_WIFI4_handler defaultHdl, uint32_t defaultWdog);
uint16_t WIFI4_setHandler( uint8_t *pCmd, uint32_t timeout, T_WIFI4_handler pHandler );
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
#line 8 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI.c"
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
void nakacisena_gateway()
{
#line 34 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI.c"
 mikrobus_logWrite( "KACENJE NA GATEWAY ....", _LOG_TEXT );
 WIFI4_cmdSingle("AT+S.SCFG=","ip_use_dhcp,\"1\"");
 WIFI4_connectToAP("Mikroe Public","mikroe.guest");
 Delay_ms(3000);

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
uint8_t in;
void appInit()
{
 WIFI4_uartDriverInit(( const uint8_t* )&_MIKROBUS1_GPIO,( const uint8_t* )&_MIKROBUS1_UART);
 InitTimer1();
 uartInterrupt();
 WIFI4_coreInit(defaultHandler,1500);
 Delay_ms(500);


 WIFI4_modulePower(0);
 Delay_100ms();
 WIFI4_modulePower(1);
 Delay_ms(1000);



 WIFI4_cmdSingle("AT","");
 nakacisena_gateway();
 WIFI4_cmdSingle("AT&V","");
 Delay_ms(1500);

}
void appTask()
{
 WIFI4_process();

 mikrobus_logWrite("PRVA KOMANDA",_LOG_LINE);
 vidiipadresu();
 Delay_ms(500);
 mikrobus_logWrite("DRUGA KOMANDA",_LOG_LINE);
 pisiWIFIstatus();
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
