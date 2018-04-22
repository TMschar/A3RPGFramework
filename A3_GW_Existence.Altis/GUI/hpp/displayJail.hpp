/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayJail.hpp
 */

#define JAIL_WINDOW_H 35
#define JAIL_WINDOW_W 100
#define JAIL_POS_X (CENTER_X - (JAIL_WINDOW_W * 0.5) * GRID_W)
#define JAIL_POS_Y (0.415 - (JAIL_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define JAIL_STARTPOS_Y (JAIL_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define JAIL_STARTPOS_X (JAIL_POS_X + (1.5 * GRID_W))

class GW_displayJail: GW_displayStandard {
    idd         = IDD_DISPLAYJAIL_DISPLAY;
    scriptName  = "GW_displayJail";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayJail'] call GW_client_fnc_initDisplay";
    class ControlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "Send to Jail"; // TODO: Localize
            x    = JAIL_POS_X;
            y    = JAIL_POS_Y;
            w    = JAIL_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = JAIL_POS_X;
            y = JAIL_POS_Y + (SIZE_M * GRID_H);
            w = JAIL_WINDOW_W * GRID_W;
            h = (JAIL_WINDOW_H * GRID_H) - (SIZE_M * GRID_H) - ((SIZE_M + 2) * GRID_H);
        };
    };
    class Controls {
        class Information: GW_ctrlStatic {
            idc   = IDC_DISPLAYJAIL_INFORMATION;
            text  = "";
            x     = JAIL_STARTPOS_X;
            y     = JAIL_STARTPOS_Y;
            w     = (JAIL_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h     = SIZE_M * GRID_H;
        };
        class InputTime: GW_ctrlEdit {
            idc   = IDC_DISPLAYJAIL_INPUTTIME;
            x     = JAIL_STARTPOS_X;
            y     = JAIL_STARTPOS_Y + ((SIZE_M * GRID_H) + GAP_H);
            w     = (JAIL_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h     = SIZE_M * GRID_H;
        };
        class Selection: GW_ctrlCombo {
            idc  = IDC_DISPLAYJAIL_SELECTION;
            x    = JAIL_STARTPOS_X;
            y    = JAIL_STARTPOS_Y + (((SIZE_M * GRID_H) * 2) + (GAP_H * 2));
            w    = (JAIL_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h    = SIZE_M * GRID_H;
        };
        class FooterGroup: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYJAIL_FOOTERGROUP;
            x   = JAIL_POS_X;
            y   = JAIL_POS_Y  + (JAIL_WINDOW_H * GRID_H) - ((SIZE_M + 2) * GRID_H);
            w   = JAIL_WINDOW_W * GRID_W;
            h   = (SIZE_M + 2) * GRID_H;
            class Controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = JAIL_WINDOW_W * GRID_W;
                    h = (SIZE_M + 2) * GRID_H;
                };
                class ButtonSendToJail: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYJAIL_FOOTERGROUP_BUTTONSENDTOJAIL;
                    text = "SEND";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (JAIL_WINDOW_W * GRID_W) * 0.3;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
        class ButtonCancel: GW_ctrlButtonClose {
            x = JAIL_POS_X + (JAIL_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = JAIL_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
