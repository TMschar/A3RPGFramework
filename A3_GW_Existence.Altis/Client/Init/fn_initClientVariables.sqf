#define NAMESCRIPT _fnc_scriptName
/**
 * Copyright (C) SimZor, SimZor Studios 2017
 * All Rights Reserved
 *
 * Filename: fn_initClientVariables.sqf
 */
scriptName "GW_client_fnc_initClientVariables: main";
scopeName "main";

GW_player_disableFire = false;
GW_player_3dPlayerIconsEnabled = false;
GW_startAntihack = false;

// GUI
GW_gui_defaultTextColour = [ "IGUI", "TEXT_RGB" ] call BIS_fnc_displayColorGet;

// Get root of mission
GW_mission_root = call
{
    private _missionConfigFileArray = toArray str missionConfigFile;
    _missionConfigFileArray resize (count _missionConfigFileArray - 15);
    toString _missionConfigFileArray
};
