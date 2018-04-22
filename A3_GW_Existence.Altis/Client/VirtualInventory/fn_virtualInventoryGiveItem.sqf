#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_virtualInventoryGiveItem.sqf
*
* Parameter(s):
*     0 (REQUIRED): OBJECT - Unit to receive the item
*     1 (REQUIRED): STRING - Classname of the item to give
*
* Description:
*     Give an item from one person to another
*/
scriptName "GW_client_fnc_virtualInventoryGiveItem: main";
scopeName "main";

if !(params [
    ["_unitReceiver", objNull, [objNull]],
    ["_itemClassname", "", [""]]
]) throw "Param error";

private _fnc_error = {
    [
        HINT_AMBER,
        "Transfer Unsuccessful",
        "The target unit can not receive this item at the moment."
    ] call GW_client_fnc_notificationsAdd;
};

// Error checks
if !(alive _unitReceiver) exitWith { call _fnc_error; };
if (isNull _unitReceiver) exitWith { call _fnc_error; };
if !([_unitReceiver, _itemClassname] call GW_client_fnc_virtualInventoryCanAddItem) exitWith { call _fnc_error; };

// Remove item from player
[player, _itemClassname, 0] call GW_client_fnc_virtualInventoryChange;

// Remotely execute function on player
[_itemClassname, player] remoteExecCall ["GW_client_fnc_virtualInventoryGiveItemRemote", _unitReceiver];