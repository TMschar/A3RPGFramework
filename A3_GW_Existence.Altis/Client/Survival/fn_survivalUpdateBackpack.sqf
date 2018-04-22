#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_survivalUpdateBackpack.sqf
 */
scriptName "GW_client_fnc_survivalUpdateBackpack: main";
scopeName "main";

private _lastBackpack = missionNamespace getVariable ["GW_survivalHandler_lastBackpack", ""];
if (isNil "GW_survivalHandler_lastBackpack" || {!(_lastBackpack isEqualTo backpack player)}) then {
    GW_survivalHandler_lastBackpack = backpack player;

    private _configClass = missionConfigFile >> "CfgSurvival";
    private _backpackInventorySpace = getNumber (_configClass >> "Backpacks" >> worldName >> backpack player >> "virtualInventorySpace");
    private _defaultInventorySpace = getNumber (_configClass >> "defaultVirtualInventory");

    // Set backpack inventory space to none in case the backpack doesnt have any
    // backpack inventory space.
    if (isNil "_backpackInventorySpace") then { _backpackInventorySpace = 0; };

    // Update virtual inventory space
    private _totalBackpackSpace = _backpackInventorySpace + _defaultInventorySpace;
    player setVariable ["virtualinventory_space", _totalBackpackSpace];

    // Log to debug log
    [
        format [
            "Player swapped backpack, or setting space for first time. Setting space: %1",
            _backpackInventorySpace
        ],
        _fnc_scriptName
    ] call GW_ext_fnc_loggingDebugLog;
};