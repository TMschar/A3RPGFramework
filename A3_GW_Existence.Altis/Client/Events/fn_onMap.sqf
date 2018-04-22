#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_onMap.sqf
*
*    Parameter(s):
*        0: BOOLEAN - Is map opened?
*        1: BOOLEAN - Is map forced?
*
*    Returns:
*        NOTHING
*
*    Description:
*        Function for onMap Event
*/
scriptName "GW_client_fnc_onMap: main";
scopeName "main";

#define CTRL_SORTBUTTON 1020
#define CTRL_SORTCTRL 1010

params [
    ["_mapIsOpened", false, [false]],
    ["_mapIsForced", false, [false]]
];

private _display = findDisplay 12;
private _ctrlMap = _display displayCtrl 51;

if _mapIsOpened then {
    GW_GUI_MapIcons_DrawHandle = _ctrlMap ctrlAddEventHandler ["Draw", GW_client_fnc_drawMapIcons];

    // Center map on player
    //_ctrlMap ctrlMapAnimAdd [0, 0.05, player];
    //ctrlMapAnimCommit _ctrlMap;

    // Sort button
    private _ctrlMapSortButton = _display ctrlCreate ["GW_ctrlButtonMapSort", CTRL_SORTBUTTON];
    _ctrlMapSortButton ctrlEnable false;
    _ctrlMapSortButton ctrlSetTextColor [1, 1, 1, 1];

    // Key Down Handler for Map
    _display displayAddEventHandler ["KeyDown", {
        params [
            ["_display", displayNull, [displayNull]],
            ["_dikCode", 0, [0]]
        ];

        if (_dikCode isEqualTo DIK_TAB) then {
            private _ctrlMapSort = _display displayCtrl CTRL_SORTCTRL;
            if (isNull _ctrlMapSort) then {
                private _ctrlMapSort = _display ctrlCreate ["GW_ctrlMapSort", CTRL_SORTCTRL];

                private _ctrlTree = _ctrlMapSort controlsGroupCtrl 7;
                _ctrlTree ctrlAddEventHandler ["TreeSelChanged", {
                    params [
                        ["_ctrl", controlNull, [controlNull]],
                        ["_selectionPath", [], [[]]]
                    ];

                    private _tvData = _ctrl tvData _selectionPath;
                    if (_tvData isEqualTo "") exitWith {};

                    private _ctrlMap = findDisplay 12 displayCtrl 51;
                    _ctrlMap ctrlMapAnimAdd [0, 0.1, getMarkerPos _tvData];
                    ctrlMapAnimCommit _ctrlMap
                }];

                private _ctrlButtonFocus = _ctrlMapSort controlsGroupCtrl 8;
                _ctrlButtonFocus ctrlAddEventHandler ["ButtonClick", {
                    params [["_ctrl", controlNull, [controlNull]]];
                    private _ctrlsGroup = ctrlParentControlsGroup _ctrl;

                    private _ctrlTree = _ctrlsGroup controlsGroupCtrl 7;
                    private _tvData = _ctrlTree tvData (tvCurSel _ctrlTree);

                    if (_tvData isEqualTo "") exitWith {};

                    private _ctrlMap = findDisplay 12 displayCtrl 51;
                    _ctrlMap ctrlMapAnimAdd [0, 0.02, getMarkerPos _tvData];
                    ctrlMapAnimCommit _ctrlMap
                }];

                private _ctrlButtonPlayer = _ctrlMapSort controlsGroupCtrl 9;
                _ctrlButtonPlayer ctrlAddEventHandler ["ButtonClick", {
                    private _ctrlMap = findDisplay 12 displayCtrl 51;
                    _ctrlMap ctrlMapAnimAdd [0, 0.05, player];
                    ctrlMapAnimCommit _ctrlMap
                }];

                // Setup tree
                {
                    private _markerName = markerText _x;
                    private _markerType = markerType _x;
                    private _markerColour = markerColor _x;
                    private _iconPath = getText (configFile >> "CfgMarkers" >> _markerType >> "icon");
                    private _iconColour = getArray (configfile >> "CfgMarkerColors" >> _markerColour >> "color");

                    // Add markers
                    if !(_markerName isEqualTo "") then {
                        private _index = _ctrlTree tvAdd [[], _markerName];
                        _ctrlTree tvSetPicture [[_index], _iconPath];
                        _ctrlTree tvSetPictureColor [[_index], _iconColour];
                        _ctrlTree tvSetData [[_index], _x]
                    };

                    true
                } count allMapMarkers;

                _ctrlTree tvSetCurSel [0];
                tvExpandAll _ctrlTree
            } else {
                ctrlDelete _ctrlMapSort
            };
            true
        }
    }]
} else {
    if (!isNil "GW_GUI_MapIcons_DrawHandle") then {
        _ctrlMap ctrlRemoveEventHandler ["Draw", GW_GUI_MapIcons_DrawHandle];
    };
};

// Map is closed
if !_mapIsOpened then {
    // Delete map sorting ctrl
    ctrlDelete (_display displayCtrl CTRL_SORTCTRL)
}
