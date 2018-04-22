#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_bleedoutKilled.sqf
 *
 * Parameter(s):
 *     0: STRING - Kind of event to execute code for
 *     1: ARRAY - Array with arguments
 */
scriptName "GW_client_fnc_bleedoutKilled: main";
scopeName "main";

if (!params [["_event", "", [""]], ["_args", [], [[]]]]) throw "Param error";
_args params [["_unit", objNull, [objNull]], ["_corpse", objNull, [objNull]]];

switch (_event) do {
    case "KILLED": {
        // Delete corpse
        if !(_corpse isEqualTo _unit) then {deleteVehicle _corpse};

        // Log death to database
        [GW_bleedoutKilled_logDeath, "GW_server_fnc_logPlayerDeath"] call GW_ext_fnc_networkCallServer;

        // Reset player
        [_unit] call GW_client_fnc_bleedoutReset;

        // Create respawn notice
        "BLEEDOUTBLACK" cutText ["", "BLACK OUT", 0.00001];
        "BLEEDOUTSPLASH" cutRsc ["SPLASHNOISE", "PLAIN", 3];

        // Show disconnect notice
        GW_Info_Title = "Better luck next time";
        GW_Info_Subtitle = "Respawning...";
        GW_Info_TitleColour = [0.92, 0.01, 0, 1];
        ["GW_Info"] call GW_client_fnc_createResource;

        private _respawnTimer = getNumber (missionConfigFile >> "CfgMedical" >> "Bleedout" >> "respawnTimer");
        GW_bleedoutRespawn_timer = diag_ticktime + _respawnTimer;
        GW_bleedoutRespawn_respawnEFHandle = addMissionEventHandler ["EachFrame", {
            GW_Info_Subtitle = format ["Respawning in %1", str round (GW_bleedoutRespawn_timer - diag_ticktime)];
            if (GW_bleedoutRespawn_timer - diag_ticktime < 0) then {
                // Setup player
                [true] call GW_client_fnc_playersSetupPlayer;

                // Create spawn dialog
                createDialog "GW_displaySpawns";

                // Remove splash and black
                "BLEEDOUTBLACK" cutText ["", "BLACK IN", 3];
                "BLEEDOUTSPLASH" cutText ["", "PLAIN", 0.00001];

                // Destroy
                ["GW_Info"] call GW_client_fnc_destroyResource;

                // Remove eventhandler
                removeMissionEventHandler ["EachFrame", GW_bleedoutRespawn_respawnEFHandle];
            };
        }];
    };
    case "INCAPACITATED": {
        // Default pre-animation
        _unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";

        // Setup clothing
        _unit setUnitLoadout GW_player_killedLoadout;
        [_unit] call GW_client_fnc_unitSetTextures;

        // Move default spawn body to previous death position
        _unit setPosATL (getPosATL _corpse);
        _unit setDir (getDir _corpse);

        if !(_corpse isEqualTo _unit) then { deleteVehicle _corpse; };

        // Notify medics - currently international health
        // and assistance service.
        [_unit, getPos _unit] remoteExecCall ["GW_client_fnc_bleedoutNotifyRevivers", independent];
    };
};
