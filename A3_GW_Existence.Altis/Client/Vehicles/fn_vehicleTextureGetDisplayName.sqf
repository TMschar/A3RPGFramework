#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleTextureGetDisplayName.sqf
*
*    Parameter(s):
*        0: STRING - Vehicle Classname
*        1: STRING - Texture Identifier
*
*    Returns:
*        STRING
*
*    Description:
*        Checks a texture identifier for a certain vehicle and returns its texture displayname.
*/
scriptName "GW_client_fnc_vehicleTextureGetDisplayName: main";
scopeName "main";

if !params [["_classname", "", [""]], ["_textureIdentifier", "", [""]]];
if (_classname isEqualTo "") exitWith {[]};

private _vehicleConfigClass = missionConfigFile >> "CfgVehicles" >> "Vehicles" >> _classname;
private _texturePropertiesArray = getArray (_vehicleConfigClass >> "textures");

// Loop through all textures
{
    _x params ["_textureDisplayName", "_textureIdentifierLoop", "", ""];
    if (_textureIdentifierLoop == _textureIdentifier) then {
        _textureDisplayName breakOut "main"
    };
    true
} count _texturePropertiesArray;

// Return empty string if nothing above is found
""