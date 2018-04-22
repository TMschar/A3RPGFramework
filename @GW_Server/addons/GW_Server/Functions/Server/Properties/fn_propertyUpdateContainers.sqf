#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_propertyUpdateContainers.sqf
*
*    Parameter(s):
*        0: OBJECT - Property Object
*        1: OBJECT - Container that needs updating
*        2: NUMBER - Container index in database array
*        3: OBJECT - Unit who triggered update
*
*    Returns:
*        NOTHING
*
*    Description:
*        Updates a container objects physical items in database
*/
scriptName "GW_server_fnc_propertyUpdateContainers: main";
scopeName "main";

if !(params [
    ["_property", objNull, [objNull]],
    ["_container", objNull, [objNull]],
    ["_index", 0, [0]],
    ["_unit", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, "Not enough parameters passed", _fnc_scriptName] call GW_server_fnc_log
};

if (isNull _container || {isNull _property}) exitWith {
    [LOG_WARNING, "Container- or property object is null", _fnc_scriptName] call GW_server_fnc_log
};

// Update array
private _propertyCurrentInventory = _container getVariable ["property_container_inventory", []];
_propertyCurrentInventory set [
    _index,
    [
        weaponCargo _container,
        magazineCargo _container,
        itemCargo _container,
        backpackCargo _container
    ]
];
_container setVariable ["property_container_inventory", _propertyCurrentInventory, true];

// Update in database
private _propertyID = _property getVariable ["propertyID", ""];
["PROPERTIES_UPDATE_CONTAINERPHYSICAL", 1, [_propertyCurrentInventory, _propertyID]] call GW_db_fnc_queryDB;

// Log
[LOG_INFO, format ["%1:%2 triggered update of property containers (Property: %3). This has now been updated.", name _unit, getPlayerUID _unit, _propertyID], _fnc_scriptName] call GW_server_fnc_log
