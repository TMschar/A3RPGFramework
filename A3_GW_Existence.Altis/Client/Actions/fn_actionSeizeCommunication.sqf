/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionSeizeCommunications.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Target to seize communication devices from
 */

if !(params [["_unitTarget", objNull, [objNull]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Remotely execute hint on unit
[HINT_WARNING, "Communication Devices Seized", format [
    "Your communication devices has been seized by %1. This means you will no"
    + "longer be able to use your messaging or communication functions. Go buy"
    + "a new radio and/or GPS to gain back full communication abilities."
]] remoteExecCall ["GW_client_fnc_notificationsAdd", _unitTarget];

// Loop through items to remove
private _seizedItems = [];
{
    if ("ItemGPS" in assignedItems _unitTarget) then {
        // Add to player
        player addItem _x;

        // Remove from target
        _unitTarget unassignItem _x;
        _unitTarget removeItem _x;

        _itemName = _x select [3, count _x];
        _seizedItems pushBack _itemName;
    };
} forEach ["ItemGPS", "ItemRadio"];

// Set variable
_unitTarget setVariable ["communicationSeized", true, true];

// Show hint
{
    [HINT_NORMAL, "Seized Communication Device", format [
        "You have seized the targets %1.",
        _x
    ]] call GW_client_fnc_notificationsAdd;
} forEach _seizedItems;