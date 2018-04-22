#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_organizationsInit.sqf
 *
 * Returns:
 *     BOOLEAN - Returns true if successful, else false
 *
 * Description:
 *     Initializes organizations for civilians
 */
scriptName "GW_client_fnc_organizationsInit: main";
scopeName "main";

if !(playerSide isEqualTo civilian) exitWith { true; };

// Send request to server and initialize
[PVAR_SERVER_HC, "GW_ORGANIZATIONS_INITPLAYERREQUEST", [player]] call GW_ext_fnc_networkPublicVariable;
waitUntil { missionNamespace getVariable ["GW_organizations_initiated", false]; };

// Return
true breakOut "main";