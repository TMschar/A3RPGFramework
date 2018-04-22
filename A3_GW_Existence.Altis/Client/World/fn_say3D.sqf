#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_say3D.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Object to play sound from
 *     1: STRING - Sound to play
 *
 * Description:
 *     Use say3D over network
 */
scriptName "GW_client_fnc_say3D: main";
scopeName "main";

try {
    if !isRemoteExecuted throw "This function should optimally be remote executed";
    if !params [["_object", objNull, [objNull]], ["_sound", "", [""]]] throw "Param error";
    _object say3D _sound
} catch {
    [_exception, _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
}