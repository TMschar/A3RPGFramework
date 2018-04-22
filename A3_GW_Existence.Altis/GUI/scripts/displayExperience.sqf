#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayExperience.sqf
 *
 * Parameter(s):
 *     0: STRING - Event
 *     1: ARRAY - Arguments
 */
#define CONFIG_CATEGORIES ("true" configClasses (missionConfigFile >> "CfgExperience" >> "Categories"))
scriptName "GW_displayExperience_Script: main";
scopeName "main";

disableSerialization;
if (!params [["_event", "", [""]], ["_args", [], [[]]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlListLevelCategories = _display displayCtrl IDC_DISPLAYEXPERIENCE_CATEGORIES;
        _ctrlListLevelCategories ctrlAddEventHandler ["LBSelChanged", {
            params [["_ctrl", controlNull, [controlNull]], ["_selectionIndex", 0, [0]]];

            private _display = ctrlParent _ctrl;
            private _lbData = _ctrl lbData _selectionIndex;
            private _levelCategoryID = call compile _lbData;
            private _index = 0;
            private _displayName = "";
            private _levels = [];

            {
                private _id = getNumber (_x >> "id");
                if (_id isEqualTo _levelCategoryID) exitWith {
                    _index = _id;
                    _displayName = getText (_x >> "displayName");
                    _levels = "true" configClasses (_x >> "Levels")
                };
                true
            } count CONFIG_CATEGORIES;

            private _ctrlLevelInfoGroup = _display displayCtrl IDC_DISPLAYEXPERIENCE_LEVELINFOGROUP;
            private _ctrlProgressText = _ctrlLevelInfoGroup controlsGroupCtrl IDC_DISPLAYEXPERIENCE_LEVELINFOGROUP_PROGRESSTEXT;
            private _ctrlProgress = _ctrlLevelInfoGroup controlsGroupCtrl IDC_DISPLAYEXPERIENCE_LEVELINFOGROUP_PROGRESS;
            private _currentExperience = (GW_Player_Experience param [_selectionIndex, [], [[]]]) param [0, 0, [0]];
            private _nextLevelInfo = [_selectionIndex] call GW_client_fnc_experienceCategoryGetNextLevel;
            private _currentLevel = [_selectionIndex] call GW_client_fnc_experienceGetCategoryLevel;

            // Set text and progress
            _nextLevelInfo params ["_nextLevelNumber", "_nextLevelExperience"];
            _ctrlProgressText ctrlSetText format ["Level %1 - %2/%3 Experience Points", _currentLevel, _currentExperience, _nextLevelExperience];
            _ctrlProgress progressSetPosition (_currentExperience / _nextLevelExperience);
        }];

        // Loop through experience array
        {
            private _name = [_forEachIndex] call GW_client_fnc_experienceGetCategoryName;
            private _lbEntry = _ctrlListLevelCategories lbAdd _name;
            _ctrlListLevelCategories lbSetData [_lbEntry, str _forEachIndex]
        } forEach GW_player_experience;

        // Select first
        _ctrlListLevelCategories lbSetCurSel 0;
    };
    case "onUnload": {};
};
