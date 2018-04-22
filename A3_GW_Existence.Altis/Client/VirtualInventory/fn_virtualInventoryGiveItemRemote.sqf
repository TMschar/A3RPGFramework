#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_virtualInventoryGiveItemRemote.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): STRING - Item Classname
 *     1 (REQUIRED): OBJECT - Unit that gave the item
 *
 * Description:
 *     Gives a person an item
 */
scriptName "GW_client_fnc_virtualInventoryGiveItemRemove: main";
scopeName "main";

if (!isRemoteExecuted) exitWith {};
if (!params [["_itemClassname", "", [""]], ["_unitGiver", objNull, [objNull]]]) throw "Param error";

private _unitGiverName = [_unitGiver] call GW_client_fnc_playersGetName;
private _itemInfo = [_itemClassname] call GW_client_fnc_virtualInventoryGetItemInfo;
private _displayName = _itemInfo param [0, "", [""]];

// Notify
[HINT_NORMAL, "Received Item", format [
    "%1 has given you a %2.",
    _unitGiverName,
    _displayName
]] call GW_client_fnc_notificationsAdd;

// Give item
[player, _itemClassname, 1, false] call GW_client_fnc_virtualInventoryChange;