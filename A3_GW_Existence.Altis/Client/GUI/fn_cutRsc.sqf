#define NAMESCRIPT _fnc_scriptName
/*
    Copyright (C) SimZor, SimZor Studios 2017
    All Rights Reserved

    Filename: fn_cutRsc.sqf

    Parameter(s):
        0: STRING - Class

    Returns:
        NOTHING
*/
scriptName "GW_client_fnc_cutText: main";
scopeName "main";

// Get parameters and make sure they are passed
params [
    ["_class", "", [""]],
    ["_type", "", [""]],
    ["_speed", 10e10, [0]],
    ["_showOnMap", false, [true]]
];

// Destroy Resource
_class cutRsc [_class, _type, _speed, _showOnMap];
