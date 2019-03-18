__WIFI4_hal_hal_gpioMap:
;__WIFI4_hal.c,215 :: 		static void hal_gpioMap(T_HAL_P gpioObj)
;__WIFI4_hal.c,262 :: 		hal_gpio_rstSet = tmp->gpioSet[ __RST_PIN_OUTPUT__ ];
ADDIU	R2, R25, 4
LW	R2, 0(R2)
SW	R2, Offset(__WIFI4_hal_hal_gpio_rstSet+0)(GP)
;__WIFI4_hal.c,277 :: 		hal_gpio_intSet = tmp->gpioSet[ __INT_PIN_OUTPUT__ ];
ADDIU	R2, R25, 28
LW	R2, 0(R2)
SW	R2, Offset(__WIFI4_hal_hal_gpio_intSet+0)(GP)
;__WIFI4_hal.c,291 :: 		}
L_end_hal_gpioMap:
JR	RA
NOP	
; end of __WIFI4_hal_hal_gpioMap
__WIFI4_hal_hal_uartMap:
;__hal_pic32.c,159 :: 		static void hal_uartMap(T_HAL_P uartObj)
;__hal_pic32.c,163 :: 		fp_uartWrite = tmp->uartWrite;
LW	R2, 0(R25)
SW	R2, Offset(__WIFI4_hal_fp_uartWrite+0)(GP)
;__hal_pic32.c,164 :: 		fp_uartRead  = tmp->uartRead;
ADDIU	R2, R25, 4
LW	R2, 0(R2)
SW	R2, Offset(__WIFI4_hal_fp_uartRead+0)(GP)
;__hal_pic32.c,165 :: 		fp_uartReady = tmp->uartReady;
ADDIU	R2, R25, 8
LW	R2, 0(R2)
SW	R2, Offset(__WIFI4_hal_fp_uartReady+0)(GP)
;__hal_pic32.c,166 :: 		}
L_end_hal_uartMap:
JR	RA
NOP	
; end of __WIFI4_hal_hal_uartMap
__WIFI4_hal_hal_uartWrite:
;__hal_pic32.c,168 :: 		static void hal_uartWrite(uint8_t input)
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;__hal_pic32.c,170 :: 		fp_uartWrite(input);
ANDI	R25, R25, 255
LW	R30, Offset(__WIFI4_hal_fp_uartWrite+0)(GP)
JALR	RA, R30
NOP	
;__hal_pic32.c,171 :: 		}
L_end_hal_uartWrite:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of __WIFI4_hal_hal_uartWrite
__WIFI4_hal_hal_uartRead:
;__hal_pic32.c,173 :: 		static uint8_t hal_uartRead()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;__hal_pic32.c,175 :: 		return ( uint8_t )fp_uartRead();
LW	R30, Offset(__WIFI4_hal_fp_uartRead+0)(GP)
JALR	RA, R30
NOP	
;__hal_pic32.c,176 :: 		}
L_end_hal_uartRead:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of __WIFI4_hal_hal_uartRead
__WIFI4_hal_hal_uartReady:
;__hal_pic32.c,178 :: 		static uint8_t hal_uartReady()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;__hal_pic32.c,180 :: 		return ( uint8_t )fp_uartReady();
LW	R30, Offset(__WIFI4_hal_fp_uartReady+0)(GP)
JALR	RA, R30
NOP	
;__hal_pic32.c,181 :: 		}
L_end_hal_uartReady:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of __WIFI4_hal_hal_uartReady
