#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionRobPlayer.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): OBJECT - Player to rob
 */
scriptName "GW_client_fnc_actionRobPlayer: main";
scopeName "main";

if (!canSuspend) throw "Not running in scheduled environment";
if (!params [ ["_unit", objNull, [objNull]] ]) throw "Expected object parameter";
if (playerSide != civilian) throw "Only civilians can rob others";
if (isNull _unit) exitWith { ["Unit is NULL", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Set conditions
private _conditionArgs = [ player, _unit ];
private _conditionCode =
{
    params [ ["_unit", objNull, [objNull]], ["_unitRobbed", objNull, [objNull]] ];
    _unit distance _unitRobbed < 4
    && {alive _unit}
    && {alive _unitRobbed}
    && {!isNull _unit}
    && {!isNull _unitRobbed}
    && {!(_unit getVariable ["incapacitated", false])}
    && {!(_unitRobbed getVariable ["incapacitated", false])}
};

// If the progress bar finishes, then do this
if ([ "", [25, "Robbing Player"], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress) then
{
    // Remove execute this on player that has been robbed
    [player] remoteExecCall ["GW_client_fnc_moneyRobberyRobbed", _unit];
}
else
{
    // Notify
    [HINT_WARNING, "Robbery Notice", "You failed to rob the player"] call GW_client_fnc_notificationsAdd;
};