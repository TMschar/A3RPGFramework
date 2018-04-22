#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_numbersGetChance.sqf
*
* Parameter(s):
*     0: NUMBER - Percentage chance of true
*
* Returns:
*     BOOLEAN
*
* Description:
*     Gets a random number between 0 and 100 and then checks if it's less than what the percentage is
*/
scriptName "GW_client_fnc_numbersGetChance: main";
scopeName "main";

if !params [["_percentageChance", 0, [0]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _random = random 100;
_random < _percentageChance
