#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_messageSendRequest.sqf
 *
 * Parameter(s):
 *     0: NUMBER
 *     1: STRING
 *     2: OBJECT
 *     3: STRING
 *     4: BOOLEAN
 */
#define TARGETMODE_PLAYER 0
#define TARGETMODE_ORGANIZATION 1
#define TARGETMODE_POLICE 2
#define TARGETMODE_MEDIC 3
#define TARGETMODE_STAFF 4
#define TARGETMODE_PSA 5
#define TARGETMODE_SA 6

scriptName "GW_client_fnc_messageSendRequest: main";
scopeName "main";

if (!params [
    ["_targetMode", 0, [0]],
    ["_targetID", "", [""]],
    ["_unitSender", objNull, [objNull]],
    ["_message", "", [""]],
    ["_sendLocation", false, [false]]
]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _targetInformation = switch _targetMode do {
    case TARGETMODE_PLAYER: {
        private _unit = [_targetID] call GW_client_fnc_getUnitByUID;
        [[_unit], name _unit];
    };
    case TARGETMODE_ORGANIZATION: {
        private _groups = allGroups select {_x getVariable ["organizationName", ""] isEqualTo _targetID};
        private _group = _groups param [0, grpNull, [grpNull]];
        private _groupName = _group getVariable ["organizationName", ""];
        [[_group], _groupName];
    };
    case TARGETMODE_POLICE: {
        [[west], "Police"];
    };
    case TARGETMODE_MEDIC: {
        [[independent], "Medical Services"];
    };
    case TARGETMODE_STAFF: {
        private _targets = ALLPLAYERSNOHC select {getPlayerUID _x in call GW_admins};
        [_targets, "Ground Wars Staff"];
    };
    case TARGETMODE_PSA;
    case TARGETMODE_SA: {
        private _targets = ALLPLAYERSNOHC;
        [_targets, format ["All Players (%1)", _targetID]];
    };
};

private _location = if _sendLocation then {
    private _nearestTown = [_unitSender] call GW_client_fnc_getNearestTown;
    private _mapGrid = mapGridPosition _unitSender;
    [format ["%1 - Grid: %2", _nearestTown, _mapGrid], getPos _unitSender];
} else {
    [["Unknown"], []];
};

private _from = name _unitSender;
private _realTime = [0] call GW_server_fnc_getRealTime;

_targetInformation params [["_targets", [], [[]]], ["_to", "", [""]]];
_location params [["_textLocation", "", [""]], ["_position", [], [[]]]];

[_to, _from, _message, _textLocation, _realTime, _position, _unitSender] remoteExecCall ["GW_client_fnc_retrieveMessage", _targets];
