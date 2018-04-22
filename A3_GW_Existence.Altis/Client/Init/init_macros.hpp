/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: init_macros.hpp
*
*    Description:
*        Macros for initialization scripts
*/

#define INIT_STATUS(increment, loadingText) \
["modifyInitStatus", [increment, loadingText, false]] call GW_displayInit_script; \
[LOG_INFO, loadingText, _fnc_scriptName] call GW_server_fnc_log