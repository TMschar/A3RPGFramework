#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_petrolStationsInit.sqf
 */
scriptName "GW_client_fnc_petrolStationInit: main";
scopeName "main";

"GW_petrolStations_petrolStationsRob" addPublicVariableEventHandler {
    params [["_variableName", "", [""]], ["_return", [], [[]]]];
    _return params [["_message", "", [""]], ["_object", objNull, [objNull]]];

    // This should not happen, but lets check this anyways. This would
    // trigger if thread is already active.
    if (!isNull GW_petrolStations_robAction) then { breakOut "main"; };

    // If object is null it means there is an error,
    // which is either that the petrol station has a
    // cooldown or is already being robbed.
    if (!isNull _object) then {
        // Start the robbery
        GW_petrolStations_robAction = [_object] spawn GW_client_fnc_petrolStationsRob;
    } else {
        // Notify player of issue
        [HINT_AMBER, "Petrol Station Notice", _message] call GW_client_fnc_notificationsAdd;
    };
};