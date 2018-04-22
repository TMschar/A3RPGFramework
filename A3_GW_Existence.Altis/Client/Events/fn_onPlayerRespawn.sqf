#define NAMESCRIPT _fnc_scriptName
/*
    Copyright (C) SimZor, SimZor Studios 2017
    All Rights Reserved

    Filename: fn_onPlayerRespawn.sqf

    Parameter(s):   0: OBJECT - Unit respawned
                    1: OBJECT - Dead Body

    Returns: NOTHING
*/
scriptName "GW_client_fnc_onPlayerRespawn: main";
scopeName "main";

if (playerRespawnTime < 10e10) then {
    setPlayerRespawnTime 10e10
};

if !(player getVariable ["incapacitated", false]) then {
    ["KILLED", _this] call GW_client_fnc_bleedoutRespawn
} else {
    ["INCAPACITATED", _this] call GW_client_fnc_bleedoutRespawn
};
