/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayIssueTicket.hpp
 */

#define TICKET_WINDOW_H 38
#define TICKET_WINDOW_W 130
#define TICKET_POS_X (CENTER_X - (TICKET_WINDOW_W * 0.5) * GRID_W)
#define TICKET_POS_Y (0.415 - (TICKET_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define TICKET_STARTPOS_Y (TICKET_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define TICKET_STARTPOS_X (TICKET_POS_X + (1.5 * GRID_W))

class GW_displayTicket: GW_displayStandard {
    idd         = IDD_DISPLAYTICKET_DISPLAY;
    scriptName  = "GW_displayTicket";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayTicket'] call GW_client_fnc_initDisplay";
    class ControlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "Issue a ticket"; // TODO: Localize
            x    = TICKET_POS_X;
            y    = TICKET_POS_Y;
            w    = TICKET_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = TICKET_POS_X;
            y = TICKET_POS_Y + (SIZE_M * GRID_H);
            w = TICKET_WINDOW_W * GRID_W;
            h = (TICKET_WINDOW_H * GRID_H) - (SIZE_M * GRID_H) - ((SIZE_M + 2) * GRID_H);
        };
        class Information: GW_ctrlStatic {
            text  = "Use the input box below to issue a ticket to the target. This person should be given 3 chances to pay this before being sent to jail. Min £500 and max £15000";
            x     = TICKET_STARTPOS_X;
            y     = TICKET_STARTPOS_Y;
            w     = (TICKET_WINDOW_W * GRID_W) - (1.5 * GRID_W);
            h     = (SIZE_M * GRID_H) * 3;
            style = ST_MULTI + ST_NO_RECT;
        };
    };
    class Controls {
        class Input: GW_ctrlEdit {
            idc  = IDC_DISPLAYTICKET_INPUT;
            x    = TICKET_STARTPOS_X;
            y    = TICKET_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + GAP_H;
            w    = (TICKET_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h    = SIZE_M * GRID_H;
        };
        class FooterGroup: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYTICKET_FOOTERGROUP;
            x   = TICKET_POS_X;
            y   = TICKET_POS_Y  + (TICKET_WINDOW_H * GRID_H) - ((SIZE_M + 2) * GRID_H);
            w   = TICKET_WINDOW_W * GRID_W;
            h   = (SIZE_M + 2) * GRID_H;
            class Controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = TICKET_WINDOW_W * GRID_W;
                    h = (SIZE_M + 2) * GRID_H;
                };
                class ButtonIssueTicket: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYTICKET_FOOTERGROUP_BUTTONISSUE;
                    text = "ISSUE TICKET";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (TICKET_WINDOW_W * GRID_W) * 0.3;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
        class ButtonCancel: GW_ctrlButtonClose {
            x = TICKET_POS_X + (TICKET_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = TICKET_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
