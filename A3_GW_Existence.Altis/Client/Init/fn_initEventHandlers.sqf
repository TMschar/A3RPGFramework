#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_initEventHandlers.sqf
 *
 * Description:
 *     Initializes all eventhandlers
 */
scriptName "GW_client_fnc_initEventHandlers: main";
scopeName "main";

private _gameDisplay = findDisplay 46;
_gameDisplay displaySetEventHandler ["KeyDown", "_this call GW_client_fnc_onKeyDown"];
_gameDisplay displaySetEventHandler ["KeyUp", "_this call GW_client_fnc_onKeyUp"];

// Add player eventhandlers.
// This will only CALL these functions, in unscheduled environment.
player addEventHandler ["Killed", GW_client_fnc_onPlayerKilled];
player addEventHandler ["Respawn", GW_client_fnc_onPlayerRespawn];
player addEventHandler ["GetInMan", GW_client_fnc_onGetInMan];
player addEventHandler ["GetOutMan", GW_client_fnc_onGetOutMan];
player addEventHandler ["InventoryOpened", {_this call GW_client_fnc_onInventoryOpened}];
player addEventHandler ["InventoryClosed", GW_client_fnc_onInventoryClosed];
player addEventHandler ["HandleDamage", GW_client_fnc_onHandleDamage];
player addEventHandler ["Take", GW_client_fnc_onTake];
player addEventHandler ["Put", GW_client_fnc_onPut];
player addEventHandler ["HandleRating", GW_client_fnc_onHandleRating];

// Add player eventhandlers, spawn them in scheduled environment
player addEventHandler ["FiredMan", {_this spawn GW_client_fnc_onFiredMan}];
player addEventHandler ["HandleHeal", {_this spawn GW_client_fnc_onHandleHeal}];

// Add eventhandlers to manage scrollwheel actions
inGameUISetEventHandler ["PrevAction", "_this call GW_client_fnc_onPrevAction"];
inGameUISetEventHandler ["NextAction", "_this call GW_client_fnc_onNextAction"];
inGameUISetEventHandler ["Action", "_this call GW_client_fnc_onAction"];

// Restrict to first person if enabled
if (getNumber (missionConfigFile >> "CfgGroundWars" >> "View" >> "firstPersonOnly") isEqualTo 1) then {
    // Switch camera to 1st person so we won't get an error when we spawn.
    player switchCamera "INTERNAL";

    // Add eventhandler to check every frame
    GW_eventHandlers_viewRestriction_efHandle = addMissionEventHandler ["EachFrame", GW_client_fnc_playersRestrictView];
};

GW_eventHandlers_handleSpeaking_efHandle = addMissionEventHandler ["EachFrame", GW_client_fnc_playersHandleSpeaking];
GW_eventhandlers_mainEachFrame_handle = addMissionEventHandler ["EachFrame", GW_client_fnc_onEachFrame];
GW_eventhandlers_mainDraw3D_handle = addMissionEventHandler ["Draw3D", GW_client_fnc_onDraw3D];
GW_eventhandlers_onMap_handle = addMissionEventHandler ["Map", GW_client_fnc_onMap];
GW_eventHandlers_gui3DActions_efHandle = addMissionEventHandler ["EachFrame", GW_client_fnc_gui3DActions];

addMissionEventHandler ["Ended", {
    if (_this == "EndDefault") then {
        [LOG_CRITICAL, "Used EndMission Cheat", _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];
        [format ["%1 disconnected to lobby - x24", profileName], "GW Existence"] call GW_client_fnc_communicationSendChat;
    };
}];
