#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: bleedout.sqf
 *
 * Parameter(s):
 *    0: STRING - Event
 *    1: ARRAY - Arguments
 */
scriptName "GW_bleedout_script: main";
scopeName "main";

disableSerialization;
if (!params [["_event", "", [""]],["_args", [], [[]]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _minutesDuration = getNumber (missionConfigFile >> "CfgGroundWars" >> "GameProperties" >> "bleedoutDuration");
        GW_Bleedout_Start = diag_tickTime;
        GW_Bleedout_Duration = (60 * _minutesDuration);

        private _ctrlTextEscape = _display displayCtrl IDC_BLEEDOUT_ESCAPENOTICE;
        _ctrlTextEscape ctrlSetFade 1;
        _ctrlTextEscape ctrlCommit 0;

        GW_Bleedout_AllowEscape = false;
        GW_Bleedout_efHandle = addMissionEventHandler ["EachFrame", {
            private _display = ["GW_Bleedout"] call GW_client_fnc_getDisplay;
            private _ctrlProgress = _display displayCtrl IDC_BLEEDOUT_PROGRESS;
            private _ctrlNearestMedic = _display displayCtrl IDC_BLEEDOUT_NEARESTMEDIC;
            private _ctrlBleedoutText = _display displayCtrl IDC_BLEEDOUT_PROGRESSTEXT;
            private _medics = {side group _x isEqualTo independent && {_x != player}} count playableUnits;

            // Set progress
            private _progress = (diag_tickTime - GW_bleedout_start) / GW_Bleedout_Duration;
            //_progress = _progress + (damage player * 0.3);

            // Check if blood is given. If it is given, then
            // give the player double the bleedout time.
            if (player getVariable ["bleedoutGivenBlood", false]) then {
                _progress = _progress - 1;
            };

            // Set position of progressbar
            _ctrlProgress progressSetPosition (1 - _progress);

            // Set colours
            if (player getVariable ["inRevive", false]) then {
                _ctrlProgress ctrlSetTextColor [0, 0.67, 0.14, 1];
                _ctrlBleedoutText ctrlSetText localize "STR_GW_GUI_BLEEDOUT_BEINGREVIVED"
            } else {
                private _percentage = round (100 - (_progress * 100));
                _ctrlBleedoutText ctrlSetText format [localize "STR_GW_GUI_BLEEDOUT_TITLE", _percentage, "%"]
            };

            // If medics on server are more than 0
            if (_medics > 0) then {
                private _medics = playableUnits select {side group _x isEqualTo independent && {_x != player}};
                private _distance = 0;

                // Loop through medics
                {
                    private _posPlayer = getPosATL player;
                    private _posMedic = getPosATL _x;
                    _distance = round (_posPlayer distance _posMedic);
                    true
                } count _medics;

                // Store distance in kilometres
                private _kmDistance = _distance / 1000;

                // Set distance text
                _ctrlNearestMedic ctrlSetText format [localize "STR_GW_GUI_BLEEDOUT_CLOSESTMEDIC", _kmDistance];
            } else {
                _ctrlNearestMedic ctrlSetText localize "STR_GW_GUI_BLEEDOUT_CLOSESTMEDICUNAVAILABLE"
            };

            // Allow respawn after 50 percent of bleeding out
            if (_progress >= 0.1 && {!GW_Bleedout_AllowEscape}) then {
                private _ctrlTextEscape = _display displayCtrl IDC_BLEEDOUT_ESCAPENOTICE;
                _ctrlTextEscape ctrlSetFade 0;
                _ctrlTextEscape ctrlCommit 2;

                // Allow escape and respawn
                GW_bleedout_allowEscape = true;
            };

            // Bled out, so kill
            if (_progress >= 1) exitWith {
                player setDamage 1;
            };
        }];
    };
    case "onUnload": {
        removeMissionEventHandler ["EachFrame", GW_bleedout_efHandle];

        GW_Bleedout_Start = nil;
        GW_Bleedout_Duration = nil;
        GW_Bleedout_efHandle = nil;
        GW_Bleedout_AllowEscape = nil;
    };
};
