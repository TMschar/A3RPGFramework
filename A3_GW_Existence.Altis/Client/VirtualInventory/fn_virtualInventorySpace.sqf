#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_virtualInventorySpace.sqf
*
*    Parameter(s):
*        0: OBJECT - Container object
*
*    Returns:
*        NUMBER
*
*    Description:
*        Returns virtual inventory space of a container
*/
scriptName "GW_client_fnc_virtualInventorySpace: main";
scopeName "main";

// Return
param [0, objNull, [objNull]] getVariable ["virtualinventory_space", 0]