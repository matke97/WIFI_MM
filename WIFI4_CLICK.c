#include "WIFI4_CLICK.h"
#include "__WIFI4_hal.c"

#define TERMINATION_CHAR 0x0D
#define BUFF_MAXSIZE 2500
/*
#define CR_CHAR 0x0D
#define LF_CHAR 0x0A
 */
 //podrazumevano vreme cekanja sa poslednjeg prijema poruke sa uarta
#define DEFAULT_WTIME 5
#define  LUTS_WIDTH 2
#define LUT_SIZE 3
#define LUT_SIZE_END 4
#define _WIFI4_CMD_MAXSIZE 10


#define EXEC_EVENT(x)                                                          \
{ currentEv.evArg[_WIFI4_EVARG_EVENT_T] = x; currentEv.fpHdl(rxB.buff, currentEv.evArg); }

#define EXEC_CALLBACK()                                                        \
if (0 !=_WIFI4_CALLBACK_EN)                                       \
{ currentEv.evArg[_WIFI4_EVARG_EVENT_T] = _WIFI4_EVENT_CALLBACK; currentEv.fpHdl(txBuff, currentEv.evArg); }
const uint8_t _WIFI4_EVARG_START_T    = 0;
const uint8_t _WIFI4_EVARG_END_T      = 1;
const uint8_t _WIFI4_EVARG_EVENT_T    = 2;
extern const uint8_t _WIFI4_CALLBACK_EN;
const uint8_t _WIFI4_EVENT_RESPONSE   = 0x00;
const uint8_t _WIFI4_EVENT_TIMEOUT    = 0x01;
const uint8_t _WIFI4_EVENT_BUFFER_OUT = 0x02;
const uint8_t _WIFI4_EVENT_CALLBACK   = 0x04;
const uint8_t _WIFI4_STORAGE_SIZE=8;

static uint8_t                      txBuff[BUFF_MAXSIZE];


static void DTE_setState(uint8_t state)
{
// True = DTE free / False = DTE busy
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
// True = DCE free / False = DCE busy
    if (0 != hal_gpio_csGet())
    {
        return 0;
    }
    else
    {
        return 1;
    }

}


//structures for response reciving
typedef struct
{
    /** Command Length */
    uint16_t                    len;
    /** Command Hash Value */
    uint32_t                    hash;
    /** Command Timeout */
    uint32_t                    timeout;
    /** Callback/Handler */
    T_WIFI4_handler   handler;

}T_CORE_obj;

//recive buffer for Response
typedef struct
{
 volatile uint8_t buff[BUFF_MAXSIZE];
 volatile uint16_t ind;
}T_WIFI4_rx_buff;

typedef struct
{
    uint16_t                    idx;
    T_CORE_obj                  storage[_WIFI4_STORAGE_SIZE];

}T_handler_storage;
typedef struct
{
    /** Pointer to handler for the particular command */
    T_WIFI4_handler   fpHdl;
    /** Watchdog timer for particular command */
    uint32_t                    wDogLimit;
    /** Event arguments */
    uint8_t                     evArg[3];

}T_CORE_event;


static volatile T_WIFI4_rx_buff rxB;
static volatile T_handler_storage hdB; // handler func buffer
static volatile T_CORE_event currentEv; //trenutna komanda, dogadjaj za obradu


static volatile uint8_t respEnd;// response ENDED
static volatile uint32_t respTime;

//HELP FUNCTIONS


//LOOK UP TABLE
static char LUT_START [3][2] =
{
 "", //default
 "+", //
 "&", //AT& -storing to flash mem or reset of device
};
static char LUT_END[4][2] =
{
  "", //default
  "=" ,
  ":",
  "\r" //exec
};

/*
hash generator- generise jednostavan hash za odredjenu komandu
da bi se mogla lakse prepoznati i locirati handler za tu komandu
*/
static uint32_t generateHash( char *pCmd )
{
    uint8_t  cnt  = 0;
    uint16_t ch   = 0;
    uint32_t hash = 5;

    while ( ch = *pCmd++ )
    {
        hash += (ch << (cnt % 8));
        cnt++;
    }
    return hash;
}
/*
  locira handler
*/
static uint16_t locateHandler( char* pCmd )
{
    uint8_t     len;
    uint16_t    idx;
    uint32_t    hash;

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

const uint8_t SEARCH_IDX         = 0;
const uint8_t SEARCH_OFFSET      = 1;

static uint8_t searchLut( char* pInput, char (*pLut)[ LUTS_WIDTH ], uint8_t lutSize, uint8_t flag )
{
    uint8_t     inLen    = 0;
    uint8_t     inOff    = 0;
    uint8_t     lutLen   = 0;
    uint8_t     lutIdx   = 0;

    if (_WIFI4_CMD_MAXSIZE < (inLen = strlen(pInput)))
    {
        inLen =_WIFI4_CMD_MAXSIZE;
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
    uint8_t hIdx     = 0;
    uint8_t startIdx = 0;
    uint8_t startOff = 0;
    uint8_t endIdx   = 0;
    uint8_t endOff   = 0;

    char tmp[_WIFI4_CMD_MAXSIZE + 1] = { 0 };

//  SEARCH LUTS
    startIdx = searchLut(pInput, LUT_START, LUT_SIZE, SEARCH_IDX);
    startOff = searchLut(pInput, LUT_START, LUT_SIZE, SEARCH_OFFSET);
    endIdx = searchLut(pInput, LUT_END, LUT_SIZE_END, SEARCH_IDX);
    endOff = searchLut(pInput, LUT_END, LUT_SIZE_END, SEARCH_OFFSET);

    if (0 == endOff)
    {
        endOff = _WIFI4_CMD_MAXSIZE;
    }

//  SEARCH STORAGE
    strncpy(tmp, pInput + startOff, endOff - startOff);
    hIdx                         = locateHandler(tmp);
    pEvent->fpHdl                = hdB.storage[hIdx].handler;
    pEvent->wDogLimit            = hdB.storage[hIdx].timeout;
   // pEvent->evArg[_G2C_EVARG_START_T]  = startIdx;
    //pEvent->evArg[_G2C_EVARG_END_T]    = endIdx;
}
static volatile uint16_t watchDogTime;
static volatile uint8_t flag_timesUp;
static volatile uint8_t flag_wdogOut;
static volatile uint8_t flag_cmdEx;
static volatile uint8_t f_wdogStart;
static volatile uint8_t f_timerStart;
static volatile uint16_t waitTime; //set wait for ending of response->for ping
static volatile uint8_t f_cpyRXtoTmp;
void WIFI4_coreInit(T_WIFI4_handler defaultHdl, uint32_t defaultWdog)
{
    // KASNIJE SETUJ
    flag_cmdEx          = 0;
    //f_buffer_warning           = false;
    flag_timesUp=0;
   flag_wdogOut=0;

   waitTime=DEFAULT_WTIME;
//  HANDLER STORAGE INIT - 0 POSITION = DEFAULT HANDLER- za sve fje
    hdB.storage[0].handler = defaultHdl;
    hdB.storage[0].timeout = defaultWdog;
    hdB.storage[0].hash    = generateHash("");
    hdB.storage[0].len     = 0;
    hdB.idx                = 1;
}

uint16_t WIFI4_setHandler( uint8_t *pCmd, uint32_t timeout, T_WIFI4_handler pHandler )
{

    if (_WIFI4_STORAGE_SIZE <= hdB.idx)
    {
        return 0;
    }
    if (locateHandler(pCmd)) //ako vec postoji handler za komandu
    {
        return 0;
    }

//  STORE NEW HANDLER
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

    hdB.storage[hdB.idx].len  = strlen(pCmd);
    hdB.storage[hdB.idx].hash = generateHash(pCmd);
    hdB.idx++;

    return hdB.idx-1; //return index in handler storage
}

/*
  response reciver- timeW-max time to wait
*/
void WIFI4_responseRec(uint16_t timeW)
{
     volatile uint32_t cnt;//counter
     uint32_t nTicks= timeW*20;  //number of "ticks" for waiting on response
     uint8_t prev,curr;
     uint8_t flag1=0,endFLag=0;
    curr=0;
    cnt=0;
   while( 1 != endFlag && rxB.ind<BUFF_MAXSIZE)
   {

    if(respTime>timeW) //ako nema odgovra vise od 5ms!
    {
     endFlag=1; // kraj responsa
    }
   }
    //mikrobus_logWrite("KRAJ RESPONSA",_LOG_LINE);
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
 hal_uartWrite(TERMINATION_CHAR);
}
/*
  Writing text to WIFI4 Click module.
*/
 void WIFI4_writeText2(uint8_t *txt)
{

 while(0 != *txt)
 {
    hal_uartWrite(*txt++);
 }
 hal_uartWrite(TERMINATION_CHAR);
 }
//USER FUNCTIONS DEFs
void WIFI4_modulePower( uint8_t powerState )
{
    if (0 != powerState)
    {
//  POWER ON SEQUENCE
        hal_gpio_rstSet(1);

    }
    else
    {
//  POWER OFF SEQUENCE
        hal_gpio_rstSet(0);
    }
}

void WIFI4_uartDriverInit(T_WIFI4_P gpio,T_WIFI4_P uart)
{
 hal_gpioMap((T_HAL_P)gpio);
 hal_uartMap((T_HAL_P)uart);
 rxB.ind=0;
 respTime=0;
 rxB.buff[0]=0;
 rxB.ind=0;
 hal_gpio_rstSet(1);
}
/*
  Writing nBytes on UART
*/

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
     //AKO JE NEKA DRUGA KOMANDA U TOKU,SACEKAJ
      while(0 != flag_cmdEx)
       {
         WIFI4_process();
       }
     createEvent(tmp,&currentEv);
     WIFI4_writeText2(tmp);

     watchDogTime=0; //reset watchdog
     waitTime=DEFAULT_WTIME;
     f_wdogStart=1;
     f_timerStart=1;
     flag_cmdEx=1;
     //sacekaj response
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

        waitTime=2000; //wait 2s
       WIFI4_writeText2(tmp);
         watchDogTime=0; //reset watchdog
        f_wdogStart=1;
        f_timerStart=1;
        flag_cmdEx=1;
     //sacekaj response
       while(0 != flag_cmdEx)
       {
         WIFI4_process();
       }
       waitTime=DEFAULT_WTIME;
       
}
void WIFI4_connectToAP(uint8_t* ssid,uint8_t *pass)
{
  uint8_t newPass[80];
    WIFI4_cmdSingle("AT+S.SCFG=","wifi_priv_mode,2");
    WIFI4_cmdSingle("AT+S.SCFG=","wifi_mode,1");
    WIFI4_cmdSingle("AT+S.SCFG=","ip_use_dhcp,1");
    
   WIFI4_cmdSingle("AT+S.SSIDTXT=",ssid);
   

   strcpy(newPass,"wifi_wpa_psk_text,");
   strcat(newPass,pass);
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
T_WIFI4_rx_buff tmpB; //tmp baf

//funkcija koja se poziva stalno u while petlji->
void WIFI4_process()
{
//WATCHDOG TIMEOUT
  if(f_wDogStart){
    if(flag_wdogOut)
    {
    DTE_setState(0);

    f_wdogStart=0;
    f_timerStart=0;
    rxB.buff[rxB.ind++]='\0';
    createEvent(rxB.buff, &currentEv);
    if(f_cpyRXtoTmp)
    {
     strcpy(tmpB.buff,rxB.buff);
     tmpB.ind=rxB.ind;
     f_cpyRXtoTmp=0;
    }
    EXEC_EVENT(_WIFI4_EVENT_RESPONSE);
    rxB.buff[0]=0;
    rxB.ind=0;
    flag_wdogOut=0;
    flag_cmdEx=0;
    
    DTE_setState(1);

    }
    }
    if(f_TimerStart){
    if(flag_timesUp)
    {
     DTE_setState(0);
     f_wdogStart=0;
      f_timerStart=0;
       rxB.buff[rxB.ind++]='\0';
         createEvent(rxB.buff, &currentEv);
       EXEC_EVENT(_WIFI4_EVENT_RESPONSE);
       if(f_cpyRXtoTmp)
    {
     strcpy(tmpB.buff,rxB.buff);
     tmpB.ind=rxB.ind;
     f_cpyRXtoTmp=0;
    }
     rxB.buff[0]=0;
     rxB.ind=0;
      flag_timesUp=0;
      flag_cmdEx=0;
      DTE_setState(1);
    }
    }
}

void WIFI4_createFile(uint8_t *name,uint16_t len)
{
 uint8_t params[50];
 strcpy(params,name);
 strcat(params,",");
 strcat(params,len);
 WIFI4_cmdSingle("AT+S.FSC=",params);
}
/*
  Open socket -> 
  host - ip address od DNS resolvable name
  port - TCP/UDP socket port
  protocol-t for TCP,u for UDP and s for secure protcol
  
*/
uint8_t WIFI4_socketOpen(uint8_t *host,uint16_t port,uint8_t protocol)
{
     char tmp[50];
     uint8_t i,ret;
     uint8_t sPort[6];
     IntToStr(port,sPort);
     strcpy(tmp,"AT+S.SOCKON=");
     strcat(tmp,host);
     strcat(tmp,',');
     strcat(tmp,sPort);
     strcat(tmp,',');
     strcat(tmp,protocol);

      while(0 != flag_cmdEx)
       {
         WIFI4_process();
       }
       
     createEvent(tmp,&currentEv);
     WIFI4_writeText2(tmp);

     watchDogTime=0; //reset watchdog
     waitTime=DEFAULT_WTIME;
     f_wdogStart=1;
     f_timerStart=1;
     flag_cmdEx=1;
     f_cpyRXtoTmp=1;
     //sacekaj response
       while(0 != flag_cmdEx)
       {
         WIFI4_process();
       }

      i=strchr(tmpB.buff,':');
      ret=atoi(tmpB.buff+i+1);
      return ret;
}
void WIFI4_socketWrite(uint8_t id,uint8_t *wdata)
{
  uint16_t len=strlen(wdata);
  uint8_t slen[4];
  uint8_t cmd[30];
  IntToStr(len,slen);

  strcpy(cmd,"AT+S.SOCKW=");
  strcat(cmd,id);
  strcat(cmd,',');
  strcat(cmd,len);
  
   //AKO JE NEKA DRUGA KOMANDA U TOKU,SACEKAJ
      while(0 != flag_cmdEx)
       {
         WIFI4_process();
       }
  createEvent(cmd,&currentEv);
  WIFI4_writeText2(cmd);
  WIFI4_writeText2(wdata);

     watchDogTime=0; //reset watchdog
     waitTime=DEFAULT_WTIME;
     f_wdogStart=1;
     f_timerStart=1;
     flag_cmdEx=1;
     f_cpyRXtoTmp=0;
     //sacekaj response
       while(0 != flag_cmdEx)
       {
         WIFI4_process();
       }
}
void WIFI4_socketClose(uint8_t id)
{
  uint8_t str[3];
  ByteToStr(id,str);
  WIFI4_cmdSIngle("AT+S.SOCKC=",str);

}