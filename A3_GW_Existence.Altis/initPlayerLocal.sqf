#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: initPlayerLocal.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        NOTHING
*
*    Description:
*        Handles main initialization of objects
*/
scriptName "initPlayerLocal: main";
scopeName "main";

// Initialize Headless Client
if (IS_HC) exitWith {
    [] call GW_hc_fnc_initHC
};

// Initialize Client
[] call GW_client_fnc_initClient
