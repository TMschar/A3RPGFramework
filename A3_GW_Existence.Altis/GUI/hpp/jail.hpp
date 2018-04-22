/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: hud.hpp
 */

#define JAIL_W 100
#define JAIL_H 19.5
#define JAIL_STARTPOS_X ((safezoneX + (safezoneW * 0.5)) - ((JAIL_W * 0.5) * GRID_W))
#define JAIL_STARTPOS_Y (((safezoneY + safezoneH) - GAP_H) - (JAIL_H * GRID_H))

class GW_Jail: GW_displayStandard {
    idd          = IDC_JAIL_DISPLAY;
    duration     = 10e10;
    scriptName   = "GW_Jail";
    scriptPath   = "GUI";
    onLoad       = "[_this, 'GW_Jail'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class Background: GW_ctrlStatic {
            x = JAIL_STARTPOS_X;
            y = JAIL_STARTPOS_Y;
            w = JAIL_W * GRID_W;
            h = JAIL_H * GRID_H;
            colorBackground[] = {0.1, 0.1, 0.1, 0.5};
        };
    };
    class controls {
        class Title: GW_ctrlStatic {
            idc         = IDC_JAIL_TITLE;
            text        = "";
            x           = JAIL_STARTPOS_X;
            y           = JAIL_STARTPOS_Y;
            w           = JAIL_W * GRID_W;
            h           = SIZE_M * GRID_H;
            font        = FONT_ALT_BOLD;
            style       = ST_CENTER;
            colorText[] = {0.8,0.01,0,1};
        };
        class Reason: GW_ctrlStatic {
            idc     = IDC_JAIL_REASON;
            text    = "";
            x       = JAIL_STARTPOS_X;
            y       = JAIL_STARTPOS_Y + ((SIZE_M * GRID_H) * 1) + (GAP_H * 1);
            w       = JAIL_W * GRID_W;
            h       = SIZE_M * GRID_H;
            style   = ST_CENTER;
        };
        class TimeLeft: GW_ctrlStatic {
            idc     = IDC_JAIL_TIMELEFT;
            text    = "";
            x       = JAIL_STARTPOS_X;
            y       = JAIL_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + (GAP_H * 2);
            w       = JAIL_W * GRID_W;
            h       = SIZE_M * GRID_H;
            style   = ST_CENTER;
        };
    };
};