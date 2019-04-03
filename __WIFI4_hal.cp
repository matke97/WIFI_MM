#line 1 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
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
#line 80 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
static void hal_uartMap( const uint8_t*  uartObj);
#line 89 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
static void hal_uartWrite(uint8_t input);
#line 98 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
static uint8_t hal_uartRead();
#line 107 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
static uint8_t hal_uartReady();
#line 117 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
typedef void (*T_hal_gpioSetFp)(uint8_t);
#line 123 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
typedef uint8_t (*T_hal_gpioGetFp)();
#line 132 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
typedef struct
{
 T_hal_gpioSetFp gpioSet[ 12 ];
 T_hal_gpioGetFp gpioGet[ 12 ];

}T_hal_gpioObj;
#line 143 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
static T_hal_gpioGetFp hal_gpio_csGet;
#line 182 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
static T_hal_gpioSetFp hal_gpio_rstSet;
#line 197 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
static T_hal_gpioSetFp hal_gpio_intSet;
#line 215 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
static void hal_gpioMap( const uint8_t*  gpioObj)
{
  const T_hal_gpioObj*  tmp = ( const T_hal_gpioObj* )gpioObj;
#line 262 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
 hal_gpio_rstSet = tmp->gpioSet[  1  ];
#line 277 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
 hal_gpio_intSet = tmp->gpioSet[  7  ];
#line 291 "C:/Users/Software/Documents/Mikroelektronika/mikroC PRO for PIC32/Packages/WIFI_MM/__WIFI4_hal.c"
}
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/hal/__hal_pic32.c"
#line 1 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 143 "c:/users/software/documents/mikroelektronika/mikroc pro for pic32/packages/wifi_mm/hal/__hal_pic32.c"
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
