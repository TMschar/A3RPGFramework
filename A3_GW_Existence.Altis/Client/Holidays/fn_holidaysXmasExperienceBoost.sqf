#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_holidaysXmasExperienceBoost.sqf
 */
scriptName "GW_client_fnc_holidaysXmasExperienceBoost: main";
scopeName "main";

if (!canSuspend) exitWith { ["Cannot suspend", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Fade in music
0 fadeMusic 0;
3 fadeMusic 1;

// Play music
playMusic "LeadTrack03_F_Bootcamp";

// Give experience in all categories
{ [_x, 80, "", false] call GW_client_fnc_experienceCategoryAddExperience; } forEach [
    LEVEL_VEHICLES,
    LEVEL_VIGILANCE,
    LEVEL_MEDICAL,
    LEVEL_WEAPONS,
    LEVEL_TOOLSOFTHETRADE,
    LEVEL_REBELLIOUS
];

// Add hint
[HINT_NORMAL, "Experience Storm", format [
    "Christmas is all about giving back and we wanted to hand you some extra experience points in "
    + "<t font='RobotoCondensedBold'>all experience categories</t> because of this. In fact <t fon"
    + "t='RobotoCondensedBold'>80 experience points<t>. We hope you enjoy this experience boost an"
    + " d that it will make it easier for you to get started here. Merry Christmas to you!"
]] call GW_client_fnc_notificationsAdd;

// Fade out music after 30 seconds
uiSleep 30;
3 fadeMusic 0;

// Reset
uiSleep 3;
playMusic "";
0 fadeMusic 1;