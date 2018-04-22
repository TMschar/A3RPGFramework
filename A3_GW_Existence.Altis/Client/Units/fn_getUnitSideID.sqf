#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_getUnitSideID.sqf
 *
 * Parameter(s):
 *     0: SIDE
 */
scriptName "GW_client_fnc_getUnitSideID: main";
scopeName "main";

params [["_side", sideUnknown, [sideUnknown]]];
private _sideID = switch _side do {
    case west:        {0};
    case independent: {1};
    case east:        {2};
    case civilian:    {3};
};

_sideID
