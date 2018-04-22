#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksDrillVault.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Target
 *
 * Description:
 *     Function to drill the bank vaults
 */
scriptName "GW_client_fnc_banksDrillVault: main";
scopeName "main";

if (!params [["_building", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Make sure unit can drill
if !([_building] call GW_client_fnc_banksCanDrill) exitWith { ["Not able to drill vault", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get door
private _door = [_building] call GW_client_fnc_worldNearestDoor;
if (_door isEqualTo 0) exitWith { ["No door", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Send request to server
[PVAR_SERVER_HC, "GW_banks_drillRequest", [player, _building, _door]] call GW_ext_fnc_networkPublicVariable;