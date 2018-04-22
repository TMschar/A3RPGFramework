#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_onHandleRating.sqf
*
* Parameter(s):
*     0: OBJECT - Unit that changed his rating
*     1: NUMBER - Rating
*
* Returns:
*     NUMBER
*/
scriptName "GW_client_fnc_onHandleRating: main";
scopeName "main";

// Debug log
["Changed rating for unit", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;

// Return 0
0
