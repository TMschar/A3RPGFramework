#include "script_component.hpp"
/**
 * Copyright (C) SimZor, SimZor Studios 2017
 * All Rights Reserved
 *
 * Filename: fn_addActions.sqf
 */
#define MO_CHAIRS allMissionObjects "Land_CampingChair_V2_F" \
    + allMissionObjects "Land_OfficeChair_01_F" \
    + allMissionObjects "Land_CampingChair_V1_F"

scriptName "GW_client_fnc_addActions: main";
scopeName "main";

// Prevent from firing weapon
player addAction [
    "",
    {},
    [],
    -99,
    false,
    false,
    "DefaultAction",
    "missionNamespace getVariable ['GW_player_disableFire', false] || {!([] call GW_client_fnc_hasInputAccess)}"
];

// Setup chairs
{
    _x addAction [
        "Sit in Chair",
        {_this call GW_client_fnc_actionChairSit},
        nil,
        1.5,
        true,
        true,
        "",
        "!(_target getVariable ['chairOccupied', false])",
        3
    ];
    true
} count MO_CHAIRS;
