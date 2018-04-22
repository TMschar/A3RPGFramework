#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_licensingHasLicense.sqf
*
* Parameter(s):
*     0 (REQUIRED): STRING - Name of the license class
*
* Returns:
*     BOOLEAN
*
* Description:
*     Checks if local unit has a certain license
*/
scriptName "GW_client_fnc_licensingHasLicense: main";
scopeName "main";

if (!params [["_licenseClass", "", [""]]]) throw "No license passed in";
_licenseClass in GW_player_licenses