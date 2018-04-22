#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_createRadioChannels.sqf
 *
 * Description:
 *    Creates radio channels for communication system so it can later be used
 */
scriptName "GW_server_fnc_createRadioChannels: main";
scopeName "main";

private _channels = [
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 1",  "%UNIT_NAME", []],
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 2",  "%UNIT_NAME", []],
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 3",  "%UNIT_NAME", []],
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 4",  "%UNIT_NAME", []],
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 5",  "%UNIT_NAME", []],
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 6",  "%UNIT_NAME", []],
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 7",  "%UNIT_NAME", []],
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 8",  "%UNIT_NAME", []],
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 9",  "%UNIT_NAME", []],
    [[0.29,0.29,0.29,1], "GW Phone Call - Tower 10", "%UNIT_NAME", []]
];

// Create channels
{
    private _channelID = radioChannelCreate _x;

    // Log
    [LOG_INFO, format ["Channel Created: %1", _x], _fnc_scriptName] call GW_server_fnc_log;
} forEach _channels;
