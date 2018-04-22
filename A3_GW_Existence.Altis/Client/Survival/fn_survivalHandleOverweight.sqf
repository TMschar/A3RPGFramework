#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_survivalHandleOverweight.sqf
*
* Parameter(s):
*     0: BOOLEAN - Overweighted or not
*
* Description:
*     Handles handicaps and resets for a person that is overweight
*/
scriptName "GW_client_fnc_survivalHandleOverweight: main";
scopeName "main";

params [["_overweight", true, [true]]];

// Player is overweight
if (_overweight) then {
        [
            HINT_WARNING,
            "Inventory Overweight",
            "You weigh more than you can carry, because of this, you have been slightly handicapped"
        ] call GW_client_fnc_notificationsAdd;

        // Handicap Player
        player setUnitRecoilCoefficient 5;
        player setAnimSpeedCoef 0.5;
        player forceWalk true;

// Player is not overweight
} else {
    [
        HINT_SUCCESS,
        "Inventory Overweight",
        "You are no longer overweight and your body health has been restored."
    ] call GW_client_fnc_notificationsAdd;

    // Reset
    player setUnitRecoilCoefficient 1;
    player setAnimSpeedCoef 1;
    player forceWalk false
};