/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: displayProgress.hpp
*/

#define GAP_OTHER_WINDOW 17
#define PROGRESS_WINDOW_H 7
#define PROGRESS_WINDOW_W 140
#define PROGRESS_POS_X (CENTER_X - (PROGRESS_WINDOW_W * 0.5) * GRID_W)
#define PROGRESS_POS_Y ((safezoneY + safezoneH) - (GAP_OTHER_WINDOW * GRID_H) - (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H))

class GW_displayProgress: GW_displayStandard {
    idd        = IDD_DISPLAYPROGRESS_DISPLAY;
    scriptName = "GW_displayProgress";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_displayProgress'] call GW_client_fnc_initDisplay";
    class ControlsBackground {};
    class controls {
        class ProgressGroup: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYPROGRESS_CONTROLSGROUP;
            x   = PROGRESS_POS_X;
            y   = PROGRESS_POS_Y;
            w   = PROGRESS_WINDOW_W * GRID_W;
            h   = PROGRESS_WINDOW_H * GRID_H;
            class controls {
                class TextBackground: GW_ctrlStatic {
                    idc               = -1;
                    x                 = 0;
                    y                 = 0;
                    w                 = PROGRESS_WINDOW_W * GRID_W;
                    h                 = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    colorBackground[] = {0.15, 0.15, 0.15, 1};
                };
                class Text: GW_ctrlStructuredText {
                    idc               = IDC_DISPLAYPROGRESS_TEXT;
                    x                 = 0;
                    y                 = 0.5 * GRID_H;
                    w                 = PROGRESS_WINDOW_W * GRID_W;
                    h                 = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    class Attributes {
                        size = 1 * GRID_H;
                    };
                };
                class ProgressBackground: GW_ctrlStatic {
                    idc               = IDC_DISPLAYPROGRESS_PROGRESSBACKGROUND;
                    x                 = 0;
                    y                 = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    w                 = PROGRESS_WINDOW_W * GRID_W;
                    h                 = 2 * GRID_H;
                    colorBackground[] = {0.2, 0.2, 0.2, 0.9};
                };
                class ProgressBackgroundStriped: GW_ctrlStaticBackgroundDisableTiles {
                    idc               = -1;
                    x                 = 0;
                    y                 = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    w                 = PROGRESS_WINDOW_W * GRID_W;
                    h                 = 2 * GRID_H;
                };
                class Progress: GW_ctrlProgress {
                    idc               = IDC_DISPLAYPROGRESS_PROGRESS;
                    x                 = 0;
                    y                 = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    w                 = PROGRESS_WINDOW_W * GRID_W;
                    h                 = 2 * GRID_H;
                    colorBar[]        = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])",
                                         "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])",
                                         "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",
                                         "1"};
                    colorFrame[]      = {0, 0, 0, 0};
                    onLoad            = "(_this select 0) progressSetPosition 0.7";
                };
            };
        };
    };
};