#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_helpersIsDevelopment.sqf
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Checks if the deployment environment is development
*/
scriptName "GW_client_fnc_helpersIsDevelopment: script";
scopeName "main";

// Return
getText (missionConfigFile >> "CfgGroundWars" >> "Build" >> "deploymentEnvironment") isEqualTo "development"