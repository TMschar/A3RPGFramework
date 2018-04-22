#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_guiHandleMeta.sqf
 *
 * Parameter(s):
 *     0: BOOLEAN - Show or hide meta heads up display
 */
scriptName "GW_client_fnc_guiHandleMeta: main";
scopeName "main";

params [["_show", false, [true]]];

private _target = cursorTarget;
private _targetType = typeOf _target;
private _vehicleCategory = [_targetType] call GW_client_fnc_vehicleGetCategory;
if (_show && {_vehicleCategory in ["Men", "Car", "Air", "Ship", "Boat"]} && {currentWeapon player == "Rangefinder"}) then {
    private _name = ["Unknown Vehicle", name _target] select (isPlayer _target);
    private _group = groupID (group _target);
    private _sideColour = [side group _target] call BIS_fnc_sideColor;
    private _speed = speed _target;
    private _vehicleName = [_targetType] call GW_client_fnc_vehicleGetDisplayName;
    private _vehicleIconPath = [_targetType] call GW_client_fnc_vehicleGetIcon;
    private _distance = player distance _target;

    if (_name isEqualTo "") then { [_target] call GW_client_fnc_playersGetName; };

    // Define and declare a global variable
    // with vehicle/unit information so we
    // can use this in the UI handler
    GW_guiHandleMeta_targetInfo = [
        _target,
        _name,
        _group,
        _sideColour,
        _speed,
        _vehicleName,
        _vehicleIconPath,
        _distance
    ];

    // Create Resource
    ["GW_hudMeta"] call GW_client_fnc_createResource;
} else {
    GW_guiHandleMeta_targetInfo = nil;

    // Destroy Resource
    ["GW_hudMeta"] call GW_client_fnc_destroyResource;
};