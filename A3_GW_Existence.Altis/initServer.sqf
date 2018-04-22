#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: initServer.sqf
 */
scriptName "initServer: main";
scopeName "main";

// Initialize Server
[] call GW_server_fnc_initServer;

// Create Xmas Simple Objects
//[] call GW_client_fnc_holidaysCreateXmasObjects;