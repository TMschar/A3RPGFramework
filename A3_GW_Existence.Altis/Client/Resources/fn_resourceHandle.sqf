#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_resourceHandle.sqf
*
* Parameter(s):
*     0: STRING - Name of Resource Class
*
* Description:
*     Handles resources (picking, gathering and mining)
*/
#define TYPE_PICK 0
#define TYPE_WOOD 1
#define TYPE_MINE 2

scriptName "GW_client_fnc_resourceHandle: main";
scopeName "main";

if (!params [["_resource", "", [""]]]) throw "Param error, expected 1";
if (_resource isEqualTo "") exitWith { ["No resource", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!isNull objectParent player) exitWith { ["In vehicle", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (playerSide != civilian) exitWith { ["Only civilians can use this resource", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _resourceConfigClass = missionConfigFile >> "CfgResources" >> "Fields" >> worldName >> _resource;
if (!isClass _resourceConfigClass) throw "No config class for resource";

// Make sure the unit has a license in order to gather from this
// resource.
private _licenseRequired = getText (_resourceConfigClass >> "license");
if (_licenseRequired != "" && {!([_licenseRequired] call GW_client_fnc_licensingHasLicense)}) exitWith {
    // Get license name
    private _licenseName = [_licenseRequired] call GW_client_fnc_licensingGetName;

    // Notify
    [HINT_WARNING, "Resource Notice", format ["You do not have the required license for this resource. You need %1.", _licenseName]] call GW_client_fnc_notificationsAdd;
};

// Get the items to give back
private _itemsGive = getArray (_resourceConfigClass >> "itemsGive");
if (_itemsGive isEqualTo []) throw "Empty array of items to give";

// Make sure unit has space in inventory
if ({!([player, _x] call GW_client_fnc_virtualInventoryCanAddItem)} count _itemsGive > 0) exitWith {
    [HINT_AMBER, "Resource Notice", "Your inventory is full."] call GW_client_fnc_notificationsAdd
};

// Play sound
private _type = getNumber (_resourceConfigClass >> "type");
private _sound = switch (_type) do {
    case TYPE_PICK: {"harvest"};
    case TYPE_WOOD: {"wood"};
    case TYPE_MINE: {"mine"};
    default {"harvest"}
};
playSound _sound;

// Make sure its thread safe
private _handle = missionNamespace getVariable ["GW_resourceHandle_actionHandle", scriptNull];
if (!isNull _handle) then { terminate _handle; };

// Create a new thread
GW_resourceHandle_actionHandle = [_resourceConfigClass, _type, _fnc_scriptName] spawn {
    scriptName "GW_client_fnc_resourceHandle: handle gathering";
    scopeName "main";

    params [
        ["_resourceConfigClass", configNull, [configNull]],
        ["_type", 0, [0]],
        ["_fnc_scriptName", "", [""]]
    ];

    // Handle cutting down trees (if applicable)
    private _tree = objNull;
    if (_type isEqualTo TYPE_WOOD) then {
        private _trees = getArray (_resourceConfigClass >> "treeProperties" >> "trees");
        private _objects = lineIntersectsObjs [eyePos player, (ATLtoASL (player modelToWorld [0, 4, 0])), player, objNull, false, 48];
        {
            private _objectName = toArray str _x;
            _objectName deleteRange [0, (_objectName find 58) + 2];
            _objectName = toString _objectName;
            if (_objectName in _trees && {alive _x}) exitWith {
                _tree = _x
            };
            true;
        } count _objects;

        if (isNull _tree) then {
            [HINT_AMBER, "Resource Notice", "You are either not close to a tree or not looking at it."] call GW_client_fnc_notificationsAdd;
            breakOut "main";
        };
    };

    private _displayName = getText (_resourceConfigClass >> "displayName");
    private _progressOverride = [3, _displayName, "gui\data\displays\displayProgress\gather.paa", "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"];
    private _conditionsArgs = [player, getPosATL player];
    private _conditionsCode = {
        params [["_unit", objNull, [objNull]], ["_startPosATL", [], [[]]]];
        getPosATL _unit distance _startPosATL < 2
        && {alive _unit}
        && {!isNull _unit}
        && {!(_unit getVariable ["incapacitated", false])}
        && {!(_unit getVariable ["restrained", false])}
    };

    // Start action
    if (["", _progressOverride, _conditionsArgs, _conditionsCode] call GW_client_fnc_startProgress) then {
        // Give all items
        private _itemsAmount = getNumber (_resourceConfigClass >> "itemAmount");
        for "_i" from 1 to _itemsAmount do {
            private _itemsGive = getArray (_resourceConfigClass >> "itemsGive");
            { [player, _x, 1] call GW_client_fnc_virtualInventoryChange; true; } count _itemsGive;
        };

        // Set damage to tree if type trees
        if (!isNull _tree && {alive _tree}) then { _tree setDamage 1; };

        // Notify and give experience based on if the resource is illegal
        if (getNumber (_resourceConfigClass >> "illegal") isEqualTo 1) then
        {
            // Give experience
            [LEVEL_REBELLIOUS, 15, "", false] call GW_client_fnc_experienceCategoryAddExperience;

            // Notify
            [
                HINT_NORMAL,
                "Resource Notice",
                "You successfully gathered items from the resource. "
                + "You have earned 15 experience points within Jack of all trades and 20 experience "
                + "points within Rebellious."
            ] call GW_client_fnc_notificationsAdd;
        }
        else
        {
            // Give experience
            [LEVEL_TOOLSOFTHETRADE, 15, "", false] call GW_client_fnc_experienceCategoryAddExperience;

            // Notify
            [
                HINT_NORMAL,
                "Resource Notice",
                "You successfully gathered items from the resource. You have earned 20 experience points within Jack of all trades."
            ] call GW_client_fnc_notificationsAdd;
        };

        // Log
        [LOG_INFO, format [
            "Gathered from %1 resource",
            _displayName
        ], _fnc_scriptName] call GW_server_fnc_log
    } else { [HINT_AMBER, "Action Failed", "You failed to gather the resources."] call GW_client_fnc_notificationsAdd; };
};
