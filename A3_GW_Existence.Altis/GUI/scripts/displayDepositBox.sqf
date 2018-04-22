#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayDepositBox.sqf
*
*    Parameter(s):
*        0: STRING - Event to execute
*        1: ARRAY  - Array with arguments
*
*    Returns:
*        NOTHING
*
*    Description:
*        Master UI Handler for Deposit Box
*/
scriptName "GW_displayDepositBox_Script: main";
scopeName "main";

disableSerialization;

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlTextPlayerInfo = _display displayCtrl IDC_DISPLAYDEPOSITBOX_PLAYERINFO;
        private _ctrlListFilter = _display displayCtrl IDC_DISPLAYDEPOSITBOX_FILTER;
        private _ctrlList = _display displayCtrl IDC_DISPLAYDEPOSITBOX_LIST;
        private _playerName = player call GW_client_fnc_playersGetName;

        {
            _ctrlList lnbAddRow [_x];
            true
        } count [
            ["Dex being retarded for RDM", "Loadout", "45 items"],
            ["Dex being retarded for RDM again", "Cash", "£52300"]
        ];

        _ctrlTextPlayerInfo ctrlSetText format ["Connected to deposit box for %1:%2", _playerName, getPlayerUID player];
        [_ctrlListFilter, _ctrlList] call BIS_fnc_initListNBoxSorting;
    };
    case "onUnload": {

    };
}
