#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_hasInputAccess.sqf
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_hasInputAccess: main";
scopeName "main";

!(player getVariable ["restrained", false])
&& {!(player getVariable ["incapacitated", false])}
&& {!(missionNamespace getVariable ["GW_jail_inJail", false])}
&& {missionNamespace getVariable ["GW_Continue", false]}
&& {!(player getVariable ["tased", false])}
