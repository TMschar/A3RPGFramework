/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayGuide.hpp
*/

#define WINDOW_GUIDE_H 100
#define WINDOW_GUIDE_W 160

#define POS_X (CENTER_X - (WINDOW_GUIDE_W * 0.5) * GRID_W)
#define POS_Y (0.415 - (WINDOW_GUIDE_H * 0.5 - SIZE_M) * GRID_H)

#define FOOTER_EXTRA 2

#define CONTENT_STARTPOS_Y (POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define CONTENT_STARTPOS_X (POS_X + (1.5 * GRID_W))

#define GAP_H (1.5 * GRID_H)
#define GAP_W (1.5 * GRID_W)

class GW_displayGuide: GW_displayStandard {
    idd         = IDC_DISPLAYGUIDE_DISPLAY;
    scriptName  = "GW_displayGuide";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayGuide'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text                = "Players Guide";
            x                   = POS_X;
            y                   = POS_Y;
            w                   = WINDOW_GUIDE_W * GRID_W;
            h                   = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x                   = POS_X;
            y                   = POS_Y + (SIZE_M * GRID_H);
            w                   = WINDOW_GUIDE_W * GRID_W;
            h                   = (WINDOW_GUIDE_H * GRID_H) - (SIZE_M * GRID_H);
        };
        class Footer: GW_ctrlStaticFooter {
            x                   = POS_X;
            y                   = POS_Y + ((WINDOW_GUIDE_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w                   = WINDOW_GUIDE_W * GRID_W;
            h                   = (SIZE_M + FOOTER_EXTRA) * GRID_H;
        };
    };
    class controls {
        class Search: GW_ctrlEdit {
            idc                 = IDC_DISPLAYGUIDE_SEARCH;
            x                   = CONTENT_STARTPOS_X;
            y                   = CONTENT_STARTPOS_Y;
            w                   = (WINDOW_GUIDE_H / 2.5) * GRID_W;
            h                   = SIZE_M * GRID_H;
        };
        class ButtonSearch: GW_ctrlButtonSearch {
            idc                 = IDC_DISPLAYGUIDE_BUTTONSEARCH;
            x                   = CONTENT_STARTPOS_X + ((WINDOW_GUIDE_H / 2.5) * GRID_W) + (0.85 * GRID_W);
            y                   = CONTENT_STARTPOS_Y;
        };
        class ButtonExpandAll: GW_ctrlButtonExpandAll {
            idc                 = IDC_DISLAYGUIDE_BUTTONEXPANDALL;
            x                   = CONTENT_STARTPOS_X + ((WINDOW_GUIDE_H / 2.5) * GRID_W) + ((0.95 * 1.4) * GRID_W) + ((SIZE_M * 1) * GRID_W);
            y                   = CONTENT_STARTPOS_Y;
        };
        class ButtonCollapseAll: GW_ctrlButtonCollapseAll {
            idc                 = IDC_DISPLAYGUIDE_BUTTONCOLLAPSEALL;
            x                   = CONTENT_STARTPOS_X + ((WINDOW_GUIDE_H / 2.5) * GRID_W) + ((0.95 * 2) * GRID_W) + ((SIZE_M * 1.65) * GRID_W);
            y                   = CONTENT_STARTPOS_Y;
        };
        class Tree: GW_ctrlTree {
            idc                 = IDC_DISPLAYGUIDE_TREE;
            idcSearch           = IDC_DISPLAYGUIDE_SEARCH;
            x                   = CONTENT_STARTPOS_X;
            y                   = CONTENT_STARTPOS_Y + GAP_H + (SIZE_M * GRID_H);
            w                   = (WINDOW_GUIDE_W / 2.8) * GRID_W;
            h                   = (WINDOW_GUIDE_H * GRID_H) - ((SIZE_M * 3) * GRID_H);
            colorBackground[]   = COLOUR_CONTENTBACKGROUND;
        };
        class Content: GW_ctrlStructuredText {
            idc                 = IDC_DISPLAYGUIDE_CONTENT;
            x                   = CONTENT_STARTPOS_X + ((WINDOW_GUIDE_W / 2.8) * GRID_W) + GAP_W;
            y                   = CONTENT_STARTPOS_Y + GAP_H + (SIZE_M * GRID_H);
            w                   = (WINDOW_GUIDE_W * GRID_W) - ((WINDOW_GUIDE_W / 2.8) * GRID_W) - (GAP_W * 3);
            h                   = (WINDOW_GUIDE_H * GRID_H) - ((SIZE_M * 3) * GRID_H);
            colorBackground[]   = COLOUR_CONTENTBACKGROUND;
        };
        class ButtonClose: GW_ctrlButtonClose {
            x = POS_X + (WINDOW_GUIDE_W * GRID_W) - (SIZE_M * GRID_W);
            y = POS_Y;
            w = (SIZE_M * GRID_W);
            h = (SIZE_M * GRID_H);
        };
    };
};
