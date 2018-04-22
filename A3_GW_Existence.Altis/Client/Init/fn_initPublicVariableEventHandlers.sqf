#include "script_component.hpp"
/**
 * Copyright (C) SimZor, SimZor Studios 2017
 * All Rights Reserved
 *
 * Filename: fn_publicVariableEventHandlers.sqf
 *
 * Parameter(s): 0
 */
scriptName "GW_client_fnc_publicVariableEventHandlers: main";
scopeName "main";

"GW_player_onMurder" addPublicVariableEventHandler { _this call GW_client_fnc_onMurder; };