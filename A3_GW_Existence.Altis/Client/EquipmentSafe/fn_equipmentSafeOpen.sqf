#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_equipmentSafeOpen.sqf
 *
 * Description:
 *     Open/access the equipment safe
 */
scriptName "GW_client_fnc_equipmentSafeOpen: main";
scopeName "main";

// Not unlocked
if !([] call GW_client_fnc_equipmentSafeIsUnlocked) exitWith {};

// Terminate thread if active
private _threadHandle = missionNamespace getVariable ["GW_equipmentSafeOpen_threadHandle", scriptNull];
if (!isNull _threadHandle) then {terminate GW_equipmentSafeOpen_threadHandle};

// Create thread to handle selection
GW_equipmentSafeOpen_threadHandle = [] spawn {
    private _equipment = ["Select", "Select what safe you want to access", "Equipment", "Clothing"] call GW_client_fnc_guiPrompt;

    // Open equipment safe
    if (_equipment) then {
        ["RMPSafe"] call GW_client_fnc_equipmentOpenShop;
    } else {
        ["RMPSafe"] call GW_client_fnc_equipmentOpenCLothingShop;
    };
};