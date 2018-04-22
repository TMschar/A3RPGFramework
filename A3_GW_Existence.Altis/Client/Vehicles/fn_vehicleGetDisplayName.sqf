#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleGetDisplayName.sqf
*
*    Parameter(s):
*        0: OBJECT - Vehicle to check displayname of
*
*    Returns:
*        STRING
*
*    Description:
*        Checks what displayname a certain vehicle has and returns
*/
scriptName "GW_client_fnc_vehicleGetDisplayName: main";
scopeName "main";

params [["_classname", "", [""]]];
getText (configFile >> "CfgVehicles" >> _classname >> "displayName")
