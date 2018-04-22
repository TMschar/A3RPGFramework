#include "script_component.hpp"
/*
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onHandleHeal.sqf
 */
scriptName "GW_client_fnc_onHandleHeal: main";
scopeName "main";

params [
    ["_unit", objNull, [objNull]],
    ["_healer", objNull, [objNull]],
    ["_healerCanHeal", false, [true]]
];

private _damage = damage _unit;
if (_unit isEqualTo _healer) then {
    waitUntil {!(damage _unit isEqualTo _damage)};

    // Add experience
    [LEVEL_MEDICAL, 50, "Healing"] call GW_client_fnc_experienceCategoryAddExperience;
};
