#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_moneyPickupRequest.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Money stack object
 */
scriptName "GW_client_fnc_moneyPickupRequest: main";
scopeName "main";

params [ ["_moneyStack", objNull, [objNull]] ];

// Error checks
if (isNull _moneyStack) exitWith { ["Money stack is NULL", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (_value isEqualTo -1) exitWith { ["Value is -1", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get value of the money stack
private _value = _moneyStack getVariable ["value", -1];

// Start progress bar
private _threadHandle = missionNamespace getVariable ["GW_moneyPickupRequest_threadHandle", scriptNull];
if (!isNull _threadHandle) exitWith {};
GW_moneyPickupRequest_threadHandle = [_moneyStack] spawn {
    if (["", [3, "Picking up money", "", "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"]] call GW_client_fnc_startProgress) then {
        // Send request to server
        [PVAR_SERVER_HC, "GW_money_pickupRequest", [player, _this select 0]] call GW_ext_fnc_networkPublicVariable;
    };
};