#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_propertyIsContainer.sqf
*
*    Parameter(s):
*        0: OBJECT - Object to check
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Checks if a container is in a property
*/
scriptName "GW_client_fnc_propertyIsContainer: main";
scopeName "main";

#define PROPERTY_CFG (missionConfigFile >> "CfgProperties" >> worldName)

if !params [["_container", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Return
typeOf _container == getText (PROPERTY_CFG >> "containerType")