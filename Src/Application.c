/*
 * Application main entry point
 *
 * Inspired by the ARDUINO environment.
 *
 * application_init gets called once at the start of the application, application_run gets called in a cyclic fashion
 * like it would be run on an arduino
 *
 * Author: Klaus Nagel, klaus[at]nagel-standorf.de
 */

#include "stm32l4xx_hal.h"
#include "Application.h"

/**
 * The initialization of the application
 *
 * Put all initialization stuff here
 */
void application_init(void)
{

}

/**
 * The application main functionality
 *
 * all real application stuff goes here or gets called from here
 */
void application_run(void)
{
    if(HAL_GPIO_ReadPin(B1_GPIO_Port, B1_Pin) == GPIO_PIN_SET)
    {
        HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_RESET);
    }
    else
    {
        HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_SET);
    }
}