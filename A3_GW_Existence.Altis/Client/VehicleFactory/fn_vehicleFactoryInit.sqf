#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleFactoryInit.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Initializes the vehicle factory system, returns true if successful
*/
scriptName "GW_client_fnc_vehicleFactoryInit: main";
scopeName "main";

// Default current builds
GW_vehicleFactory_currentBuilds = [];

true