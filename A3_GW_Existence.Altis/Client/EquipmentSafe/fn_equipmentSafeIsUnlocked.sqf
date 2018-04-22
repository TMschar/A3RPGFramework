#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_equipmentSafeIsUnlocked.sqf
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Checks if the RMP equipment safe is unlocked
 */
scriptName "GW_client_fnc_equipmentSafeIsUnlocked: main";
scopeName "main";

private _status = missionNamespace getVariable ["equipmentSafeStatus", -1];
private _evaluation = _status isEqualTo 1;

// Return
_evaluation;