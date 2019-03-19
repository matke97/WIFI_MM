WIFI4_CLICK_hal_gpioMap:
;__wifi4_hal.c,215 :: 		static void hal_gpioMap(T_HAL_P gpioObj)
;__wifi4_hal.c,262 :: 		hal_gpio_rstSet = tmp->gpioSet[ __RST_PIN_OUTPUT__ ];
ADDIU	R2, R25, 4
LW	R2, 0(R2)
SW	R2, Offset(WIFI4_CLICK_hal_gpio_rstSet+0)(GP)
;__wifi4_hal.c,277 :: 		hal_gpio_intSet = tmp->gpioSet[ __INT_PIN_OUTPUT__ ];
ADDIU	R2, R25, 28
LW	R2, 0(R2)
SW	R2, Offset(WIFI4_CLICK_hal_gpio_intSet+0)(GP)
;__wifi4_hal.c,291 :: 		}
L_end_hal_gpioMap:
JR	RA
NOP	
; end of WIFI4_CLICK_hal_gpioMap
WIFI4_CLICK_hal_uartMap:
;__hal_pic32.c,159 :: 		static void hal_uartMap(T_HAL_P uartObj)
;__hal_pic32.c,163 :: 		fp_uartWrite = tmp->uartWrite;
LW	R2, 0(R25)
SW	R2, Offset(WIFI4_CLICK_fp_uartWrite+0)(GP)
;__hal_pic32.c,164 :: 		fp_uartRead  = tmp->uartRead;
ADDIU	R2, R25, 4
LW	R2, 0(R2)
SW	R2, Offset(WIFI4_CLICK_fp_uartRead+0)(GP)
;__hal_pic32.c,165 :: 		fp_uartReady = tmp->uartReady;
ADDIU	R2, R25, 8
LW	R2, 0(R2)
SW	R2, Offset(WIFI4_CLICK_fp_uartReady+0)(GP)
;__hal_pic32.c,166 :: 		}
L_end_hal_uartMap:
JR	RA
NOP	
; end of WIFI4_CLICK_hal_uartMap
WIFI4_CLICK_hal_uartWrite:
;__hal_pic32.c,168 :: 		static void hal_uartWrite(uint8_t input)
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;__hal_pic32.c,170 :: 		fp_uartWrite(input);
ANDI	R25, R25, 255
LW	R30, Offset(WIFI4_CLICK_fp_uartWrite+0)(GP)
JALR	RA, R30
NOP	
;__hal_pic32.c,171 :: 		}
L_end_hal_uartWrite:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of WIFI4_CLICK_hal_uartWrite
WIFI4_CLICK_hal_uartRead:
;__hal_pic32.c,173 :: 		static uint8_t hal_uartRead()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;__hal_pic32.c,175 :: 		return ( uint8_t )fp_uartRead();
LW	R30, Offset(WIFI4_CLICK_fp_uartRead+0)(GP)
JALR	RA, R30
NOP	
;__hal_pic32.c,176 :: 		}
L_end_hal_uartRead:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of WIFI4_CLICK_hal_uartRead
WIFI4_CLICK_hal_uartReady:
;__hal_pic32.c,178 :: 		static uint8_t hal_uartReady()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;__hal_pic32.c,180 :: 		return ( uint8_t )fp_uartReady();
LW	R30, Offset(WIFI4_CLICK_fp_uartReady+0)(GP)
JALR	RA, R30
NOP	
;__hal_pic32.c,181 :: 		}
L_end_hal_uartReady:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of WIFI4_CLICK_hal_uartReady
WIFI4_CLICK_DTE_setState:
;WIFI4_CLICK.c,41 :: 		static void DTE_setState(uint8_t state)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,44 :: 		if (1 == state)
SW	R25, 4(SP)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_WIFI4_CLICK_DTE_setState79
NOP	
J	L_WIFI4_CLICK_DTE_setState0
NOP	
L_WIFI4_CLICK_DTE_setState79:
;WIFI4_CLICK.c,46 :: 		hal_gpio_intSet( 0 );
MOVZ	R25, R0, R0
LW	R30, Offset(WIFI4_CLICK_hal_gpio_intSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,47 :: 		}
J	L_WIFI4_CLICK_DTE_setState1
NOP	
L_WIFI4_CLICK_DTE_setState0:
;WIFI4_CLICK.c,50 :: 		hal_gpio_intSet( 1 );
ORI	R25, R0, 1
LW	R30, Offset(WIFI4_CLICK_hal_gpio_intSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,51 :: 		}
L_WIFI4_CLICK_DTE_setState1:
;WIFI4_CLICK.c,53 :: 		}
L_end_DTE_setState:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of WIFI4_CLICK_DTE_setState
WIFI4_CLICK_DCE_getState:
;WIFI4_CLICK.c,55 :: 		static uint8_t DCE_getState()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;WIFI4_CLICK.c,58 :: 		if (0 != hal_gpio_csGet())
LW	R30, Offset(WIFI4_CLICK_hal_gpio_csGet+0)(GP)
JALR	RA, R30
NOP	
ANDI	R2, R2, 255
BNE	R2, R0, L_WIFI4_CLICK_DCE_getState82
NOP	
J	L_WIFI4_CLICK_DCE_getState2
NOP	
L_WIFI4_CLICK_DCE_getState82:
;WIFI4_CLICK.c,60 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_DCE_getState
NOP	
;WIFI4_CLICK.c,61 :: 		}
L_WIFI4_CLICK_DCE_getState2:
;WIFI4_CLICK.c,64 :: 		return 1;
ORI	R2, R0, 1
;WIFI4_CLICK.c,67 :: 		}
L_end_DCE_getState:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of WIFI4_CLICK_DCE_getState
WIFI4_CLICK_generateHash:
;WIFI4_CLICK.c,155 :: 		static uint32_t generateHash( char *pCmd )
;WIFI4_CLICK.c,157 :: 		uint8_t  cnt  = 0;
; cnt start address is: 20 (R5)
MOVZ	R5, R0, R0
;WIFI4_CLICK.c,158 :: 		uint16_t ch   = 0;
;WIFI4_CLICK.c,159 :: 		uint32_t hash = 5;
; hash start address is: 24 (R6)
ORI	R6, R0, 5
; hash end address is: 24 (R6)
; cnt end address is: 20 (R5)
;WIFI4_CLICK.c,161 :: 		while ( ch = *pCmd++ )
L_WIFI4_CLICK_generateHash4:
; hash start address is: 24 (R6)
; cnt start address is: 20 (R5)
MOVZ	R3, R25, R0
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
LBU	R2, 0(R3)
; ch start address is: 16 (R4)
ANDI	R4, R2, 255
BNE	R4, R0, L_WIFI4_CLICK_generateHash85
NOP	
J	L_WIFI4_CLICK_generateHash5
NOP	
L_WIFI4_CLICK_generateHash85:
;WIFI4_CLICK.c,163 :: 		hash += (ch << (cnt % 8));
ANDI	R2, R5, 7
ANDI	R3, R4, 65535
ANDI	R2, R2, 255
SLLV	R2, R3, R2
ANDI	R2, R2, 65535
ADDU	R2, R6, R2
MOVZ	R6, R2, R0
;WIFI4_CLICK.c,164 :: 		cnt++;
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;WIFI4_CLICK.c,165 :: 		}
; ch end address is: 16 (R4)
; cnt end address is: 20 (R5)
J	L_WIFI4_CLICK_generateHash4
NOP	
L_WIFI4_CLICK_generateHash5:
;WIFI4_CLICK.c,166 :: 		return hash;
MOVZ	R2, R6, R0
; hash end address is: 24 (R6)
;WIFI4_CLICK.c,167 :: 		}
L_end_generateHash:
JR	RA
NOP	
; end of WIFI4_CLICK_generateHash
WIFI4_CLICK_locateHandler:
;WIFI4_CLICK.c,171 :: 		static uint16_t locateHandler( char* pCmd )
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;WIFI4_CLICK.c,178 :: 		len = strlen(pCmd);
JAL	_strlen+0
NOP	
; len start address is: 28 (R7)
SEH	R7, R2
;WIFI4_CLICK.c,179 :: 		hash = generateHash(pCmd);
JAL	WIFI4_CLICK_generateHash+0
NOP	
; hash start address is: 16 (R4)
MOVZ	R4, R2, R0
;WIFI4_CLICK.c,181 :: 		for (idx = 1; idx < hdB.idx; idx++)
; idx start address is: 24 (R6)
ORI	R6, R0, 1
; len end address is: 28 (R7)
; idx end address is: 24 (R6)
ANDI	R5, R7, 255
L_WIFI4_CLICK_locateHandler6:
; idx start address is: 24 (R6)
; len start address is: 20 (R5)
; hash start address is: 16 (R4)
; hash end address is: 16 (R4)
; len start address is: 20 (R5)
; len end address is: 20 (R5)
ANDI	R3, R6, 65535
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L_WIFI4_CLICK_locateHandler87
NOP	
J	L_WIFI4_CLICK_locateHandler7
NOP	
L_WIFI4_CLICK_locateHandler87:
; hash end address is: 16 (R4)
; len end address is: 20 (R5)
;WIFI4_CLICK.c,183 :: 		if (hdB.storage[idx].len == len)
; len start address is: 20 (R5)
; hash start address is: 16 (R4)
ANDI	R2, R6, 65535
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
ANDI	R2, R5, 255
BEQ	R3, R2, L_WIFI4_CLICK_locateHandler88
NOP	
J	L_WIFI4_CLICK_locateHandler9
NOP	
L_WIFI4_CLICK_locateHandler88:
;WIFI4_CLICK.c,185 :: 		if (hdB.storage[idx].hash == hash)
ANDI	R2, R6, 65535
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LW	R2, 0(R2)
BEQ	R2, R4, L_WIFI4_CLICK_locateHandler89
NOP	
J	L_WIFI4_CLICK_locateHandler10
NOP	
L_WIFI4_CLICK_locateHandler89:
; hash end address is: 16 (R4)
; len end address is: 20 (R5)
;WIFI4_CLICK.c,187 :: 		return idx;
ANDI	R2, R6, 65535
; idx end address is: 24 (R6)
J	L_end_locateHandler
NOP	
;WIFI4_CLICK.c,188 :: 		}
L_WIFI4_CLICK_locateHandler10:
;WIFI4_CLICK.c,189 :: 		}
; idx start address is: 24 (R6)
; len start address is: 20 (R5)
; hash start address is: 16 (R4)
L_WIFI4_CLICK_locateHandler9:
;WIFI4_CLICK.c,181 :: 		for (idx = 1; idx < hdB.idx; idx++)
ADDIU	R2, R6, 1
ANDI	R6, R2, 65535
;WIFI4_CLICK.c,190 :: 		}
; hash end address is: 16 (R4)
; len end address is: 20 (R5)
; idx end address is: 24 (R6)
J	L_WIFI4_CLICK_locateHandler6
NOP	
L_WIFI4_CLICK_locateHandler7:
;WIFI4_CLICK.c,192 :: 		return 0;
MOVZ	R2, R0, R0
;WIFI4_CLICK.c,193 :: 		}
L_end_locateHandler:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of WIFI4_CLICK_locateHandler
_WIFI4_writeText2:
;WIFI4_CLICK.c,202 :: 		void WIFI4_writeText2(uint8_t *txt)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,205 :: 		while(0 != *txt)
L_WIFI4_writeText211:
LBU	R2, 0(R25)
ANDI	R2, R2, 255
BNE	R2, R0, L__WIFI4_writeText292
NOP	
J	L_WIFI4_writeText212
NOP	
L__WIFI4_writeText292:
;WIFI4_CLICK.c,207 :: 		hal_uartWrite(*txt++);
SW	R25, 4(SP)
LBU	R25, 0(R25)
JAL	WIFI4_CLICK_hal_uartWrite+0
NOP	
LW	R25, 4(SP)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;WIFI4_CLICK.c,208 :: 		}
J	L_WIFI4_writeText211
NOP	
L_WIFI4_writeText212:
;WIFI4_CLICK.c,209 :: 		hal_uartWrite(TERMINATION_CHAR);
SW	R25, 4(SP)
ORI	R25, R0, 13
JAL	WIFI4_CLICK_hal_uartWrite+0
NOP	
LW	R25, 4(SP)
;WIFI4_CLICK.c,210 :: 		}
L_end_WIFI4_writeText2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WIFI4_writeText2
WIFI4_CLICK_searchLut:
;WIFI4_CLICK.c,212 :: 		static uint8_t searchLut( char* pInput, char (*pLut)[ LUTS_WIDTH ], uint8_t lutSize, uint8_t flag )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;WIFI4_CLICK.c,214 :: 		uint8_t     inLen    = 0;
;WIFI4_CLICK.c,215 :: 		uint8_t     inOff    = 0;
;WIFI4_CLICK.c,216 :: 		uint8_t     lutLen   = 0;
;WIFI4_CLICK.c,217 :: 		uint8_t     lutIdx   = 0;
;WIFI4_CLICK.c,219 :: 		if (_WIFI4_CMD_MAXSIZE < (inLen = strlen(pInput)))
JAL	_strlen+0
NOP	
; inLen start address is: 12 (R3)
SEH	R3, R2
ANDI	R2, R2, 255
SLTIU	R2, R2, 11
BEQ	R2, R0, L_WIFI4_CLICK_searchLut94
NOP	
J	L_WIFI4_CLICK_searchLut68
NOP	
L_WIFI4_CLICK_searchLut94:
; inLen end address is: 12 (R3)
;WIFI4_CLICK.c,221 :: 		inLen =_WIFI4_CMD_MAXSIZE;
; inLen start address is: 24 (R6)
ORI	R6, R0, 10
; inLen end address is: 24 (R6)
;WIFI4_CLICK.c,222 :: 		}
J	L_WIFI4_CLICK_searchLut13
NOP	
L_WIFI4_CLICK_searchLut68:
;WIFI4_CLICK.c,219 :: 		if (_WIFI4_CMD_MAXSIZE < (inLen = strlen(pInput)))
ANDI	R6, R3, 255
;WIFI4_CLICK.c,222 :: 		}
L_WIFI4_CLICK_searchLut13:
;WIFI4_CLICK.c,224 :: 		for (lutIdx = 1; lutIdx < lutSize; lutIdx++)
; inLen start address is: 24 (R6)
; lutIdx start address is: 20 (R5)
ORI	R5, R0, 1
; inLen end address is: 24 (R6)
; lutIdx end address is: 20 (R5)
L_WIFI4_CLICK_searchLut14:
; lutIdx start address is: 20 (R5)
; inLen start address is: 24 (R6)
ANDI	R3, R5, 255
ANDI	R2, R27, 255
SLTU	R2, R3, R2
BNE	R2, R0, L_WIFI4_CLICK_searchLut95
NOP	
J	L_WIFI4_CLICK_searchLut15
NOP	
L_WIFI4_CLICK_searchLut95:
;WIFI4_CLICK.c,226 :: 		lutLen = strlen(pLut[lutIdx]);
ANDI	R2, R5, 255
SLL	R2, R2, 1
ADDU	R2, R26, R2
SW	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
; lutLen start address is: 28 (R7)
SEH	R7, R2
;WIFI4_CLICK.c,228 :: 		for (inOff = 0; inOff < inLen; inOff++)
; inOff start address is: 32 (R8)
MOVZ	R8, R0, R0
; inLen end address is: 24 (R6)
; inOff end address is: 32 (R8)
; lutIdx end address is: 20 (R5)
L_WIFI4_CLICK_searchLut17:
; inOff start address is: 32 (R8)
; lutLen start address is: 28 (R7)
; lutLen end address is: 28 (R7)
; inLen start address is: 24 (R6)
; lutIdx start address is: 20 (R5)
ANDI	R3, R8, 255
ANDI	R2, R6, 255
SLTU	R2, R3, R2
BNE	R2, R0, L_WIFI4_CLICK_searchLut96
NOP	
J	L_WIFI4_CLICK_searchLut18
NOP	
L_WIFI4_CLICK_searchLut96:
; lutLen end address is: 28 (R7)
;WIFI4_CLICK.c,230 :: 		if (!strncmp(pLut[lutIdx], pInput + inOff, lutLen))
; lutLen start address is: 28 (R7)
ANDI	R2, R8, 255
ADDU	R3, R25, R2
ANDI	R2, R5, 255
SLL	R2, R2, 1
ADDU	R2, R26, R2
SB	R27, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
ANDI	R27, R7, 255
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncmp+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
LBU	R27, 4(SP)
BEQ	R2, R0, L_WIFI4_CLICK_searchLut97
NOP	
J	L_WIFI4_CLICK_searchLut20
NOP	
L_WIFI4_CLICK_searchLut97:
;WIFI4_CLICK.c,232 :: 		if (SEARCH_IDX == flag)
ANDI	R2, R28, 255
BEQ	R2, R0, L_WIFI4_CLICK_searchLut98
NOP	
J	L_WIFI4_CLICK_searchLut21
NOP	
L_WIFI4_CLICK_searchLut98:
; lutLen end address is: 28 (R7)
; inLen end address is: 24 (R6)
; inOff end address is: 32 (R8)
;WIFI4_CLICK.c,234 :: 		return lutIdx;
ANDI	R2, R5, 255
; lutIdx end address is: 20 (R5)
J	L_end_searchLut
NOP	
;WIFI4_CLICK.c,235 :: 		}
L_WIFI4_CLICK_searchLut21:
;WIFI4_CLICK.c,236 :: 		else if (SEARCH_OFFSET == flag)
; lutIdx start address is: 20 (R5)
; inOff start address is: 32 (R8)
; inLen start address is: 24 (R6)
; lutLen start address is: 28 (R7)
ANDI	R3, R28, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_WIFI4_CLICK_searchLut99
NOP	
J	L_WIFI4_CLICK_searchLut23
NOP	
L_WIFI4_CLICK_searchLut99:
; lutLen end address is: 28 (R7)
; inLen end address is: 24 (R6)
; lutIdx end address is: 20 (R5)
;WIFI4_CLICK.c,238 :: 		return inOff;
ANDI	R2, R8, 255
; inOff end address is: 32 (R8)
J	L_end_searchLut
NOP	
;WIFI4_CLICK.c,239 :: 		}
L_WIFI4_CLICK_searchLut23:
;WIFI4_CLICK.c,240 :: 		}
; lutIdx start address is: 20 (R5)
; inOff start address is: 32 (R8)
; inLen start address is: 24 (R6)
; lutLen start address is: 28 (R7)
L_WIFI4_CLICK_searchLut20:
;WIFI4_CLICK.c,228 :: 		for (inOff = 0; inOff < inLen; inOff++)
ADDIU	R2, R8, 1
ANDI	R8, R2, 255
;WIFI4_CLICK.c,241 :: 		}
; lutLen end address is: 28 (R7)
; inOff end address is: 32 (R8)
J	L_WIFI4_CLICK_searchLut17
NOP	
L_WIFI4_CLICK_searchLut18:
;WIFI4_CLICK.c,224 :: 		for (lutIdx = 1; lutIdx < lutSize; lutIdx++)
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;WIFI4_CLICK.c,242 :: 		}
; inLen end address is: 24 (R6)
; lutIdx end address is: 20 (R5)
J	L_WIFI4_CLICK_searchLut14
NOP	
L_WIFI4_CLICK_searchLut15:
;WIFI4_CLICK.c,243 :: 		return 0;
MOVZ	R2, R0, R0
;WIFI4_CLICK.c,244 :: 		}
L_end_searchLut:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of WIFI4_CLICK_searchLut
WIFI4_CLICK_createEvent:
;WIFI4_CLICK.c,245 :: 		static void createEvent( char *pInput, T_CORE_event *pEvent )
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;WIFI4_CLICK.c,247 :: 		uint8_t hIdx     = 0;
SW	R25, 4(SP)
SW	R27, 8(SP)
SW	R28, 12(SP)
;WIFI4_CLICK.c,248 :: 		uint8_t startIdx = 0;
;WIFI4_CLICK.c,249 :: 		uint8_t startOff = 0;
;WIFI4_CLICK.c,250 :: 		uint8_t endIdx   = 0;
;WIFI4_CLICK.c,251 :: 		uint8_t endOff   = 0;
;WIFI4_CLICK.c,253 :: 		char tmp[_WIFI4_CMD_MAXSIZE + 1] = { 0 };
ADDIU	R23, SP, 24
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICSWIFI4_CLICK_createEvent_tmp_L0+0)
ORI	R24, R24, lo_addr(?ICSWIFI4_CLICK_createEvent_tmp_L0+0)
JAL	___CC2DW+0
NOP	
;WIFI4_CLICK.c,256 :: 		startIdx = searchLut(pInput, LUT_START, LUT_SIZE, SEARCH_IDX);
SW	R26, 16(SP)
SW	R25, 20(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 4
LUI	R26, hi_addr(WIFI4_CLICK_LUT_START+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_LUT_START+0)
JAL	WIFI4_CLICK_searchLut+0
NOP	
LW	R25, 20(SP)
; startIdx start address is: 36 (R9)
ANDI	R9, R2, 255
;WIFI4_CLICK.c,257 :: 		startOff = searchLut(pInput, LUT_START, LUT_SIZE, SEARCH_OFFSET);
SW	R25, 20(SP)
ORI	R28, R0, 1
ORI	R27, R0, 4
LUI	R26, hi_addr(WIFI4_CLICK_LUT_START+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_LUT_START+0)
JAL	WIFI4_CLICK_searchLut+0
NOP	
LW	R25, 20(SP)
; startOff start address is: 44 (R11)
ANDI	R11, R2, 255
;WIFI4_CLICK.c,258 :: 		endIdx = searchLut(pInput, LUT_END, LUT_SIZE_END, SEARCH_IDX);
SW	R25, 20(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 4
LUI	R26, hi_addr(WIFI4_CLICK_LUT_END+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_LUT_END+0)
JAL	WIFI4_CLICK_searchLut+0
NOP	
LW	R25, 20(SP)
; endIdx start address is: 40 (R10)
ANDI	R10, R2, 255
;WIFI4_CLICK.c,259 :: 		endOff = searchLut(pInput, LUT_END, LUT_SIZE_END, SEARCH_OFFSET);
SW	R25, 20(SP)
ORI	R28, R0, 1
ORI	R27, R0, 4
LUI	R26, hi_addr(WIFI4_CLICK_LUT_END+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_LUT_END+0)
JAL	WIFI4_CLICK_searchLut+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
; endOff start address is: 12 (R3)
ANDI	R3, R2, 255
;WIFI4_CLICK.c,261 :: 		if (0 == endOff)
ANDI	R2, R2, 255
BEQ	R2, R0, L_WIFI4_CLICK_createEvent101
NOP	
J	L_WIFI4_CLICK_createEvent69
NOP	
L_WIFI4_CLICK_createEvent101:
; endOff end address is: 12 (R3)
;WIFI4_CLICK.c,263 :: 		endOff = _WIFI4_CMD_MAXSIZE;
; endOff start address is: 16 (R4)
ORI	R4, R0, 10
; endOff end address is: 16 (R4)
;WIFI4_CLICK.c,264 :: 		}
J	L_WIFI4_CLICK_createEvent24
NOP	
L_WIFI4_CLICK_createEvent69:
;WIFI4_CLICK.c,261 :: 		if (0 == endOff)
ANDI	R4, R3, 255
;WIFI4_CLICK.c,264 :: 		}
L_WIFI4_CLICK_createEvent24:
;WIFI4_CLICK.c,267 :: 		strncpy(tmp, pInput + startOff, endOff - startOff);
; endOff start address is: 16 (R4)
ANDI	R3, R11, 255
ANDI	R2, R4, 255
; endOff end address is: 16 (R4)
SUBU	R4, R2, R3
ANDI	R2, R11, 255
; startOff end address is: 44 (R11)
ADDU	R3, R25, R2
ADDIU	R2, SP, 24
SW	R26, 16(SP)
SEH	R27, R4
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
LW	R26, 16(SP)
;WIFI4_CLICK.c,268 :: 		hIdx                         = locateHandler(tmp);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	WIFI4_CLICK_locateHandler+0
NOP	
; hIdx start address is: 20 (R5)
ANDI	R5, R2, 65535
;WIFI4_CLICK.c,269 :: 		pEvent->fpHdl                = hdB.storage[hIdx].handler;
ANDI	R2, R2, 255
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SW	R2, 0(R26)
;WIFI4_CLICK.c,270 :: 		pEvent->wDogLimit            = hdB.storage[hIdx].timeout;
ADDIU	R4, R26, 4
ANDI	R2, R5, 255
; hIdx end address is: 20 (R5)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R4)
;WIFI4_CLICK.c,271 :: 		pEvent->evArg[_WIFI4_EVARG_START_T]  = startIdx;
ADDIU	R2, R26, 8
SB	R9, 0(R2)
; startIdx end address is: 36 (R9)
;WIFI4_CLICK.c,272 :: 		pEvent->evArg[_WIFI4_EVARG_END_T]    = endIdx;
ADDIU	R2, R26, 8
ADDIU	R2, R2, 1
SB	R10, 0(R2)
; endIdx end address is: 40 (R10)
;WIFI4_CLICK.c,273 :: 		}
L_end_createEvent:
LW	R28, 12(SP)
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of WIFI4_CLICK_createEvent
WIFI4_CLICK_cmdSingle:
;WIFI4_CLICK.c,276 :: 		static void cmdSingle(char* command,char *param,uint16_t wTime,uint8_t f_cpyResp){
ADDIU	SP, SP, -76
SW	RA, 0(SP)
;WIFI4_CLICK.c,278 :: 		strcpy(tmp,command);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 24
SW	R26, 12(SP)
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R26, 12(SP)
;WIFI4_CLICK.c,279 :: 		strcat(tmp,param);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,280 :: 		strcpy(txBuff,tmp);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(WIFI4_CLICK_txBuff+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_txBuff+0)
JAL	_strcpy+0
NOP	
;WIFI4_CLICK.c,282 :: 		while(0 != flag_cmdEx)
L_WIFI4_CLICK_cmdSingle25:
LBU	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
BNE	R2, R0, L_WIFI4_CLICK_cmdSingle104
NOP	
J	L_WIFI4_CLICK_cmdSingle26
NOP	
L_WIFI4_CLICK_cmdSingle104:
;WIFI4_CLICK.c,284 :: 		WIFI4_process();
SB	R28, 12(SP)
SH	R27, 14(SP)
SW	R26, 16(SP)
SW	R25, 20(SP)
JAL	_WIFI4_process+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
LHU	R27, 14(SP)
LBU	R28, 12(SP)
;WIFI4_CLICK.c,285 :: 		}
J	L_WIFI4_CLICK_cmdSingle25
NOP	
L_WIFI4_CLICK_cmdSingle26:
;WIFI4_CLICK.c,286 :: 		createEvent(tmp,&currentEv);
ADDIU	R2, SP, 24
SH	R27, 12(SP)
SW	R26, 16(SP)
SW	R25, 20(SP)
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+0)
MOVZ	R25, R2, R0
JAL	WIFI4_CLICK_createEvent+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
LHU	R27, 12(SP)
;WIFI4_CLICK.c,287 :: 		WIFI4_writeText2(tmp);
ADDIU	R2, SP, 24
SB	R28, 12(SP)
SH	R27, 14(SP)
SW	R26, 16(SP)
SW	R25, 20(SP)
MOVZ	R25, R2, R0
JAL	_WIFI4_writeText2+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
LHU	R27, 14(SP)
LBU	R28, 12(SP)
;WIFI4_CLICK.c,289 :: 		watchDogTime=0; //reset watchdog
SH	R0, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
;WIFI4_CLICK.c,290 :: 		waitTime=wTime;
SH	R27, Offset(WIFI4_CLICK_waitTime+0)(GP)
;WIFI4_CLICK.c,291 :: 		f_wdogStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
;WIFI4_CLICK.c,292 :: 		f_timerStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,293 :: 		flag_cmdEx=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,294 :: 		f_cpyRXtoTmp=f_cpyResp;
SB	R28, Offset(WIFI4_CLICK_f_cpyRXtoTmp+0)(GP)
;WIFI4_CLICK.c,296 :: 		while(0 != flag_cmdEx)
L_WIFI4_CLICK_cmdSingle27:
LBU	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
BNE	R2, R0, L_WIFI4_CLICK_cmdSingle106
NOP	
J	L_WIFI4_CLICK_cmdSingle28
NOP	
L_WIFI4_CLICK_cmdSingle106:
;WIFI4_CLICK.c,298 :: 		WIFI4_process();
SB	R28, 12(SP)
SH	R27, 14(SP)
SW	R26, 16(SP)
SW	R25, 20(SP)
JAL	_WIFI4_process+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
LHU	R27, 14(SP)
LBU	R28, 12(SP)
;WIFI4_CLICK.c,299 :: 		}
J	L_WIFI4_CLICK_cmdSingle27
NOP	
L_WIFI4_CLICK_cmdSingle28:
;WIFI4_CLICK.c,300 :: 		waitTime=DEFAULT_WTIME;
ORI	R2, R0, 5
SH	R2, Offset(WIFI4_CLICK_waitTime+0)(GP)
;WIFI4_CLICK.c,301 :: 		}
L_end_cmdSingle:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of WIFI4_CLICK_cmdSingle
_WIFI4_coreInit:
;WIFI4_CLICK.c,302 :: 		void WIFI4_coreInit(T_WIFI4_handler defaultHdl, uint32_t defaultWdog)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,305 :: 		flag_cmdEx          = 0;
SW	R25, 4(SP)
SB	R0, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,306 :: 		flag_timesUp=0;
SB	R0, Offset(WIFI4_CLICK_flag_timesUp+0)(GP)
;WIFI4_CLICK.c,307 :: 		flag_wdogOut=0;
SB	R0, Offset(WIFI4_CLICK_flag_wdogOut+0)(GP)
;WIFI4_CLICK.c,308 :: 		respTime=0;
SW	R0, Offset(WIFI4_CLICK_respTime+0)(GP)
;WIFI4_CLICK.c,309 :: 		rxB.buff[0]=0;
SB	R0, Offset(WIFI4_CLICK_rxB+0)(GP)
;WIFI4_CLICK.c,310 :: 		rxB.ind=0;
SH	R0, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,311 :: 		waitTime=DEFAULT_WTIME;
ORI	R2, R0, 5
SH	R2, Offset(WIFI4_CLICK_waitTime+0)(GP)
;WIFI4_CLICK.c,313 :: 		hdB.storage[0].handler = defaultHdl;
SW	R25, Offset(WIFI4_CLICK_hdB+16)(GP)
;WIFI4_CLICK.c,314 :: 		hdB.storage[0].timeout = defaultWdog;
SW	R26, Offset(WIFI4_CLICK_hdB+12)(GP)
;WIFI4_CLICK.c,315 :: 		hdB.storage[0].hash    = generateHash("");
LUI	R25, hi_addr(?lstr1_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr1_WIFI4_CLICK+0)
JAL	WIFI4_CLICK_generateHash+0
NOP	
SW	R2, Offset(WIFI4_CLICK_hdB+8)(GP)
;WIFI4_CLICK.c,316 :: 		hdB.storage[0].len     = 0;
SH	R0, Offset(WIFI4_CLICK_hdB+4)(GP)
;WIFI4_CLICK.c,317 :: 		hdB.idx                = 1;
ORI	R2, R0, 1
SH	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
;WIFI4_CLICK.c,318 :: 		}
L_end_WIFI4_coreInit:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WIFI4_coreInit
_WIFI4_setHandler:
;WIFI4_CLICK.c,320 :: 		uint16_t WIFI4_setHandler( uint8_t *pCmd, uint32_t timeout, T_WIFI4_handler pHandler )
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI4_CLICK.c,323 :: 		if (_WIFI4_STORAGE_SIZE <= hdB.idx)
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLTIU	R2, R2, 16
BEQ	R2, R0, L__WIFI4_setHandler109
NOP	
J	L_WIFI4_setHandler29
NOP	
L__WIFI4_setHandler109:
;WIFI4_CLICK.c,325 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_WIFI4_setHandler
NOP	
;WIFI4_CLICK.c,326 :: 		}
L_WIFI4_setHandler29:
;WIFI4_CLICK.c,327 :: 		if (locateHandler(pCmd)) //ako vec postoji handler za komandu
SW	R25, 4(SP)
JAL	WIFI4_CLICK_locateHandler+0
NOP	
LW	R25, 4(SP)
BNE	R2, R0, L__WIFI4_setHandler111
NOP	
J	L_WIFI4_setHandler30
NOP	
L__WIFI4_setHandler111:
;WIFI4_CLICK.c,329 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_WIFI4_setHandler
NOP	
;WIFI4_CLICK.c,330 :: 		}
L_WIFI4_setHandler30:
;WIFI4_CLICK.c,333 :: 		if (0 == pHandler)
BEQ	R27, R0, L__WIFI4_setHandler112
NOP	
J	L_WIFI4_setHandler31
NOP	
L__WIFI4_setHandler112:
;WIFI4_CLICK.c,335 :: 		hdB.storage[hdB.idx].handler = hdB.storage[0].handler;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
LW	R2, Offset(WIFI4_CLICK_hdB+16)(GP)
SW	R2, 0(R3)
;WIFI4_CLICK.c,336 :: 		}
J	L_WIFI4_setHandler32
NOP	
L_WIFI4_setHandler31:
;WIFI4_CLICK.c,339 :: 		hdB.storage[hdB.idx].handler = pHandler;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R27, 0(R2)
;WIFI4_CLICK.c,340 :: 		}
L_WIFI4_setHandler32:
;WIFI4_CLICK.c,341 :: 		if (0 == timeout)
BEQ	R26, R0, L__WIFI4_setHandler113
NOP	
J	L_WIFI4_setHandler33
NOP	
L__WIFI4_setHandler113:
;WIFI4_CLICK.c,343 :: 		hdB.storage[hdB.idx].timeout =hdB.storage[0].timeout;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
LW	R2, Offset(WIFI4_CLICK_hdB+12)(GP)
SW	R2, 0(R3)
;WIFI4_CLICK.c,344 :: 		}
J	L_WIFI4_setHandler34
NOP	
L_WIFI4_setHandler33:
;WIFI4_CLICK.c,347 :: 		hdB.storage[hdB.idx].timeout = timeout;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R26, 0(R2)
;WIFI4_CLICK.c,348 :: 		}
L_WIFI4_setHandler34:
;WIFI4_CLICK.c,350 :: 		hdB.storage[hdB.idx].len  = strlen(pCmd);
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
SW	R2, 8(SP)
JAL	_strlen+0
NOP	
LW	R3, 8(SP)
SH	R2, 0(R3)
;WIFI4_CLICK.c,351 :: 		hdB.storage[hdB.idx].hash = generateHash(pCmd);
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SW	R2, 8(SP)
JAL	WIFI4_CLICK_generateHash+0
NOP	
LW	R3, 8(SP)
SW	R2, 0(R3)
;WIFI4_CLICK.c,352 :: 		hdB.idx++;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
;WIFI4_CLICK.c,354 :: 		return hdB.idx-1; //return index in handler storage
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
ADDIU	R2, R2, -1
;WIFI4_CLICK.c,355 :: 		}
L_end_WIFI4_setHandler:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WIFI4_setHandler
_StrToHex:
;WIFI4_CLICK.c,358 :: 		void StrToHex(uint8_t *string,uint8_t *output)
ADDIU	SP, SP, -96
SW	RA, 0(SP)
;WIFI4_CLICK.c,363 :: 		strcpy(hex,"");
ADDIU	R2, SP, 15
SW	R26, 4(SP)
SW	R25, 8(SP)
LUI	R26, hi_addr(?lstr2_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr2_WIFI4_CLICK+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
;WIFI4_CLICK.c,365 :: 		for(i=0;i<strlen(string)-1;i++)
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_StrToHex35:
; i start address is: 24 (R6)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, -1
ANDI	R3, R6, 255
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__StrToHex115
NOP	
J	L_StrToHex36
NOP	
L__StrToHex115:
;WIFI4_CLICK.c,367 :: 		ByteToHex(string[i],tmp);
ADDIU	R3, SP, 12
ANDI	R2, R6, 255
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SW	R26, 4(SP)
SW	R25, 8(SP)
MOVZ	R26, R3, R0
ANDI	R25, R2, 255
JAL	_ByteToHex+0
NOP	
;WIFI4_CLICK.c,368 :: 		strcat(hex,tmp);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 15
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
;WIFI4_CLICK.c,365 :: 		for(i=0;i<strlen(string)-1;i++)
ADDIU	R2, R6, 1
ANDI	R6, R2, 255
;WIFI4_CLICK.c,369 :: 		}
; i end address is: 24 (R6)
J	L_StrToHex35
NOP	
L_StrToHex36:
;WIFI4_CLICK.c,370 :: 		strcpy(output,hex);
ADDIU	R2, SP, 15
SW	R26, 4(SP)
SW	R25, 8(SP)
MOVZ	R25, R26, R0
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
;WIFI4_CLICK.c,371 :: 		}
L_end_StrToHex:
LW	RA, 0(SP)
ADDIU	SP, SP, 96
JR	RA
NOP	
; end of _StrToHex
_WIFI4_writeText:
;WIFI4_CLICK.c,377 :: 		void WIFI4_writeText(uint8_t *txt,uint8_t nBytes)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI4_CLICK.c,380 :: 		for(i=0;i<nBytes;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_WIFI4_writeText38:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
ANDI	R2, R26, 255
SLTU	R2, R3, R2
BNE	R2, R0, L__WIFI4_writeText117
NOP	
J	L_WIFI4_writeText39
NOP	
L__WIFI4_writeText117:
;WIFI4_CLICK.c,382 :: 		hal_uartWrite(txt[i]);
ANDI	R2, R4, 255
ADDU	R2, R25, R2
SB	R4, 4(SP)
SB	R26, 5(SP)
SW	R25, 8(SP)
LBU	R25, 0(R2)
JAL	WIFI4_CLICK_hal_uartWrite+0
NOP	
LW	R25, 8(SP)
LBU	R26, 5(SP)
LBU	R4, 4(SP)
;WIFI4_CLICK.c,380 :: 		for(i=0;i<nBytes;i++)
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;WIFI4_CLICK.c,383 :: 		}
; i end address is: 16 (R4)
J	L_WIFI4_writeText38
NOP	
L_WIFI4_writeText39:
;WIFI4_CLICK.c,384 :: 		hal_uartWrite(TERMINATION_CHAR);
SB	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 13
JAL	WIFI4_CLICK_hal_uartWrite+0
NOP	
LW	R25, 8(SP)
LBU	R26, 4(SP)
;WIFI4_CLICK.c,385 :: 		}
L_end_WIFI4_writeText:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WIFI4_writeText
_WIFI4_modulePower:
;WIFI4_CLICK.c,392 :: 		void WIFI4_modulePower( uint8_t powerState )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,394 :: 		if (0 != powerState)
SW	R25, 4(SP)
ANDI	R2, R25, 255
BNE	R2, R0, L__WIFI4_modulePower120
NOP	
J	L_WIFI4_modulePower41
NOP	
L__WIFI4_modulePower120:
;WIFI4_CLICK.c,397 :: 		hal_gpio_rstSet(1);
ORI	R25, R0, 1
LW	R30, Offset(WIFI4_CLICK_hal_gpio_rstSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,399 :: 		}
J	L_WIFI4_modulePower42
NOP	
L_WIFI4_modulePower41:
;WIFI4_CLICK.c,403 :: 		hal_gpio_rstSet(0);
MOVZ	R25, R0, R0
LW	R30, Offset(WIFI4_CLICK_hal_gpio_rstSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,404 :: 		}
L_WIFI4_modulePower42:
;WIFI4_CLICK.c,405 :: 		}
L_end_WIFI4_modulePower:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WIFI4_modulePower
_WIFI4_uartDriverInit:
;WIFI4_CLICK.c,407 :: 		void WIFI4_uartDriverInit(T_WIFI4_P gpio,T_WIFI4_P uart)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,409 :: 		hal_gpioMap((T_HAL_P)gpio);
SW	R25, 4(SP)
JAL	WIFI4_CLICK_hal_gpioMap+0
NOP	
;WIFI4_CLICK.c,410 :: 		hal_uartMap((T_HAL_P)uart);
MOVZ	R25, R26, R0
JAL	WIFI4_CLICK_hal_uartMap+0
NOP	
;WIFI4_CLICK.c,413 :: 		hal_gpio_rstSet(1);
ORI	R25, R0, 1
LW	R30, Offset(WIFI4_CLICK_hal_gpio_rstSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,414 :: 		}
L_end_WIFI4_uartDriverInit:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WIFI4_uartDriverInit
_WIFI4_setSSID:
;WIFI4_CLICK.c,417 :: 		void WIFI4_setSSID(uint8_t *ssid)
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;WIFI4_CLICK.c,419 :: 		char comm[30]="AT+S.SSIDTXT=";
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICSWIFI4_setSSID_comm_L0+0)
ORI	R24, R24, lo_addr(?ICSWIFI4_setSSID_comm_L0+0)
JAL	___CC2DW+0
NOP	
;WIFI4_CLICK.c,420 :: 		strcat(comm,ssid);
ADDIU	R2, SP, 12
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,421 :: 		WIFI4_writeText2(comm);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_WIFI4_writeText2+0
NOP	
;WIFI4_CLICK.c,422 :: 		}
L_end_WIFI4_setSSID:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _WIFI4_setSSID
_WIFI4_cmdSingle:
;WIFI4_CLICK.c,425 :: 		void WIFI4_cmdSingle(char* command,char *param){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI4_CLICK.c,426 :: 		cmdSingle(command,param,DEFAULT_WTIME,0);
SW	R27, 4(SP)
SW	R28, 8(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 5
JAL	WIFI4_CLICK_cmdSingle+0
NOP	
;WIFI4_CLICK.c,427 :: 		}
L_end_WIFI4_cmdSingle:
LW	R28, 8(SP)
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WIFI4_cmdSingle
_WIFI4_ping:
;WIFI4_CLICK.c,429 :: 		void WIFI4_ping(uint8_t *ipAddr)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;WIFI4_CLICK.c,431 :: 		cmdSingle("AT+S.PING=",ipAddr,2000,0);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 2000
MOVZ	R26, R25, R0
LUI	R25, hi_addr(?lstr3_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr3_WIFI4_CLICK+0)
JAL	WIFI4_CLICK_cmdSingle+0
NOP	
;WIFI4_CLICK.c,434 :: 		}
L_end_WIFI4_ping:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _WIFI4_ping
_WIFI4_connectToAP:
;WIFI4_CLICK.c,435 :: 		void WIFI4_connectToAP(uint8_t* ssid,uint8_t *pass)
ADDIU	SP, SP, -100
SW	RA, 0(SP)
;WIFI4_CLICK.c,438 :: 		WIFI4_cmdSingle("AT+S.SCFG=","wifi_priv_mode,2");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LUI	R26, hi_addr(?lstr5_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr5_WIFI4_CLICK+0)
LUI	R25, hi_addr(?lstr4_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr4_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,439 :: 		WIFI4_cmdSingle("AT+S.SCFG=","wifi_mode,1");
LUI	R26, hi_addr(?lstr7_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr7_WIFI4_CLICK+0)
LUI	R25, hi_addr(?lstr6_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr6_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,440 :: 		WIFI4_cmdSingle("AT+S.SCFG=","ip_use_dhcp,1");
LUI	R26, hi_addr(?lstr9_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr9_WIFI4_CLICK+0)
LUI	R25, hi_addr(?lstr8_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr8_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
LW	R25, 16(SP)
;WIFI4_CLICK.c,442 :: 		WIFI4_cmdSingle("AT+S.SSIDTXT=",ssid);
MOVZ	R26, R25, R0
LUI	R25, hi_addr(?lstr10_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr10_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,445 :: 		strcpy(newPass,"wifi_wpa_psk_text,");
ADDIU	R2, SP, 20
LUI	R26, hi_addr(?lstr11_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr11_WIFI4_CLICK+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R26, 12(SP)
;WIFI4_CLICK.c,446 :: 		strcat(newPass,pass);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,447 :: 		WIFI4_cmdSingle("AT+S.SCFG=",newPass);
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
LUI	R25, hi_addr(?lstr12_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr12_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,448 :: 		}
L_end_WIFI4_connectToAP:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 100
JR	RA
NOP	
; end of _WIFI4_connectToAP
_WIFI4_putc:
;WIFI4_CLICK.c,450 :: 		void WIFI4_putc(char c)
;WIFI4_CLICK.c,452 :: 		flag_cmdEx=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,453 :: 		f_timerStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,454 :: 		respTime=0;
SW	R0, Offset(WIFI4_CLICK_respTime+0)(GP)
;WIFI4_CLICK.c,455 :: 		rxB.buff[rxB.ind++]=c;
LHU	R3, Offset(WIFI4_CLICK_rxB+2500)(GP)
LUI	R2, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_rxB+0)
ADDU	R2, R2, R3
SB	R25, 0(R2)
LHU	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,457 :: 		}
L_end_WIFI4_putc:
JR	RA
NOP	
; end of _WIFI4_putc
_WIFI4_tick:
;WIFI4_CLICK.c,459 :: 		void WIFI4_tick()
;WIFI4_CLICK.c,461 :: 		if(f_timerStart){
LBU	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
BNE	R2, R0, L__WIFI4_tick129
NOP	
J	L_WIFI4_tick43
NOP	
L__WIFI4_tick129:
;WIFI4_CLICK.c,462 :: 		if((++respTime) > waitTime)
LW	R2, Offset(WIFI4_CLICK_respTime+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(WIFI4_CLICK_respTime+0)(GP)
LHU	R3, Offset(WIFI4_CLICK_waitTime+0)(GP)
LW	R2, Offset(WIFI4_CLICK_respTime+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WIFI4_tick130
NOP	
J	L_WIFI4_tick44
NOP	
L__WIFI4_tick130:
;WIFI4_CLICK.c,464 :: 		flag_timesUp=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_timesUp+0)(GP)
;WIFI4_CLICK.c,466 :: 		}
L_WIFI4_tick44:
;WIFI4_CLICK.c,467 :: 		}
L_WIFI4_tick43:
;WIFI4_CLICK.c,468 :: 		if(f_wdogStart){
LBU	R2, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
BNE	R2, R0, L__WIFI4_tick132
NOP	
J	L_WIFI4_tick45
NOP	
L__WIFI4_tick132:
;WIFI4_CLICK.c,469 :: 		if((++watchDogTime) > currentEv.wDogLimit)
LHU	R2, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
LW	R3, Offset(WIFI4_CLICK_currentEv+4)(GP)
LHU	R2, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WIFI4_tick133
NOP	
J	L_WIFI4_tick46
NOP	
L__WIFI4_tick133:
;WIFI4_CLICK.c,471 :: 		flag_wdogOut=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_wdogOut+0)(GP)
;WIFI4_CLICK.c,473 :: 		}
L_WIFI4_tick46:
;WIFI4_CLICK.c,474 :: 		}
L_WIFI4_tick45:
;WIFI4_CLICK.c,475 :: 		}
L_end_WIFI4_tick:
JR	RA
NOP	
; end of _WIFI4_tick
_WIFI4_process:
;WIFI4_CLICK.c,479 :: 		void WIFI4_process()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI4_CLICK.c,482 :: 		if(f_wDogStart){
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
BNE	R2, R0, L__WIFI4_process136
NOP	
J	L_WIFI4_process47
NOP	
L__WIFI4_process136:
;WIFI4_CLICK.c,483 :: 		if(flag_wdogOut)
LBU	R2, Offset(WIFI4_CLICK_flag_wdogOut+0)(GP)
BNE	R2, R0, L__WIFI4_process138
NOP	
J	L_WIFI4_process48
NOP	
L__WIFI4_process138:
;WIFI4_CLICK.c,485 :: 		DTE_setState(0);
MOVZ	R25, R0, R0
JAL	WIFI4_CLICK_DTE_setState+0
NOP	
;WIFI4_CLICK.c,487 :: 		f_wdogStart=0;
SB	R0, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
;WIFI4_CLICK.c,488 :: 		f_timerStart=0;
SB	R0, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,489 :: 		rxB.buff[rxB.ind++]='\0';
LHU	R3, Offset(WIFI4_CLICK_rxB+2500)(GP)
LUI	R2, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_rxB+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
LHU	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,490 :: 		if(f_cpyRXtoTmp == 1)
LBU	R3, Offset(WIFI4_CLICK_f_cpyRXtoTmp+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__WIFI4_process139
NOP	
J	L_WIFI4_process49
NOP	
L__WIFI4_process139:
;WIFI4_CLICK.c,492 :: 		strcpy(tmpB.buff,rxB.buff);
LUI	R26, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_rxB+0)
LUI	R25, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_tmpB+0)
JAL	_strcpy+0
NOP	
;WIFI4_CLICK.c,493 :: 		tmpB.ind=rxB.ind;
LHU	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
SH	R2, Offset(WIFI4_CLICK_tmpB+2500)(GP)
;WIFI4_CLICK.c,494 :: 		f_cpyRXtoTmp=0;
SB	R0, Offset(WIFI4_CLICK_f_cpyRXtoTmp+0)(GP)
;WIFI4_CLICK.c,495 :: 		}
L_WIFI4_process49:
;WIFI4_CLICK.c,496 :: 		createEvent(rxB.buff, &currentEv);
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+0)
LUI	R25, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_rxB+0)
JAL	WIFI4_CLICK_createEvent+0
NOP	
;WIFI4_CLICK.c,498 :: 		EXEC_EVENT(_WIFI4_EVENT_RESPONSE);
SB	R0, Offset(WIFI4_CLICK_currentEv+10)(GP)
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+8)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+8)
LUI	R25, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_rxB+0)
LW	R30, Offset(WIFI4_CLICK_currentEv+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,500 :: 		rxB.buff[0]=0;
SB	R0, Offset(WIFI4_CLICK_rxB+0)(GP)
;WIFI4_CLICK.c,501 :: 		rxB.ind=0;
SH	R0, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,502 :: 		flag_wdogOut=0;
SB	R0, Offset(WIFI4_CLICK_flag_wdogOut+0)(GP)
;WIFI4_CLICK.c,503 :: 		flag_cmdEx=0;
SB	R0, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,505 :: 		DTE_setState(1);
ORI	R25, R0, 1
JAL	WIFI4_CLICK_DTE_setState+0
NOP	
;WIFI4_CLICK.c,507 :: 		}
L_WIFI4_process48:
;WIFI4_CLICK.c,508 :: 		}
L_WIFI4_process47:
;WIFI4_CLICK.c,509 :: 		if(f_TimerStart){
LBU	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
BNE	R2, R0, L__WIFI4_process141
NOP	
J	L_WIFI4_process50
NOP	
L__WIFI4_process141:
;WIFI4_CLICK.c,510 :: 		if(flag_timesUp)
LBU	R2, Offset(WIFI4_CLICK_flag_timesUp+0)(GP)
BNE	R2, R0, L__WIFI4_process143
NOP	
J	L_WIFI4_process51
NOP	
L__WIFI4_process143:
;WIFI4_CLICK.c,512 :: 		DTE_setState(0);
MOVZ	R25, R0, R0
JAL	WIFI4_CLICK_DTE_setState+0
NOP	
;WIFI4_CLICK.c,513 :: 		f_wdogStart=0;
SB	R0, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
;WIFI4_CLICK.c,514 :: 		f_timerStart=0;
SB	R0, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,515 :: 		rxB.buff[rxB.ind++]='\0';
LHU	R3, Offset(WIFI4_CLICK_rxB+2500)(GP)
LUI	R2, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_rxB+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
LHU	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,516 :: 		if(f_cpyRXtoTmp == 1)
LBU	R3, Offset(WIFI4_CLICK_f_cpyRXtoTmp+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__WIFI4_process144
NOP	
J	L_WIFI4_process52
NOP	
L__WIFI4_process144:
;WIFI4_CLICK.c,518 :: 		strcpy(tmpB.buff,rxB.buff);
LUI	R26, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_rxB+0)
LUI	R25, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_tmpB+0)
JAL	_strcpy+0
NOP	
;WIFI4_CLICK.c,519 :: 		tmpB.ind=rxB.ind;
LHU	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
SH	R2, Offset(WIFI4_CLICK_tmpB+2500)(GP)
;WIFI4_CLICK.c,520 :: 		f_cpyRXtoTmp=0;
SB	R0, Offset(WIFI4_CLICK_f_cpyRXtoTmp+0)(GP)
;WIFI4_CLICK.c,521 :: 		}
L_WIFI4_process52:
;WIFI4_CLICK.c,522 :: 		createEvent(rxB.buff, &currentEv);
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+0)
LUI	R25, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_rxB+0)
JAL	WIFI4_CLICK_createEvent+0
NOP	
;WIFI4_CLICK.c,523 :: 		EXEC_EVENT(_WIFI4_EVENT_RESPONSE);
SB	R0, Offset(WIFI4_CLICK_currentEv+10)(GP)
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+8)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+8)
LUI	R25, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_rxB+0)
LW	R30, Offset(WIFI4_CLICK_currentEv+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,525 :: 		rxB.buff[0]=0;
SB	R0, Offset(WIFI4_CLICK_rxB+0)(GP)
;WIFI4_CLICK.c,526 :: 		rxB.ind=0;
SH	R0, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,527 :: 		flag_timesUp=0;
SB	R0, Offset(WIFI4_CLICK_flag_timesUp+0)(GP)
;WIFI4_CLICK.c,528 :: 		flag_cmdEx=0;
SB	R0, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,529 :: 		DTE_setState(1);
ORI	R25, R0, 1
JAL	WIFI4_CLICK_DTE_setState+0
NOP	
;WIFI4_CLICK.c,530 :: 		}
L_WIFI4_process51:
;WIFI4_CLICK.c,531 :: 		}
L_WIFI4_process50:
;WIFI4_CLICK.c,532 :: 		}
L_end_WIFI4_process:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WIFI4_process
_WIFI4_createFile:
;WIFI4_CLICK.c,534 :: 		void WIFI4_createFile(uint8_t *name,uint16_t len)
ADDIU	SP, SP, -64
SW	RA, 0(SP)
;WIFI4_CLICK.c,537 :: 		strcpy(params,name);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 14
SH	R26, 12(SP)
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;WIFI4_CLICK.c,538 :: 		strcat(params,",");
ADDIU	R2, SP, 14
LUI	R26, hi_addr(?lstr13_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr13_WIFI4_CLICK+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LHU	R26, 12(SP)
;WIFI4_CLICK.c,539 :: 		strcat(params,len);
ADDIU	R2, SP, 14
ANDI	R26, R26, 65535
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,540 :: 		WIFI4_cmdSingle("AT+S.FSC=",params);
ADDIU	R2, SP, 14
MOVZ	R26, R2, R0
LUI	R25, hi_addr(?lstr14_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr14_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,541 :: 		}
L_end_WIFI4_createFile:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 64
JR	RA
NOP	
; end of _WIFI4_createFile
_WIFI4_getIPAddress:
;WIFI4_CLICK.c,549 :: 		void WIFI4_getIPAddress(uint8_t *ip)
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;WIFI4_CLICK.c,552 :: 		uint8_t ind=0;
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R28, 12(SP)
; ind start address is: 28 (R7)
MOVZ	R7, R0, R0
;WIFI4_CLICK.c,554 :: 		cmdSingle("AT+S.STS=","ip_ipaddr",DEFAULT_WTIME,0);
SB	R7, 16(SP)
SW	R25, 20(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 5
LUI	R26, hi_addr(?lstr16_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr16_WIFI4_CLICK+0)
LUI	R25, hi_addr(?lstr15_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr15_WIFI4_CLICK+0)
JAL	WIFI4_CLICK_cmdSingle+0
NOP	
; ind end address is: 28 (R7)
LW	R25, 20(SP)
LBU	R7, 16(SP)
;WIFI4_CLICK.c,555 :: 		while(tmpB.buff[ind] != '=' && ind<tmpB.ind)
L_WIFI4_getIPAddress53:
; ind start address is: 28 (R7)
ANDI	R3, R7, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 61
BNE	R3, R2, L__WIFI4_getIPAddress148
NOP	
J	L__WIFI4_getIPAddress72
NOP	
L__WIFI4_getIPAddress148:
ANDI	R3, R7, 255
LHU	R2, Offset(WIFI4_CLICK_tmpB+2500)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WIFI4_getIPAddress149
NOP	
J	L__WIFI4_getIPAddress71
NOP	
L__WIFI4_getIPAddress149:
L__WIFI4_getIPAddress70:
;WIFI4_CLICK.c,557 :: 		ind++;
ADDIU	R2, R7, 1
ANDI	R7, R2, 255
;WIFI4_CLICK.c,558 :: 		}
J	L_WIFI4_getIPAddress53
NOP	
;WIFI4_CLICK.c,555 :: 		while(tmpB.buff[ind] != '=' && ind<tmpB.ind)
L__WIFI4_getIPAddress72:
L__WIFI4_getIPAddress71:
;WIFI4_CLICK.c,559 :: 		if( tmpB.buff[ind] != '\0') //RESPONSE OK
ANDI	R3, R7, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__WIFI4_getIPAddress151
NOP	
J	L_WIFI4_getIPAddress57
NOP	
L__WIFI4_getIPAddress151:
;WIFI4_CLICK.c,561 :: 		strcpy(str,tmpB.buff[++ind]);
ADDIU	R2, R7, 1
ANDI	R7, R2, 255
ANDI	R3, R2, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
LBU	R3, 0(R2)
ADDIU	R2, SP, 24
SW	R25, 16(SP)
ANDI	R26, R3, 255
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;WIFI4_CLICK.c,562 :: 		ip[0]=atoi(str);
MOVZ	R2, R25, R0
SW	R2, 28(SP)
ADDIU	R2, SP, 24
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
LW	R3, 28(SP)
SB	R2, 0(R3)
; ind end address is: 28 (R7)
;WIFI4_CLICK.c,563 :: 		while(tmpB.buff[ind]!='.')
L_WIFI4_getIPAddress58:
; ind start address is: 28 (R7)
ANDI	R3, R7, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 46
BNE	R3, R2, L__WIFI4_getIPAddress153
NOP	
J	L_WIFI4_getIPAddress59
NOP	
L__WIFI4_getIPAddress153:
;WIFI4_CLICK.c,565 :: 		ind++;
ADDIU	R2, R7, 1
ANDI	R7, R2, 255
;WIFI4_CLICK.c,566 :: 		}
J	L_WIFI4_getIPAddress58
NOP	
L_WIFI4_getIPAddress59:
;WIFI4_CLICK.c,567 :: 		strcpy(str,tmpB.buff[++ind]);
ADDIU	R2, R7, 1
ANDI	R7, R2, 255
ANDI	R3, R2, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
LBU	R3, 0(R2)
ADDIU	R2, SP, 24
SW	R25, 16(SP)
ANDI	R26, R3, 255
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;WIFI4_CLICK.c,568 :: 		ip[1]=atoi(str);
ADDIU	R2, R25, 1
SW	R2, 28(SP)
ADDIU	R2, SP, 24
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
LW	R3, 28(SP)
SB	R2, 0(R3)
; ind end address is: 28 (R7)
;WIFI4_CLICK.c,569 :: 		while(tmpB.buff[ind]!='.')
L_WIFI4_getIPAddress60:
; ind start address is: 28 (R7)
ANDI	R3, R7, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 46
BNE	R3, R2, L__WIFI4_getIPAddress155
NOP	
J	L_WIFI4_getIPAddress61
NOP	
L__WIFI4_getIPAddress155:
;WIFI4_CLICK.c,571 :: 		ind++;
ADDIU	R2, R7, 1
ANDI	R7, R2, 255
;WIFI4_CLICK.c,572 :: 		}
J	L_WIFI4_getIPAddress60
NOP	
L_WIFI4_getIPAddress61:
;WIFI4_CLICK.c,573 :: 		strcpy(str,tmpB.buff[++ind]);
ADDIU	R2, R7, 1
ANDI	R7, R2, 255
ANDI	R3, R2, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
LBU	R3, 0(R2)
ADDIU	R2, SP, 24
SW	R25, 16(SP)
ANDI	R26, R3, 255
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;WIFI4_CLICK.c,574 :: 		ip[2]=atoi(str);
ADDIU	R2, R25, 2
SW	R2, 28(SP)
ADDIU	R2, SP, 24
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
LW	R3, 28(SP)
SB	R2, 0(R3)
; ind end address is: 28 (R7)
;WIFI4_CLICK.c,575 :: 		while(tmpB.buff[ind]!='.')
L_WIFI4_getIPAddress62:
; ind start address is: 28 (R7)
ANDI	R3, R7, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 46
BNE	R3, R2, L__WIFI4_getIPAddress157
NOP	
J	L_WIFI4_getIPAddress63
NOP	
L__WIFI4_getIPAddress157:
;WIFI4_CLICK.c,577 :: 		ind++;
ADDIU	R2, R7, 1
ANDI	R7, R2, 255
;WIFI4_CLICK.c,578 :: 		}
J	L_WIFI4_getIPAddress62
NOP	
L_WIFI4_getIPAddress63:
;WIFI4_CLICK.c,579 :: 		strcpy(str,tmpB.buff[++ind]);
ADDIU	R2, R7, 1
; ind end address is: 28 (R7)
ANDI	R3, R2, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
LBU	R3, 0(R2)
ADDIU	R2, SP, 24
SW	R25, 16(SP)
ANDI	R26, R3, 255
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;WIFI4_CLICK.c,580 :: 		ip[3]=atoi(str);
ADDIU	R2, R25, 3
SW	R2, 28(SP)
ADDIU	R2, SP, 24
SW	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
LW	R25, 16(SP)
LW	R3, 28(SP)
SB	R2, 0(R3)
;WIFI4_CLICK.c,581 :: 		}
L_WIFI4_getIPAddress57:
;WIFI4_CLICK.c,582 :: 		}
L_end_WIFI4_getIPAddress:
LW	R28, 12(SP)
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _WIFI4_getIPAddress
_WIFI4_socketOpen:
;WIFI4_CLICK.c,592 :: 		uint8_t WIFI4_socketOpen(uint8_t *host,uint32_t port,uint8_t protocol)
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;WIFI4_CLICK.c,597 :: 		IntToStr(port,sPort);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, SP, 54
SW	R25, 20(SP)
MOVZ	R25, R26, R0
MOVZ	R26, R2, R0
JAL	_IntToStr+0
NOP	
;WIFI4_CLICK.c,598 :: 		strcpy(tmp,"");
ADDIU	R2, SP, 24
LUI	R26, hi_addr(?lstr17_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr17_WIFI4_CLICK+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 20(SP)
;WIFI4_CLICK.c,599 :: 		strcat(tmp,host);
ADDIU	R2, SP, 24
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,600 :: 		strcat(tmp,",");
ADDIU	R2, SP, 24
LUI	R26, hi_addr(?lstr18_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr18_WIFI4_CLICK+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,601 :: 		strcat(tmp,sPort);
ADDIU	R3, SP, 54
ADDIU	R2, SP, 24
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,602 :: 		strcat(tmp,",");
ADDIU	R2, SP, 24
LUI	R26, hi_addr(?lstr19_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr19_WIFI4_CLICK+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,603 :: 		ByteToStr(protocol,sPort);
ADDIU	R2, SP, 54
MOVZ	R26, R2, R0
ANDI	R25, R27, 255
JAL	_ByteToStr+0
NOP	
;WIFI4_CLICK.c,604 :: 		strcat(tmp,sPort);
ADDIU	R3, SP, 54
ADDIU	R2, SP, 24
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,606 :: 		cmdSingle("AT+S.SOCKON=",tmp,1000,1);
ADDIU	R2, SP, 24
ORI	R28, R0, 1
ORI	R27, R0, 1000
MOVZ	R26, R2, R0
LUI	R25, hi_addr(?lstr20_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr20_WIFI4_CLICK+0)
JAL	WIFI4_CLICK_cmdSingle+0
NOP	
;WIFI4_CLICK.c,608 :: 		i=strchr(tmpB.buff,':');
ORI	R26, R0, 58
LUI	R25, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_tmpB+0)
JAL	_strchr+0
NOP	
;WIFI4_CLICK.c,609 :: 		ret=atoi(tmpB.buff+i+1);
ANDI	R3, R2, 255
LUI	R2, hi_addr(WIFI4_CLICK_tmpB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_tmpB+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
;WIFI4_CLICK.c,610 :: 		return ret;
;WIFI4_CLICK.c,611 :: 		}
;WIFI4_CLICK.c,610 :: 		return ret;
;WIFI4_CLICK.c,611 :: 		}
L_end_WIFI4_socketOpen:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of _WIFI4_socketOpen
_WIFI4_socketWrite:
;WIFI4_CLICK.c,618 :: 		void WIFI4_socketWrite(uint8_t id,uint8_t *wdata)
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;WIFI4_CLICK.c,620 :: 		uint16_t len=strlen(wdata);
SW	R25, 4(SP)
SB	R25, 8(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LBU	R25, 8(SP)
; len start address is: 24 (R6)
SEH	R6, R2
;WIFI4_CLICK.c,623 :: 		IntToStr(len,slen);
ADDIU	R3, SP, 13
SW	R26, 8(SP)
SB	R25, 12(SP)
MOVZ	R26, R3, R0
ANDI	R25, R2, 65535
JAL	_IntToStr+0
NOP	
;WIFI4_CLICK.c,625 :: 		strcpy(cmd,"AT+S.SOCKW=");
ADDIU	R2, SP, 17
LUI	R26, hi_addr(?lstr21_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr21_WIFI4_CLICK+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 12(SP)
;WIFI4_CLICK.c,626 :: 		strcat(cmd,id);
ADDIU	R2, SP, 17
ANDI	R26, R25, 255
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,627 :: 		strcat(cmd,',');
ADDIU	R2, SP, 17
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,628 :: 		strcat(cmd,len);
ADDIU	R2, SP, 17
; len end address is: 24 (R6)
ANDI	R26, R6, 65535
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LW	R26, 8(SP)
;WIFI4_CLICK.c,631 :: 		while(0 != flag_cmdEx)
L_WIFI4_socketWrite64:
LBU	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
BNE	R2, R0, L__WIFI4_socketWrite161
NOP	
J	L_WIFI4_socketWrite65
NOP	
L__WIFI4_socketWrite161:
;WIFI4_CLICK.c,633 :: 		WIFI4_process();
SW	R26, 8(SP)
SB	R25, 12(SP)
JAL	_WIFI4_process+0
NOP	
LBU	R25, 12(SP)
LW	R26, 8(SP)
;WIFI4_CLICK.c,634 :: 		}
J	L_WIFI4_socketWrite64
NOP	
L_WIFI4_socketWrite65:
;WIFI4_CLICK.c,635 :: 		createEvent(cmd,&currentEv);
ADDIU	R2, SP, 17
SW	R26, 8(SP)
SB	R25, 12(SP)
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+0)
MOVZ	R25, R2, R0
JAL	WIFI4_CLICK_createEvent+0
NOP	
;WIFI4_CLICK.c,636 :: 		WIFI4_writeText2(cmd);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_WIFI4_writeText2+0
NOP	
LBU	R25, 12(SP)
LW	R26, 8(SP)
;WIFI4_CLICK.c,637 :: 		WIFI4_writeText2(wdata);
SW	R26, 8(SP)
SB	R25, 12(SP)
MOVZ	R25, R26, R0
JAL	_WIFI4_writeText2+0
NOP	
LBU	R25, 12(SP)
LW	R26, 8(SP)
;WIFI4_CLICK.c,639 :: 		watchDogTime=0; //reset watchdog
SH	R0, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
;WIFI4_CLICK.c,640 :: 		waitTime=DEFAULT_WTIME;
ORI	R2, R0, 5
SH	R2, Offset(WIFI4_CLICK_waitTime+0)(GP)
;WIFI4_CLICK.c,641 :: 		f_wdogStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
;WIFI4_CLICK.c,642 :: 		f_timerStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,643 :: 		flag_cmdEx=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,644 :: 		f_cpyRXtoTmp=0;
SB	R0, Offset(WIFI4_CLICK_f_cpyRXtoTmp+0)(GP)
;WIFI4_CLICK.c,646 :: 		while(0 != flag_cmdEx)
L_WIFI4_socketWrite66:
LBU	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
BNE	R2, R0, L__WIFI4_socketWrite163
NOP	
J	L_WIFI4_socketWrite67
NOP	
L__WIFI4_socketWrite163:
;WIFI4_CLICK.c,648 :: 		WIFI4_process();
SW	R26, 8(SP)
SB	R25, 12(SP)
JAL	_WIFI4_process+0
NOP	
LBU	R25, 12(SP)
LW	R26, 8(SP)
;WIFI4_CLICK.c,649 :: 		}
J	L_WIFI4_socketWrite66
NOP	
L_WIFI4_socketWrite67:
;WIFI4_CLICK.c,650 :: 		}
L_end_WIFI4_socketWrite:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of _WIFI4_socketWrite
_WIFI4_socketClose:
;WIFI4_CLICK.c,652 :: 		void WIFI4_socketClose(uint8_t id)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;WIFI4_CLICK.c,655 :: 		ByteToStr(id,str);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
JAL	_ByteToStr+0
NOP	
;WIFI4_CLICK.c,656 :: 		WIFI4_cmdSIngle("AT+S.SOCKC=",str);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
LUI	R25, hi_addr(?lstr22_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr22_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,658 :: 		}
L_end_WIFI4_socketClose:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _WIFI4_socketClose
_WIFI4_socketServerOpen:
;WIFI4_CLICK.c,667 :: 		void WIFI4_socketServerOpen(uint16_t port)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;WIFI4_CLICK.c,670 :: 		LongToStr(port,sPort);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
ANDI	R25, R25, 65535
JAL	_LongToStr+0
NOP	
;WIFI4_CLICK.c,671 :: 		mikrobus_logWrite(sPort,_LOG_LINE);
ADDIU	R2, SP, 12
ORI	R26, R0, 2
MOVZ	R25, R2, R0
JAL	_mikrobus_logWrite+0
NOP	
;WIFI4_CLICK.c,672 :: 		WIFI4_cmdSingle("AT+S.SOCKD=",sPort);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
LUI	R25, hi_addr(?lstr23_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr23_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,673 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;WIFI4_CLICK.c,674 :: 		}
L_end_WIFI4_socketServerOpen:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _WIFI4_socketServerOpen
_WIFI4_socketServerClose:
;WIFI4_CLICK.c,675 :: 		void WIFI4_socketServerClose()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI4_CLICK.c,677 :: 		WIFI4_cmdSingle("AT+S","");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(?lstr25_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr25_WIFI4_CLICK+0)
LUI	R25, hi_addr(?lstr24_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr24_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,678 :: 		WIFI4_cmdSingle("AT+S.SOCKD=",0x0D);
ORI	R26, R0, 13
LUI	R25, hi_addr(?lstr26_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr26_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,679 :: 		}
L_end_WIFI4_socketServerClose:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WIFI4_socketServerClose
