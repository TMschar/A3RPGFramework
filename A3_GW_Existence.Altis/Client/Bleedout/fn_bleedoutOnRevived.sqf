#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_bleedoutOnRevived.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to reset
 *     1: ARRAY  - Array with previous loadout before incapacitation
 *     2: ARRAY  - Array with previous virtual items before incapacitation
 */
scriptName "GW_client_fnc_bleedoutOnRevived: main";
scopeName "main";

if !(
    params
    [
        ["_unit", objNull, [objNull]],
        ["_loadout", [], [[]]],
        ["_items", [], [[]]]
    ]
) throw "Param error";

// Reset bleedout
[_unit, true] call GW_client_fnc_bleedoutReset;

// Add loadout again
_unit setUnitLoadout _loadout;
[_unit] call GW_client_fnc_unitSetTextures;

// Add virtual inventory items again
_unitKilled setVariable ["virtualinventory_items", _items, true];

// Create HUD
["GW_HUD"] call GW_client_fnc_createResource;

// Broadcast
private _realname = [_unit] call GW_client_fnc_playersGetName;
private _message = format ["%1 was revived", _realname];
[_message, "Revive"] call GW_client_fnc_communicationSendChat;

// Give experience points
[LEVEL_MEDICAL, 100, "On foot in the grave"] call GW_client_fnc_experienceCategoryAddExperience;
