#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onNextAction.sqf
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_onNextAction: main";
scopeName "main";

// Do not let use actions if its blocked
if !([] call GW_client_fnc_hasInputAccess) exitWith {true};

false