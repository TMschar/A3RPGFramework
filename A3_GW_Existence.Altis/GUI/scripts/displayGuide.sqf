#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_arrestWarrantsIsWanted.sqf
*
*    Parameter(s):
*        0: STRING - Event to execute
*        1: ARRAY  - Array with arguments from display initialization
*
*    Returns:
*        NOTHING
*
*    Description:
*        Master UI handler for guide
*/
scriptName "GW_displayGuide_script: main";
scopeName "main";

disableSerialization;

#define SELF GW_displayGuide_script

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlTree = _display displayCtrl IDC_DISPLAYGUIDE_TREE;
        private _ctrlButtonExpandAll = _display displayCtrl IDC_DISLAYGUIDE_BUTTONEXPANDALL;
        private _ctrlButtonCollapseAll = _display displayCtrl IDC_DISPLAYGUIDE_BUTTONCOLLAPSEALL;
        private _ctrlButtonSearch = _display displayCtrl IDC_DISPLAYGUIDE_BUTTONSEARCH;
        private _ctrlEditSearch = _display displayCtrl IDC_DISPLAYGUIDE_SEARCH;
        private _categories = [
            [
                "General",
                [
                    "Welcome",
                    "Get Involved"
                ]
            ],
            [
                localize "STR_GW_GUI_DISPLAYS_DISPLAYGUIDE_GUIDE",
                [
                    "Keybindings",
                    "Experience System"
                ]
            ],
            [
                localize "STR_GW_GUI_DISPLAYS_DISPLAYGUIDE_RULES",
                [
                    "General",
                    "Behaviour",
                    "Teams",
                    "Exploits, Cheats & Hacks"
                ]
            ],
            [
                localize "STR_GW_GUI_DISPLAYS_DISPLAYGUIDE_GW",
                [
                    "ArmA 3 Servers",
                    "Social Channels & Community",
                    "Tools"
                ]
            ]
        ];

        _ctrlTree ctrlAddEventHandler ["TreeSelChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_path", [], [[]]]
            ];

            private _display = ctrlParent _ctrl;
            private _tvData = _ctrl tvData _path;
            private _ctrlStructuredText = _display displayCtrl IDC_DISPLAYGUIDE_CONTENT;

            _ctrlStructuredText ctrlSetStructuredText parseText _tvData
        }];

        _ctrlButtonExpandAll ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlTree = _display displayCtrl IDC_DISPLAYGUIDE_TREE;
            tvExpandAll _ctrlTree
        }];

        _ctrlButtonCollapseAll ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlTree = _display displayCtrl IDC_DISPLAYGUIDE_TREE;
            tvCollapseAll _ctrlTree
        }];

        _ctrlEditSearch ctrlAddEventHandler ["KeyUp", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlButtonSearch = _display displayCtrl IDC_DISPLAYGUIDE_BUTTONSEARCH;

            private _iconPath = [
                "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa"
            ] select !(ctrlText _ctrl isEqualTo "");

            _ctrlButtonSearch ctrlSetText _iconPath;
        }];

        _ctrlButtonSearch ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlEditSearch = _display displayCtrl IDC_DISPLAYGUIDE_SEARCH;
            private _ctrlTree = _display displayCtrl IDC_DISPLAYGUIDE_TREE;

            if !(ctrlText _ctrlEditSearch isEqualTo "") then {
                _ctrl ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
                _ctrlEditSearch ctrlSetText ""
            }
        }];

        // Load all categories
        {
            _x params [
                ["_categoryName", "", [""]],
                ["_subCategories", [], [[]]]
            ];

            private _treeCategoryEntry = _ctrlTree tvAdd [[], _categoryName];
            _ctrlTree tvSetPicture [[_treeCategoryEntry], "a3\3den\Data\Cfg3DEN\Layer\iconDefault_ca.paa"];

            {
                if (_x isEqualType "") then {
                    _treeSubCategoryEntry = _ctrlTree tvAdd [[_treeCategoryEntry], _x];
                    _ctrlTree tvSetPicture [[_treeCategoryEntry, _treeSubCategoryEntry], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"]
                };
                true
            } count _subCategories;

            true
        } count _categories;

        // _ctrlTree tvSetData [
        //     [1, 0],
        //     "<t font='PuristaMedium' shadow='0' align='center' size='1.2'>KEYBINDINGS</t><br/><br/><t font='PuristaLight' shadow='0'>NUM 1: Fade Sound (Earplugs)</t><br/><t shadow='0' font='PuristaLight'>NUM 2: Holster Weapon</t><br/><t shadow='0' font='PuristaLight'>ESC: Pause Menu</t>"
        // ];

        // _ctrlTree tvSetData [
        //     [_indexGuide, _entryExperience],
        //     "<t font='PuristaMedium' shadow='0' align='center' size='1.2'>EXPERIENCE SYSTEM</t><br/><br/><t font='PuristaLight' shadow='0'>The experience system is what controls the equipment that is available to you. When you level up, you will unlock new weapons and other gear.</t>"];
        // _ctrlTree tvSetData [[_indexGuide, _entryReports], "<t font='PuristaMedium' shadow='0' align='center' size='1.2'>REPORTING PLAYERS</t><br/><br/><t font='PuristaLight' shadow='0'>Reporting players can be done on our discord. Click the link in the main menu.</t>"];
        // _ctrlTree tvSetPicture [[_indexGuide, _entryKeyBindings], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"];
        // _ctrlTree tvSetPicture [[_indexGuide, _entryExperience], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"];
        // _ctrlTree tvSetPicture [[_indexGuide, _entryReports], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"];

        // _ctrlTree tvAdd [[_indexRules], "Teams"];
        // _ctrlTree tvAdd [[_indexRules], "Exploits, Cheats & Hacks"];
        // _ctrlTree tvAdd [[_indexGW], "Servers"];
        // _ctrlTree tvAdd [[_indexGW], "Social Media"];
        // _ctrlTree tvAdd [[_indexGW], "Tools"];

        tvExpandAll _ctrlTree;
        _ctrlTree tvSetCurSel [0, 0]
    };
    case "onUnload": {

    }
}