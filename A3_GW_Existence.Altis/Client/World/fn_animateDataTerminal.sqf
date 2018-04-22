#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_animateDataTerminal.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Open or Close
 *        3: Open Terminal
 *        0: Close Terminal
 *
 * Description:
 *     Animates a data terminal (Nexus)
 */
scriptName "GW_client_fnc_animateDataTerminal: main";
scopeName "main";

if (!params [
    ["_terminal", objNull, [objNull]],
    ["_mode", 0, [0]],
    ["_colours", [], [[]]]
]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Open / Close Terminal
[_terminal, _mode] call BIS_fnc_dataTerminalAnimate;

// Set colour of terminal
[_terminal, [_colours]] call BIS_fnc_dataTerminalColor
