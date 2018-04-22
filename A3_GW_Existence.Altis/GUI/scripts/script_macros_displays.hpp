/*
    Copyright (C) SimZor, SimZor Studios 2017
    All Rights Reserved

    Filename: script_macros_displays.hpp
*/

#include "..\identifiers.hpp"
#define INITIAL_PARAMETERS \
if !(params [ \
    ["_event", "", [""]], \
    ["_args", [], [[]]] \
]) exitWith {[2, "NO PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log;};
