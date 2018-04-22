#include "script_component.hpp"
/*
 * Copyright (c) 2017  SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_setConstant.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): NUMBER - Namespace
 *     1 (REQUIRED): ANY - Variable name
 *     2 (REQUIRED): ANY - Value of variable
 *     3 (OPTIONAL): BOOLEAN - Broadcast
 */
scriptName "GW_client_fnc_setConstant: main";
scopeName "main";

params [["_namespace", 0, [0]], ["_variable", "", [""]], "_value", ["_broadcast", false, [false]]];

if (_variable isEqualTo "") exitWith {[LOG_WARNING, localize "STR_GW_LOG_SYSTEM_SETCONSTANT_EXIT1", _fnc_scriptName] call GW_server_fnc_log};
if (isNil "_value") exitWith {[LOG_WARNING, localize "STR_GW_LOG_SYSTEM_SETCONSTANT_EXIT2", _fnc_scriptName] call GW_server_fnc_log};
if (isNil "_namespace") exitWith {[LOG_WARNING, localize "STR_GW_LOG_SYSTEM_SETCONSTANT_EXIT3", _fnc_scriptName] call GW_server_fnc_log};

private _namespace = [missionNamespace, uiNamespace] select _namespace;
private _str = [str _value, _value] select (_value isEqualType "");
private _code = compileFinal _str;

// Set variable in namespace
_namespace setVariable [_variable, _code, _broadcast];
