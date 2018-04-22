#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onPrevAction.sqf
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_onPrevAction: main";
scopeName "main";

if !([] call GW_client_fnc_hasInputAccess) exitWith {true};

false
