#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_resourceStealOil.sqf
 */
scriptName "GW_client_fnc_resourceStealOil: main";
scopeName "main";

private _scriptHandle = missionNamespace getVariable ["GW_resourceStealOil_scriptHandle", scriptNull];
if (!isNull _scriptHandle) exitWith { ["Already stealing oil...", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if !(["civ_oil"] call GW_client_fnc_licensingHasLicense) exitWith { [HINT_WARNING, "Training Required", "You do not have the required training."] call GW_client_fnc_notificationsAdd; };

GW_resourceStealOil_scriptHandle = [] spawn {
    scriptName "GW_client_fnc_resourceStealOil: stealOilThread";
    scopeName "main";

    // Conditions
    private _conditionArgs = [player, getPosATL player];
    private _conditionCode = {
        params [["_unit", objNull, [objNull]], ["_startPos", [], [[]]]];
        getPosATL _unit distance _startPos < 2
        && {alive _unit}
        && {!isNull _unit}
        && {!(_unit getVariable ["incapacitated", false])}
        && {isNull objectParent player}
    };

    // Start progress bar and manage it failing or succeeding
    if (["", [20, "Stealing Oil", "", ""], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress) then {
        // Add oil
        private _itemAmount = 0;
        for "_i" from 1 to 3 do {
            if ([player, "Oil", 1, false] call GW_client_fnc_virtualInventoryChange) then {
                _itemAmount = _itemAmount + 1;
            };
        };

        // Give experience
        private _expJOAT = 10 * _itemAmount;
        private _expReb = 15 * _itemAmount;
        [LEVEL_TOOLSOFTHETRADE, _expJOAT, "", false] call GW_client_fnc_experienceCategoryAddExperience;
        [LEVEL_REBELLIOUS, _expReb, "", false] call GW_client_fnc_experienceCategoryAddExperience;

        // Notify
        [HINT_NORMAL, "Stole oil", format [
            "You stole <t font='RobotoCondensedBold'>%1</t> units worth of <t font='RobotoCondensedBold'>Oil</t>"
            + " and received <t font='RobotoCondensedBold'>%3</t> experience "
            + "points in <t font='RobotoCondensedBold'>Rebellious</t> and %2 "
            + "experience points in <t font='RobotoCondensedBold'>Jack of "
            + "all trades</t>.",
            _itemAmount,
            _expJOAT,
            _expReb
        ]] call GW_client_fnc_notificationsAdd;
    } else { [HINT_WARNING, "Failed to steal oil", "You failed to steal oil from the Oil Rig."] call GW_client_fnc_notificationsAdd; };
};