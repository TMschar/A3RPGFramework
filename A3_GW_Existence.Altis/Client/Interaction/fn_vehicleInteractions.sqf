#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleInteractions.sqf
 *
 * Parameter(s):
 *     0: OBJECT
 *
 * Description:
 *     Add available interaction actions to array
 */
#define ACTIONS GW_displayInteractionMenu_actions

scriptName "GW_client_fnc_vehicleInteractions: main";
scopeName "main";

// Error checks
if (!params [["_target", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (isNull _target) exitWith {};

private _hasKeys = [player, _target] call GW_client_fnc_vehicleHasKeys;
private _hasLockpick = [player, "Lockpick"] call GW_client_fnc_virtualInventoryHasItem;
private _restrainedCrew = {_x getVariable ["restrainer", grpNull] == group player} count (crew _target);

// Lock/Unlock + Inventory
if (_hasKeys) then {
    private _action = ["Lock", "Unlock"] select (_target call GW_client_fnc_vehicleLocked);
    ACTIONS pushback [_action, "", "[_this] call GW_client_fnc_vehicleUnlock", "key"];
    ACTIONS pushback ["Trunk", "", "[_this] call GW_client_fnc_virtualInventoryRequestInventory", "trunk"];
};

// if (_hasKeys || {!([_target] call GW_client_fnc_vehicleLocked)}) then {
//     if (isNull driver _target) then { ACTIONS pushback ["Get in driver", "", "player moveInDriver _this", "key"]; };
//     if (_target canVehicleCargo player) then { ACTIONS pushback ["Get in cargo", "", "player moveInCargo _this", "key"]; };
// };

// Repairing
if ([_target] call GW_client_fnc_vehicleIsDamaged && {"ToolKit" in items player || "ToolKit" in itemCargo _target}) then {
    ACTIONS pushback ["Repair Vehicle", "", "[_this] spawn GW_client_fnc_vehicleRepair", "repair"];
};

// Unflip Vehicle
if (_hasKeys && {!canMove _target} || {!(crew _target isEqualTo [])} || {[_target] call GW_client_fnc_vehicleIsDamaged}) then {
    ACTIONS pushBack ["Unflip Vehicle", "", "[_this] spawn GW_client_fnc_vehicleUnflip", "unflip"];
};

// IHAS and Police Actions
if (playerSide in [west, independent]) then {
    if (count crew _target < 1) then {
        ACTIONS pushBack ["Impound Vehicle", "", "[_this] spawn GW_client_fnc_vehicleImpound", "impound"]
    };

    // Vehicle Registration
    ACTIONS pushBack [
        "Vehicle Registration",
        "",
        "GW_displayVehicleRegistration_Vehicle = _this; findDisplay 46 createDisplay 'GW_displayVehicleRegistration'",
        "registration"
    ];

    // Seize or Crush Vehicle
    if ([_target] call GW_client_fnc_vehicleCanCrush) then {
        ACTIONS pushBack ["Crush Vehicle", "", "[_this] spawn GW_client_fnc_vehicleCrush", "crush"];
    };
};

// Pullout
if (
    count crew _target > 0
    && {
        playerSide in [west, independent]
        || {_restrainedCrew > 0}
        || {!canMove _target}
        || {[player, _target] call GW_client_fnc_vehicleHasKeys}
    }
) then {
    ACTIONS pushBack ["Pull out crew", "", "[_this] call GW_client_fnc_vehicleEjectCrew", "pullout"]
};

// Lockpick Vehicle
if (!_hasKeys && {_hasLockpick}) then {
    ACTIONS pushBack ["Lockpick", "", "[_this] spawn GW_client_fnc_vehicleLockpick", "lockpick"]
};

// Door animations
private _vehicleDoorsSources = _target call GW_client_fnc_vehicleAvailableDoorAnims;
if ([player, _target] call GW_client_fnc_vehicleHasKeys || {locked _target isEqualTo 0}) then {
    {
        _x params [["_name", "", [""]], ["_source", "", [""]]];
        if (_target doorPhase _source isEqualTo 1) then {
            GW_displayInteractionMenu_Actions pushback [
                format ["Close %1 door", _name],
                "",
                format ["_this animateDoor ['%1', 0]", _source],
                "closeDoor"
            ]
        } else {
            GW_displayInteractionMenu_Actions pushback [
                format ["Open %1 door", _name],
                "",
                format ["_this animateDoor ['%1', 1]", _source],
                "openDoor"
            ]
        };
    } forEach _vehicleDoorsSources
}
