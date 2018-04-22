#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_itemsEdibles.sqf
 *
 * Parameter(s):
 *     0: STRING - Config Name of Item
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Used to eat edible items, food and drink. Needs to run locally on the PC where it is eaten.
 *     Important that this function returns boolean as that value will be used if they item should be
 *     removed or not.
 */
#define TITLE_NONEED "You are full"
#define TITLE_NOTEDIBLE "Not Edible"
#define MESSAGE_NOTEDIBLE "The item you tried to eat/drink is not edible."
#define MESSAGE_NONEED "You are full with no hunger or thirst, you do not need to eat/drink this."
#define PERCENT_STRING "%"

scriptName "GW_client_fnc_itemsEdibles: main";
scopeName "main";

if !(params [["_class", "", [""]]]) throw "Param error";

// Make sure the class for the item is present
private _configClass = missionConfigFile >> "CfgVirtualItems" >> "Items" >> _class;
if (!isClass _configClass) throw "No class for item";

// Make sure its edible
private _edible = isNumber (_configClass >> "edible");
if (!_edible) throw "Not edible";

// Get displayname of item
private _displayName = getText (_configClass >> "displayName");

// Get edible properties
private _ediblePropertiesClass = _configClass >> "EdibleProperties";
if (!isClass _ediblePropertiesClass) throw "No edible property class";

private _stat = getText (_ediblePropertiesClass >> "stat");
private _decrease = getNumber (_ediblePropertiesClass >> "decrease");
private _value = [[], missionNamespace, "GW_Player_bodyStats", _stat] call GW_client_fnc_dictGetValueByKey;

if (_decrease == 0) throw "Decrease is 0";

// Exit here if there is no need to eat/drink
if (_value isEqualTo 0) exitWith {
    [HINT_NORMAL, TITLE_NONEED, MESSAGE_NONEED] call GW_client_fnc_notificationsAdd;
    false
};

// Decrease
_value = _value - _decrease;
if (_value <= 0) then {_value = 0};

// Update body stat
[[], missionNamespace, "GW_Player_bodyStats", _stat, _value] call GW_client_fnc_dictSetValueByKey;

// Notify
[HINT_NORMAL, "Survival Notice", format [
    "Your %4 is now at %1%2.",
    (1 - _value) * 100,
    PERCENT_STRING,
    _decrease,
    _stat
]] call GW_client_fnc_notificationsAdd;

// Sync
[false] call GW_client_fnc_playerSyncRequest;

// Return true (true will delete the item)
true breakOut "main";
