#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_moneyRobberyReceive.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Cash
 *     1: OBJECT - Object that were robbed
 */
scriptName "GW_client_fnc_moneyRobberyReceive: main";
scopeName "main";

if (!params [ ["_cash", -1, [0]], ["_unit", objNull, [objNull]] ]) throw "Expected two parameters";
if (isNull _unit) exitWith { ["Unit is NULL", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Format cash to avoid scientific notation
private _cashFormatted = [_cash] call GW_client_fnc_currencyFormat;

// Do depending on if the player had any
// cash or not.
if (_cash > 0) then
{
    // Add cash to player
    [1, _cash, 1] call GW_client_fnc_playersHandleMoney;

    // Notify
    [HINT_NORMAL, "Robbery Notice", format ["You robbed %1 from this person.", _cashFormatted]] call GW_client_fnc_notificationsAdd;
}
else
{
    // Notify
    [HINT_AMBER, "Robbery Notice", "This person did not have any cash on him."] call GW_client_fnc_notificationsAdd;
};

// Add warrant
private _crime = ["ArmedRobbery", "Robbery"] select (currentWeapon player isEqualTo "");
[player, _crime] call GW_client_fnc_arrestWarrantsAdd;

// Add robbery log
[LOG_INFO, format ["Robbed %1:%2 and received %3", name _unit, getPlayerUID _unit, _cashFormatted], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];