#include "script_component.hpp"
#include "init_macros.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_initClient.sqf
 */
scriptName "GW_client_fnc_initClient: main";
scopeName "main";

// Create resource as soon as game is started so there is no seconds with no screen
if !(profileNamespace getVariable ["GW_bypassCinematicIntro", false]) then {
    // Create loading resource
    ["GW_cinematics"] call GW_client_fnc_createResource;

    // Destroy it, when it tells us to continue
    waitUntil { missionNamespace getVariable ["GW_Continue", false]; };
    ["GW_cinematics"] call GW_client_fnc_destroyResource;
};

// HOTFIX:: DO NOT REMOVE UNTIL I STOP BEING RETARDED
missionNamespace setVariable ["GW_Continue", true];

// Wait until game display is ready
waitUntil {!isNull player && {player isEqualTo player} && {!isNull (findDisplay 46)} && {time > 0}};

// Store a variable, which we use later to see how long the initialization time was
private _time = diag_tickTime;

// Disable Water Mark on Developer Branch
disableSerialization;
{
    private _ctrl = findDisplay 46 displayCtrl _x;
    if isNull _ctrl then {
        breakTo "main"
    };
    _ctrl ctrlShow false;
    true;
} count [1000, 1001, 1002, 1200, 1202];

// Create our initialization display.
// This will show information and a camera
// about the initialization. See function
// GW_displayInit_script (displayInit.sqf)
// for more information.
private _displayCreated = createDialog "GW_displayInit";
waitUntil { _displayCreated; };

// Setup player settings
INIT_STATUS(.1, "Setting up player settings...");
player addRating 99999;
enableSentences false;
showChat false;
[] call GW_client_fnc_initSetPlayerSettings;

// Initialize notification handler
[] spawn GW_client_fnc_notificationsHandler;

// Make sure database is up
INIT_STATUS(.1, "Waiting for database...");
if !(call GW_client_fnc_checkDatabaseConnection) exitWith {
    endMission "GW_DataError";
};

// Get player data from server
INIT_STATUS(.1, "Getting your player data...");
[[player], "GW_server_fnc_getPlayerData"] call GW_ext_fnc_networkCallServer;
waitUntil {missionNamespace getVariable ["GW_InitPlayer_PlayerDataReceived", false]};

// Init organizations, properties and factories.
// It is very important that initOrganisations
// is called first. If it is not called first
// it will not initialize and just return false
// which will result in this catch block catching an exception
if (playerSide isEqualTo civilian) then {
    try {
        // Initialize organizations
        INIT_STATUS(.1, "Setting up your organization(s)...");
        if !(call GW_client_fnc_organizationsInit) throw "Initializing organizations failed";

        // Initialize properties
        INIT_STATUS(.1, "Setting up your propertie(s)...");
        if !(call GW_client_fnc_propertyInitProperties) throw "Property init failed";

        // Initialize vehicle factory
        INIT_STATUS(.1, "Setting up vehicle factory...");
        if !(call GW_client_fnc_vehicleFactoryInit) throw "Vehicle factory init failed"
    } catch {
        [LOG_INFO, format ["Exception thrown in init (%1)", str _exception], _fnc_scriptName] call GW_server_fnc_log;
        endMission "GW_DataError";
        breakOut "main";
    };
} else {
    // Increment init time with .2 since no organizations or properties had to be initialized
    INIT_STATUS(.3, "Initializing Faction");
};

// Setup all eventhandlers
INIT_STATUS(.1, "Initializing Eventhandlers...");
[] call GW_client_fnc_initEventHandlers;
[] call GW_client_fnc_initPublicVariableEventHandlers;

// Setup actions
INIT_STATUS(.1, "Setting up actions...");
[] call GW_client_fnc_addActions;

INIT_STATUS(.1, "Setting up your player...");
[] call GW_client_fnc_playersSetupPlayer;
[] call GW_client_fnc_virtualInventoryInitPlayer;

INIT_STATUS(.1, "Finalizing client setup...");
[] call GW_server_fnc_scriptMonitor;
[player, ""] remoteExecCall ["GW_client_fnc_syncAnimation", 0];
{[_x] call GW_client_fnc_unitSetTextures} count allPlayers;

// Start Sync Handler
[true] call GW_client_fnc_playersSyncHandler;

// Sync request
[false] call GW_client_fnc_playerSyncRequest;

GW_startAntihack = true;

// Count time it took to initialize
_time = diag_Ticktime - _time;
[LOG_INFO, format [
    "Client init finished (took %1 seconds, %1 minutes after mission start).",
    _time,
    round (time / 60)
], _fnc_scriptName] call GW_server_fnc_log;

// Imprison into player if he/she logged out
// while in jail.
if (GW_player_jailTime > 0) then {
    try {
        [player, GW_player_jail, GW_player_jailTime, "Legacy Sentence"] call GW_client_fnc_jailSendToJail;
    } catch {
        [LOG_WARNING, format ["Exception thrown: %1", _exception], _fnc_scriptName] call GW_server_fnc_log;
    };
};
