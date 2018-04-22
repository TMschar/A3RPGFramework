#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleGetTexturePaths.sqf
*
*    Parameter(s):
*       0: STRING - Vehicle Classname
*       1: STRING - Texture Identifier
*
*    Returns:
*        ARRAY
*/
scriptName "GW_client_fnc_vehicleGetTexturePaths: main";
scopeName "main";

if !params [["_vehicleClassname", "", [""]], ["_textureIdentifier", "", [""]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

if (_vehicleClassname isEqualTo "") exitWith {
    [LOG_WARNING, "No Classname", _fnc_scriptName] call GW_server_fnc_log;
    []
};

private _vehicleConfigClass = missionConfigFile >> "CfgVehicles" >> "Vehicles" >> _vehicleClassname;
private _texturesArray = getArray (_vehicleConfigClass >> "textures");

// Loop through all textures
{
    _x params ["", "_textureIdentifierLoop", "", "_texturePaths"];
    if (_textureIdentifierLoop == _textureIdentifier) then {
        _texturePaths breakOut "main"
    };
    true
} count _texturesArray;

// Return empty array if nothing is found
[]
