#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_arrestWarrantsIsWanted.sqf
 *
 * Description:
 *     Handles speaking. Should be ran in eachFrame eventhandler
 */
scriptName "GW_client_fnc_playersHandleSpeaking: main";
scopeName "main";

private _isSpeaking = !isNull findDisplay 55;
if (_isSpeaking) then {
    private _vonConfig = missionConfigFile >> "CfgGroundWars" >> "GameProperties" >> "VON";
    if (getNumber (_vonConfig >> "vonCheckEnable") isEqualTo 1) then {
        if (currentChannel in (getArray (_vonConfig >> "disableChannelIDs"))) then {
            setCurrentChannel 5;
        };
    };
};

if !(player getVariable ["speaking", false] isEqualTo _isSpeaking) then {
    player setVariable ["speaking", _isSpeaking, true]
};