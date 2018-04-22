/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: hud.hpp
 */

#define META_W 100
#define META_H 80
#define META_STARTPOS_X (CENTER_X - (META_W * 0.5) * GRID_W)
#define META_STARTPOS_Y (safezoneY + ((SIZE_M * GRID_H) * 2) + (GAP_H * 2))

class GW_hudMeta: GW_displayStandard {
    idd          = IDC_META_DISPLAY;
    scriptName   = "GW_hudMeta";
    scriptPath   = "GUI";
    onLoad       = "[_this, 'GW_hudMeta'] call GW_client_fnc_initDisplay";
    duration     = 10e10;
    fadeIn       = 1;
    fadeOut      = 1;
    class controls {
        class Header: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_META_GROUPHEADER;
            x   = META_STARTPOS_X;
            y   = META_STARTPOS_Y;
            w   = META_W * GRID_W;
            h   = SIZE_M * GRID_H;
            class Controls {
                class Background: GW_ctrlStatic {
                    x                 = 0;
                    y                 = 0;
                    w                 = META_W * GRID_W;
                    h                 = SIZE_M * GRID_H;
                    colorBackground[] = {0.1, 0.1, 0.1, 0.9};
                };
                class SideColour: GW_ctrlStatic {
                    idc               = IDC_META_GROUPHEADER_SIDECOLOUR;
                    x                 = (SIZE_M * GRID_W / 2) / 2;
                    y                 = (SIZE_M * GRID_W / 2) / 2;
                    w                 = SIZE_M * GRID_W / 2;
                    h                 = SIZE_M * GRID_H / 2;
                    colorBackground[] = {0, 1, 0, 1};
                };
                class Title: GW_ctrlStatic {
                    idc   = IDC_META_GROUPHEADER_NAME;
                    x     = (GAP_W * 2) + (SIZE_M * GRID_W / 2);
                    y     = 0;
                    w     = (META_W * GRID_W) - (SIZE_M * GRID_W / 2) - (GAP_W * 2);
                    h     = SIZE_M * GRID_H;
                    style = ST_RIGHT;
                };
            };
        };
        class Content: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_META_GROUPCONTENT;
            x = META_STARTPOS_X;
            y = META_STARTPOS_Y + (SIZE_M * GRID_H);
            w = META_W * GRID_W;
            h = ((SIZE_M * GRID_H) * 4) + (GAP_H * 5);
            class Controls {
                class Background: GW_ctrlStatic {
                    x                 = 0;
                    y                 = 0;
                    w                 = META_W * GRID_W;
                    h                 = ((SIZE_M * GRID_H) * 4) + (GAP_H * 5);
                    colorBackground[] = {0.1, 0.1, 0.1, 0.5};
                };
                class VehicleIcon: GW_ctrlStaticPictureKeepAspect {
                    idc     = IDC_GROUPMETA_GROUPCONTENT_VEHICLEICON;
                    x       = GAP_W;
                    y       = GAP_H;
                    w       = SIZE_M * GRID_W;
                    h       = SIZE_M * GRID_H;
                };
                class VehicleType: GW_ctrlStatic {
                    idc     = IDC_GROUPMETA_GROUPCONTENT_VEHICLETYPE;
                    x       = (GAP_W * 2) + (SIZE_M * GRID_W);
                    y       = GAP_H;
                    w       = (META_W * GRID_W) - (SIZE_M * GRID_H) - (GAP_W * 2);
                    h       = SIZE_M * GRID_H;
                    style   = ST_RIGHT;
                };
                class SpeedIcon: GW_ctrlStaticPictureKeepAspect {
                    text    = "gui\data\titles\hud\meta\speed.paa";
                    x       = GAP_W;
                    y       = (GAP_H * 2) + (SIZE_M * GRID_H);
                    w       = SIZE_M * GRID_W;
                    h       = SIZE_M * GRID_H;
                };
                class SpeedText: GW_ctrlStatic {
                    idc     = IDC_GROUPMETA_GROUPCONTENT_SPEEDTEXT;
                    x       = (GAP_W * 2) + (SIZE_M * GRID_W);
                    y       = (GAP_H * 2) + (SIZE_M * GRID_H);
                    w       = (META_W * GRID_W) - (SIZE_M * GRID_H) - (GAP_W * 2);
                    h       = SIZE_M * GRID_H;
                    style   = ST_RIGHT;
                };
                class DistanceIcon: GW_ctrlStaticPictureKeepAspect {
                    text    = "gui\data\titles\hud\meta\distance.paa";
                    x       = GAP_W;
                    y       = (GAP_H * 3) + ((SIZE_M * GRID_H) * 2);
                    w       = SIZE_M * GRID_W;
                    h       = SIZE_M * GRID_H;
                };
                class DistanceText: GW_ctrlStatic {
                    idc     = IDC_GROUPMETA_GROUPCONTENT_DISTANCETEXT;
                    x       = (GAP_W * 2) + (SIZE_M * GRID_W);
                    y       = (GAP_H * 3) + ((SIZE_M * GRID_H) * 2);
                    w       = (META_W * GRID_W) - (SIZE_M * GRID_H) - (GAP_W * 2);
                    h       = SIZE_M * GRID_H;
                    style   = ST_RIGHT;
                };
                class GroupIcon: GW_ctrlStaticPictureKeepAspect {
                    text    = "gui\data\titles\hud\meta\group.paa";
                    x       = GAP_W;
                    y       = (GAP_H * 4) + ((SIZE_M * GRID_H) * 3);
                    w       = SIZE_M * GRID_W;
                    h       = SIZE_M * GRID_H;
                };
                class GroupText: GW_ctrlStatic {
                    idc     = IDC_GROUPMETA_GROUPCONTENT_GROUPTEXT;
                    x       = (GAP_W * 2) + (SIZE_M * GRID_W);
                    y       = (GAP_H * 4) + ((SIZE_M * GRID_H) * 3);
                    w       = (META_W * GRID_W) - (SIZE_M * GRID_H) - (GAP_W * 2);
                    h       = SIZE_M * GRID_H;
                    style   = ST_RIGHT;
                };
            };
        };
    };
};