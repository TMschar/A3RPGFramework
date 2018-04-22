#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onTake.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to which the event handler is assigned
 *     1: OBJECT - Container from which the item was taken
 *     2: STRING - Item Class Name
 *
 * Description:
 *      Triggers when a unit takes an item from a container.
 */
scriptName "GW_client_fnc_onTake: main";
scopeName "main";

// Sync
[false] call GW_client_fnc_playerSyncRequest;

params [["_unit", objNull, [objNull]], ["_container", objNull, [objNull]], ["_item", "", [""]]];

private _itemInformation = [_item] call BIS_fnc_itemType;
_itemInformation params [["_itemCategory", "", [""]], ["_itemType", "", [""]]];

// Texture Player
if (_itemCategory == "Equipment" && {_itemType in ["Uniform", "Backpack"]}) then {
    [_unit] call GW_client_fnc_unitSetTextures
};

// Update comms
[_unit] call GW_client_fnc_communicationUpdateComms;

// Log
[LOG_INFO, format ["Picked up item: %1", _item], _fnc_scriptName] call GW_server_fnc_log
