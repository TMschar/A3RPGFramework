#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_warrantsQueryWarrants.sqf
 *
 * Description:
 *     Queries warrants from server
 */
scriptName "GW_server_fnc_warrantsQueryWarrants: main";
scopeName "main";

if !isRemoteExecuted exitWith {};

// Query
private _query = ["WARRANTS_SELECTWARRANTS", 2, []] call GW_db_fnc_queryDB;
[_query] remoteExecCall ["GW_client_fnc_arrestWarrantsReceive", remoteExecutedOwner];