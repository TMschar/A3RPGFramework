#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_virtualInventoryChange.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Container attached to object
 *     1: STRING - Class
 *     2: MODE   - Add or remove
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Add or remove a virtual item to the virtual inventory
 *     of an object.
 */
#define MODE_ADD 1
#define MODE_REMOVE 0
#define MESSAGE_POLICECLOSE "You cannot destroy illegal items when close to Police/Military. Go further than 50 metres, and then try again."
#define MESSAGE_SPACE "You do not have enough space to hold this item."
#define MESSAGE_REMOVED "%1 has been removed to your virtual inventory"
#define TITLE_REMOVALFAILED "Removal Failed"
#define TITLE_SPACE "Not enough space"
#define TITLE_REMOVED "Item Removed"

scriptName "GW_client_fnc_virtualInventoryChange: main";
scopeName "main";

params [
    ["_object", objNull, [objNull]],
    ["_class", "", [""]],
    ["_mode", -1, [0]],
    ["_showMessage", true, [true]]
];

if (isNull _object) exitWith {};
if (_class isEqualTo "") exitWith {};
if (_mode isEqualTo -1) exitWith {};

private _inventory = _object getVariable ["virtualinventory_items", []];
private _inventorySpace = _object getVariable ["virtualinventory_space", 0];
private _config = missionConfigFile >> "CfgVirtualItems" >> "Items" >> _class;
private _displayName = getText (_config >> "displayName");
private _illegalItem = getNumber (_config >> "illegal") isEqualTo 1;
private _return = false;

if (_mode isEqualTo MODE_REMOVE) then {
    // Loop through inventory
    {
        // Prevent civilians from deleting items directly
        // in-front of Police.
        if (_illegalItem && {!(playerside in [independent, west])}) then {
            private _bluforWithinRadius = {_x distance player < 50} count (playableUnits select {side _x isEqualTo west});
            if (_bluforWithinRadius > 0) then {
                // Show message
                [HINT_WARNING, TITLE_REMOVALFAILED, MESSAGE_POLICECLOSE] call GW_client_fnc_notificationsAdd;

                // Breakout main scope
                false breakOut "main";
            };
        };

        // Item found
        if (_class == _x) exitWith {
            _inventory deleteAt _forEachIndex;
            _return = true;

            // Notify Player
            if (_showMessage) then {
                [HINT_NORMAL, TITLE_REMOVED, format [MESSAGE_REMOVED, _displayName]] call GW_client_fnc_notificationsAdd;
            };
        };
    } forEach _inventory;
} else {
    if (_mode isEqualTo MODE_ADD) then {
        private _itemWeight = getNumber (_config >> "weight");
        private _totalWeight = _object call GW_client_fnc_virtualInventoryCalculateTotalWeight;
        private _canAddItem = [_object, _class] call GW_client_fnc_virtualInventoryCanAddItem;

        // Make sure object can hold the item
        if (!_canAddItem) then {
            if (_showMessage) then { [HINT_AMBER, TITLE_SPACE, MESSAGE_SPACE] call GW_client_fnc_notificationsAdd; };
            _return breakOut "main";
        };

        // Add to inventory variable. This needs to be used
        // to update the global inventory variable later.
        _class = toLower _class;
        _inventory pushBack _class;

        // Return success
        _return = true;
    };
};

if _return then {
    // Update inventory
    _object setVariable ["virtualinventory_items", _inventory, true];

    // Log
    private _objectName = [typeOf _object, [_object] call GW_client_fnc_playersGetName] select (isPlayer _object);
    private _modeName = [["deleted", "from"], ["added", "to"]] select _mode;
    private _itemInfo = [_class] call GW_client_fnc_virtualInventoryGetItemInfo;
    [LOG_INFO, format [
            "%1 has been %2 %3 %4's inventory. New inventory: %5.",
            _itemInfo select 1,
            _modeName select 1,
            _modeName select 2,
            _objectName,
            _inventory
    ], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];
};

// Return
_return;
