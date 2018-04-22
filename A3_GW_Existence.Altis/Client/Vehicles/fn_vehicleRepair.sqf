#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleRepair.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to repair
 *
 * Description:
 *     Repairs a vehicle. Needs to be in scheduled environment
 */
#define ICONPATH_REPAIR "GUI\data\displays\displayInteractionMenu\repair.paa"

scriptName "GW_client_fnc_vehicleRepair: main";
scopeName "main";

if !(canSuspend) throw "Suspension was not allowed";
if (!params [ ["_vehicle", objNull, [objNull]] ]) throw "Expected parameters";
if (isNull _vehicle) throw "Vehicle is NULL";

private _conditionArgs = [player, _vehicle];
private _conditionCode =
{
    params [["_unit", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];
    _unit distance _vehicle < 5
    && {alive _unit}
    && {!isNull _unit}
    && {!(_unit getVariable ["incapacitated", false])}
    && {!isNull _vehicle}
};

//private _repairDuration = [30, 25, 20, 15, 10] select ([LEVEL_VEHICLES] call GW_client_fnc_experienceGetCategoryLevel);
if (["", [20, localize "STR_GW_ACTIONSPROGRESS_REPAIR", "gui\data\displays\displayInteractionMenu\repair.paa", "AinvPknlMstpSnonWnonDnon_medic_1"], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress) then
{
    // Repair
    _vehicle setDamage 0;

    // Notify
    [HINT_NORMAL, "Repair Notice", "Your successfully repaired your vehicle.", ICONPATH_REPAIR] call GW_client_fnc_notificationsAdd;

    // Give experience points
    [LEVEL_VEHICLES, 80, "Handy man"] call GW_client_fnc_experienceCategoryAddExperience;
}
else
{
    // Notify
    [HINT_WARNING, "Repair Notice", "Your attempt to repair your vehicle failed.", ICONPATH_REPAIR] call GW_client_fnc_notificationsAdd;
};