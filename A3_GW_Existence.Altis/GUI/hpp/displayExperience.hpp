/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayExperience.hpp
 */

#define EXPERIENCE_WINDOW_H 20
#define EXPERIENCE_WINDOW_W 160
#define EXPERIENCE_POS_X (CENTER_X - (EXPERIENCE_WINDOW_W * 0.5) * GRID_W)
#define EXPERIENCE_POS_Y (0.415 - (EXPERIENCE_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define EXPERIENCE_STARTPOS_Y (EXPERIENCE_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define EXPERIENCE_STARTPOS_X (EXPERIENCE_POS_X + (1.5 * GRID_W))

class GW_displayExperience: GW_displayStandard {
    idd         = IDD_DISPLAYEXPERIENCE_DISPLAY;
    scriptName  = "GW_displayExperience";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayExperience'] call GW_client_fnc_initDisplay";
    class ControlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "My Experience";
            x    = EXPERIENCE_POS_X;
            y    = EXPERIENCE_POS_Y;
            w    = EXPERIENCE_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = EXPERIENCE_POS_X;
            y = EXPERIENCE_POS_Y + (SIZE_M * GRID_H);
            w = EXPERIENCE_WINDOW_W * GRID_W;
            h = (EXPERIENCE_WINDOW_H * GRID_H) - (SIZE_M * GRID_H) - ((SIZE_M + 2) * GRID_H);
        };
    };
    class Controls {
        class Categories: GW_ctrlXListbox {
            idc = IDC_DISPLAYEXPERIENCE_CATEGORIES;
            x   = EXPERIENCE_STARTPOS_X;
            y   = EXPERIENCE_STARTPOS_Y;
            w   = ((EXPERIENCE_WINDOW_W / 2) * GRID_W) - ((1.5 * GRID_W) * 4);
            h   = SIZE_M * GRID_H;
        };
        class LevelInfo: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYEXPERIENCE_LEVELINFOGROUP;
            x = EXPERIENCE_STARTPOS_X + ((((EXPERIENCE_WINDOW_W / 2) * GRID_W) - ((1.5 * GRID_W) * 2)));
            y = EXPERIENCE_STARTPOS_Y;
            w = ((EXPERIENCE_WINDOW_W / 2) * GRID_W) - (1.5 * GRID_W);
            h = SIZE_M * GRID_H;
            class Controls {
                class ProgressBackground: GW_ctrlStatic {
                    idc                 = 10;
                    x                   = 0;
                    y                   = 0;
                    w                   = ((EXPERIENCE_WINDOW_W / 2) * GRID_W) - ((1.5 * GRID_W) * 2);
                    h                   = SIZE_M * GRID_H;
                    colorBackground[]   = {0, 0, 0, 1};
                };
                class Progress: GW_ctrlProgress {
                    idc = IDC_DISPLAYEXPERIENCE_LEVELINFOGROUP_PROGRESS;
                    x   = 0;
                    y   = 0;
                    w   = ((EXPERIENCE_WINDOW_W / 2) * GRID_W) - ((1.5 * GRID_W) * 2);
                    h   = SIZE_M * GRID_H;
                };
                class ProgressText: GW_ctrlStatic {
                    idc   = IDC_DISPLAYEXPERIENCE_LEVELINFOGROUP_PROGRESSTEXT;
                    text  = "";
                    x     = 0;
                    y     = 0;
                    w     = ((EXPERIENCE_WINDOW_W / 2) * GRID_W) - ((1.5 * GRID_W) * 2);
                    h     = SIZE_M * GRID_H;
                    style = ST_CENTER;
                };
            };
        };
        class ButtonClose: GW_ctrlButtonClose {
            x = EXPERIENCE_POS_X + (EXPERIENCE_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = EXPERIENCE_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
