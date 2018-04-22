#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailInit.sqf
 *
 * Description:
 *     Initializes Jail
 */
scriptName "GW_client_fnc_jailInit: main";
scopeName "main";

// Default variable to empty array
GW_jail_inMates = [];

// Start the jail handler
[] spawn GW_server_fnc_jailHandler;

// Eventhandler for people requesting the in-mates
// inside the prison.
"GW_jail_getInMates" addPublicVariableEventHandler {_this call GW_server_fnc_jailGetInMates};

// Eventhandler for adding an inmate
"GW_jail_addInMate" addPublicVariableEventHandler {_this call GW_server_fnc_jailAddInMate};

// Eventhandler for releasing an inmate
"GW_jail_releaseInMate" addPublicVariableEventHandler {_this call GW_server_fnc_jailReleaseInMate};