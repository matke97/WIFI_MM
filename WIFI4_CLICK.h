/*
*/

#ifndef __WIFI4_CLICK_H_
#define __WIFI4_CLICK_H_
#include "stdint.h"
#define T_WIFI4_P  const uint8_t*
typedef void ( *T_WIFI4_handler )( char *buffer, uint8_t *evArgs );

 // static WIFI4_BUFFER testB;
void WIFI4_uartDriverInit(T_WIFI4_P gpio,T_WIFI4_P uart);
void WIFI4_writeText(uint8_t *txt,uint8_t nBytes);
void WIFI4_cmdSingle(char* command,char *param);

void WIFI4_connectToAP(uint8_t* ssid,uint8_t *pass);
//void WIFI4_enabled(bool state);
void WIFI4_putc(char c);
//void WIFI4_writeText2(uint8_t *txt);
void WIFI4_modulePower(uint8_t  powerState );
void WIFI4_setSSID(uint8_t *ssid);
void WIFI4_getSSID();
void WIFI4_tick();
void WIFI4_process();
void WIFI4_ping(uint8_t *ipAddr);
void WIFI4_coreInit(T_WIFI4_handler defaultHdl, uint32_t defaultWdog);
uint16_t WIFI4_setHandler( uint8_t *pCmd, uint32_t timeout, T_WIFI4_handler pHandler );
#endif