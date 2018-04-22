#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleManipulateLock.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        NOTHING
*
*    Description:
*        Manipulates a lock of a vehicle, either locks or unlocks it as well as playing a sound.
*/
scriptName "GW_client_fnc_vehicleManipulateLock: main";
scopeName "main";

if !(params [
    ["_vehicle", objNull, [objNull]],
    ["_lock", false, [false]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

private _sound = ["CarUnlock", "CarLock"] select _lock;

_vehicle lock _lock;
[_vehicle, _sound] remoteExecCall ["GW_client_fnc_say3D", 0]
