#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_petrolStationsRobRequest.hpp
 *
 * Parameter(s):
 *     0 (REQUIRED): OBJECT - Counter
 */
scriptName "GW_client_fnc_petrolStationsRobRequest: main";
scopeName "main";

if (!params [["_object", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Make sure they have a weapon
if (currentWeapon player == "Rangefinder") exitWith {};
if (currentWeapon player isEqualTo "") exitWith { [HINT_WARNING, "Petrol Station Notice", "You do not have a weapon equipped."] call GW_client_fnc_notificationsAdd; };

// Send request to server
[PVAR_SERVER_HC, "GW_petrolStations_petrolStationsRob", [_object, player]] call GW_ext_fnc_networkPublicVariable;