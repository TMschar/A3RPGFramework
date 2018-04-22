#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onDraw3D.sqf
 */
scriptName "GW_client_fnc_onDraw3D: main";
scopeName "main";

// Handle Nametags
if !(profileNamespace getVariable ["GW_disableHexagons", false]) then {
    [] call GW_client_fnc_pushbackNametags;
    [] call GW_client_fnc_drawNameTags;
};

// Draw 3D group tags
[] call GW_client_fnc_drawGroupTags;