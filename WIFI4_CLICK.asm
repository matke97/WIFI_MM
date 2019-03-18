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
;WIFI4_CLICK.c,37 :: 		static void DTE_setState(uint8_t state)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,40 :: 		if (1 == state)
SW	R25, 4(SP)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_WIFI4_CLICK_DTE_setState72
NOP	
J	L_WIFI4_CLICK_DTE_setState0
NOP	
L_WIFI4_CLICK_DTE_setState72:
;WIFI4_CLICK.c,42 :: 		hal_gpio_intSet( 0 );
MOVZ	R25, R0, R0
LW	R30, Offset(WIFI4_CLICK_hal_gpio_intSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,43 :: 		}
J	L_WIFI4_CLICK_DTE_setState1
NOP	
L_WIFI4_CLICK_DTE_setState0:
;WIFI4_CLICK.c,46 :: 		hal_gpio_intSet( 1 );
ORI	R25, R0, 1
LW	R30, Offset(WIFI4_CLICK_hal_gpio_intSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,47 :: 		}
L_WIFI4_CLICK_DTE_setState1:
;WIFI4_CLICK.c,49 :: 		}
L_end_DTE_setState:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of WIFI4_CLICK_DTE_setState
WIFI4_CLICK_DCE_getState:
;WIFI4_CLICK.c,51 :: 		static uint8_t DCE_getState()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;WIFI4_CLICK.c,54 :: 		if (0 != hal_gpio_csGet())
LW	R30, Offset(WIFI4_CLICK_hal_gpio_csGet+0)(GP)
JALR	RA, R30
NOP	
ANDI	R2, R2, 255
BNE	R2, R0, L_WIFI4_CLICK_DCE_getState75
NOP	
J	L_WIFI4_CLICK_DCE_getState2
NOP	
L_WIFI4_CLICK_DCE_getState75:
;WIFI4_CLICK.c,56 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_DCE_getState
NOP	
;WIFI4_CLICK.c,57 :: 		}
L_WIFI4_CLICK_DCE_getState2:
;WIFI4_CLICK.c,60 :: 		return 1;
ORI	R2, R0, 1
;WIFI4_CLICK.c,63 :: 		}
L_end_DCE_getState:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of WIFI4_CLICK_DCE_getState
WIFI4_CLICK_generateHash:
;WIFI4_CLICK.c,135 :: 		static uint32_t generateHash( char *pCmd )
;WIFI4_CLICK.c,137 :: 		uint8_t  cnt  = 0;
; cnt start address is: 20 (R5)
MOVZ	R5, R0, R0
;WIFI4_CLICK.c,138 :: 		uint16_t ch   = 0;
;WIFI4_CLICK.c,139 :: 		uint32_t hash = 5;
; hash start address is: 24 (R6)
ORI	R6, R0, 5
; hash end address is: 24 (R6)
; cnt end address is: 20 (R5)
;WIFI4_CLICK.c,141 :: 		while ( ch = *pCmd++ )
L_WIFI4_CLICK_generateHash4:
; hash start address is: 24 (R6)
; cnt start address is: 20 (R5)
MOVZ	R3, R25, R0
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
LBU	R2, 0(R3)
; ch start address is: 16 (R4)
ANDI	R4, R2, 255
BNE	R4, R0, L_WIFI4_CLICK_generateHash78
NOP	
J	L_WIFI4_CLICK_generateHash5
NOP	
L_WIFI4_CLICK_generateHash78:
;WIFI4_CLICK.c,143 :: 		hash += (ch << (cnt % 8));
ANDI	R2, R5, 7
ANDI	R3, R4, 65535
ANDI	R2, R2, 255
SLLV	R2, R3, R2
ANDI	R2, R2, 65535
ADDU	R2, R6, R2
MOVZ	R6, R2, R0
;WIFI4_CLICK.c,144 :: 		cnt++;
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;WIFI4_CLICK.c,145 :: 		}
; ch end address is: 16 (R4)
; cnt end address is: 20 (R5)
J	L_WIFI4_CLICK_generateHash4
NOP	
L_WIFI4_CLICK_generateHash5:
;WIFI4_CLICK.c,146 :: 		return hash;
MOVZ	R2, R6, R0
; hash end address is: 24 (R6)
;WIFI4_CLICK.c,147 :: 		}
L_end_generateHash:
JR	RA
NOP	
; end of WIFI4_CLICK_generateHash
WIFI4_CLICK_locateHandler:
;WIFI4_CLICK.c,151 :: 		static uint16_t locateHandler( char* pCmd )
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;WIFI4_CLICK.c,158 :: 		len = strlen(pCmd);
JAL	_strlen+0
NOP	
; len start address is: 28 (R7)
SEH	R7, R2
;WIFI4_CLICK.c,159 :: 		hash = generateHash(pCmd);
JAL	WIFI4_CLICK_generateHash+0
NOP	
; hash start address is: 16 (R4)
MOVZ	R4, R2, R0
;WIFI4_CLICK.c,161 :: 		for (idx = 1; idx < hdB.idx; idx++)
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
BNE	R2, R0, L_WIFI4_CLICK_locateHandler80
NOP	
J	L_WIFI4_CLICK_locateHandler7
NOP	
L_WIFI4_CLICK_locateHandler80:
; hash end address is: 16 (R4)
; len end address is: 20 (R5)
;WIFI4_CLICK.c,163 :: 		if (hdB.storage[idx].len == len)
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
BEQ	R3, R2, L_WIFI4_CLICK_locateHandler81
NOP	
J	L_WIFI4_CLICK_locateHandler9
NOP	
L_WIFI4_CLICK_locateHandler81:
;WIFI4_CLICK.c,165 :: 		if (hdB.storage[idx].hash == hash)
ANDI	R2, R6, 65535
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LW	R2, 0(R2)
BEQ	R2, R4, L_WIFI4_CLICK_locateHandler82
NOP	
J	L_WIFI4_CLICK_locateHandler10
NOP	
L_WIFI4_CLICK_locateHandler82:
; hash end address is: 16 (R4)
; len end address is: 20 (R5)
;WIFI4_CLICK.c,167 :: 		return idx;
ANDI	R2, R6, 65535
; idx end address is: 24 (R6)
J	L_end_locateHandler
NOP	
;WIFI4_CLICK.c,168 :: 		}
L_WIFI4_CLICK_locateHandler10:
;WIFI4_CLICK.c,169 :: 		}
; idx start address is: 24 (R6)
; len start address is: 20 (R5)
; hash start address is: 16 (R4)
L_WIFI4_CLICK_locateHandler9:
;WIFI4_CLICK.c,161 :: 		for (idx = 1; idx < hdB.idx; idx++)
ADDIU	R2, R6, 1
ANDI	R6, R2, 65535
;WIFI4_CLICK.c,170 :: 		}
; hash end address is: 16 (R4)
; len end address is: 20 (R5)
; idx end address is: 24 (R6)
J	L_WIFI4_CLICK_locateHandler6
NOP	
L_WIFI4_CLICK_locateHandler7:
;WIFI4_CLICK.c,172 :: 		return 0;
MOVZ	R2, R0, R0
;WIFI4_CLICK.c,173 :: 		}
L_end_locateHandler:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of WIFI4_CLICK_locateHandler
WIFI4_CLICK_searchLut:
;WIFI4_CLICK.c,178 :: 		static uint8_t searchLut( char* pInput, char (*pLut)[ LUTS_WIDTH ], uint8_t lutSize, uint8_t flag )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;WIFI4_CLICK.c,180 :: 		uint8_t     inLen    = 0;
;WIFI4_CLICK.c,181 :: 		uint8_t     inOff    = 0;
;WIFI4_CLICK.c,182 :: 		uint8_t     lutLen   = 0;
;WIFI4_CLICK.c,183 :: 		uint8_t     lutIdx   = 0;
;WIFI4_CLICK.c,185 :: 		if (_WIFI4_CMD_MAXSIZE < (inLen = strlen(pInput)))
JAL	_strlen+0
NOP	
; inLen start address is: 12 (R3)
SEH	R3, R2
ANDI	R2, R2, 255
SLTIU	R2, R2, 11
BEQ	R2, R0, L_WIFI4_CLICK_searchLut84
NOP	
J	L_WIFI4_CLICK_searchLut60
NOP	
L_WIFI4_CLICK_searchLut84:
; inLen end address is: 12 (R3)
;WIFI4_CLICK.c,187 :: 		inLen =_WIFI4_CMD_MAXSIZE;
; inLen start address is: 24 (R6)
ORI	R6, R0, 10
; inLen end address is: 24 (R6)
;WIFI4_CLICK.c,188 :: 		}
J	L_WIFI4_CLICK_searchLut11
NOP	
L_WIFI4_CLICK_searchLut60:
;WIFI4_CLICK.c,185 :: 		if (_WIFI4_CMD_MAXSIZE < (inLen = strlen(pInput)))
ANDI	R6, R3, 255
;WIFI4_CLICK.c,188 :: 		}
L_WIFI4_CLICK_searchLut11:
;WIFI4_CLICK.c,190 :: 		for (lutIdx = 1; lutIdx < lutSize; lutIdx++)
; inLen start address is: 24 (R6)
; lutIdx start address is: 20 (R5)
ORI	R5, R0, 1
; inLen end address is: 24 (R6)
; lutIdx end address is: 20 (R5)
L_WIFI4_CLICK_searchLut12:
; lutIdx start address is: 20 (R5)
; inLen start address is: 24 (R6)
ANDI	R3, R5, 255
ANDI	R2, R27, 255
SLTU	R2, R3, R2
BNE	R2, R0, L_WIFI4_CLICK_searchLut85
NOP	
J	L_WIFI4_CLICK_searchLut13
NOP	
L_WIFI4_CLICK_searchLut85:
;WIFI4_CLICK.c,192 :: 		lutLen = strlen(pLut[lutIdx]);
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
;WIFI4_CLICK.c,194 :: 		for (inOff = 0; inOff < inLen; inOff++)
; inOff start address is: 32 (R8)
MOVZ	R8, R0, R0
; inLen end address is: 24 (R6)
; inOff end address is: 32 (R8)
; lutIdx end address is: 20 (R5)
L_WIFI4_CLICK_searchLut15:
; inOff start address is: 32 (R8)
; lutLen start address is: 28 (R7)
; lutLen end address is: 28 (R7)
; inLen start address is: 24 (R6)
; lutIdx start address is: 20 (R5)
ANDI	R3, R8, 255
ANDI	R2, R6, 255
SLTU	R2, R3, R2
BNE	R2, R0, L_WIFI4_CLICK_searchLut86
NOP	
J	L_WIFI4_CLICK_searchLut16
NOP	
L_WIFI4_CLICK_searchLut86:
; lutLen end address is: 28 (R7)
;WIFI4_CLICK.c,196 :: 		if (!strncmp(pLut[lutIdx], pInput + inOff, lutLen))
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
BEQ	R2, R0, L_WIFI4_CLICK_searchLut87
NOP	
J	L_WIFI4_CLICK_searchLut18
NOP	
L_WIFI4_CLICK_searchLut87:
;WIFI4_CLICK.c,198 :: 		if (SEARCH_IDX == flag)
ANDI	R2, R28, 255
BEQ	R2, R0, L_WIFI4_CLICK_searchLut88
NOP	
J	L_WIFI4_CLICK_searchLut19
NOP	
L_WIFI4_CLICK_searchLut88:
; lutLen end address is: 28 (R7)
; inLen end address is: 24 (R6)
; inOff end address is: 32 (R8)
;WIFI4_CLICK.c,200 :: 		return lutIdx;
ANDI	R2, R5, 255
; lutIdx end address is: 20 (R5)
J	L_end_searchLut
NOP	
;WIFI4_CLICK.c,201 :: 		}
L_WIFI4_CLICK_searchLut19:
;WIFI4_CLICK.c,202 :: 		else if (SEARCH_OFFSET == flag)
; lutIdx start address is: 20 (R5)
; inOff start address is: 32 (R8)
; inLen start address is: 24 (R6)
; lutLen start address is: 28 (R7)
ANDI	R3, R28, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_WIFI4_CLICK_searchLut89
NOP	
J	L_WIFI4_CLICK_searchLut21
NOP	
L_WIFI4_CLICK_searchLut89:
; lutLen end address is: 28 (R7)
; inLen end address is: 24 (R6)
; lutIdx end address is: 20 (R5)
;WIFI4_CLICK.c,204 :: 		return inOff;
ANDI	R2, R8, 255
; inOff end address is: 32 (R8)
J	L_end_searchLut
NOP	
;WIFI4_CLICK.c,205 :: 		}
L_WIFI4_CLICK_searchLut21:
;WIFI4_CLICK.c,206 :: 		}
; lutIdx start address is: 20 (R5)
; inOff start address is: 32 (R8)
; inLen start address is: 24 (R6)
; lutLen start address is: 28 (R7)
L_WIFI4_CLICK_searchLut18:
;WIFI4_CLICK.c,194 :: 		for (inOff = 0; inOff < inLen; inOff++)
ADDIU	R2, R8, 1
ANDI	R8, R2, 255
;WIFI4_CLICK.c,207 :: 		}
; lutLen end address is: 28 (R7)
; inOff end address is: 32 (R8)
J	L_WIFI4_CLICK_searchLut15
NOP	
L_WIFI4_CLICK_searchLut16:
;WIFI4_CLICK.c,190 :: 		for (lutIdx = 1; lutIdx < lutSize; lutIdx++)
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;WIFI4_CLICK.c,208 :: 		}
; inLen end address is: 24 (R6)
; lutIdx end address is: 20 (R5)
J	L_WIFI4_CLICK_searchLut12
NOP	
L_WIFI4_CLICK_searchLut13:
;WIFI4_CLICK.c,209 :: 		return 0;
MOVZ	R2, R0, R0
;WIFI4_CLICK.c,210 :: 		}
L_end_searchLut:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of WIFI4_CLICK_searchLut
WIFI4_CLICK_createEvent:
;WIFI4_CLICK.c,211 :: 		static void createEvent( char *pInput, T_CORE_event *pEvent )
ADDIU	SP, SP, -36
SW	RA, 0(SP)
;WIFI4_CLICK.c,213 :: 		uint8_t hIdx     = 0;
SW	R25, 4(SP)
SW	R27, 8(SP)
SW	R28, 12(SP)
;WIFI4_CLICK.c,214 :: 		uint8_t startIdx = 0;
;WIFI4_CLICK.c,215 :: 		uint8_t startOff = 0;
;WIFI4_CLICK.c,216 :: 		uint8_t endIdx   = 0;
;WIFI4_CLICK.c,217 :: 		uint8_t endOff   = 0;
;WIFI4_CLICK.c,219 :: 		char tmp[_WIFI4_CMD_MAXSIZE + 1] = { 0 };
ADDIU	R23, SP, 24
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICSWIFI4_CLICK_createEvent_tmp_L0+0)
ORI	R24, R24, lo_addr(?ICSWIFI4_CLICK_createEvent_tmp_L0+0)
JAL	___CC2DW+0
NOP	
;WIFI4_CLICK.c,222 :: 		startIdx = searchLut(pInput, LUT_START, LUT_SIZE, SEARCH_IDX);
SW	R26, 16(SP)
SW	R25, 20(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 3
LUI	R26, hi_addr(WIFI4_CLICK_LUT_START+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_LUT_START+0)
JAL	WIFI4_CLICK_searchLut+0
NOP	
LW	R25, 20(SP)
;WIFI4_CLICK.c,223 :: 		startOff = searchLut(pInput, LUT_START, LUT_SIZE, SEARCH_OFFSET);
SW	R25, 20(SP)
ORI	R28, R0, 1
ORI	R27, R0, 3
LUI	R26, hi_addr(WIFI4_CLICK_LUT_START+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_LUT_START+0)
JAL	WIFI4_CLICK_searchLut+0
NOP	
LW	R25, 20(SP)
; startOff start address is: 36 (R9)
ANDI	R9, R2, 255
;WIFI4_CLICK.c,224 :: 		endIdx = searchLut(pInput, LUT_END, LUT_SIZE_END, SEARCH_IDX);
SW	R25, 20(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 4
LUI	R26, hi_addr(WIFI4_CLICK_LUT_END+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_LUT_END+0)
JAL	WIFI4_CLICK_searchLut+0
NOP	
LW	R25, 20(SP)
;WIFI4_CLICK.c,225 :: 		endOff = searchLut(pInput, LUT_END, LUT_SIZE_END, SEARCH_OFFSET);
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
;WIFI4_CLICK.c,227 :: 		if (0 == endOff)
ANDI	R2, R2, 255
BEQ	R2, R0, L_WIFI4_CLICK_createEvent91
NOP	
J	L_WIFI4_CLICK_createEvent61
NOP	
L_WIFI4_CLICK_createEvent91:
; endOff end address is: 12 (R3)
;WIFI4_CLICK.c,229 :: 		endOff = _WIFI4_CMD_MAXSIZE;
; endOff start address is: 16 (R4)
ORI	R4, R0, 10
; endOff end address is: 16 (R4)
;WIFI4_CLICK.c,230 :: 		}
J	L_WIFI4_CLICK_createEvent22
NOP	
L_WIFI4_CLICK_createEvent61:
;WIFI4_CLICK.c,227 :: 		if (0 == endOff)
ANDI	R4, R3, 255
;WIFI4_CLICK.c,230 :: 		}
L_WIFI4_CLICK_createEvent22:
;WIFI4_CLICK.c,233 :: 		strncpy(tmp, pInput + startOff, endOff - startOff);
; endOff start address is: 16 (R4)
ANDI	R3, R9, 255
ANDI	R2, R4, 255
; endOff end address is: 16 (R4)
SUBU	R4, R2, R3
ANDI	R2, R9, 255
; startOff end address is: 36 (R9)
ADDU	R3, R25, R2
ADDIU	R2, SP, 24
SW	R26, 16(SP)
SEH	R27, R4
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
LW	R26, 16(SP)
;WIFI4_CLICK.c,234 :: 		hIdx                         = locateHandler(tmp);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	WIFI4_CLICK_locateHandler+0
NOP	
; hIdx start address is: 20 (R5)
ANDI	R5, R2, 65535
;WIFI4_CLICK.c,235 :: 		pEvent->fpHdl                = hdB.storage[hIdx].handler;
ANDI	R2, R2, 255
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
LW	R2, 0(R2)
SW	R2, 0(R26)
;WIFI4_CLICK.c,236 :: 		pEvent->wDogLimit            = hdB.storage[hIdx].timeout;
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
;WIFI4_CLICK.c,239 :: 		}
L_end_createEvent:
LW	R28, 12(SP)
LW	R27, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of WIFI4_CLICK_createEvent
_WIFI4_coreInit:
;WIFI4_CLICK.c,247 :: 		void WIFI4_coreInit(T_WIFI4_handler defaultHdl, uint32_t defaultWdog)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,250 :: 		flag_cmdEx          = 0;
SW	R25, 4(SP)
SB	R0, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,252 :: 		flag_timesUp=0;
SB	R0, Offset(WIFI4_CLICK_flag_timesUp+0)(GP)
;WIFI4_CLICK.c,253 :: 		flag_wdogOut=0;
SB	R0, Offset(WIFI4_CLICK_flag_wdogOut+0)(GP)
;WIFI4_CLICK.c,255 :: 		waitTime=DEFAULT_WTIME;
ORI	R2, R0, 5
SH	R2, Offset(WIFI4_CLICK_waitTime+0)(GP)
;WIFI4_CLICK.c,257 :: 		hdB.storage[0].handler = defaultHdl;
SW	R25, Offset(WIFI4_CLICK_hdB+16)(GP)
;WIFI4_CLICK.c,258 :: 		hdB.storage[0].timeout = defaultWdog;
SW	R26, Offset(WIFI4_CLICK_hdB+12)(GP)
;WIFI4_CLICK.c,259 :: 		hdB.storage[0].hash    = generateHash("");
LUI	R25, hi_addr(?lstr1_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr1_WIFI4_CLICK+0)
JAL	WIFI4_CLICK_generateHash+0
NOP	
SW	R2, Offset(WIFI4_CLICK_hdB+8)(GP)
;WIFI4_CLICK.c,260 :: 		hdB.storage[0].len     = 0;
SH	R0, Offset(WIFI4_CLICK_hdB+4)(GP)
;WIFI4_CLICK.c,261 :: 		hdB.idx                = 1;
ORI	R2, R0, 1
SH	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
;WIFI4_CLICK.c,262 :: 		}
L_end_WIFI4_coreInit:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WIFI4_coreInit
_WIFI4_setHandler:
;WIFI4_CLICK.c,264 :: 		uint16_t WIFI4_setHandler( uint8_t *pCmd, uint32_t timeout, T_WIFI4_handler pHandler )
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI4_CLICK.c,267 :: 		if (_WIFI4_STORAGE_SIZE <= hdB.idx)
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLTIU	R2, R2, 8
BEQ	R2, R0, L__WIFI4_setHandler94
NOP	
J	L_WIFI4_setHandler23
NOP	
L__WIFI4_setHandler94:
;WIFI4_CLICK.c,269 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_WIFI4_setHandler
NOP	
;WIFI4_CLICK.c,270 :: 		}
L_WIFI4_setHandler23:
;WIFI4_CLICK.c,271 :: 		if (locateHandler(pCmd)) //ako vec postoji handler za komandu
SW	R25, 4(SP)
JAL	WIFI4_CLICK_locateHandler+0
NOP	
LW	R25, 4(SP)
BNE	R2, R0, L__WIFI4_setHandler96
NOP	
J	L_WIFI4_setHandler24
NOP	
L__WIFI4_setHandler96:
;WIFI4_CLICK.c,273 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_WIFI4_setHandler
NOP	
;WIFI4_CLICK.c,274 :: 		}
L_WIFI4_setHandler24:
;WIFI4_CLICK.c,277 :: 		if (0 == pHandler)
BEQ	R27, R0, L__WIFI4_setHandler97
NOP	
J	L_WIFI4_setHandler25
NOP	
L__WIFI4_setHandler97:
;WIFI4_CLICK.c,279 :: 		hdB.storage[hdB.idx].handler = hdB.storage[0].handler;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
LW	R2, Offset(WIFI4_CLICK_hdB+16)(GP)
SW	R2, 0(R3)
;WIFI4_CLICK.c,280 :: 		}
J	L_WIFI4_setHandler26
NOP	
L_WIFI4_setHandler25:
;WIFI4_CLICK.c,283 :: 		hdB.storage[hdB.idx].handler = pHandler;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R27, 0(R2)
;WIFI4_CLICK.c,284 :: 		}
L_WIFI4_setHandler26:
;WIFI4_CLICK.c,285 :: 		if (0 == timeout)
BEQ	R26, R0, L__WIFI4_setHandler98
NOP	
J	L_WIFI4_setHandler27
NOP	
L__WIFI4_setHandler98:
;WIFI4_CLICK.c,287 :: 		hdB.storage[hdB.idx].timeout =hdB.storage[0].timeout;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
LW	R2, Offset(WIFI4_CLICK_hdB+12)(GP)
SW	R2, 0(R3)
;WIFI4_CLICK.c,288 :: 		}
J	L_WIFI4_setHandler28
NOP	
L_WIFI4_setHandler27:
;WIFI4_CLICK.c,291 :: 		hdB.storage[hdB.idx].timeout = timeout;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
SLL	R3, R2, 4
LUI	R2, hi_addr(WIFI4_CLICK_hdB+4)
ORI	R2, R2, lo_addr(WIFI4_CLICK_hdB+4)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R26, 0(R2)
;WIFI4_CLICK.c,292 :: 		}
L_WIFI4_setHandler28:
;WIFI4_CLICK.c,294 :: 		hdB.storage[hdB.idx].len  = strlen(pCmd);
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
;WIFI4_CLICK.c,295 :: 		hdB.storage[hdB.idx].hash = generateHash(pCmd);
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
;WIFI4_CLICK.c,296 :: 		hdB.idx++;
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
;WIFI4_CLICK.c,298 :: 		return hdB.idx-1; //return index in handler storage
LHU	R2, Offset(WIFI4_CLICK_hdB+0)(GP)
ADDIU	R2, R2, -1
;WIFI4_CLICK.c,299 :: 		}
L_end_WIFI4_setHandler:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WIFI4_setHandler
_WIFI4_responseRec:
;WIFI4_CLICK.c,304 :: 		void WIFI4_responseRec(uint16_t timeW)
;WIFI4_CLICK.c,309 :: 		uint8_t flag1=0,endFLag=0;
; endFLag start address is: 16 (R4)
MOVZ	R4, R0, R0
;WIFI4_CLICK.c,311 :: 		cnt=0;
; cnt start address is: 8 (R2)
MOVZ	R2, R0, R0
; cnt end address is: 8 (R2)
; endFLag end address is: 16 (R4)
;WIFI4_CLICK.c,312 :: 		while( 1 != endFlag && rxB.ind<BUFF_MAXSIZE)
L_WIFI4_responseRec29:
; endFLag start address is: 16 (R4)
ANDI	R3, R4, 255
ORI	R2, R0, 1
BNE	R3, R2, L__WIFI4_responseRec101
NOP	
J	L__WIFI4_responseRec64
NOP	
L__WIFI4_responseRec101:
LHU	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
SLTIU	R2, R2, 2500
BNE	R2, R0, L__WIFI4_responseRec102
NOP	
J	L__WIFI4_responseRec63
NOP	
L__WIFI4_responseRec102:
L__WIFI4_responseRec62:
;WIFI4_CLICK.c,315 :: 		if(respTime>timeW) //ako nema odgovra vise od 5ms!
ANDI	R3, R25, 65535
LW	R2, Offset(WIFI4_CLICK_respTime+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WIFI4_responseRec103
NOP	
J	L__WIFI4_responseRec65
NOP	
L__WIFI4_responseRec103:
; endFLag end address is: 16 (R4)
;WIFI4_CLICK.c,317 :: 		endFlag=1; // kraj responsa
; endFLag start address is: 8 (R2)
ORI	R2, R0, 1
; endFLag end address is: 8 (R2)
ANDI	R4, R2, 255
;WIFI4_CLICK.c,318 :: 		}
J	L_WIFI4_responseRec33
NOP	
L__WIFI4_responseRec65:
;WIFI4_CLICK.c,315 :: 		if(respTime>timeW) //ako nema odgovra vise od 5ms!
;WIFI4_CLICK.c,318 :: 		}
L_WIFI4_responseRec33:
;WIFI4_CLICK.c,319 :: 		}
; endFLag start address is: 16 (R4)
; endFLag end address is: 16 (R4)
J	L_WIFI4_responseRec29
NOP	
;WIFI4_CLICK.c,312 :: 		while( 1 != endFlag && rxB.ind<BUFF_MAXSIZE)
L__WIFI4_responseRec64:
L__WIFI4_responseRec63:
;WIFI4_CLICK.c,321 :: 		rxB.buff[rxB.ind]='\0';
LHU	R3, Offset(WIFI4_CLICK_rxB+2500)(GP)
LUI	R2, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_rxB+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;WIFI4_CLICK.c,322 :: 		}
L_end_WIFI4_responseRec:
JR	RA
NOP	
; end of _WIFI4_responseRec
_StrToHex:
;WIFI4_CLICK.c,323 :: 		void StrToHex(uint8_t *string,uint8_t *output)
ADDIU	SP, SP, -96
SW	RA, 0(SP)
;WIFI4_CLICK.c,328 :: 		strcpy(hex,"");
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
;WIFI4_CLICK.c,330 :: 		for(i=0;i<strlen(string)-1;i++)
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_StrToHex34:
; i start address is: 24 (R6)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, -1
ANDI	R3, R6, 255
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__StrToHex105
NOP	
J	L_StrToHex35
NOP	
L__StrToHex105:
;WIFI4_CLICK.c,332 :: 		ByteToHex(string[i],tmp);
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
;WIFI4_CLICK.c,333 :: 		strcat(hex,tmp);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 15
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
;WIFI4_CLICK.c,330 :: 		for(i=0;i<strlen(string)-1;i++)
ADDIU	R2, R6, 1
ANDI	R6, R2, 255
;WIFI4_CLICK.c,334 :: 		}
; i end address is: 24 (R6)
J	L_StrToHex34
NOP	
L_StrToHex35:
;WIFI4_CLICK.c,335 :: 		strcpy(output,hex);
ADDIU	R2, SP, 15
SW	R26, 4(SP)
SW	R25, 8(SP)
MOVZ	R25, R26, R0
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 8(SP)
LW	R26, 4(SP)
;WIFI4_CLICK.c,336 :: 		}
L_end_StrToHex:
LW	RA, 0(SP)
ADDIU	SP, SP, 96
JR	RA
NOP	
; end of _StrToHex
_WIFI4_writeText:
;WIFI4_CLICK.c,338 :: 		void WIFI4_writeText(uint8_t *txt,uint8_t nBytes)
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI4_CLICK.c,341 :: 		for(i=0;i<nBytes;i++)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_WIFI4_writeText37:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
ANDI	R2, R26, 255
SLTU	R2, R3, R2
BNE	R2, R0, L__WIFI4_writeText107
NOP	
J	L_WIFI4_writeText38
NOP	
L__WIFI4_writeText107:
;WIFI4_CLICK.c,343 :: 		hal_uartWrite(txt[i]);
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
;WIFI4_CLICK.c,341 :: 		for(i=0;i<nBytes;i++)
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;WIFI4_CLICK.c,344 :: 		}
; i end address is: 16 (R4)
J	L_WIFI4_writeText37
NOP	
L_WIFI4_writeText38:
;WIFI4_CLICK.c,345 :: 		hal_uartWrite(TERMINATION_CHAR);
SB	R26, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 13
JAL	WIFI4_CLICK_hal_uartWrite+0
NOP	
LW	R25, 8(SP)
LBU	R26, 4(SP)
;WIFI4_CLICK.c,346 :: 		}
L_end_WIFI4_writeText:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WIFI4_writeText
_WIFI4_writeText2:
;WIFI4_CLICK.c,350 :: 		void WIFI4_writeText2(uint8_t *txt)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,353 :: 		while(0 != *txt)
L_WIFI4_writeText240:
LBU	R2, 0(R25)
ANDI	R2, R2, 255
BNE	R2, R0, L__WIFI4_writeText2110
NOP	
J	L_WIFI4_writeText241
NOP	
L__WIFI4_writeText2110:
;WIFI4_CLICK.c,355 :: 		hal_uartWrite(*txt++);
SW	R25, 4(SP)
LBU	R25, 0(R25)
JAL	WIFI4_CLICK_hal_uartWrite+0
NOP	
LW	R25, 4(SP)
ADDIU	R2, R25, 1
MOVZ	R25, R2, R0
;WIFI4_CLICK.c,356 :: 		}
J	L_WIFI4_writeText240
NOP	
L_WIFI4_writeText241:
;WIFI4_CLICK.c,357 :: 		hal_uartWrite(TERMINATION_CHAR);
SW	R25, 4(SP)
ORI	R25, R0, 13
JAL	WIFI4_CLICK_hal_uartWrite+0
NOP	
LW	R25, 4(SP)
;WIFI4_CLICK.c,358 :: 		}
L_end_WIFI4_writeText2:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WIFI4_writeText2
_WIFI4_modulePower:
;WIFI4_CLICK.c,360 :: 		void WIFI4_modulePower( uint8_t powerState )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,362 :: 		if (0 != powerState)
SW	R25, 4(SP)
ANDI	R2, R25, 255
BNE	R2, R0, L__WIFI4_modulePower113
NOP	
J	L_WIFI4_modulePower42
NOP	
L__WIFI4_modulePower113:
;WIFI4_CLICK.c,365 :: 		hal_gpio_rstSet(1);
ORI	R25, R0, 1
LW	R30, Offset(WIFI4_CLICK_hal_gpio_rstSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,367 :: 		}
J	L_WIFI4_modulePower43
NOP	
L_WIFI4_modulePower42:
;WIFI4_CLICK.c,371 :: 		hal_gpio_rstSet(0);
MOVZ	R25, R0, R0
LW	R30, Offset(WIFI4_CLICK_hal_gpio_rstSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,372 :: 		}
L_WIFI4_modulePower43:
;WIFI4_CLICK.c,373 :: 		}
L_end_WIFI4_modulePower:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WIFI4_modulePower
_WIFI4_uartDriverInit:
;WIFI4_CLICK.c,375 :: 		void WIFI4_uartDriverInit(T_WIFI4_P gpio,T_WIFI4_P uart)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;WIFI4_CLICK.c,377 :: 		hal_gpioMap((T_HAL_P)gpio);
SW	R25, 4(SP)
JAL	WIFI4_CLICK_hal_gpioMap+0
NOP	
;WIFI4_CLICK.c,378 :: 		hal_uartMap((T_HAL_P)uart);
MOVZ	R25, R26, R0
JAL	WIFI4_CLICK_hal_uartMap+0
NOP	
;WIFI4_CLICK.c,379 :: 		rxB.ind=0;
SH	R0, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,380 :: 		respTime=0;
SW	R0, Offset(WIFI4_CLICK_respTime+0)(GP)
;WIFI4_CLICK.c,381 :: 		rxB.buff[0]=0;
SB	R0, Offset(WIFI4_CLICK_rxB+0)(GP)
;WIFI4_CLICK.c,382 :: 		rxB.ind=0;
SH	R0, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,383 :: 		hal_gpio_rstSet(1);
ORI	R25, R0, 1
LW	R30, Offset(WIFI4_CLICK_hal_gpio_rstSet+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,384 :: 		}
L_end_WIFI4_uartDriverInit:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WIFI4_uartDriverInit
_WIFI4_setSSID:
;WIFI4_CLICK.c,389 :: 		void WIFI4_setSSID(uint8_t *ssid)
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;WIFI4_CLICK.c,391 :: 		char comm[30]="AT+S.SSIDTXT=";
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICSWIFI4_setSSID_comm_L0+0)
ORI	R24, R24, lo_addr(?ICSWIFI4_setSSID_comm_L0+0)
JAL	___CC2DW+0
NOP	
;WIFI4_CLICK.c,392 :: 		strcat(comm,ssid);
ADDIU	R2, SP, 12
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,393 :: 		WIFI4_writeText2(comm);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_WIFI4_writeText2+0
NOP	
;WIFI4_CLICK.c,394 :: 		}
L_end_WIFI4_setSSID:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _WIFI4_setSSID
_WIFI4_getSSID:
;WIFI4_CLICK.c,395 :: 		void WIFI4_getSSID()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI4_CLICK.c,398 :: 		WIFI4_cmdSingle(comm,"");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(?lstr3_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr3_WIFI4_CLICK+0)
LUI	R25, hi_addr(WIFI4_getSSID_comm_L0+0)
ORI	R25, R25, lo_addr(WIFI4_getSSID_comm_L0+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,399 :: 		}
L_end_WIFI4_getSSID:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WIFI4_getSSID
_WIFI4_cmdSingle:
;WIFI4_CLICK.c,401 :: 		void WIFI4_cmdSingle(char* command,char *param){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;WIFI4_CLICK.c,403 :: 		strcpy(tmp,command);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 20
SW	R26, 12(SP)
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R26, 12(SP)
;WIFI4_CLICK.c,404 :: 		strcat(tmp,param);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,405 :: 		strcpy(txBuff,tmp);
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
LUI	R25, hi_addr(WIFI4_CLICK_txBuff+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_txBuff+0)
JAL	_strcpy+0
NOP	
;WIFI4_CLICK.c,407 :: 		while(0 != flag_cmdEx)
L_WIFI4_cmdSingle44:
LBU	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
BNE	R2, R0, L__WIFI4_cmdSingle119
NOP	
J	L_WIFI4_cmdSingle45
NOP	
L__WIFI4_cmdSingle119:
;WIFI4_CLICK.c,409 :: 		WIFI4_process();
SW	R26, 12(SP)
SW	R25, 16(SP)
JAL	_WIFI4_process+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;WIFI4_CLICK.c,410 :: 		}
J	L_WIFI4_cmdSingle44
NOP	
L_WIFI4_cmdSingle45:
;WIFI4_CLICK.c,411 :: 		createEvent(tmp,&currentEv);
ADDIU	R2, SP, 20
SW	R26, 12(SP)
SW	R25, 16(SP)
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+0)
MOVZ	R25, R2, R0
JAL	WIFI4_CLICK_createEvent+0
NOP	
;WIFI4_CLICK.c,412 :: 		WIFI4_writeText2(tmp);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_WIFI4_writeText2+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;WIFI4_CLICK.c,414 :: 		watchDogTime=0; //reset watchdog
SH	R0, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
;WIFI4_CLICK.c,415 :: 		waitTime=DEFAULT_WTIME;
ORI	R2, R0, 5
SH	R2, Offset(WIFI4_CLICK_waitTime+0)(GP)
;WIFI4_CLICK.c,416 :: 		f_wdogStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
;WIFI4_CLICK.c,417 :: 		f_timerStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,418 :: 		flag_cmdEx=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,420 :: 		while(0 != flag_cmdEx)
L_WIFI4_cmdSingle46:
LBU	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
BNE	R2, R0, L__WIFI4_cmdSingle121
NOP	
J	L_WIFI4_cmdSingle47
NOP	
L__WIFI4_cmdSingle121:
;WIFI4_CLICK.c,422 :: 		WIFI4_process();
SW	R26, 12(SP)
SW	R25, 16(SP)
JAL	_WIFI4_process+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
;WIFI4_CLICK.c,423 :: 		}
J	L_WIFI4_cmdSingle46
NOP	
L_WIFI4_cmdSingle47:
;WIFI4_CLICK.c,424 :: 		}
L_end_WIFI4_cmdSingle:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _WIFI4_cmdSingle
_WIFI4_ping:
;WIFI4_CLICK.c,426 :: 		void WIFI4_ping(uint8_t *ipAddr)
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;WIFI4_CLICK.c,429 :: 		strcpy(tmp,"AT+S.PING=");
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 16
SW	R25, 12(SP)
LUI	R26, hi_addr(?lstr4_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr4_WIFI4_CLICK+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 12(SP)
;WIFI4_CLICK.c,430 :: 		strcat(tmp,ipAddr);
ADDIU	R2, SP, 16
MOVZ	R26, R25, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,431 :: 		while(0 != flag_cmdEx)
L_WIFI4_ping48:
LBU	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
BNE	R2, R0, L__WIFI4_ping124
NOP	
J	L_WIFI4_ping49
NOP	
L__WIFI4_ping124:
;WIFI4_CLICK.c,433 :: 		WIFI4_process();
SW	R25, 12(SP)
JAL	_WIFI4_process+0
NOP	
LW	R25, 12(SP)
;WIFI4_CLICK.c,434 :: 		}
J	L_WIFI4_ping48
NOP	
L_WIFI4_ping49:
;WIFI4_CLICK.c,435 :: 		createEvent(tmp,&currentEv);
ADDIU	R2, SP, 16
SW	R25, 12(SP)
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+0)
MOVZ	R25, R2, R0
JAL	WIFI4_CLICK_createEvent+0
NOP	
;WIFI4_CLICK.c,436 :: 		currentEv.wDogLimit=3*currentEv.wDogLimit;
LW	R3, Offset(WIFI4_CLICK_currentEv+4)(GP)
ORI	R2, R0, 3
MULTU	R2, R3
MFLO	R2
SW	R2, Offset(WIFI4_CLICK_currentEv+4)(GP)
;WIFI4_CLICK.c,438 :: 		waitTime=2000; //wait 1s
ORI	R2, R0, 2000
SH	R2, Offset(WIFI4_CLICK_waitTime+0)(GP)
;WIFI4_CLICK.c,439 :: 		WIFI4_writeText2(tmp);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_WIFI4_writeText2+0
NOP	
LW	R25, 12(SP)
;WIFI4_CLICK.c,440 :: 		watchDogTime=0; //reset watchdog
SH	R0, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
;WIFI4_CLICK.c,441 :: 		f_wdogStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
;WIFI4_CLICK.c,442 :: 		f_timerStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,443 :: 		flag_cmdEx=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,445 :: 		while(0 != flag_cmdEx)
L_WIFI4_ping50:
LBU	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
BNE	R2, R0, L__WIFI4_ping126
NOP	
J	L_WIFI4_ping51
NOP	
L__WIFI4_ping126:
;WIFI4_CLICK.c,447 :: 		WIFI4_process();
SW	R25, 12(SP)
JAL	_WIFI4_process+0
NOP	
LW	R25, 12(SP)
;WIFI4_CLICK.c,448 :: 		}
J	L_WIFI4_ping50
NOP	
L_WIFI4_ping51:
;WIFI4_CLICK.c,449 :: 		waitTime=DEFAULT_WTIME;
ORI	R2, R0, 5
SH	R2, Offset(WIFI4_CLICK_waitTime+0)(GP)
;WIFI4_CLICK.c,451 :: 		}
L_end_WIFI4_ping:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _WIFI4_ping
_WIFI4_connectToAP:
;WIFI4_CLICK.c,452 :: 		void WIFI4_connectToAP(uint8_t* ssid,uint8_t *pass)
ADDIU	SP, SP, -100
SW	RA, 0(SP)
;WIFI4_CLICK.c,457 :: 		WIFI4_cmdSingle("AT+S.SCFG=","wifi_priv_mode,2");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
LUI	R26, hi_addr(?lstr6_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr6_WIFI4_CLICK+0)
LUI	R25, hi_addr(?lstr5_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr5_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,458 :: 		WIFI4_cmdSingle("AT+S.SCFG=","wifi_mode,1");
LUI	R26, hi_addr(?lstr8_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr8_WIFI4_CLICK+0)
LUI	R25, hi_addr(?lstr7_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr7_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,459 :: 		WIFI4_cmdSingle("AT+S.SCFG=","ip_use_dhcp,1");
LUI	R26, hi_addr(?lstr10_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr10_WIFI4_CLICK+0)
LUI	R25, hi_addr(?lstr9_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr9_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
LW	R25, 16(SP)
;WIFI4_CLICK.c,461 :: 		WIFI4_cmdSingle("AT+S.SSIDTXT=",ssid);
MOVZ	R26, R25, R0
LUI	R25, hi_addr(?lstr11_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr11_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,464 :: 		strcpy(newPass,"wifi_wpa_psk_text,");
ADDIU	R2, SP, 20
LUI	R26, hi_addr(?lstr12_WIFI4_CLICK+0)
ORI	R26, R26, lo_addr(?lstr12_WIFI4_CLICK+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R26, 12(SP)
;WIFI4_CLICK.c,465 :: 		strcat(newPass,pass);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;WIFI4_CLICK.c,467 :: 		WIFI4_cmdSingle("AT+S.SCFG=",newPass);
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
LUI	R25, hi_addr(?lstr13_WIFI4_CLICK+0)
ORI	R25, R25, lo_addr(?lstr13_WIFI4_CLICK+0)
JAL	_WIFI4_cmdSingle+0
NOP	
;WIFI4_CLICK.c,468 :: 		}
L_end_WIFI4_connectToAP:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 100
JR	RA
NOP	
; end of _WIFI4_connectToAP
_WIFI4_putc:
;WIFI4_CLICK.c,469 :: 		void WIFI4_putc(char c)
;WIFI4_CLICK.c,471 :: 		flag_cmdEx=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,472 :: 		f_timerStart=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,473 :: 		respTime=0;
SW	R0, Offset(WIFI4_CLICK_respTime+0)(GP)
;WIFI4_CLICK.c,474 :: 		rxB.buff[rxB.ind++]=c;
LHU	R3, Offset(WIFI4_CLICK_rxB+2500)(GP)
LUI	R2, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_rxB+0)
ADDU	R2, R2, R3
SB	R25, 0(R2)
LHU	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,476 :: 		}
L_end_WIFI4_putc:
JR	RA
NOP	
; end of _WIFI4_putc
_WIFI4_tick:
;WIFI4_CLICK.c,478 :: 		void WIFI4_tick()
;WIFI4_CLICK.c,480 :: 		if(f_timerStart){
LBU	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
BNE	R2, R0, L__WIFI4_tick131
NOP	
J	L_WIFI4_tick52
NOP	
L__WIFI4_tick131:
;WIFI4_CLICK.c,481 :: 		if((++respTime) > waitTime)
LW	R2, Offset(WIFI4_CLICK_respTime+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(WIFI4_CLICK_respTime+0)(GP)
LHU	R3, Offset(WIFI4_CLICK_waitTime+0)(GP)
LW	R2, Offset(WIFI4_CLICK_respTime+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WIFI4_tick132
NOP	
J	L_WIFI4_tick53
NOP	
L__WIFI4_tick132:
;WIFI4_CLICK.c,483 :: 		flag_timesUp=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_timesUp+0)(GP)
;WIFI4_CLICK.c,485 :: 		}
L_WIFI4_tick53:
;WIFI4_CLICK.c,486 :: 		}
L_WIFI4_tick52:
;WIFI4_CLICK.c,487 :: 		if(f_wdogStart){
LBU	R2, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
BNE	R2, R0, L__WIFI4_tick134
NOP	
J	L_WIFI4_tick54
NOP	
L__WIFI4_tick134:
;WIFI4_CLICK.c,488 :: 		if((++watchDogTime) > currentEv.wDogLimit)
LHU	R2, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
LW	R3, Offset(WIFI4_CLICK_currentEv+4)(GP)
LHU	R2, Offset(WIFI4_CLICK_watchDogTime+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WIFI4_tick135
NOP	
J	L_WIFI4_tick55
NOP	
L__WIFI4_tick135:
;WIFI4_CLICK.c,490 :: 		flag_wdogOut=1;
ORI	R2, R0, 1
SB	R2, Offset(WIFI4_CLICK_flag_wdogOut+0)(GP)
;WIFI4_CLICK.c,492 :: 		}
L_WIFI4_tick55:
;WIFI4_CLICK.c,493 :: 		}
L_WIFI4_tick54:
;WIFI4_CLICK.c,494 :: 		}
L_end_WIFI4_tick:
JR	RA
NOP	
; end of _WIFI4_tick
_WIFI4_process:
;WIFI4_CLICK.c,496 :: 		void WIFI4_process()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;WIFI4_CLICK.c,499 :: 		if(f_wDogStart){
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
BNE	R2, R0, L__WIFI4_process138
NOP	
J	L_WIFI4_process56
NOP	
L__WIFI4_process138:
;WIFI4_CLICK.c,500 :: 		if(flag_wdogOut)
LBU	R2, Offset(WIFI4_CLICK_flag_wdogOut+0)(GP)
BNE	R2, R0, L__WIFI4_process140
NOP	
J	L_WIFI4_process57
NOP	
L__WIFI4_process140:
;WIFI4_CLICK.c,502 :: 		DTE_setState(0);
MOVZ	R25, R0, R0
JAL	WIFI4_CLICK_DTE_setState+0
NOP	
;WIFI4_CLICK.c,505 :: 		f_wdogStart=0;
SB	R0, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
;WIFI4_CLICK.c,506 :: 		f_timerStart=0;
SB	R0, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,507 :: 		rxB.buff[rxB.ind++]='\0';
LHU	R3, Offset(WIFI4_CLICK_rxB+2500)(GP)
LUI	R2, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_rxB+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
LHU	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,508 :: 		createEvent(rxB.buff, &currentEv);
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+0)
LUI	R25, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_rxB+0)
JAL	WIFI4_CLICK_createEvent+0
NOP	
;WIFI4_CLICK.c,509 :: 		EXEC_EVENT(_WIFI4_EVENT_RESPONSE);
SB	R0, Offset(WIFI4_CLICK_currentEv+10)(GP)
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+8)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+8)
LUI	R25, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_rxB+0)
LW	R30, Offset(WIFI4_CLICK_currentEv+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,510 :: 		rxB.buff[0]=0;
SB	R0, Offset(WIFI4_CLICK_rxB+0)(GP)
;WIFI4_CLICK.c,511 :: 		rxB.ind=0;
SH	R0, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,512 :: 		flag_wdogOut=0;
SB	R0, Offset(WIFI4_CLICK_flag_wdogOut+0)(GP)
;WIFI4_CLICK.c,513 :: 		flag_cmdEx=0;
SB	R0, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,514 :: 		DTE_setState(1);
ORI	R25, R0, 1
JAL	WIFI4_CLICK_DTE_setState+0
NOP	
;WIFI4_CLICK.c,516 :: 		}
L_WIFI4_process57:
;WIFI4_CLICK.c,517 :: 		}
L_WIFI4_process56:
;WIFI4_CLICK.c,518 :: 		if(f_TimerStart){
LBU	R2, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
BNE	R2, R0, L__WIFI4_process142
NOP	
J	L_WIFI4_process58
NOP	
L__WIFI4_process142:
;WIFI4_CLICK.c,519 :: 		if(flag_timesUp)
LBU	R2, Offset(WIFI4_CLICK_flag_timesUp+0)(GP)
BNE	R2, R0, L__WIFI4_process144
NOP	
J	L_WIFI4_process59
NOP	
L__WIFI4_process144:
;WIFI4_CLICK.c,523 :: 		DTE_setState(0);
MOVZ	R25, R0, R0
JAL	WIFI4_CLICK_DTE_setState+0
NOP	
;WIFI4_CLICK.c,524 :: 		f_wdogStart=0;
SB	R0, Offset(WIFI4_CLICK_f_wdogStart+0)(GP)
;WIFI4_CLICK.c,525 :: 		f_timerStart=0;
SB	R0, Offset(WIFI4_CLICK_f_timerStart+0)(GP)
;WIFI4_CLICK.c,526 :: 		rxB.buff[rxB.ind++]='\0';
LHU	R3, Offset(WIFI4_CLICK_rxB+2500)(GP)
LUI	R2, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R2, R2, lo_addr(WIFI4_CLICK_rxB+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
LHU	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,527 :: 		createEvent(rxB.buff, &currentEv);
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+0)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+0)
LUI	R25, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_rxB+0)
JAL	WIFI4_CLICK_createEvent+0
NOP	
;WIFI4_CLICK.c,528 :: 		EXEC_EVENT(_WIFI4_EVENT_RESPONSE);
SB	R0, Offset(WIFI4_CLICK_currentEv+10)(GP)
LUI	R26, hi_addr(WIFI4_CLICK_currentEv+8)
ORI	R26, R26, lo_addr(WIFI4_CLICK_currentEv+8)
LUI	R25, hi_addr(WIFI4_CLICK_rxB+0)
ORI	R25, R25, lo_addr(WIFI4_CLICK_rxB+0)
LW	R30, Offset(WIFI4_CLICK_currentEv+0)(GP)
JALR	RA, R30
NOP	
;WIFI4_CLICK.c,529 :: 		rxB.buff[0]=0;
SB	R0, Offset(WIFI4_CLICK_rxB+0)(GP)
;WIFI4_CLICK.c,530 :: 		rxB.ind=0;
SH	R0, Offset(WIFI4_CLICK_rxB+2500)(GP)
;WIFI4_CLICK.c,531 :: 		flag_timesUp=0;
SB	R0, Offset(WIFI4_CLICK_flag_timesUp+0)(GP)
;WIFI4_CLICK.c,532 :: 		flag_cmdEx=0;
SB	R0, Offset(WIFI4_CLICK_flag_cmdEx+0)(GP)
;WIFI4_CLICK.c,533 :: 		DTE_setState(1);
ORI	R25, R0, 1
JAL	WIFI4_CLICK_DTE_setState+0
NOP	
;WIFI4_CLICK.c,535 :: 		}
L_WIFI4_process59:
;WIFI4_CLICK.c,536 :: 		}
L_WIFI4_process58:
;WIFI4_CLICK.c,537 :: 		}
L_end_WIFI4_process:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WIFI4_process
