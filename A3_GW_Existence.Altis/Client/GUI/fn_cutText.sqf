#define NAMESCRIPT _fnc_scriptName
/*
    Copyright (C) SimZor, SimZor Studios 2017
    All Rights Reserved

    Filename: fn_cutText.sqf

    Parameter(s):
        0: STRING - Class

    Returns:
        NUMBER
*/
scriptName "GW_client_fnc_cutText: main";
scopeName "main";

// Get parameters and make sure they are passed
if !(params [["_class", "", [""]]]) exitWith {};

// Destroy Resource
_class cutText ["", "PLAIN"];
