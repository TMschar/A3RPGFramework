#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_petrolStationsCanRob.sqf
 *
 * Returns:
 *     BOOLEAN
 */
#define REQUIRED_BLUFOR (getNumber (missionConfigFile >> "CfgPetrolStations" >> worldName >> "Settings" >> "requiredBlufor"))

scriptName "GW_client_fnc_petrolStationsCanRob: main";
scopeName "main";

// Return
playerSide != west
&& ({side group _x isEqualTo west} count ALLPLAYERSNOHC) >= REQUIRED_BLUFOR;