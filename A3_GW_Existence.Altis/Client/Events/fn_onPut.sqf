#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onPut.sqf
 */
scriptName "GW_client_fnc_onPut: main";
scopeName "main";

// Sync
[false] call GW_client_fnc_playerSyncRequest;