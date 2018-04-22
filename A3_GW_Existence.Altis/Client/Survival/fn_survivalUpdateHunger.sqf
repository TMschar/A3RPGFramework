#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_survivalUpdateHunger.sqf
 */
scriptName "GW_client_fnc_survivalUpdateHunger: main";
scopeName "main";

private _lastHungerUpdate = missionNamespace getVariable ["GW_survivalHandler_lastHungerUpdate", 0];
if ([_lastHungerUpdate, 5 * 60] call GW_client_fnc_numbersIsFinished) then {
    private _currentHunger = [[], missionNamespace, "GW_player_bodyStats", "hunger"] call GW_client_fnc_dictGetValueByKey;
    private _newHunger = _currentHunger + 0.02;

    if (_newHunger >= 1) then { _newHunger = 1; };

    // Update hunger
    [[], missionNamespace, "GW_player_bodyStats", "hunger", _newHunger] call GW_client_fnc_dictSetValueByKey;

    // Set last update to current time
    GW_survivalHandler_lastHungerUpdate = time
};