#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playersIsOnline.sqf
 *
 * Parameter(s):
 *     0: STRING - UID of player to check
 *
 * Description:
 *     Checks if a player is online or not
 */
scriptName "GW_client_fnc_playersIsOnline: main";
scopeName "main";

if (!params [["_uid", "", [""]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Return
!isNull (_uid call GW_client_fnc_getUnitByUID);
