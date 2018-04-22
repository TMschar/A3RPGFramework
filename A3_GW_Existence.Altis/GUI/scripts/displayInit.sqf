#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayInit.sqf
 *
 * Parameter(s):
 *     0: STRING - Event to execute
 *     1: ARRAY  - Array with arguments
 */
#define SELF GW_displayInit_script
#define VAR_PROGRESS GW_displayInit_progress
#define VAR_CAMHANDLE GW_displayInit_cameraHandle
#define VAR_MUSICSTOPHANDLE GW_displayInit_musicStopHandle
#define TRACK_LONG "AmbientTrack01_F_Orange"

scriptName "GW_displayInit_Script: main";
scopeName "main";

disableSerialization;

if (
    !params
    [
        ["_event", "", [""]],
        ["_args", [], [[]]]
    ]
) throw "Param error";

switch (_event) do
{
    case "onLoad":
    {
        _args params [ ["_display", displayNull, [displayNull]] ];

        // Play music
        0 fadeMusic 0;
        playMusic "LeadTrack02_F_Malden";
        5 fadeMusic 0.5;

        // Play music as soon as it stops
        VAR_PROGRESS = 0;
        VAR_MUSICSTOPHANDLE = addMusicEventHandler ["MusicStop", { playMusic TRACK_LONG; }];

        // Setup camera
        "SPLASHNOISE" cutRsc ["SPLASHNOISE", "PLAIN", 10e10];
        ["setupCamera", []] spawn SELF;
    };
    case "loadIn":
    {
        _args params [ ["_display", displayNull, [displayNull]] ];

        // Fade out music and wait
        4 fadeMusic 0;
        uiSleep 4;

        // Notify
        _ctrlLoadingText ctrlSetText "LOADING IN...";

        // Spawn
        closeDialog 0;
        createDialog "GW_displaySpawns";
    };
    case "modifyInitStatus":
    {
        _args params [
            ["_incrementation", 0, [0]],
            ["_loadingText", "", [""]],
            ["_softLogFinished", false, [false]]
        ];

        private _display = ["GW_displayInit"] call GW_client_fnc_getDisplay;
        private _ctrlLoadingText = _display displayCtrl IDC_DISPLAYININT_INITSTATETEXT;
        private _ctrlProgressBar = _display displayCtrl IDC_DISPLAYINIT_PROGRESSBAR;

        VAR_PROGRESS = VAR_PROGRESS + _incrementation;
        if (_incrementation >= 0.01) then
        {
            if (_incrementation > 1 || {_incrementation < 0.1}) exitWith {};
            uiSleep 0.5;

            // Update loading text
            _ctrlLoadingText ctrlSetText (toUpper _loadingText);

            private _progressPosition = progressPosition _ctrlProgressBar;
            private _progressToAdd = (VAR_PROGRESS - _progressPosition) / 30;
            for "_i" from 0 to 30 do
            {
                _progressPosition = progressPosition _ctrlProgressBar;
                _ctrlProgressBar progressSetPosition (_progressPosition + _progressToAdd);
                uiSleep 0.01;
            };
        };

        private _aliveState = missionNamespace getVariable ["GW_player_alive", 0];
        if (VAR_PROGRESS >= 1) then
        {
            if (_aliveState isEqualTo 0) then
            {
                ["loadIn", []] call SELF;
            }
            else
            {
                _ctrlLoadingText ctrlSetText "COOLDOWN TRIGGERED, PLEASE WAIT...";
                uiSleep 2;

                // Play cooldown track
                4 fadeMusic 0;
                sleep 4;
                playMusic TRACK_LONG;
                4 fadeMusic 0.5;

                private _startTime = time;
                private _cooldown = 5 * 60;
                for "_i" from 0 to 1 step 0 do {
                    private _timePassed = round (time - _startTime);
                    private _time = [_cooldown - _timePassed, "MM:SS"] call BIS_fnc_secondsToString;
                    _ctrlLoadingText ctrlSetText format ["COOLDOWN - %1", _time];

                    // Timer finished (load in)
                    if (_cooldown - _timePassed < 0) exitWith { ["loadIn", []] call SELF; };
                };
            };
        };
    };
    case "setupCamera":
    {
        private _camTargets = [];
        private _camTarget = [];
        private _camStart = [];

        // Set positions depending on the world
        switch (toUpper worldName) do
        {
            case "ALTIS":
            {
                _camTarget = [3644.95, 13109, 0];
                _camStart = [3759, 12907];
                _camTargets =
                [
                    [3743.45, 12856.3],
                    [3384.99, 12891.5],
                    [3312.42, 13342.05],
                    [3657.17, 13532.45],
                    [4048.55, 13240.32],
                    [3981.92, 12807.55]
                ];
            };
            case "MALDEN":
            {
                _camTarget = [7239.66, 7926.61, 0];
                _camStart = [7406.92, 8042.55];
                _camTargets =
                [
                    [7377.7, 7812.33],
                    [7151.66, 7778.11],
                    [7066.42, 7917.05],
                    [7158.17, 8127.45],
                    [7209.55, 8102.32],
                    [7406.92, 8042.55]
                ];
            };
        };

        // No target
        if (count _camTargets < 1) throw "No configuration for targets of world";

        private _duration = 2;
        private _altitude = 180;
        private _commitTime = (_duration * 60) / count _camTargets;

        VAR_CAMHANDLE = "camera" camCreate (_camStart + [_altitude]);
        showCinemaBorder true;
        camUseNVG !(call GW_client_fnc_worldIsDayTime);
        VAR_CAMHANDLE cameraEffect ["INTERNAL", "BACK"];
        VAR_CAMHANDLE camSetTarget _camTarget;
        VAR_CAMHANDLE camCommit 0;

        showCinemaBorder false;

        // Loop through cam targets
        {
            private _new = _x + [_altitude];
            _new params [
                ["_posX", 0, [0]],
                ["_posY", 0, [0]],
                ["_posZ", 0, [0]]
            ];

            VAR_CAMHANDLE camSetPos [_posX, _posY, _posZ];
            VAR_CAMHANDLE camCommit _commitTime;

            waitUntil { camCommitted VAR_CAMHANDLE; };
        } forEach _camTargets;
    };
    case "onUnload":
    {
        // No longer use NVGs
        camUseNVG false;

        // Destroy camera
        VAR_CAMHANDLE cameraEffect ["TERMINATE", "BACK"];
        camDestroy VAR_CAMHANDLE;

        // Remove music stop eventhandler
        removeMusicEventHandler ["MusicStop", VAR_MUSICSTOPHANDLE];
    };
};
