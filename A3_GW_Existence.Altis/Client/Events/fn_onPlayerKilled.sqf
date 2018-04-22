#define NAMESCRIPT _fnc_scriptName
/*
    Copyright (C) SimZor, SimZor Studios 2017
    All Rights Reserved

    Filename: fn_onPlayerKilled.sqf

    Parameter(s):
        0: OBJECT - Unit killed
        1: OBJECT - Killer
        2: OBJECT - Trigger
        3: BOOL - Show effects

    Returns:
        NOTHING
*/
scriptName "GW_server_fnc_onPlayerKilled: main";
scopeName "main";

// Prevent respawning so we have time to fiddle with player
if (playerRespawnTime < 10e10) then {
    setPlayerRespawnTime 10e10
};

if (player getVariable ["incapacitated", false]) then {
    ["KILLED", _this] call GW_client_fnc_bleedoutKilled
} else {
    ["INCAPACITATED", _this] call GW_client_fnc_bleedoutKilled
};
