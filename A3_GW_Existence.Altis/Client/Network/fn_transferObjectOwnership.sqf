#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_transferObjectOwnership.sqf
*
*    Parameter(s):
*        0: OBJECT - Object to transfer
*
*    Description:
*        Transfers object ownership from server to headless client
*/
scriptName "GW_client_fnc_transferObjectOwnership: main";
scopeName "main";

if !(params [["_vehicle", objNull, [objNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Make sure vehicle is local
if !(local _vehicle) exitWith {};
if !(missionNamespace getVariable ["GW_HC_isActive", false]) exitWith {};

// Set owner to headless client
_hcOwner = owner (missionNamespace getVariable [STR_HC, objNull]);
_vehicle setOwner _hcOwner;

// Log to debug
["Transferred ownership of object to hc", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
