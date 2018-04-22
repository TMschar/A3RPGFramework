#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksCanCollectMoneybag.sqf
 *
 * Parameter(s):
 *     0: OBJECT - The box to collect moneybags from
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_banksCanCollectMoneybag: main";
scopeName "main";

if (!params [["_box", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

_box getVariable ["moneybags", 0] > 0
&& {_box getVariable ["breached", false]}