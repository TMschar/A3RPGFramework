#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_bleedoutNotifyRevivers.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to revive
 *
 * Description:
 *     Function to be used when a unit gets incapacitated and needs revive.
 */
scriptName "GW_client_fnc_bleedoutOnRevived: main";
scopeName "main";

if !(params [ ["_unit", objNull, [objNull]], ["_unitPosition", [], [[]]] ]) throw "Param error";

// Notify
[HINT_NORMAL, "Player Incapacitated", format [
    "A player has been incapacitated. You should go assist them by giving them medical aid. "
    + "They are currently %1 metres away from your current position. The patients name is %2 "
    + "and you will be able to see them on your map, gps and through your 3D markers.",
    _unitPosition distance (getPos player),
    name _unit
]] call GW_client_fnc_notificationsAdd;
