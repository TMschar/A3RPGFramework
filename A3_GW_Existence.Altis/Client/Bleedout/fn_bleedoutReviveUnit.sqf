
#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_bleedoutRevivePlayer.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Object to revive
 *
 * Description:
 *     A function for medics to use when reviving a target. Must be ran in scheduled environment, else will error.
 */
#define PAYOUT_BANK 10000

scriptName "GW_client_fnc_bleedoutReviveUnit: main";
scopeName "main";

if (!params [ ["_unit", objNull, [objNull]] ]) throw "Param error";
if (!canSuspend) throw "Must be ran scheduled";

// Set unit to in revive
_unit setVariable ["inRevive", true, true];

private _conditionArgs = [player, _unit];
private _conditionCode =
{
    params [ ["_selfUnit", objNull, [objNull]], ["_targetUnit", objNull, [objNull]] ];
    _selfUnit distance _targetUnit < 2
    && {alive _selfUnit}
    && {!isNull _selfUnit}
    && {!(_selfUnit getVariable ["incapacitated", false])}
    && {!isNull _targetUnit}
    && {_targetUnit getVariable ["incapacitated", false]}
};

// Start progress bar
if (["Revive", [], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress) then
{
    // Get total revives
    private _totalRevives = missionNamespace getVariable ["GW_bleedoutReviveUnit_totalRevives", 1];
    private _experiencePayout = 100 * _totalRevives;

    // Increase revives this session
    GW_bleedoutReviveUnit_totalRevives = _totalRevives + 1;

    _unit setVariable ["inRevive", false, true];
    _unit setVariable ["incapacitated", false, true];

    // Give notification
    private _payoutFormatted = [PAYOUT_BANK] call GW_client_fnc_currencyFormat;
    private _unitsName = [_unit] call GW_client_fnc_playersGetName;
    [
        HINT_NORMAL,
        "Revive Notice",
        format
        [
            "You successfully revived %3. You have been paid %1 and you have received %2 experience points within Medical. Good job!",
            _payoutFormatted,
            _experiencePayout,
            _unitsName
        ]
    ] call GW_client_fnc_notificationsAdd;

    // Give money
    BANK = BANK + PAYOUT_BANK;

    // Give experience
    [LEVEL_MEDICAL, _experiencePayout, "", false] call GW_client_fnc_experienceCategoryAddExperience;
}
else
{
    // Give notification
    [HINT_AMBER, "Revive Failed", "You cancelled or failed the revive."] call GW_client_fnc_notificationsAdd;

    // Update variable
    _unit setVariable ["inRevive", false, true];
};
