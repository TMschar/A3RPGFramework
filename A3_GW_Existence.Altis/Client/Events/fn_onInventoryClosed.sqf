#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_onInventoryClosed.sqf
*
*    Parameter(s):
*        0: OBJECT - Unit opening said container
*        1: OBJECT - Container said unit opens
*
*    Returns:
*        NOTHING
*
*    Description:
*        Eventhandler which fires when inventory closes
*/
scriptName "GW_client_fnc_onInventoryClosed: main";
scopeName "main";

params [
    ["_unit", objNull, [objNull]],
    ["_container", objNull, [objNull]]
];

private _containerInventoryPrevious = _container getVariable ["property_container_inventory", []];
private _containerInventory = [
    getItemCargo _container,
    getWeaponCargo _container,
    getMagazineCargo _container,
    getBackpackCargo _container
];
private _containerType = getText (missionConfigFile >> "CfgProperties" >> worldName >> "containerType");

if (!(_containerInventoryPrevious isEqualTo []) && {typeOf _container == _containerType}) then {
    // Check if inventory has been changed since last use
    if !(_containerInventory isEqualTo _containerInventoryPrevious) then {
        private _containerIndex = _container getVariable ["property_container_index", 0];
        private _property = getPos _container nearestObject "House";

        if (isNil "_property" || {isNull _property}) exitWith {
            [LOG_WARNING, "Property not found", _fnc_scriptName] call GW_server_fnc_log
        };

        [[_property, _container, _containerIndex, player], "GW_server_fnc_propertyUpdateContainers"] call GW_ext_fnc_networkCallServer;

        [LOG_INFO, "Triggered property container update", _fnc_scriptName] call GW_server_fnc_log
    };

    // Reset
    GW_Player_PropertyInteraction_ConatainerPhysicalItems = nil;
};
