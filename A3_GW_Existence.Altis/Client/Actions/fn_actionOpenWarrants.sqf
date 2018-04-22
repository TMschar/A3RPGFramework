#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_actionOpenWarrants.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        NOTHING
*
*    Description:
*        Opens the warrants
*/
scriptName "GW_client_fnc_actionOpenWarrants: main";
scopeName "main";

[] spawn GW_client_fnc_arrestWarrantsRequest
