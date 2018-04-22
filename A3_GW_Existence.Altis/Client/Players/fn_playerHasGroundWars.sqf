#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playerHasGroundWars.sqf
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_playerHasGroundWars: main";
scopeName "main";

// Check
private _result = profileNameSteam find "ground-wars.com";

// Return
!(_result isEqualTo -1)