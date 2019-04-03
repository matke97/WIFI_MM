#include"WIFI4_CLICK.h"
const uint8_t _WIFI4_CALLBACK_EN=0;
/**
  * @brief Timer interrupt init
 */
void InitTimer1(){
  T1CON         	=	0x8010;
  T1IP0_bit         = 	1;
  T1IP1_bit         = 	1;
  T1IP2_bit         = 	1;
  T1IF_bit         	= 	0;
  T1IE_bit         	= 	1;
  PR1               = 	10000;
  TMR1              = 	0;
}
/**
  * @brief Timer interrupt routine
*/
void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
  T1IF_bit         = 0;
  WIFI4_tick();
}