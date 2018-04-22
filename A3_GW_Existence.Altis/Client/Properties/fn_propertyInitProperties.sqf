#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_propertyInitProperties.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        BOOLEAN - true if successfull, else false
*
*    Description:
*        Initializes properties for civilians (only client side)
*/
scriptName "GW_client_fnc_propertyInitProperties: main";
scopeName "main";

// Functionality only for civilians at this moment
if !(playerSide isEqualTo civilian) exitWith {true};

/**
*    Make sure organisations are already initialized before properties
*    Without organisations initiated, a organisation name will not be present
*    Organisation name is required by the property system, for setting up org. properties
*/
if !(missionNamespace getVariable ["GW_Organizations_Initiated", false]) exitWith {false};

/**
*   Initialize properties for player (sends request to server)
*   Send organisation name in order to setup org properties as well
*/
private _orgName = group player getVariable ["organizationName", ""];
[
    [
        player,
        _orgName
    ],
    "GW_server_fnc_propertyInitPlayer"
] call GW_ext_fnc_networkCallServer;

// Wait until property data from server has been returned
waitUntil {missionNamespace getVariable ["GW_InitPlayer_PropertyDataReceived", false]};

// Return
true