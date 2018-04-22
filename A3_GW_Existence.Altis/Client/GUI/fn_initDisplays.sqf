#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_initDisplays.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        NOTHING
*
*    Description:
*        Initializes displays and compiles the scripts
*/
scriptName "GW_client_fnc_initDisplays: main";
scopeName "main";

// Default variable
private _displaysWhitelist = [];

// Loop through displays and compile the scripts
{
    // Loop through all configs with scriptPath and scriptName properties
    {
        private _scriptPath = getText (_x >> "scriptPath");
        private _displayName = getText (_x >> "scriptName");
        private _scriptName = _displayName + "_Script";

        private _fileName = [_displayName, 3] call BIS_fnc_trimString;
        private _path = getText (missionConfigfile >> "CfgScriptPaths" >> _scriptPath) + _fileName + ".sqf";

        private _code = compileFinal (format ["_fnc_scriptName = '%1';", _scriptName] + preProcessFileLineNumbers _path);
        missionNamespace setVariable [_scriptName, _code];
        _displaysWhitelist pushBack (toUpper _scriptName);

        true
    } count (configProperties [
        _x,
        "isClass _x && {isText (_x >> 'scriptPath')} && {isText (_x >> 'scriptName')}",
        false
    ]);
    true
} count [
    missionConfigFile,
    missionConfigFile >> "RscTitles"
];

// Set a constant with the display whitelist
[
    0,
    "GW_displaysWhitelist",
    _displaysWhitelist
] call GW_client_fnc_setConstant
