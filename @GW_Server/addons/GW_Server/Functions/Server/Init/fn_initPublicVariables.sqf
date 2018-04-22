#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_initPublicVariables.sqf
 *
 * Description:
 *     Makes some variables in server namespace public to those who needs it. Todo is to make a config for this
 */
scriptName "GW_server_fnc_initPublicVariables: main";
scopeName "main";

publicVariable "GW_server_fnc_compile";
publicVariable "GW_server_fnc_scriptMonitor";
publicVariable "GW_server_fnc_initPublicVariableEventHandlers";
publicVariable "GW_server_fnc_log";

// New thread to wait for headless client
[] spawn {
    scriptName "GW_server_fnc_initPublicVariables: wait for headless client";
    scopeName "main";

    for "_i" from 0 to 1 step 0 do {
        uiSleep 1;
        if (missionNamespace getVariable ["GW_HC_isActive", false]) exitWith {
            owner HEADLESSCLIENT publicVariableClient "GW_server_fnc_getPlayerData";
            owner HEADLESSCLIENT publicVariableClient "GW_server_fnc_propertyInitPlayer";
            owner HEADLESSCLIENT publicVariableClient "GW_server_fnc_vehicleInsert";

            [LOG_INFO, "Passed variables to Headless Client"] call GW_server_fnc_log;

            breakOut "main";
        };
    };
};
