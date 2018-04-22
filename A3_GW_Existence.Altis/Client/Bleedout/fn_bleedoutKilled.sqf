#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_bleedoutKilled.sqf
 *
 * Parameter(s):
 *     0: STRING - Event to fire
 *     1: ARRAY  - Array with arguments
 */
scriptName "GW_client_fnc_bleedoutKilled: main";
scopeName "main";

if (!params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) throw "Param error";

_args params [
    ["_unitKilled", objNull, [objNull]],
    ["_unitKiller", objNull, [objNull]],
    ["_unitInstigator", objNull, [objNull]],
    ["_useEffects", false, [false]]
];

// Switch on event
switch (_event) do {
    case "KILLED": {
        [LOG_INFO, format [
            "Was killed by %1:%2",
            name _unitKiller,
            getPlayerUID _unitKiller
        ], _fnc_scriptName] call GW_server_fnc_log;

        // Close all displays
        [] call GW_client_fnc_guiCloseAllDisplays;

        // Killed var
        GW_bleedoutKilled_killed = true;

        // Drop items
        private _currentItems = missionNamespace getVariable ["GW_player_killedItems", []];
        _unitKilled setVariable ["virtualinventory_items", _currentItems, true];
        [_unitKilled, getPosATL _unitKilled] call GW_client_fnc_virtualInventoryDropItems;

        // Drop cash on ground
        [CASH, getPosATL _unitKilled] call GW_client_fnc_moneyDropMoney;
        CASH = 0;

        // Add killer to wanted list if not police or independent
        if !(side _unitKiller in [west, independent]) then { [_unitKiller, "Murder"] call GW_client_fnc_arrestWarrantsAdd; };

        // Respawn
        _unitKilled setVariable ["incapacitated", false, true];
        setPlayerRespawnTime 0;
    };
    case "INCAPACITATED": {
        [LOG_INFO, format [
            "Was incapacitated by %1:%2",
            name _unitKiller,
            getPlayerUID _unitKiller
        ], _fnc_scriptName] call GW_server_fnc_log;

        // Close all displays
        [] call GW_client_fnc_guiCloseAllDisplays;

        // Set incapcitated
        _unitKilled setVariable ["incapacitated", true, true];

        // Fix for combat logging - this will strip down player
        // then sync, which will have a empty inventory if they were
        // to combat log. When we sync it is important that we pass the
        // second argument as true so it will send UID instead of the
        // player object.
        GW_player_killedItems = _unitKilled getVariable ["virtualInventory_items", []];
        GW_player_killedLoadout = getUnitLoadout player;
        [_unitKilled] call GW_client_fnc_stripDownUnit;
        _unitKilled setVariable ["virtualinventory_items", [], true];
        [false, true] call GW_client_fnc_playerSyncRequest;

        // Halt
        ["GW_HUD"] call GW_client_fnc_destroyResource;
        [false] call GW_client_fnc_playersSyncHandler;
        [false] call GW_client_fnc_survivalHandler;
        [false] call GW_client_fnc_moneyPaycheckHandler;

        // Set names
        private _nameKiller = name _unitInstigator;
        private _nameKilled = name _unitKilled;
        private _weapon = getText (configFile >> "CfgWeapons" >> currentWeapon _unitInstigator >> "displayName");
        private _distance = _unitKilled distance _unitKiller;

        // Store this so it can be logged later (if killed). This will declare and define an array with all the information about
        // the player during their death. Only use this to log AFTER they have been killed (in case of being revived).
        GW_bleedoutKilled_logDeath = [
            GW_player_killedLoadout,
            GW_player_killedItems,
            getPlayerUID _unitKilled,
            currentWeapon _unitKiller,
            _distance,
            CASH
        ];

        // Set broadcast string depending on some conditions
        private _broadcastString = if (_unitKilled isEqualTo _unitKiller) then
        {
            format ["%1 has been incapacitated by himself.", name _unitKilled];
        }
        else
        {
            if !(_weapon isEqualTo "") then
            {
                format ["%1 got incapacitated by %2 with a %3", name _unitKilled, name _unitInstigator, _weapon];
            }
            else
            {
                if (isNull _unitKiller && {isNull _unitInstigator}) then
                {
                    format ["%1 got incapacitated by unknown source", name _unitKilled];
                }
                else
                {
                    format ["%1 got incapacitated by %2", name _unitKilled, name _unitInstigator];
                };
            };
        };

        // Add incapacitator to wanted list
        if !(side group _unitKiller in [independent, west]) then { [_unitKiller, "AttemptedMurder"] call GW_client_fnc_arrestWarrantsAdd; };

        // Broadcast kill feed message
        [_broadcastString, "Kill Feed"] call GW_client_fnc_communicationSendChat;

        // Make sure only internal (1st person) view is allowed
        GW_bleedoutKilled_eachFrameHandle = addMissionEventHandler
        [
            "EachFrame",
            {
                // Only allow first person view
                if (cameraView == "EXTERNAL") then { player switchCamera "INTERNAL"; };

                // Wait for revive
                if (!(player getVariable ["incapacitated", false]) && {!(missionNamespace getVariable ["GW_bleedoutKilled_killed", false])}) then
                {
                    [player, GW_player_killedLoadout, GW_player_killedItems] call GW_client_fnc_bleedoutOnRevived;
                };

                if (animationState player != "AinjPpneMstpSnonWrflDnon_rolltoback") then
                {
                    player playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
                };
            }
        ];

        // Wait for respawn
        if !(isNil "GW_bleedoutKilled_waitForRespawnThread") then { terminate GW_bleedoutKilled_waitForRespawnThread; };
        GW_bleedoutKilled_waitForRespawnThread = [_unitKilled] spawn
        {
            scriptName "GW_client_fnc_bleedoutKilled: wait for respawn";
            scopeName "main";

            params [ ["_unitKilled", objNull, [objNull]] ];

            // Create display
            ["GW_Bleedout"] call GW_client_fnc_createResource;

            // Create effects
            GW_bleedoutRespawn_ppEffect1 = ppEffectCreate ["colorCorrections", 1500];
            GW_bleedoutRespawn_ppEffect2 = ppEffectCreate ["ChromAberration", 200];
            GW_bleedoutRespawn_ppEffect1 ppEffectEnable true;
            GW_bleedoutRespawn_ppEffect2 ppEffectEnable true;
            GW_bleedoutRespawn_ppEffect1 ppEffectAdjust [0.9, 1, 0, [0.4, 0.4, 0.4, 0.5], [0.6, 0.6, 0.6, 0.3], [0.4, 0.4, 0.4, 0.5]];
            GW_bleedoutRespawn_ppEffect2 ppEffectAdjust [0.05, 0.05, true];
            GW_bleedoutRespawn_ppEffect1 ppEffectCommit 3;
            GW_bleedoutRespawn_ppEffect2 ppEffectCommit 3;

            // Eject if unit is in vehicle
            if !(isNull objectParent _unitKilled) then { _unitKilled action ["Eject", vehicle _unitKilled]; };

            // Halt until body is still
            waitUntil { vectorMagnitude velocity _unitKilled <= 0; };

            // Respawn
            setPlayerRespawnTime 0;
        };
    };
};
