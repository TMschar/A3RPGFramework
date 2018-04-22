#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_organizationsDisbandFromPlayer.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        NOTHING
*
*    Description:
*        NO DESCRIPTION
*/
scriptName "GW_client_fnc_organizationsDisbandFromPlayer: main";
scopeName "main";

private _group = group player;

// Join new group
private _newGroup = createGroup civilian;
[player] joinSilent _newGroup;

// If old group is empty, delete it
if (units _group isEqualTo []) then {
    deleteGroup _group
};

[HINT_AMBER, "Organization Disbanded", "The organization you are a member of has successfully been disbanded."] call GW_client_fnc_notificationsAdd
