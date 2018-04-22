#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailGetInMates.sqf
 *
 * Parameter(s):
 *     0: STRING - Name of public variable
 *     1: OBJECT - Object that requested
 */
scriptName "GW_server_fnc_jailGetInMates: main";
scopeName "main";

params [["_variableName", "", [""]], ["_requester", objNull, [objNull]]];

// Send back
[PVAR_CLIENT, _variableName, GW_jail_inMates, owner _requester];