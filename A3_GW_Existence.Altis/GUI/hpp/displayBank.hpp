/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayBank.hpp
 */

#define BANK_WINDOW_H 40
#define BANK_WINDOW_W 130
#define BANK_POS_X (CENTER_X - (BANK_WINDOW_W * 0.5) * GRID_W)
#define BANK_POS_Y (0.415 - (BANK_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define BANK_STARTPOS_Y (BANK_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define BANK_STARTPOS_X (BANK_POS_X + (1.5 * GRID_W))

class GW_displayBank: GW_displayStandard {
    idd         = IDD_DISPLAYBANK_DISPLAY;
    scriptName  = "GW_displayBank";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayBank'] call GW_client_fnc_initDisplay";
    class ControlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "Personal Bank Account"; // TODO: Localize
            x    = BANK_POS_X;
            y    = BANK_POS_Y;
            w    = BANK_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = BANK_POS_X;
            y = BANK_POS_Y + (SIZE_M * GRID_H);
            w = BANK_WINDOW_W * GRID_W;
            h = (BANK_WINDOW_H * GRID_H) - (SIZE_M * GRID_H) - ((SIZE_M + 2) * GRID_H);
        };
        class TitleBank: GW_ctrlStatic {
            text = "Bank"; // TODO: Localize
            x    = BANK_STARTPOS_X;
            y    = BANK_STARTPOS_Y;
            w    = 10 * GRID_W;
            h    = SIZE_M * GRID_H;
            font = FONT_ALT_BOLD;
        };
        class TitleCash: TitleBank {
            text = "Cash"; // TODO: Localize
            y    = BANK_STARTPOS_Y + (SIZE_M * GRID_H) + GRID_H;
        };
    };
    class Controls {
        class Bank: GW_ctrlStatic {
            idc  = IDC_DISPLAYBANK_BANK;
            x    = BANK_STARTPOS_X + (10 * GRID_W) + GRID_W;
            y    = BANK_STARTPOS_Y;
            w    = (BANK_WINDOW_H * 0.7) * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Cash: GW_ctrlStatic {
            idc  = IDC_DISPLAYBANK_CASH;
            x    = BANK_STARTPOS_X + (10 * GRID_W) + GRID_W;
            y    = BANK_STARTPOS_Y + (SIZE_M * GRID_H) + GRID_H;
            w    = (BANK_WINDOW_H * 0.7) * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class ListPlayers: GW_ctrlCombo {
            idc  = IDC_DISPLAYBANK_LISTPLAYERS;
            x    = BANK_STARTPOS_X;
            y    = BANK_STARTPOS_Y + (((SIZE_M * GRID_H) + GRID_H) * 2);
            w    = (BANK_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h    = SIZE_M * GRID_H;
        };
        class Input: GW_ctrlEdit {
            idc  = IDC_DISPLAYBANK_INPUT;
            x    = BANK_STARTPOS_X;
            y    = BANK_STARTPOS_Y + (((SIZE_M * GRID_H) + GRID_H) * 2) + (SIZE_M * GRID_H) + GRID_H;
            w    = (BANK_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h    = SIZE_M * GRID_H;
        };
        class FooterGroup: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYBANK_FOOTERGROUP;
            x   = BANK_POS_X;
            y   = BANK_POS_Y  + (BANK_WINDOW_H * GRID_H) - ((SIZE_M + 2) * GRID_H);
            w   = BANK_WINDOW_W * GRID_W;
            h   = (SIZE_M + 2) * GRID_H;
            class Controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = BANK_WINDOW_W * GRID_W;
                    h = (SIZE_M + 2) * GRID_H;
                };
                class ButtonDepositAll: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYBANK_BUTTONDEPOSITALL;
                    text = "$STR_GW_GUI_DISPLAYS_DISPLAYBANK_BUTTONDEPOSITALL";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (BANK_WINDOW_W * GRID_W) * 0.2;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonWithdraw: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYBANK_BUTTONWITHDRAW;
                    text = "$STR_GW_GUI_DISPLAYS_DISPLAYBANK_BUTTONWITHDRAW";
                    x    = GRID_W + ((((BANK_WINDOW_W * GRID_W) * 0.2) + GRID_W) * 1);
                    y    = GRID_H;
                    w    = (BANK_WINDOW_W * GRID_W) * 0.2;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonDeposit: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYBANK_BUTTONDEPOSIT;
                    text = "$STR_GW_GUI_DISPLAYS_DISPLAYBANK_BUTTONDEPOSIT";
                    x    = GRID_W + ((((BANK_WINDOW_W * GRID_W) * 0.2) + GRID_W) * 2);
                    y    = GRID_H;
                    w    = (BANK_WINDOW_W * GRID_W) * 0.2;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonTransfer: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYBANK_BUTTONTRANSFER;
                    text = "$STR_GW_GUI_DISPLAYS_DISPLAYBANK_TRANSFER";
                    x    = GRID_W + ((((BANK_WINDOW_W * GRID_W) * 0.2) + GRID_W) * 3);
                    y    = GRID_H;
                    w    = (BANK_WINDOW_W * GRID_W) * 0.2;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
        class ButtonCancel: GW_ctrlButtonClose {
            x = BANK_POS_X + (BANK_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = BANK_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
