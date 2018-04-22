#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_virtualInventoryDropItems.sqf
 *
 * Parameter(s):
 *     0: OBJECT   - Object to drop items from
 *     1: POSITION - Position to drop crate at
 *
 * Throws:
 *     Exception if unit is null
 *     Exception if no position is passed
 *     Exception if not enough parameters are passed
 *
 * Description:
 *     Drops a crate with all inventory items
 */
#define CRATE_CLASSNAME "Box_T_East_Wps_F"

scriptName "GW_client_fnc_virtualInventoryDropItems: main";
scopeName "main";

if (!params [
    ["_unit", objNull, [objNull]],
    ["_position", [], [[]]]
]) throw "Expected two parameters";

if (isNull _unit) throw "Unit is null";
if (_position isEqualTo []) throw "No position";

private _unitInventoryItems = _unit getVariable ["virtualinventory_items", []];
if (_unitInventoryItems isEqualTo []) exitWith { ["No items to drop", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _unitInventorySpace = _unit getVariable ["virtualinventory_space", 0];
private _container = CRATE_CLASSNAME createVehicle _position;

// Clear cargo of container
clearItemCargoGlobal _container;
clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearBackpackCargoGlobal _container;

// Setup new virtual inventory for the crate
[_container, _unitInventorySpace, _unitInventoryItems] call GW_client_fnc_setupVirtualInventoryContainer;

// Reset unit inventory
_unit setVariable ["virtualinventory_items", [], true];