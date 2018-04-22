#define NAMESCRIPT _fnc_scriptName
/*
    Copyright (C) SimZor, SimZor Studios 2017
    All Rights Reserved

    Filename: fn_destroyResource.sqf

    Parameter(s):
        0: STRING - Resource Name to Destroy

    Returns:
        NOTHING
*/
scriptName "GW_client_fnc_destroyResource: main";
scopeName "main";

if !(params [["_resourceName", "", [""]]]) exitWith {[2, "NO PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log;};
if (_resourceName isEqualTo "") exitWith {};

disableSerialization;

// If display is active, destroy it
if ([_resourceName] call GW_client_fnc_guiDisplayActive) then {
    ["onUnload", []] call ([_resourceName, 0] call GW_client_fnc_getDisplayScript);
    _resourceName cutText ["", "PLAIN"];
} else {
    [2, "No resource active to destroy", _fnc_scriptName] call GW_server_fnc_log
};
