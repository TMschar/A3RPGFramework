#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onEachFrame.sqf
 */
scriptName "GW_client_fnc_onEachFrame: main";
scopeName "main";

// Disable commanding menu
if !(commandingMenu isEqualTo "") then { showCommandingMenu ""; };

// Update Players to Draw on Map (each 20 frames)
if (diag_frameno % 20 isEqualTo 0 && {visibleMap} || {visibleGPS} || {["GW_displayAdmin"] call GW_client_fnc_guiDisplayActive}) then {
    GW_MapDrawIcons_Units = [];
    private _arrayDrawUnits = if (["GW_displayAdmin"] call GW_client_fnc_guiDisplayActive) then {
        ALLPLAYERSNOHC;
    } else {
        GW_MapDrawIcons_Units pushback [vehicle player, "iconManVirtual", [0.92, 0.53, 0, 1]];
        units group player - [player];
    };

    {
        GW_MapDrawIcons_Units pushBack [
            vehicle _x,
            [
                "iconMan",
                getText (configFile >> "CfgVehicles" >> typeOf objectParent _x >> "icon")
            ] select (!isNull objectParent _x),
            [side group _x, false] call BIS_fnc_sideColor
        ];
        true;
    } count _arrayDrawUnits;

    if (["GW_displayAdmin"] call GW_client_fnc_guiDisplayActive) then {
        {
            if (count crew _x isEqualTo 0 && {_x isKindOf "Car"} || {_x isKindOf "Air"} || {_x isKindOf "Tank"}) then {
                private _parentX = _x;
                private _vehicleType = ["Plane", "Car", "Tank", "Helicopter"] select {_parentX isKindOf _x};
                private _vehicleIcon = (getText (configFile >> "CfgVehicleIcons" >> (getText (configFile >> "CfgVehicles" >> (if (_vehicleType isEqualType []) then {_vehicleType select 0} else {_vehicleType}) >> "icon"))));
                GW_MapDrawIcons_Units pushback [_x, _vehicleIcon, [0, 0.6, 0.47, 1]]
            };
            true;
        } count vehicles;
    };

    // Handle GPS Map Markers
    private _ctrlMiniMap = (uiNamespace getVariable ["RscCustomInfoMiniMap", displayNull]) displayCtrl 101;
    if (isNil "GW_GUI_MiniMapIcons_DrawHandle" && {visibleGPS}) then {
        GW_GUI_MiniMapIcons_DrawHandle = _ctrlMiniMap ctrlAddEventHandler ["Draw", GW_client_fnc_drawMapIcons];
    } else {
        if (!visibleGPS && {!isNil "GW_GUI_MiniMapIcons_DrawHandle"}) then {
            _ctrlMiniMap ctrlRemoveEventHandler ["Draw", GW_GUI_MiniMapIcons_DrawHandle];
        };
    };
};
