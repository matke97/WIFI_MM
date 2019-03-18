#line 1 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI4_CLICK.c"
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
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 80 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
static void hal_uartMap( const uint8_t*  uartObj);
#line 89 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
static void hal_uartWrite(uint8_t input);
#line 98 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
static uint8_t hal_uartRead();
#line 107 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
static uint8_t hal_uartReady();
#line 117 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
typedef void (*T_hal_gpioSetFp)(uint8_t);
#line 123 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
typedef uint8_t (*T_hal_gpioGetFp)();
#line 132 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
typedef struct
{
 T_hal_gpioSetFp gpioSet[ 12 ];
 T_hal_gpioGetFp gpioGet[ 12 ];

}T_hal_gpioObj;
#line 143 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
static T_hal_gpioGetFp hal_gpio_csGet;
#line 182 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
static T_hal_gpioSetFp hal_gpio_rstSet;
#line 197 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
static T_hal_gpioSetFp hal_gpio_intSet;
#line 215 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
static void hal_gpioMap( const uint8_t*  gpioObj)
{
  const T_hal_gpioObj*  tmp = ( const T_hal_gpioObj* )gpioObj;
#line 262 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
 hal_gpio_rstSet = tmp->gpioSet[  1  ];
#line 277 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
 hal_gpio_intSet = tmp->gpioSet[  7  ];
#line 291 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__wifi4_hal.c"
}
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__hal_pic32.c"
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 143 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/__hal_pic32.c"
typedef void ( *T_hal_uartWriteFp )(unsigned int);
typedef unsigned int ( *T_hal_uartReadFp )();
typedef unsigned int ( *T_hal_uartReadyFp )();

typedef struct
{
 T_hal_uartWriteFp uartWrite;
 T_hal_uartReadFp uartRead;
 T_hal_uartReadyFp uartReady;

}T_hal_uartObj;

static T_hal_uartWriteFp fp_uartWrite;
static T_hal_uartReadFp fp_uartRead;
static T_hal_uartReadyFp fp_uartReady;

static void hal_uartMap( const uint8_t*  uartObj)
{
  const T_hal_uartObj*  tmp = ( const T_hal_uartObj* )uartObj;

 fp_uartWrite = tmp->uartWrite;
 fp_uartRead = tmp->uartRead;
 fp_uartReady = tmp->uartReady;
}

static void hal_uartWrite(uint8_t input)
{
 fp_uartWrite(input);
}

static uint8_t hal_uartRead()
{
 return ( uint8_t )fp_uartRead();
}

static uint8_t hal_uartReady()
{
 return ( uint8_t )fp_uartReady();
}
#line 24 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI4_CLICK.c"
const uint8_t _WIFI4_EVARG_START_T = 0;
const uint8_t _WIFI4_EVARG_END_T = 1;
const uint8_t _WIFI4_EVARG_EVENT_T = 2;
extern const uint8_t _WIFI4_CALLBACK_EN;
const uint8_t _WIFI4_EVENT_RESPONSE = 0x00;
const uint8_t _WIFI4_EVENT_TIMEOUT = 0x01;
const uint8_t _WIFI4_EVENT_BUFFER_OUT = 0x02;
const uint8_t _WIFI4_EVENT_CALLBACK = 0x04;
const uint8_t _WIFI4_STORAGE_SIZE=8;

static uint8_t txBuff[ 2500 ];


static void DTE_setState(uint8_t state)
{

 if (1 == state)
 {
 hal_gpio_intSet( 0 );
 }
 else
 {
 hal_gpio_intSet( 1 );
 }

}

static uint8_t DCE_getState()
{

 if (0 != hal_gpio_csGet())
 {
 return 0;
 }
 else
 {
 return 1;
 }

}



typedef struct
{

 uint16_t len;

 uint32_t hash;

 uint32_t timeout;

 T_WIFI4_handler handler;

}T_CORE_obj;


typedef struct
{
 volatile uint8_t buff[ 2500 ];
 volatile uint16_t ind;
}T_WIFI4_rx_buff;

typedef struct
{
 uint16_t idx;
 T_CORE_obj storage[_WIFI4_STORAGE_SIZE];

}T_handler_storage;
typedef struct
{

 T_WIFI4_handler fpHdl;

 uint32_t wDogLimit;

 uint8_t evArg[3];

}T_CORE_event;


static volatile T_WIFI4_rx_buff rxB;
static volatile T_handler_storage hdB;
static volatile T_CORE_event currentEv;


static volatile uint8_t respEnd;
static volatile uint32_t respTime;





static char LUT_START [3][2] =
{
 "",
 "+",
 "&",
};
static char LUT_END[4][2] =
{
 "",
 "=" ,
 ":",
 "\r"
};
#line 135 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI4_CLICK.c"
static uint32_t generateHash( char *pCmd )
{
 uint8_t cnt = 0;
 uint16_t ch = 0;
 uint32_t hash = 5;

 while ( ch = *pCmd++ )
 {
 hash += (ch << (cnt % 8));
 cnt++;
 }
 return hash;
}
#line 151 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI4_CLICK.c"
static uint16_t locateHandler( char* pCmd )
{
 uint8_t len;
 uint16_t idx;
 uint32_t hash;

 idx = 0;
 len = strlen(pCmd);
 hash = generateHash(pCmd);

 for (idx = 1; idx < hdB.idx; idx++)
 {
 if (hdB.storage[idx].len == len)
 {
 if (hdB.storage[idx].hash == hash)
 {
 return idx;
 }
 }
 }

 return 0;
}

const uint8_t SEARCH_IDX = 0;
const uint8_t SEARCH_OFFSET = 1;

static uint8_t searchLut( char* pInput, char (*pLut)[  2  ], uint8_t lutSize, uint8_t flag )
{
 uint8_t inLen = 0;
 uint8_t inOff = 0;
 uint8_t lutLen = 0;
 uint8_t lutIdx = 0;

 if ( 10  < (inLen = strlen(pInput)))
 {
 inLen = 10 ;
 }

 for (lutIdx = 1; lutIdx < lutSize; lutIdx++)
 {
 lutLen = strlen(pLut[lutIdx]);

 for (inOff = 0; inOff < inLen; inOff++)
 {
 if (!strncmp(pLut[lutIdx], pInput + inOff, lutLen))
 {
 if (SEARCH_IDX == flag)
 {
 return lutIdx;
 }
 else if (SEARCH_OFFSET == flag)
 {
 return inOff;
 }
 }
 }
 }
 return 0;
}
static void createEvent( char *pInput, T_CORE_event *pEvent )
{
 uint8_t hIdx = 0;
 uint8_t startIdx = 0;
 uint8_t startOff = 0;
 uint8_t endIdx = 0;
 uint8_t endOff = 0;

 char tmp[ 10  + 1] = { 0 };


 startIdx = searchLut(pInput, LUT_START,  3 , SEARCH_IDX);
 startOff = searchLut(pInput, LUT_START,  3 , SEARCH_OFFSET);
 endIdx = searchLut(pInput, LUT_END,  4 , SEARCH_IDX);
 endOff = searchLut(pInput, LUT_END,  4 , SEARCH_OFFSET);

 if (0 == endOff)
 {
 endOff =  10 ;
 }


 strncpy(tmp, pInput + startOff, endOff - startOff);
 hIdx = locateHandler(tmp);
 pEvent->fpHdl = hdB.storage[hIdx].handler;
 pEvent->wDogLimit = hdB.storage[hIdx].timeout;


}
static volatile uint16_t watchDogTime;
static volatile uint8_t flag_timesUp;
static volatile uint8_t flag_wdogOut;
static volatile uint8_t flag_cmdEx;
static volatile uint8_t f_wdogStart;
static volatile uint8_t f_timerStart;
static volatile uint16_t waitTime;
void WIFI4_coreInit(T_WIFI4_handler defaultHdl, uint32_t defaultWdog)
{

 flag_cmdEx = 0;

 flag_timesUp=0;
 flag_wdogOut=0;

 waitTime= 5 ;

 hdB.storage[0].handler = defaultHdl;
 hdB.storage[0].timeout = defaultWdog;
 hdB.storage[0].hash = generateHash("");
 hdB.storage[0].len = 0;
 hdB.idx = 1;
}

uint16_t WIFI4_setHandler( uint8_t *pCmd, uint32_t timeout, T_WIFI4_handler pHandler )
{

 if (_WIFI4_STORAGE_SIZE <= hdB.idx)
 {
 return 0;
 }
 if (locateHandler(pCmd))
 {
 return 0;
 }


 if (0 == pHandler)
 {
 hdB.storage[hdB.idx].handler = hdB.storage[0].handler;
 }
 else
 {
 hdB.storage[hdB.idx].handler = pHandler;
 }
 if (0 == timeout)
 {
 hdB.storage[hdB.idx].timeout =hdB.storage[0].timeout;
 }
 else
 {
 hdB.storage[hdB.idx].timeout = timeout;
 }

 hdB.storage[hdB.idx].len = strlen(pCmd);
 hdB.storage[hdB.idx].hash = generateHash(pCmd);
 hdB.idx++;

 return hdB.idx-1;
}
#line 304 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI4_CLICK.c"
void WIFI4_responseRec(uint16_t timeW)
{
 volatile uint32_t cnt;
 uint32_t nTicks= timeW*20;
 uint8_t prev,curr;
 uint8_t flag1=0,endFLag=0;
 curr=0;
 cnt=0;
 while( 1 != endFlag && rxB.ind< 2500 )
 {

 if(respTime>timeW)
 {
 endFlag=1;
 }
 }

 rxB.buff[rxB.ind]='\0';
}
void StrToHex(uint8_t *string,uint8_t *output)
{
 char tmp[3];
 char hex[80];
 uint8_t i;
 strcpy(hex,"");

 for(i=0;i<strlen(string)-1;i++)
 {
 ByteToHex(string[i],tmp);
 strcat(hex,tmp);
 }
 strcpy(output,hex);
}

void WIFI4_writeText(uint8_t *txt,uint8_t nBytes)
{
 uint8_t i;
 for(i=0;i<nBytes;i++)
 {
 hal_uartWrite(txt[i]);
 }
 hal_uartWrite( 0x0D );
}
#line 350 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI4_CLICK.c"
 void WIFI4_writeText2(uint8_t *txt)
{

 while(0 != *txt)
 {
 hal_uartWrite(*txt++);
 }
 hal_uartWrite( 0x0D );
 }

void WIFI4_modulePower( uint8_t powerState )
{
 if (0 != powerState)
 {

 hal_gpio_rstSet(1);

 }
 else
 {

 hal_gpio_rstSet(0);
 }
}

void WIFI4_uartDriverInit( const uint8_t*  gpio, const uint8_t*  uart)
{
 hal_gpioMap(( const uint8_t* )gpio);
 hal_uartMap(( const uint8_t* )uart);
 rxB.ind=0;
 respTime=0;
 rxB.buff[0]=0;
 rxB.ind=0;
 hal_gpio_rstSet(1);
}
#line 389 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/WIFI4_CLICK.c"
void WIFI4_setSSID(uint8_t *ssid)
{
 char comm[30]="AT+S.SSIDTXT=";
 strcat(comm,ssid);
 WIFI4_writeText2(comm);
}
void WIFI4_getSSID()
{
 const char comm[]="AT+S.GCFG=wifi_ssid";
 WIFI4_cmdSingle(comm,"");
}

void WIFI4_cmdSingle(char* command,char *param){
 char tmp[50];
 strcpy(tmp,command);
 strcat(tmp,param);
 strcpy(txBuff,tmp);

 while(0 != flag_cmdEx)
 {
 WIFI4_process();
 }
 createEvent(tmp,&currentEv);
 WIFI4_writeText2(tmp);

 watchDogTime=0;
 waitTime= 5 ;
 f_wdogStart=1;
 f_timerStart=1;
 flag_cmdEx=1;

 while(0 != flag_cmdEx)
 {
 WIFI4_process();
 }
 }

void WIFI4_ping(uint8_t *ipAddr)
{
 char tmp[50];
 strcpy(tmp,"AT+S.PING=");
 strcat(tmp,ipAddr);
 while(0 != flag_cmdEx)
 {
 WIFI4_process();
 }
 createEvent(tmp,&currentEv);
 currentEv.wDogLimit=3*currentEv.wDogLimit;

 waitTime=2000;
 WIFI4_writeText2(tmp);
 watchDogTime=0;
 f_wdogStart=1;
 f_timerStart=1;
 flag_cmdEx=1;

 while(0 != flag_cmdEx)
 {
 WIFI4_process();
 }
 waitTime= 5 ;

}
void WIFI4_connectToAP(uint8_t* ssid,uint8_t *pass)
{
 uint8_t newPass[80];


 WIFI4_cmdSingle("AT+S.SSIDTXT=",ssid);


 strcpy(newPass,"wifi_wpa_psk_text,\"");
 strcat(newPass,pass);
 strcat(newPass,"\"");
 WIFI4_cmdSingle("AT+S.SCFG=",newPass);
}
void WIFI4_putc(char c)
{
 flag_cmdEx=1;
 f_timerStart=1;
 respTime=0;
 rxB.buff[rxB.ind++]=c;

}

void WIFI4_tick()
{
 if(f_timerStart){
 if((++respTime) > waitTime)
 {
 flag_timesUp=1;

 }
 }
 if(f_wdogStart){
 if((++watchDogTime) > currentEv.wDogLimit)
 {
 flag_wdogOut=1;

 }
 }
}

void WIFI4_process()
{

 if(f_wDogStart){
 if(flag_wdogOut)
 {



 f_wdogStart=0;
 f_timerStart=0;
 rxB.buff[rxB.ind]='\0';
 createEvent(rxB.buff, &currentEv);
  { currentEv.evArg[_WIFI4_EVARG_EVENT_T] = _WIFI4_EVENT_RESPONSE; currentEv.fpHdl(rxB.buff, currentEv.evArg); } ;
 rxB.buff[0]=0;
 rxB.ind=0;
 flag_wdogOut=0;
 flag_cmdEx=0;


 }
 }
 if(f_TimerStart){
 if(flag_timesUp)
 {



 f_wdogStart=0;
 f_timerStart=0;
 rxB.buff[rxB.ind]='\0';
 createEvent(rxB.buff, &currentEv);
  { currentEv.evArg[_WIFI4_EVARG_EVENT_T] = _WIFI4_EVENT_RESPONSE; currentEv.fpHdl(rxB.buff, currentEv.evArg); } ;
 rxB.buff[0]=0;
 rxB.ind=0;
 flag_timesUp=0;
 flag_cmdEx=0;


 }
 }
}
