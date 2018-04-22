#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailHandler.sqf
 *
 * Description:
 *     A thread to handle the jail
 */
scriptName "GW_server_fnc_jailHandler: main";
scopeName "main";

for "_i" from 0 to 1 step 0 do {
    {
        _x params [
            ["_unit", objNull, [objNull]],
            ["_sentenceTime", 0, [0]],
            ["_reason", "", [""]],
            ["_jailClass", "", [""]],
            ["_startTime", -1, [-1]]
        ];

        private _configJail = missionConfigFile >> "CfgJail" >> "Centers" >> worldName >> _jailClass;
        private _processing = _configJail >> "ProcessingArea";
        private _direction = getNumber (_processing >> "direction");
        private _posATL = getArray (_processing >> "positionATL");
        private _unitPosATL = getPosATL _unit;

        // Handle people glitching out of jail by checking
        // their distance.
        if (_posATL distance _unitPosATL > 150) then {
            // Set direction of jail processing area
            _unit setPosATL _posATL;
            _unit setDir _direction;

            // Notify unit
            [HINT_WARNING, "Jail Glitch", "Mess with the best, get rekt like the rest."] remoteExecCall ["GW_client_fnc_notificationsAdd", _unit];

            // Log
            [LOG_WARNING, format [
                "%1:%2 tried glitching his way out of jail which has been dealt with.",
                name _unit,
                getPlayerUID _unit
            ], _fnc_scriptName] call GW_server_fnc_log;
        };

        // Check if its time to be released
        if ([_startTime, _sentenceTime] call GW_client_fnc_numbersIsFinished) then {
            // Send a release request
            [PVAR_SERVER_HC, "GW_jail_releaseInMate", _unit] call GW_ext_fnc_networkPublicVariable;
        };

        // Wait
        uiSleep 0.5;
    } forEach GW_jail_inMates;

    // Wait
    uiSleep 1;
};