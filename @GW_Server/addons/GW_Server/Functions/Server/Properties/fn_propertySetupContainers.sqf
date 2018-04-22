#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertySetupContainers.sqf

    Parameter(s):
        0: OBJECT - Property Object
        1: NUMBER - Amount of containers to setup
        2: ARRAY - Equipment
        3: ARRAY - Virtual Items

    Returns:
        NOTHING

    Examples
        * For checking new properties and their container locations
        private _house = "classname" createVehicle position player;
        private _customDir = 0;
        private _containerObject = createVehicle ["Box_NATO_Equip_F", (getPosATL _house), [], 0, "CAN_COLLIDE"];
        _containerObject setDir (getDir _house);
        _containerObject setPosWorld (_house modelToWorldWorld [0, 0, 0]);
        _containerObject setDir (getDir _containerObject + _customDir);
*/
scriptName "GW_server_fnc_propertySetupContainers: main";
scopeName "main";

if !(params [
    ["_propertyObject",        objNull, [objNull]],
    ["_containerCount",        0,       [0]      ],
    ["_containerEquipment",    [],      [[]]     ],
    ["_containerVirtualItems", [],      [[]]     ]
]) exitWith {[LOG_INFO, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_propertySetupContainers};

private _propertiesConfig = missionConfigFile >> "CfgProperties" >> worldName;
private _propertyClassName = typeOf _propertyObject;
if !(isClass (_propertiesConfig >> _propertyClassName >> "Container_Locations")) exitWith {[LOG_WARNING, "CONTAINER LOCATIONS ARE NOT PRESENT IN CONFIG, EXITING...", _fnc_scriptName] call GW_server_fnc_log};

private _containerType = getText (_propertiesConfig >> "containerType");
for "_i" from 0 to (_containerCount - 1) do {
    scopeName "loopContainers";

    // Make sure container position properties is present in config
    private _specificContainerString = "Container_" + (str (_i + 1));
    if !(isClass (_propertiesConfig >> _propertyClassName >> "Container_Locations" >> _specificContainerString)) exitWith {
        [LOG_WARNING, "SPECIFIC CONTAINER LOCATION CLASS NOT AVAILABLE", _fnc_scriptName] call GW_server_fnc_log
    };

    // Get specific container information
    private _specificContainerConfig = _propertiesConfig >> _propertyClassName >> "Container_Locations" >> _specificContainerString;
    private _relativePosition = getArray (_specificContainerConfig >> "relativePosition");
    private _relativeDirection = getNumber (_specificContainerConfig >> "relativeDirection");

    // Create container and set position relative to house
    private _containerObject = createVehicle [_containerType, (getPosATL _propertyObject), [], 0, "CAN_COLLIDE"];
    _containerObject setDir (getDir _propertyObject);
    _containerObject setPosWorld (_propertyObject modelToWorldWorld _relativePosition);
    _containerObject setDir (getDir _containerObject + _relativeDirection);

    _containerObject allowDamage false;
    _containerObject enableSimulation false;
    _containerObject enableDynamicSimulation true;
    _containerObject enableRopeAttach false;

    _containerObject setVariable ["property_container_index", _i, true];
    _containerObject setVariable ["property_container_inventory", _containerEquipment, true];

    // Set parent property
    _containerObject setVariable ["parentProperty", _propertyObject, true];

    // Setup virtual inventory on container
    private _virtualItems = if (count _containerVirtualItems > 0) then {
        _containerVirtualItems select _i
    } else {
        []
    };
    private _containerSpace = getNumber (_propertiesConfig >> _propertyClassName >> "virtualInventorySpace");
    [_containerObject, _containerSpace, _virtualItems] call GW_client_fnc_setupVirtualInventoryContainer;

    // Clear any default cargo
    clearWeaponCargoGlobal _containerObject;
    clearMagazineCargoGlobal _containerObject;
    clearItemCargoGlobal _containerObject;
    clearBackpackCargoGlobal _containerObject;

    if (count _containerEquipment > 0) then {
        (_containerEquipment select _i) params [
            ["_weapons",    [], [[]]],
            ["_magazines",  [], [[]]],
            ["_items",      [], [[]]],
            ["_backpacks",  [], [[]]]
        ];

        // Add weapons
        {
            _x params [["_item", "", [""]]];
            _containerObject addWeaponCargoGlobal [_item, 1];
            true
        } count _weapons;

        // Add magazines
        {
            _x params [["_item", "", [""]]];
            _containerObject addMagazineCargoGlobal [_item, 1];
            true
        } count _magazines;

        // Add items
        {
            _x params [["_item", "", [""]]];
            _containerObject addItemCargoGlobal [_item, 1];
            true
        } count _items;

        // Add backpacks
        {
            _x params [["_item", "", [""]]];
            _containerObject addBackPackCargoGlobal [_item, 1];
            true
        } count _items
    }
};
