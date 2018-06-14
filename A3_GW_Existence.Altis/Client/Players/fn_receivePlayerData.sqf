#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_receivePlayerData.sqf
 */
scriptName "GW_client_fnc_receivePlayerData: main";
scopeName "main";

// Make sure server is executing
if !(remoteExecutedOwner isEqualTo 2) exitWith { [LOG_CRITICAL, "Remote executor was not server", _fnc_scriptNName] remoteExecCall ["GW_server_fnc_log", 2]; };

params [
    ["_successful", false, [true]],
    ["_newPlayer", false, [true]],
    ["_id", -1, [1]],
    ["_dictRanks", [], [[]], 6],
    ["_dictPlaytimes", [], [[]], 4],
    ["_dictMoney", [], [[]], 2],
    ["_dictGear", [], [[]], 4],
    ["_dictBodyStats", [], [[]], 3],
    ["_licenses", [], [[]]],
    ["_experience", [], [[]]],
    ["_inventory", [], [[]]],
    ["_jailTime", -1, [0]],
    ["_jail", "", [""]],
    ["_alive", 0, [1]]
];

if (!_successfull) exitWith {
    GW_initPlayer_dbDataReceived = false;
    endMission "GW_DataError";

    // Log
    [LOG_CRITICAL, "Receiving player data failed", _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];
};

// Verify that variables is not already set by a hacker etc
{
    missionNamespace setVariable [_x, nil];
    if (!isNil _x) exitWith { endMission "GW_DataError"; };
    true
} count [
    "GW_Player_sideRank",
    "GW_Player_adminRank",
    "GW_Player_donorRank",
    "GW_player_id",
    "GW_player_playtime",
    "GW_player_gear",
    "GW_Player_bodyStats",
    "GW_player_jailTime",
    "GW_player_jail",
    "GW_player_alive",
    "GW_player_newPlayer",
    "GW_player_inventory",
    "GW_Player_mbAlive",
    "GW_Player_mcAlive",
    "GW_player_gear",
    "GW_player_experience",
    "GW_player_licenses",
    "GW_player_timeJoined"
];

// Set ranks
private _sideRank = [_dictRanks, missionNamespace, "", str playerSide] call GW_client_fnc_dictGetValueByKey;
private _adminRank = [_dictRanks, missionNamespace, "", "admin"] call GW_client_fnc_dictGetValueByKey;
private _donorRank = [_dictRanks, missionNamespace, "", "donor"] call GW_client_fnc_dictGetValueByKey;
[0, "GW_Player_sideRank", _sideRank] call GW_client_fnc_setConstant;
[0, "GW_Player_adminRank", _adminRank] call GW_client_fnc_setConstant;
[0, "GW_Player_donorRank", _donorRank] call GW_client_fnc_setConstant;

// Set player id
[0, "GW_player_id", _id] call GW_client_fnc_setConstant;

// Setup a dict with playtime
[missionNamespace, "GW_player_playtime", _dictPlaytimes] call GW_client_fnc_dictCreateDict;
[missionNamespace, "GW_player_gear", _dictGear] call GW_client_fnc_dictCreateDict;
[missionNamespace, "GW_player_bodyStats", _dictBodyStats] call GW_client_fnc_dictCreateDict;

// Setup normal variables
GW_player_jailTime = _jailTime;
GW_player_jail = _jail;
GW_player_alive = _alive;
GW_player_newPlayer = _newPlayer;
GW_player_inventory = _inventory;

// Money Variables
if (_newPlayer) then {
    private _baseConfig = missionConfigFile >> "CfgGroundWars" >> "Players" >> "Finance" >> "Money";
    GW_Player_mbAlive = getNumber (_baseConfig >> "bankStart");
    GW_Player_mcAlive = getNumber (_baseConfig >> "cashStart");

    // Start notification loop
    [] spawn {
        scriptName "GW_client_fnc_receivePlayerData: newPlayerNotificationLoop";
        private _cooldown = 5 * 60;
        for "_i" from 0 to 1 step 0 do {
            uiSleep _cooldown;
            [
                HINT_NORMAL,
                "Welcome Stranger!",
                "Hi and welcome to Ground Wars: Existence! Glad to see that you are on here checking this out. "
                + "This is a new Life/RPG gamemode on the block which has been in development for about 5 - 6 months. "
                + "This mission is only just in Beta stage right now which may mean there is a few bugs, but do not worry, "
                + "if you find a bug; just make sure to report it and we got you covered. You can do so at https://feedback"
                + ".simzorstudios.com. If you haven't already done so, make sure to register a new account on our forums "
                + "at https://forums.simzorstudios.com like the rest of the community. You can also find us to have a chat "
                + "on our TeamSpeak server at ts.ground-wars.com or by just entering groundwars in the TS address field."
                + " We wish you a very happy time playing!"
            ] call GW_client_fnc_notificationsAdd;

            uiSleep _cooldown;
            [
                HINT_NORMAL,
                "Beta Stage",
                "Existence is currently in Beta-stage, so do not freak out if you find a bug or two! We got you covered, just as "
                + "long as you report i on https://feedback.simzorstudios.com. It will really help us out! Things are going into "
                + "stable very soon!"
            ] call GW_client_fnc_notificationsAdd;

            uiSleep _cooldown;
            [
                HINT_NORMAL,
                "Donations",
                "Hi there! We hope you are enjoying Existence so far. We're just checking in to let you know that we're a non-profit "
                + "community trying to make awesome content for you to play. In order to keep our servers and services alive, we need "
                + "your help! If you got some spare change or feeling generous, please consider donating in order for our servers and "
                + "services to stay alive! It really helps us out. You can donate on our forums (https://forums.simzorstudios.com)."
                + "Happy playing."
            ] call GW_client_fnc_notificationsAdd;
        };
    };
} else {
    BANK = [_dictMoney, missionNamespace, "", "bank"] call GW_client_fnc_dictGetValueByKey;
    CASH = [_dictMoney, missionNamespace, "", "cash"] call GW_client_fnc_dictGetValueByKey;
};

// Set previous player damage
private _previousDamage = [[], missionNamespace, "GW_Player_bodyStats", "damage"] call GW_client_fnc_dictGetValueByKey;
player setDamage _previousDamage;

// Experience
GW_player_experience = _experience;
GW_player_licenses = _licenses;

// Set jointime
GW_player_timeJoined = time;

// Continue initializing
GW_initPlayer_playerDataReceived = true;

// Sync request
[false] call GW_client_fnc_playerSyncRequest;
