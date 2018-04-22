#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleUnflip.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to unflip
 *
 * Description:
 *     Unflips vehicle
 */
scriptName "GW_client_fnc_vehicleUnflip: main";
scopeName "main";

if !(params [ ["_vehicle", objNull, [objNull]] ]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

if (isNull _vehicle) exitWith { ["Vehicle is null", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (canMove _vehicle && {crew _vehicle isEqualTo []} && {damage _vehicle isEqualTo 0}) exitWith { ["Error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!canSuspend) exitWith { ["Can only be ran in scheduled environment", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _conditionArgs = [ player, _vehicle ];
private _conditionCode =
{
    params [["_unit", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];
    _unit distance _vehicle < 8
    && {alive _unit}
    && {!isNull _unit}
    && {!(_unit getVariable ["incapacitated", false])}
    && {!isNull _vehicle}
};

if (["UnflipVehicle", [], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress) then
{
    (getPos _vehicle) params [["_posX", 0, [0]], ["_posY", 0, [0]], ["_posZ", 0, [0]]];

    // Set new position
    _vehicle setPos [ _posX, _posY, _posZ + 1 ];

    // Notify
    [HINT_NORMAL, "Vehicle Notice", "You successfully unflipped your vehicle. Be careful next time!"] call GW_client_fnc_notificationsAdd;alive

    // Give experience
    [LEVEL_VEHICLES, 20, "Strong Man"] call GW_client_fnc_experienceCategoryAddExperience;
}
else
{
    [HINT_WARNING, "Unflip Failed", "Unflipping of your vehicle failed"] call GW_client_fnc_notificationsAdd;
};
