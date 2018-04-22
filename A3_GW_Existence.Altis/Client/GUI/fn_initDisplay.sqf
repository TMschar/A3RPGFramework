#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_initDisplay.sqf
*
* Parameter(s):
*     0: ARRAY - Array with parameters connected with display who called this function
*     1: STRING - String containing display class of display which this script is initially called from
*
* Description:
*     Initializes a display (adds eventhandlers as well as calls the display script)
*/
scriptName "GW_client_fnc_initDisplay: main";
scopeName "main";

if !params [["_args", [], [[]]], ["_displayClass", "", [""]]] exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

_args params [["_display", displayNull, [displayNull]]];

// Disable endmission cheat and possibly escape key
GW_initDisplay_isEscapeBlocked = getNumber (missionConfigFile >> _displayClass >> "blockEscape") isEqualTo 1;
_display displayAddEventHandler ["KeyDown", {
    call {
        params ["_ctrl", "_keyCode", "_shift"];

        // Block endmission cheat
        if (_keyCode isEqualTo 74 && {_shift}) exitWith {
            if !userInputDisabled then {
                disableUserInput true;
                disableUserInput false;
            };
            true
        };

        // Check if escape is pressed and should be blocked
        if (_keyCode isEqualTo 1 && {GW_initDisplay_isEscapeBlocked}) exitWith {true}
    }
}];

// Set this so it can be accessed if need be at
// a later stage. Important that the displays are stored
// in uiNamespace in case they do not support serialization.
uiNamespace setVariable [_displayClass, _display];

// Handle unload event
_display displayAddEventHandler [
    "Unload",
    format [
        "['onUnload', []] call %1;", [_displayClass, 1] call GW_client_fnc_getDisplayScript
    ]
];

// Initially call display script
private _fnc = [_displayClass, 0] call GW_client_fnc_getDisplayScript;
["onLoad", _args] call _fnc
