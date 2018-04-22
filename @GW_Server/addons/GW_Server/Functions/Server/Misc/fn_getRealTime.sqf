#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_getRealTime.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Kind of arguments to pass into time function of extDB3
 *
 * Returns:
 *     ARRAY
 *
 * Description:
 *     Returns time on local server
 */
scriptName "GW_client_fnc_getRealTime: main";
scopeName "main";

if (!params [["_mode", 0, [0]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

private _modeAdditions = ["", ":3", ":[0,0,30,24,60,60]"] select _mode;
private _call = "9:LOCAL_TIME" + _modeAdditions;
private _return = "extDB3" callExtension _call;

// Return
parseSimpleArray _return;