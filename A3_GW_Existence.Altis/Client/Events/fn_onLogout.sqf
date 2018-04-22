#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_onLogout.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        NOTHING
*
*    Description:
*        Logs out player
*/
scriptName "GW_client_fnc_onLogout: main";
scopeName "main";

// Show disconnect notice
GW_Info_Title = "Disconnecting";
GW_Info_Subtitle = "Sit back and relax, we're syncing you data...";
GW_Info_TitleColour = [0.92, 0.01, 0, 1];

"LOGOUT" cutText ["", "BLACK OUT", 3];
"LOGOUTSPLASH" cutRsc ["SPLASHNOISE", "PLAIN", 3];

"GW_Info" call GW_client_fnc_createResource;

disableUserInput true;
playMusic "EventTrack01_F_EPC";

// Close all displays and sync
false call GW_client_fnc_playerSyncRequest;
call GW_client_fnc_guiCloseAllDisplays;
"GW_HUD" call GW_client_fnc_destroyResource;

GW_onLogout_MusicEVHStart_Handle = addMusicEventHandler ["MusicStart", {
    0 spawn {
        0.5 fadeMusic 0.5;
        uiSleep 5;

        5 fadeMusic 0;
        uiSleep 5;

        GW_Info_Title = "Disconnected";
        GW_Info_Subtitle = "Your data was successfully synced.";
        GW_Info_TitleColour = [0.18, 0.69, 0, 1];

        uiSleep 0.5;

        [LOG_INFO, "DISCONNECTED", "GW_client_fnc_logout: musicStart handler"] call GW_server_fnc_log;
        removeAllMusicEventHandlers "MusicStart";

        disableUserInput false;
        endMission "GW_End";
    };
}];
