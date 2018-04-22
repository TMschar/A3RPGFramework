#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertySetup.sqf

    Parameter(s):
        0: NUMBER   - Type of property
        1: STRING   - Owner of property (either Steam ID for personal properties or organization name for safehouses)
        2: ARRAY    - Location of object in format [x, y, z]
        3: NUMBER   - Number of containers
        4: ARRAY    - Container equipment
        5: ARRAY    - Container virtual items
        6: NUMBER   - Purchase price (will return price in scientific notation)

    Returns:
        NOTHING
*/
scriptName "GW_server_fnc_propertySetup: main";
scopeName "main";

params [
    ["_propertyType", 0, [0]],
    ["_propertyOwner", "", [""]],
    ["_propertyLocation", [], [[]], 3],
    ["_containerCount", 0, [0]],
    ["_containerEquipment", [], [[]]],
    ["_containerVirtualItems", [], [[]]],
    ["_purchasePrice", 0, [0]],
    ["_propertyID", "", [""]]
];

private _propertyObject = _propertyLocation nearestObject "House";

_propertyObject allowDamage false;
_propertyObject setVariable ["propertyOwner", _propertyOwner, true];
_propertyObject setVariable ["propertyType", _propertyType, true];
_propertyObject setVariable ["propertyPurchasePrice", _purchasePrice, true];
_propertyObject setVariable ["propertyID", _propertyID, true];

// Lock property
[1, _propertyObject] call GW_client_fnc_propertyManipulateLocks;

if (_containerCount > 0) then {
    [_propertyObject, _containerCount, _containerEquipment, _containerVirtualItems] call GW_server_fnc_propertySetupContainers
}
