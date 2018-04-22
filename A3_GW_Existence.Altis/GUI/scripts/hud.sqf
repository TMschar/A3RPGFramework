#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: hud.sqf
*
* Parameter(s):
*     0 (REQUIRED): STRING - Event to execute
*     1 (REQUIRED): ARRAY  - Array with arguments
*/
#define SELF GW_HUD_script
#define DISPLAY_CLASS "GW_HUD"
#define STATS_DRAW3D_HANDLE GW_HUD_stats_draw3DHandle
#define COMPASS_DRAW3D_HANDLE GW_HUD_compass_draw3DHandle
#define COLOUR_ORANGE [0.84, 0.39, 0, 1]
#define COLOUR_RED [0.69, 0.01, 0, 1]

scriptName "GW_HUD_script";
scopeName "main";

disableSerialization;
if !params [["_event", "", [""]], ["_args", [], [[]]]] exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        // Debug log
        ["HUD Loaded", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;

        // Add on each frame handlers (draw3D)
        STATS_DRAW3D_HANDLE = addMissionEventHandler ["Draw3D", {["statsDraw3D", []] call SELF}];
        COMPASS_DRAW3D_HANDLE = addMissionEventHandler ["Draw3D", {["compassDraw3D", []] call SELF}];
    };
    case "compassDraw3D": {
        // Define controls and display
        private _display = DISPLAY_CLASS call GW_client_fnc_getDisplay;
        private _ctrlDirectionGroup = _display displayCtrl IDC_HUD_DIRECTIONBAR;

        // Get cardinal points and direction of player
        private _playerCardinalPoints = [player] call GW_client_fnc_worldCardinalPoints;
        _playerCardinalPoints params [
            ["_dir", 0, [0]],
            ["_cardinalPoint", "", [""]],
            ["_cardinalPointLeft", "", [""]],
            ["_cardinalPointRight", "", [""]]
        ];

        // Update texts
        (_ctrlDirectionGroup controlsGroupCtrl 2) ctrlSetText format ["%1° %2", _dir toFixed 0, _cardinalPoint];
        (_ctrlDirectionGroup controlsGroupCtrl 1) ctrlSetText _cardinalPointLeft;
        (_ctrlDirectionGroup controlsGroupCtrl 3) ctrlSetText _cardinalPointRight;
    };
    case "statsDraw3D": {
        private _display = DISPLAY_CLASS call GW_client_fnc_getDisplay;
        private _ctrlTextMoney = _display displayCtrl IDC_HUD_MONEY;
        private _ctrlStatsGroup = _display displayCtrl IDC_HUD_STATSGROUP;
        private _ctrlStatusIconsGroup = _display displayCtrl IDC_HUD_STATUSICONS;

        // Update state of status icons
        (_ctrlStatusIconsGroup controlsGroupCtrl IDC_HUD_STATUSICONS_ICONEARPLUGS) ctrlShow (missionNamespace getVariable ["GW_fadeSound", false]);
        (_ctrlStatusIconsGroup controlsGroupCtrl IDC_HUD_STATUSICONS_ICONSEATBELT) ctrlShow (player getVariable ["seatbelt", false]);
        (_ctrlStatusIconsGroup controlsGroupCtrl IDC_HUD_STATUSICONS_ICONHANDCUFFS) ctrlShow (player getVariable ["restrained", false]);
        (_ctrlStatusIconsGroup controlsGroupCtrl IDC_HUD_STATUSICONS_ICONCOMMSSEIZED) ctrlShow !([player] call GW_client_fnc_communicationHasComms);

        // Update progress bars
        (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_HUNGERPROGRESS) progressSetPosition (1 - ([[], missionNamespace, "GW_Player_bodyStats", "hunger"] call GW_client_fnc_dictGetValueByKey));
        (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_THIRSTPROGRESS) progressSetPosition (1 - ([[], missionNamespace, "GW_Player_bodyStats", "thirst"] call GW_client_fnc_dictGetValueByKey));
        (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_HEALTHPROGRESS) progressSetPosition (1 - damage player);

        if (diag_frameno % 30 == 0) then {
            private _hunger = 1 - ([[], missionNamespace, "GW_Player_bodyStats", "hunger"] call GW_client_fnc_dictGetValueByKey);
            private _thirst = 1 - ([[], missionNamespace, "GW_Player_bodyStats", "thirst"] call GW_client_fnc_dictGetValueByKey);
            private _damage = 1 - (damage player);

            if (_hunger < 0.2) then {
                (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_ICONHUNGER) ctrlSetTextColor COLOUR_RED;
            } else {
                if (_hunger < 0.3) then {
                    (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_ICONHUNGER) ctrlSetTextColor COLOUR_ORANGE;
                } else {
                    (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_ICONHUNGER) ctrlSetTextColor [1, 1, 1, 1];
                };
            };

            if (_thirst < 0.2) then {
                (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_ICONTHIRST) ctrlSetTextColor COLOUR_RED;
            } else {
                if (_thirst < 0.3) then {
                    (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_ICONTHIRST) ctrlSetTextColor COLOUR_ORANGE;
                } else {
                    (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_ICONTHIRST) ctrlSetTextColor [1, 1, 1, 1];
                };
            };

            if (_damage < 0.3) then {
                (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_ICONDAMAGE) ctrlSetTextColor COLOUR_RED;
            } else {
                if (_damage < 0.2) then {
                    (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_ICONDAMAGE) ctrlSetTextColor COLOUR_ORANGE;
                } else {
                    (_ctrlStatsGroup controlsGroupCtrl IDC_HUD_STATSGROUP_ICONDAMAGE) ctrlSetTextColor [1, 1, 1, 1];
                };
            };
        };

        // Set money
        _ctrlTextMoney ctrlSetText ([CASH] call GW_client_fnc_currencyFormat);
    };
    case "onUnload": {
        removeMissionEventHandler ["Draw3D", COMPASS_DRAW3D_HANDLE];
        removeMissionEventHandler ["Draw3D", STATS_DRAW3D_HANDLE];
        COMPASS_DRAW3D_HANDLE = nil;
        STATS_DRAW3D_HANDLE = nil;
    };
};