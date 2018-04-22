#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_initEventHandlers.sqf
 */
scriptName "GW_server_fnc_initEventHandlers: main";
scopeName "main";

// Init Public Variable EventHandlers
[] call GW_server_fnc_initPublicVariableEventHandlers;

// Add Mission Eventhandlers
addMissionEventHandler ["EntityKilled", GW_server_fnc_onEntityKilled];
addMissionEventHandler ["PlayerConnected", GW_server_fnc_onPlayerConnected];
addMissionEventHandler ["PlayerDisconnected", GW_server_fnc_onPlayerDisconnected];
addMissionEventHandler ["HandleDisconnect", GW_server_fnc_onHandleDisconnect];
