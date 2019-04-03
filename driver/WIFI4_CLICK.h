/*
    WIFI4_CLICK.h

-----------------------------------------------------------------------------

    Date          : mar 2019.
    Author        : Milos Matic

-----------------------------------------------------------------------------*/
#ifndef __WIFI4_CLICK_H_
#define __WIFI4_CLICK_H_
#include "stdint.h"
#define T_WIFI4_P  const uint8_t*

/**
 * @typedef T_WIFI4_handler
 * @brief Handler Prototype
 */
typedef void ( *T_WIFI4_handler )( char *buffer, uint8_t *evArgs );

 
 /**
 * @brief Driver Initialization
 *
 * @param[in] gpioObj pointer to GPIO object
 * @param[in] uartObj pointer to UART object
 *
 * Default UART driver intializaton function.
 */
void wifi4_uartDriverInit( T_WIFI4_P gpio, T_WIFI4_P uart );

/**
 * @brief Core Initialization
 *
 * @param[in] defaultHdl        default handler
 * @param[in] defaultWdog       default watchdog
 *
 * Initialization should be executed before any other function. User can
 * execute this function later inside the application to reset AT Engine to
 * the default state.
 */
void wifi4_coreInit( T_WIFI4_handler defaultHdl, uint32_t defaultWdog );


/**
 * @brief Simple AT Command
 *
 * @param[in] command      pointer to AT command string
 * @param[in] param        pointer to parametar of AT command string 
 *                         ("" if AT command don't recive a parametar)
 *
 * Function should be used in case of simple AT commands which have no
 * additional arguments expected. Most of the AT Commands uses this function.
 */
void wifi4_cmdSingle( char* command, char *param );

/**
  @brief Connecting to AP
  *
  * @param[in] ssid       pointer to ssid string
  * @paramp[in] pass      pointer to password string
  *
  * Function should be placed in appInit function to establish
  * communication to internet throw other AP device.
  *
*/
void wifi4_connectToAP( uint8_t* ssid , uint8_t *pass );

/**
 * @brief Receive
 *
 * @param[in] c       char received from the module
 *
 * Function is used to populate response buffer with characters received from
 * the module. This function should be placed inside UART ISR function.
 */
void wifi4_putc( char c );

/**
 * @brief Enables or disables module power
 *
 * @param[in] powerState
 *
 * Turn ON or OFF the module.
 */
void wifi4_modulePower( uint8_t  powerState );

/**
 * @brief Engine Tick
 *
 * Function must be placed inside the Timer ISR function which will be called
 * every one millisecond.
 */
void wifi4_tick();

/**
 * @brief AT Engine State Machine
 *
 * This function should be placed inside the infinite while loop.
 */
void wifi4_process();

/**
 * @brief Ping command
 * @param[in] ipAddr    ipAddres/DNS resolvable host which want to ping
 *
 * Function should be used as test for internet connection.
 * Exaple: WIFI4_ping("8.8.8.8") - ping google.com
*/
void wifi4_ping( uint8_t *ipAddr );

/**
 * @brief Save AT Command to Storage
 *
 * @param[in] pCmd          command string
 * @param[in] timeout       timeout for provided command
 * @param[in] pHandler      handler for provided command
 *
 * Saves handlers and timeout for the particular command.
 */
uint16_t wifi4_setHandler( uint8_t *pCmd, uint32_t timeout, T_WIFI4_handler pHandler );
/**
  * @brief connect to network socket
  * @param[in] host   ip address of socket or DNS resovalble host
  * @param[in] port   port
  * @param[in] protcol    newtwork protcol to be used in communication.
  *            t for TCP socket, u for UDP socket, s for secure socket.
  *
*/
void wifi4_socketOpen( uint8_t *host, uint32_t port, uint8_t protocol );

/**
  * @brief Close socket
  * @param[in] id      ID of socket connection to be closed
  *
*/
void wifi4_socketClose( uint8_t id );

/**
  * @brief Write data to opened network socket
  * @param[in] id     ID of socket connection
  * @param[in] wdata  Data to be written on socket
*/
void wifi4_socketWrite( uint8_t id, uint8_t *wdata );

/**
  * @brief Opens socket on defined port.Wifi4 will be server
  * @param[in] port specifing network port to open socket-range:0-65535
  *
  *
*/
void wifi4_socketServerOpen(uint32_t port);
/**
  * @brief Write text to client on socket
  * @param[in] txt       text to send
  *
*/
void wifi4_socketServerWrite(uint8_t *txt);

/**
  * @brief Socket closing
  *
*/
void wifi4_socketServerClose();

/**
  * @brief Creating and uploading file to Wifi4 click WebServer
  * @param[in] name     Name of file
  * @param[in] content  Content of file
  * Function is used to create files that will used to create some web page
  * on web server.
*/
void wifi4_createFile( uint8_t *name, uint8_t *content );

/**
  * @brief Appending existing file on web server
  * @param[in] ime   Name of file to be appended
  * @param[in] html  Content of file
*/
void wifi4_appendFile( uint8_t *ime, uint8_t *html );
#endif