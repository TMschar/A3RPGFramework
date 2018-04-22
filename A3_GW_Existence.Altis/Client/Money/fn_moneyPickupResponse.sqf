#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_moneyPickupResponse.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Value of Money
 */
#define MAX_PICKUP ([] call GW_client_fnc_moneyPickupMax)
#define EXP_REWARD 20

scriptName "GW_client_fnc_moneyPickupResponse: main";
scopeName "main";

// Make sure this function is remotely executed
if (!isRemoteExecuted) exitWith {
    ["This function must be remotely executed", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

// Only let server remote execute this function
if (remoteExecutedOwner != 2) exitWith {
    ["Only server is allowed to remotely execute this function", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

// Get the value of the money stack
if (!params [["_moneyStackValue", -1, [-1]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

// Error checks
if (_moneyStackValue isEqualTo -1) exitWith { ["No money value", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (_moneyStackValue > MAX_PICKUP) then { _moneyStackValue = MAX_PICKUP; };

// Play animation
// player playMoveNow "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";

// Add value to current cash
CASH = CASH + _moneyStackValue;

// Add experience
[0, EXP_REWARD, "", false] call GW_client_fnc_experienceCategoryAddExperience;

// Notify
private _categoryName = [0] call GW_client_fnc_experienceGetCategoryName;
private _formattedCash = [_moneyStackValue] call GW_client_fnc_currencyFormat;
[HINT_NORMAL, "Picked up money", format [
    "You picked up a stack of money worth <t font='RobotoCondensedBold'>%1</t>."
    + "You have been rewarded with <t font='RobotoCondensedBold'>%2</t> "
    + "experience points in the category <t font='RobotoCondensedBold'>%3</t> "
    + "because you found it.",
    _formattedCash,
    EXP_REWARD,
    _categoryName
]] call GW_client_fnc_notificationsAdd;