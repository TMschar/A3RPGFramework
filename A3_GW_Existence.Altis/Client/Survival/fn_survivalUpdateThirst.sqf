#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_survivalUpdateThirst.sqf
 */
scriptName "GW_client_fnc_survivalUpdateThirst: main";
scopeName "main";

private _lastThirstUpdate = missionNamespace getVariable ["GW_survivalHandler_lastThirstUpdate", 0];
if ([_lastThirstUpdate, 3 * 60] call GW_client_fnc_numbersIsFinished) then {
    private _currentThirst = [[], missionNamespace, "GW_player_bodyStats", "thirst"] call GW_client_fnc_dictGetValueByKey;
    private _newThirst = _currentThirst + 0.05;

    if (_newThirst >= 1) then { _newThirst = 1; };

    // Update hunger
    [[], missionNamespace, "GW_player_bodyStats", "thirst", _newThirst] call GW_client_fnc_dictSetValueByKey;

    // Set last update to current time
    GW_survivalHandler_lastThirstUpdate = time;
};