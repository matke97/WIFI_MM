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
BNE	R2, R0, L__RX_ISR56
NOP	
J	L_RX_ISR0
NOP	
L__RX_ISR56:
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
;WIFI.c,33 :: 		void nakacisena_gateway()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI.c,35 :: 		mikrobus_logWrite( "KACENJE NA GATEWAY ....", _LOG_TEXT );
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr1_WIFI+0)
ORI	R25, R25, lo_addr(?lstr1_WIFI+0)
JAL	_mikrobus_logWrite+0
NOP	
;WIFI.c,39 :: 		WIFI4_connectToAP("MikroE Public","mikroe.guest") ;
LUI	R26, hi_addr(?lstr3_WIFI+0)
ORI	R26, R26, lo_addr(?lstr3_WIFI+0)
LUI	R25, hi_addr(?lstr2_WIFI+0)
ORI	R25, R25, lo_addr(?lstr2_WIFI+0)
JAL	_WIFI4_connectToAP+0
NOP	
;WIFI.c,43 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_nakacisena_gateway1:
ADDIU	R24, R24, -1
BNE	R24, R0, L_nakacisena_gateway1
NOP	
;WIFI.c,45 :: 		mikrobus_logWrite( "GOTOVO", _LOG_LINE );
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr4_WIFI+0)
ORI	R25, R25, lo_addr(?lstr4_WIFI+0)
JAL	_mikrobus_logWrite+0
NOP	
;WIFI.c,46 :: 		}
L_end_nakacisena_gateway:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _nakacisena_gateway
_vidiipadresu:
;WIFI.c,47 :: 		void vidiipadresu()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI.c,49 :: 		WIFI4_cmdSingle("AT+S.STS=","ip_ipaddr");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(?lstr6_WIFI+0)
ORI	R26, R26, lo_addr(?lstr6_WIFI+0)
LUI	R25, hi_addr(?lstr5_WIFI+0)
ORI	R25, R25, lo_addr(?lstr5_WIFI+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI.c,51 :: 		}
L_end_vidiipadresu:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _vidiipadresu
_pisiWIFIstatus:
;WIFI.c,52 :: 		void pisiWIFIstatus()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI.c,54 :: 		WIFI4_cmdSingle("AT+S.STS=","wifi_state");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(?lstr8_WIFI+0)
ORI	R26, R26, lo_addr(?lstr8_WIFI+0)
LUI	R25, hi_addr(?lstr7_WIFI+0)
ORI	R25, R25, lo_addr(?lstr7_WIFI+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI.c,56 :: 		}
L_end_pisiWIFIstatus:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _pisiWIFIstatus
_defaultHandler:
;WIFI.c,57 :: 		void defaultHandler(uint8_t *resp,uint8_t *args)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;WIFI.c,59 :: 		mikrobus_logWrite(resp,_LOG_LINE);
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
ORI	R26, R0, 2
JAL	_mikrobus_logWrite+0
NOP	
LW	R25, 12(SP)
;WIFI.c,60 :: 		if(!strncmp(resp,"+ACT:",5))
SW	R25, 12(SP)
ORI	R27, R0, 5
LUI	R26, hi_addr(?lstr9_WIFI+0)
ORI	R26, R26, lo_addr(?lstr9_WIFI+0)
JAL	_strncmp+0
NOP	
LW	R25, 12(SP)
BEQ	R2, R0, L__defaultHandler61
NOP	
J	L_defaultHandler3
NOP	
L__defaultHandler61:
;WIFI.c,64 :: 		strcpy(resp,resp+5);
ADDIU	R2, R25, 5
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
;WIFI.c,65 :: 		if(!strncmp(resp,"RELAY_R1",8))
SW	R25, 12(SP)
ORI	R27, R0, 8
LUI	R26, hi_addr(?lstr10_WIFI+0)
ORI	R26, R26, lo_addr(?lstr10_WIFI+0)
JAL	_strncmp+0
NOP	
LW	R25, 12(SP)
BEQ	R2, R0, L__defaultHandler62
NOP	
J	L_defaultHandler4
NOP	
L__defaultHandler62:
;WIFI.c,67 :: 		strcpy(resp,resp+9);
ADDIU	R2, R25, 9
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
;WIFI.c,68 :: 		if(resp[0] == 0x30)
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BEQ	R3, R2, L__defaultHandler63
NOP	
J	L_defaultHandler5
NOP	
L__defaultHandler63:
;WIFI.c,70 :: 		read=0;
SB	R0, 16(SP)
;WIFI.c,71 :: 		}
J	L_defaultHandler6
NOP	
L_defaultHandler5:
;WIFI.c,72 :: 		else  if(resp[0] == 0x31)
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BEQ	R3, R2, L__defaultHandler64
NOP	
J	L_defaultHandler7
NOP	
L__defaultHandler64:
;WIFI.c,74 :: 		read=1;
ORI	R2, R0, 1
SB	R2, 16(SP)
;WIFI.c,75 :: 		}
L_defaultHandler7:
L_defaultHandler6:
;WIFI.c,76 :: 		if(0 != read)
LBU	R2, 16(SP)
BNE	R2, R0, L__defaultHandler66
NOP	
J	L_defaultHandler8
NOP	
L__defaultHandler66:
;WIFI.c,78 :: 		state=1;
ORI	R2, R0, 1
SB	R2, Offset(_state+0)(GP)
;WIFI.c,79 :: 		}else
J	L_defaultHandler9
NOP	
L_defaultHandler8:
;WIFI.c,81 :: 		state=0;
SB	R0, Offset(_state+0)(GP)
;WIFI.c,82 :: 		}
L_defaultHandler9:
;WIFI.c,83 :: 		}else {
J	L_defaultHandler10
NOP	
L_defaultHandler4:
;WIFI.c,84 :: 		if(!strncmp(resp,"RELAY_R2",8))
SW	R25, 12(SP)
ORI	R27, R0, 8
LUI	R26, hi_addr(?lstr11_WIFI+0)
ORI	R26, R26, lo_addr(?lstr11_WIFI+0)
JAL	_strncmp+0
NOP	
LW	R25, 12(SP)
BEQ	R2, R0, L__defaultHandler67
NOP	
J	L_defaultHandler11
NOP	
L__defaultHandler67:
;WIFI.c,86 :: 		strcpy(resp,resp+9);
ADDIU	R2, R25, 9
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
;WIFI.c,88 :: 		if(resp[0] == '0')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 48
BEQ	R3, R2, L__defaultHandler68
NOP	
J	L_defaultHandler12
NOP	
L__defaultHandler68:
;WIFI.c,90 :: 		read=0;
SB	R0, 16(SP)
;WIFI.c,91 :: 		}
J	L_defaultHandler13
NOP	
L_defaultHandler12:
;WIFI.c,92 :: 		else if(resp[0] == '1')
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 49
BEQ	R3, R2, L__defaultHandler69
NOP	
J	L_defaultHandler14
NOP	
L__defaultHandler69:
;WIFI.c,94 :: 		read=1;
ORI	R2, R0, 1
SB	R2, 16(SP)
;WIFI.c,95 :: 		}
L_defaultHandler14:
L_defaultHandler13:
;WIFI.c,96 :: 		if(0 != read)
LBU	R2, 16(SP)
BNE	R2, R0, L__defaultHandler71
NOP	
J	L_defaultHandler15
NOP	
L__defaultHandler71:
;WIFI.c,98 :: 		state2=1;
ORI	R2, R0, 1
SB	R2, Offset(_state2+0)(GP)
;WIFI.c,99 :: 		}else
J	L_defaultHandler16
NOP	
L_defaultHandler15:
;WIFI.c,101 :: 		state2=0;
SB	R0, Offset(_state2+0)(GP)
;WIFI.c,102 :: 		}
L_defaultHandler16:
;WIFI.c,103 :: 		}
L_defaultHandler11:
;WIFI.c,104 :: 		}
L_defaultHandler10:
;WIFI.c,105 :: 		}
L_defaultHandler3:
;WIFI.c,106 :: 		}
L_end_defaultHandler:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _defaultHandler
_systemInit:
;WIFI.c,107 :: 		void systemInit()
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;WIFI.c,110 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;WIFI.c,111 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_INPUT );
ORI	R27, R0, 1
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;WIFI.c,112 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_OUTPUT );
MOVZ	R27, R0, R0
ORI	R26, R0, 7
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;WIFI.c,113 :: 		mikrobus_uartInit(_MIKROBUS1,&_WIFI4_UART_CFG[0]);
LUI	R2, hi_addr(__WIFI4_UART_CFG+0)
ORI	R2, R2, lo_addr(__WIFI4_UART_CFG+0)
MOVZ	R26, R2, R0
MOVZ	R25, R0, R0
JAL	_mikrobus_uartInit+0
NOP	
;WIFI.c,115 :: 		mikrobus_logInit(_LOG_USBUART_B,115200);
LUI	R26, 1
ORI	R26, R26, 49664
ORI	R25, R0, 48
JAL	_mikrobus_logInit+0
NOP	
;WIFI.c,118 :: 		mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 1
JAL	_mikrobus_gpioInit+0
NOP	
;WIFI.c,119 :: 		mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
MOVZ	R27, R0, R0
ORI	R26, R0, 6
ORI	R25, R0, 1
JAL	_mikrobus_gpioInit+0
NOP	
;WIFI.c,120 :: 		}
L_end_systemInit:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _systemInit
_appInit:
;WIFI.c,122 :: 		void appInit()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI.c,124 :: 		WIFI4_uartDriverInit((T_WIFI4_P)&_MIKROBUS1_GPIO,(T_WIFI4_P)&_MIKROBUS1_UART);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(__MIKROBUS1_UART+0)
ORI	R26, R26, lo_addr(__MIKROBUS1_UART+0)
LUI	R25, hi_addr(__MIKROBUS1_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS1_GPIO+0)
JAL	_WIFI4_uartDriverInit+0
NOP	
;WIFI.c,125 :: 		relay_gpioDriverInit((T_RELAY_P)&_MIKROBUS2_GPIO);
LUI	R25, hi_addr(__MIKROBUS2_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS2_GPIO+0)
JAL	_relay_gpioDriverInit+0
NOP	
;WIFI.c,127 :: 		InitTimer1();
JAL	_InitTimer1+0
NOP	
;WIFI.c,128 :: 		uartInterrupt();
JAL	_uartInterrupt+0
NOP	
;WIFI.c,129 :: 		WIFI4_coreInit(defaultHandler,1500);
ORI	R26, R0, 1500
LUI	R25, hi_addr(_defaultHandler+0)
ORI	R25, R25, lo_addr(_defaultHandler+0)
JAL	_WIFI4_coreInit+0
NOP	
;WIFI.c,132 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_appInit17:
ADDIU	R24, R24, -1
BNE	R24, R0, L_appInit17
NOP	
NOP	
NOP	
;WIFI.c,136 :: 		WIFI4_modulePower(0);
MOVZ	R25, R0, R0
JAL	_WIFI4_modulePower+0
NOP	
;WIFI.c,137 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;WIFI.c,138 :: 		WIFI4_modulePower(1);
ORI	R25, R0, 1
JAL	_WIFI4_modulePower+0
NOP	
;WIFI.c,139 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_appInit19:
ADDIU	R24, R24, -1
BNE	R24, R0, L_appInit19
NOP	
;WIFI.c,143 :: 		WIFI4_cmdSingle("AT","");
LUI	R26, hi_addr(?lstr13_WIFI+0)
ORI	R26, R26, lo_addr(?lstr13_WIFI+0)
LUI	R25, hi_addr(?lstr12_WIFI+0)
ORI	R25, R25, lo_addr(?lstr12_WIFI+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI.c,144 :: 		nakacisena_gateway();
JAL	_nakacisena_gateway+0
NOP	
;WIFI.c,145 :: 		WIFI4_cmdSingle("AT&V","");
LUI	R26, hi_addr(?lstr15_WIFI+0)
ORI	R26, R26, lo_addr(?lstr15_WIFI+0)
LUI	R25, hi_addr(?lstr14_WIFI+0)
ORI	R25, R25, lo_addr(?lstr14_WIFI+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI.c,147 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_appInit21:
ADDIU	R24, R24, -1
BNE	R24, R0, L_appInit21
NOP	
NOP	
;WIFI.c,148 :: 		WIFI4_socketServerOpen(32000);
ORI	R25, R0, 32000
JAL	_WIFI4_socketServerOpen+0
NOP	
;WIFI.c,149 :: 		Delay_ms(1500);
LUI	R24, 610
ORI	R24, R24, 23039
L_appInit23:
ADDIU	R24, R24, -1
BNE	R24, R0, L_appInit23
NOP	
NOP	
;WIFI.c,151 :: 		state=0;
SB	R0, Offset(_state+0)(GP)
;WIFI.c,152 :: 		state2=0;
SB	R0, Offset(_state2+0)(GP)
;WIFI.c,153 :: 		oldstate=0;
SB	R0, Offset(_oldstate+0)(GP)
;WIFI.c,154 :: 		oldstate2=0;
SB	R0, Offset(_oldstate2+0)(GP)
;WIFI.c,155 :: 		relay_relay1Control(0);
MOVZ	R25, R0, R0
JAL	_relay_relay1Control+0
NOP	
;WIFI.c,156 :: 		relay_relay2Control(0);
MOVZ	R25, R0, R0
JAL	_relay_relay2Control+0
NOP	
;WIFI.c,157 :: 		}
L_end_appInit:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _appInit
_appTask:
;WIFI.c,159 :: 		void appTask()
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI.c,161 :: 		WIFI4_process();
SW	R25, 4(SP)
JAL	_WIFI4_process+0
NOP	
;WIFI.c,164 :: 		if(state == 1 && oldstate == 0)
LBU	R3, Offset(_state+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__appTask75
NOP	
J	L__appTask44
NOP	
L__appTask75:
LBU	R2, Offset(_oldstate+0)(GP)
BEQ	R2, R0, L__appTask76
NOP	
J	L__appTask43
NOP	
L__appTask76:
L__appTask42:
;WIFI.c,166 :: 		oldstate=1;
ORI	R2, R0, 1
SB	R2, Offset(_oldstate+0)(GP)
;WIFI.c,167 :: 		relay_relay1Control(1);
ORI	R25, R0, 1
JAL	_relay_relay1Control+0
NOP	
;WIFI.c,168 :: 		WIFI4_writeText2("REL1 ON\n");
LUI	R25, hi_addr(?lstr16_WIFI+0)
ORI	R25, R25, lo_addr(?lstr16_WIFI+0)
JAL	_WIFI4_writeText2+0
NOP	
;WIFI.c,164 :: 		if(state == 1 && oldstate == 0)
L__appTask44:
L__appTask43:
;WIFI.c,170 :: 		if(state == 0 && oldstate == 1)
LBU	R2, Offset(_state+0)(GP)
BEQ	R2, R0, L__appTask77
NOP	
J	L__appTask46
NOP	
L__appTask77:
LBU	R3, Offset(_oldstate+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__appTask78
NOP	
J	L__appTask45
NOP	
L__appTask78:
L__appTask41:
;WIFI.c,172 :: 		oldstate=0;
SB	R0, Offset(_oldstate+0)(GP)
;WIFI.c,173 :: 		relay_relay1Control(0);
MOVZ	R25, R0, R0
JAL	_relay_relay1Control+0
NOP	
;WIFI.c,174 :: 		WIFI4_writeText2("REL1 OFF\n");
LUI	R25, hi_addr(?lstr17_WIFI+0)
ORI	R25, R25, lo_addr(?lstr17_WIFI+0)
JAL	_WIFI4_writeText2+0
NOP	
;WIFI.c,170 :: 		if(state == 0 && oldstate == 1)
L__appTask46:
L__appTask45:
;WIFI.c,176 :: 		if(state2 == 1 && oldstate2 == 0)
LBU	R3, Offset(_state2+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__appTask79
NOP	
J	L__appTask48
NOP	
L__appTask79:
LBU	R2, Offset(_oldstate2+0)(GP)
BEQ	R2, R0, L__appTask80
NOP	
J	L__appTask47
NOP	
L__appTask80:
L__appTask40:
;WIFI.c,178 :: 		oldstate2=1;
ORI	R2, R0, 1
SB	R2, Offset(_oldstate2+0)(GP)
;WIFI.c,179 :: 		relay_relay2Control(1);
ORI	R25, R0, 1
JAL	_relay_relay2Control+0
NOP	
;WIFI.c,180 :: 		WIFI4_writeText2("REL2 ON\n");
LUI	R25, hi_addr(?lstr18_WIFI+0)
ORI	R25, R25, lo_addr(?lstr18_WIFI+0)
JAL	_WIFI4_writeText2+0
NOP	
;WIFI.c,176 :: 		if(state2 == 1 && oldstate2 == 0)
L__appTask48:
L__appTask47:
;WIFI.c,182 :: 		if(state2 == 0 && oldstate2 == 1)
LBU	R2, Offset(_state2+0)(GP)
BEQ	R2, R0, L__appTask81
NOP	
J	L__appTask50
NOP	
L__appTask81:
LBU	R3, Offset(_oldstate2+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__appTask82
NOP	
J	L__appTask49
NOP	
L__appTask82:
L__appTask39:
;WIFI.c,184 :: 		oldstate2=0;
SB	R0, Offset(_oldstate2+0)(GP)
;WIFI.c,185 :: 		relay_relay2Control(0);
MOVZ	R25, R0, R0
JAL	_relay_relay2Control+0
NOP	
;WIFI.c,186 :: 		WIFI4_writeText2("REL2 OFF\n");
LUI	R25, hi_addr(?lstr19_WIFI+0)
ORI	R25, R25, lo_addr(?lstr19_WIFI+0)
JAL	_WIFI4_writeText2+0
NOP	
;WIFI.c,182 :: 		if(state2 == 0 && oldstate2 == 1)
L__appTask50:
L__appTask49:
;WIFI.c,188 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;WIFI.c,189 :: 		}
L_end_appTask:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _appTask
_main:
;WIFI.c,192 :: 		void main() {
;WIFI.c,193 :: 		systemInit();
JAL	_systemInit+0
NOP	
;WIFI.c,194 :: 		appInit();
JAL	_appInit+0
NOP	
;WIFI.c,196 :: 		mikrobus_logWrite("PROBA",_LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr20_WIFI+0)
ORI	R25, R25, lo_addr(?lstr20_WIFI+0)
JAL	_mikrobus_logWrite+0
NOP	
;WIFI.c,197 :: 		while(1)
L_main37:
;WIFI.c,199 :: 		appTask();
JAL	_appTask+0
NOP	
;WIFI.c,200 :: 		}
J	L_main37
NOP	
;WIFI.c,204 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
