_InitTimer1:
;wifi4_timer.h,4 :: 		void InitTimer1(){
;wifi4_timer.h,5 :: 		T1CON         = 0x8010;
ORI	R2, R0, 32784
SW	R2, Offset(T1CON+0)(GP)
;wifi4_timer.h,6 :: 		T1IP0_bit         = 1;
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
;wifi4_timer.h,7 :: 		T1IP1_bit         = 1;
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
;wifi4_timer.h,8 :: 		T1IP2_bit         = 1;
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
;wifi4_timer.h,9 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;wifi4_timer.h,10 :: 		T1IE_bit         = 1;
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
;wifi4_timer.h,11 :: 		PR1                 = 10000;
ORI	R2, R0, 10000
SW	R2, Offset(PR1+0)(GP)
;wifi4_timer.h,12 :: 		TMR1                 = 0;
SW	R0, Offset(TMR1+0)(GP)
;wifi4_timer.h,13 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_Timer1Interrupt:
;wifi4_timer.h,15 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;wifi4_timer.h,16 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;wifi4_timer.h,17 :: 		WIFI4_tick();
JAL	_WIFI4_tick+0
NOP	
;wifi4_timer.h,18 :: 		}
L_end_Timer1Interrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Timer1Interrupt
_uartInterrupt:
;WIFI.c,14 :: 		void uartInterrupt()
;WIFI.c,16 :: 		U2IP0_bit    = 1;
LUI	R2, BitMask(U2IP0_bit+0)
ORI	R2, R2, BitMask(U2IP0_bit+0)
_SX	
;WIFI.c,17 :: 		U2IP1_bit    = 1;
LUI	R2, BitMask(U2IP1_bit+0)
ORI	R2, R2, BitMask(U2IP1_bit+0)
_SX	
;WIFI.c,18 :: 		U2IP2_bit    = 1;
LUI	R2, BitMask(U2IP2_bit+0)
ORI	R2, R2, BitMask(U2IP2_bit+0)
_SX	
;WIFI.c,19 :: 		U2RXIE_bit   = 1;
LUI	R2, BitMask(U2RXIE_bit+0)
ORI	R2, R2, BitMask(U2RXIE_bit+0)
_SX	
;WIFI.c,20 :: 		EnableInterrupts();
EI	R30
;WIFI.c,21 :: 		}
L_end_uartInterrupt:
JR	RA
NOP	
; end of _uartInterrupt
_RX_ISR:
;WIFI.c,23 :: 		void RX_ISR()iv IVT_UART_2 ilevel 7 ics ICS_SRS
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;WIFI.c,25 :: 		if( IFS1 & ( 1 << U2RXIF ))
LW	R2, Offset(IFS1+0)(GP)
ANDI	R2, R2, 512
BNE	R2, R0, L__RX_ISR20
NOP	
J	L_RX_ISR0
NOP	
L__RX_ISR20:
;WIFI.c,27 :: 		char  tmp = UART2_Read();
JAL	_UART2_Read+0
NOP	
;WIFI.c,28 :: 		WIFI4_putc(tmp);
ANDI	R25, R2, 255
JAL	_WIFI4_putc+0
NOP	
;WIFI.c,29 :: 		U2RXIF_bit = 0;
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;WIFI.c,30 :: 		}
L_RX_ISR0:
;WIFI.c,31 :: 		}
L_end_RX_ISR:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _RX_ISR
_nakacisena_gateway:
;WIFI.c,32 :: 		void nakacisena_gateway()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI.c,34 :: 		mikrobus_logWrite( "KACENJE NA GATEWAY ....", _LOG_TEXT );
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr1_WIFI+0)
ORI	R25, R25, lo_addr(?lstr1_WIFI+0)
JAL	_mikrobus_logWrite+0
NOP	
;WIFI.c,38 :: 		WIFI4_connectToAP("MikroE Public","mikroe.guest") ;
LUI	R26, hi_addr(?lstr3_WIFI+0)
ORI	R26, R26, lo_addr(?lstr3_WIFI+0)
LUI	R25, hi_addr(?lstr2_WIFI+0)
ORI	R25, R25, lo_addr(?lstr2_WIFI+0)
JAL	_WIFI4_connectToAP+0
NOP	
;WIFI.c,42 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_nakacisena_gateway1:
ADDIU	R24, R24, -1
BNE	R24, R0, L_nakacisena_gateway1
NOP	
;WIFI.c,44 :: 		mikrobus_logWrite( "GOTOVO", _LOG_LINE );
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr4_WIFI+0)
ORI	R25, R25, lo_addr(?lstr4_WIFI+0)
JAL	_mikrobus_logWrite+0
NOP	
;WIFI.c,45 :: 		}
L_end_nakacisena_gateway:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _nakacisena_gateway
_vidiipadresu:
;WIFI.c,46 :: 		void vidiipadresu()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI.c,48 :: 		WIFI4_cmdSingle("AT+S.STS=","ip_ipaddr");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(?lstr6_WIFI+0)
ORI	R26, R26, lo_addr(?lstr6_WIFI+0)
LUI	R25, hi_addr(?lstr5_WIFI+0)
ORI	R25, R25, lo_addr(?lstr5_WIFI+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI.c,50 :: 		}
L_end_vidiipadresu:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _vidiipadresu
_pisiWIFIstatus:
;WIFI.c,51 :: 		void pisiWIFIstatus()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI.c,53 :: 		WIFI4_cmdSingle("AT+S.STS=","wifi_state");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(?lstr8_WIFI+0)
ORI	R26, R26, lo_addr(?lstr8_WIFI+0)
LUI	R25, hi_addr(?lstr7_WIFI+0)
ORI	R25, R25, lo_addr(?lstr7_WIFI+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI.c,55 :: 		}
L_end_pisiWIFIstatus:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _pisiWIFIstatus
_systemInit:
;WIFI.c,56 :: 		void systemInit()
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;WIFI.c,59 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;WIFI.c,60 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_INPUT );
ORI	R27, R0, 1
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;WIFI.c,61 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_OUTPUT );
MOVZ	R27, R0, R0
ORI	R26, R0, 7
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;WIFI.c,62 :: 		mikrobus_uartInit(_MIKROBUS1,&_WIFI4_UART_CFG[0]);
LUI	R2, hi_addr(__WIFI4_UART_CFG+0)
ORI	R2, R2, lo_addr(__WIFI4_UART_CFG+0)
MOVZ	R26, R2, R0
MOVZ	R25, R0, R0
JAL	_mikrobus_uartInit+0
NOP	
;WIFI.c,63 :: 		mikrobus_logInit(_LOG_USBUART_B,115200);
LUI	R26, 1
ORI	R26, R26, 49664
ORI	R25, R0, 48
JAL	_mikrobus_logInit+0
NOP	
;WIFI.c,64 :: 		}
L_end_systemInit:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _systemInit
_defaultHandler:
;WIFI.c,65 :: 		void defaultHandler(uint8_t *resp,uint8_t *args)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI.c,67 :: 		mikrobus_logWrite(resp,_LOG_LINE);
SW	R26, 4(SP)
ORI	R26, R0, 2
JAL	_mikrobus_logWrite+0
NOP	
;WIFI.c,68 :: 		}
L_end_defaultHandler:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _defaultHandler
_stshandler:
;WIFI.c,69 :: 		void stshandler(uint8_t *resp,uint8_t *args)
;WIFI.c,73 :: 		}
L_end_stshandler:
JR	RA
NOP	
; end of _stshandler
_appInit:
;WIFI.c,74 :: 		void appInit()
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;WIFI.c,76 :: 		WIFI4_uartDriverInit((T_WIFI4_P)&_MIKROBUS1_GPIO,(T_WIFI4_P)&_MIKROBUS1_UART);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LUI	R26, hi_addr(__MIKROBUS1_UART+0)
ORI	R26, R26, lo_addr(__MIKROBUS1_UART+0)
LUI	R25, hi_addr(__MIKROBUS1_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS1_GPIO+0)
JAL	_WIFI4_uartDriverInit+0
NOP	
;WIFI.c,77 :: 		InitTimer1();
JAL	_InitTimer1+0
NOP	
;WIFI.c,78 :: 		uartInterrupt();
JAL	_uartInterrupt+0
NOP	
;WIFI.c,79 :: 		WIFI4_coreInit(defaultHandler,1500);
ORI	R26, R0, 1500
LUI	R25, hi_addr(_defaultHandler+0)
ORI	R25, R25, lo_addr(_defaultHandler+0)
JAL	_WIFI4_coreInit+0
NOP	
;WIFI.c,80 :: 		WIFI4_setHandler("#  ip_ipaddr =",1500,stshandler);
LUI	R27, hi_addr(_stshandler+0)
ORI	R27, R27, lo_addr(_stshandler+0)
ORI	R26, R0, 1500
LUI	R25, hi_addr(?lstr9_WIFI+0)
ORI	R25, R25, lo_addr(?lstr9_WIFI+0)
JAL	_WIFI4_setHandler+0
NOP	
;WIFI.c,81 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_appInit3:
ADDIU	R24, R24, -1
BNE	R24, R0, L_appInit3
NOP	
NOP	
NOP	
;WIFI.c,84 :: 		WIFI4_modulePower(0);
MOVZ	R25, R0, R0
JAL	_WIFI4_modulePower+0
NOP	
;WIFI.c,85 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;WIFI.c,86 :: 		WIFI4_modulePower(1);
ORI	R25, R0, 1
JAL	_WIFI4_modulePower+0
NOP	
;WIFI.c,87 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_appInit5:
ADDIU	R24, R24, -1
BNE	R24, R0, L_appInit5
NOP	
;WIFI.c,91 :: 		WIFI4_cmdSingle("AT","");
LUI	R26, hi_addr(?lstr11_WIFI+0)
ORI	R26, R26, lo_addr(?lstr11_WIFI+0)
LUI	R25, hi_addr(?lstr10_WIFI+0)
ORI	R25, R25, lo_addr(?lstr10_WIFI+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI.c,92 :: 		nakacisena_gateway();
JAL	_nakacisena_gateway+0
NOP	
;WIFI.c,93 :: 		WIFI4_cmdSingle("AT&V","");
LUI	R26, hi_addr(?lstr13_WIFI+0)
ORI	R26, R26, lo_addr(?lstr13_WIFI+0)
LUI	R25, hi_addr(?lstr12_WIFI+0)
ORI	R25, R25, lo_addr(?lstr12_WIFI+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI.c,94 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_appInit7:
ADDIU	R24, R24, -1
BNE	R24, R0, L_appInit7
NOP	
NOP	
;WIFI.c,95 :: 		WIFI4_socketServerOpen(32000);
ORI	R25, R0, 32000
JAL	_WIFI4_socketServerOpen+0
NOP	
;WIFI.c,96 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_appInit9:
ADDIU	R24, R24, -1
BNE	R24, R0, L_appInit9
NOP	
NOP	
;WIFI.c,99 :: 		}
L_end_appInit:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _appInit
_appTask:
;WIFI.c,102 :: 		void appTask()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;WIFI.c,105 :: 		WIFI4_process();
JAL	_WIFI4_process+0
NOP	
;WIFI.c,107 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_appTask11:
ADDIU	R24, R24, -1
BNE	R24, R0, L_appTask11
NOP	
;WIFI.c,109 :: 		}
L_end_appTask:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _appTask
_main:
;WIFI.c,112 :: 		void main() {
;WIFI.c,113 :: 		systemInit();
JAL	_systemInit+0
NOP	
;WIFI.c,114 :: 		appInit();
JAL	_appInit+0
NOP	
;WIFI.c,116 :: 		mikrobus_logWrite("PROBA",_LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr14_WIFI+0)
ORI	R25, R25, lo_addr(?lstr14_WIFI+0)
JAL	_mikrobus_logWrite+0
NOP	
;WIFI.c,117 :: 		while(1)
L_main13:
;WIFI.c,119 :: 		appTask();
JAL	_appTask+0
NOP	
;WIFI.c,120 :: 		}
J	L_main13
NOP	
;WIFI.c,124 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
