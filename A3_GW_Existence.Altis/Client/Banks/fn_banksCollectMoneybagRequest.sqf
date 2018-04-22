#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_moneyCollectMoneybagRequest.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Box
 */
scriptName "GW_client_fnc_banksCollectMoneybagRequest: main";
scopeName "main";

if (!params [["_box", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Send request to server
[PVAR_SERVER_HC, "GW_banks_collectMoneybagRequest", [player, _box]] call GW_ext_fnc_networkPublicVariable;