#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleGetIcon.sqf
*
*    Parameter(s):
*        0: OBJECT - Vehicle to get icon for
*
*    Returns:
*        STRING
*
*    Description:
*        Looks up an icon for the relevant vehicle in ArmA 3 files and returns its path to file
*/
scriptName "GW_client_fnc_vehicleGetIcon: main";
scopeName "main";

params [["_classname", "", [""]]];
getText (configFile >> "CfgVehicles" >> _classname >> "icon")
