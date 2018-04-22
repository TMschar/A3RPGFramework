/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: hud.hpp
*/
#define HUD_STARTPOS_X (safezoneX + GAP_W)
#define HUD_STARTPOS_Y ((safezoneY + safezoneH) - GAP_H)
#define HUD_STATS_W 67
#define HUD_STATS_H 23
#define HUD_STATS_GAP_W (2 * GRID_W)
#define HUD_STATS_GAP_H (2 * GRID_H)
#define HUD_BACKGROUND {0.1, 0.1, 0.1, 0.9}
#define HUD_DIRECTIONBAR_W 100

class GW_HUD: GW_displayStandard {
    idd          = IDC_HUD_DISPLAY;
    duration     = 10e10;
    scriptName   = "GW_HUD";
    scriptPath   = "GUI";
    onLoad       = "[_this, 'GW_HUD'] call GW_client_fnc_initDisplay";
    class controlsBackground {};
    class controls {
        class DirectionGroup: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_HUD_DIRECTIONBAR;
            x   = CENTER_X - (HUD_DIRECTIONBAR_W * 0.5) * GRID_W;
            y   = safezoneY + (SIZE_M * GRID_H);
            w   = HUD_DIRECTIONBAR_W * GRID_W;
            h   = SIZE_M * GRID_H;
            class Controls {
                class CardinalPointLeft: GW_ctrlStatic {
                    idc               = 1;
                    x                 = 0;
                    y                 = 0;
                    w                 = SIZE_M * GRID_W;
                    h                 = SIZE_M * GRID_H;
                    style             = ST_CENTER;
                    colorBackground[] = HUD_BACKGROUND;
                };
                class CardinalPointRight: CardinalPointLeft {
                    idc = 3;
                    x   = (HUD_DIRECTIONBAR_W * GRID_W) - (SIZE_M * GRID_W);
                };
                class DirectionBar: CardinalPointLeft {
                    idc               = 2;
                    x                 = SIZE_M * GRID_W;
                    y                 = 0;
                    w                 = (HUD_DIRECTIONBAR_W * GRID_W) - ((SIZE_M * GRID_W) * 2);
                    colorBackground[] = {0.1, 0.1, 0.1, 0.5};
                    font              = FONT_ALT_BOLD;
                };
            };
        };
        class StatusIcons: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_HUD_STATUSICONS;
            x   = HUD_STARTPOS_X;
            y   = (HUD_STARTPOS_Y - (HUD_STATS_H * GRID_H)) - (HUD_STATS_GAP_H / 2) - (SIZE_XL * GRID_H) - (SIZE_XL * GRID_H) - (HUD_STATS_GAP_H / 2);
            w   = HUD_STATS_W * GRID_W;
            h   = SIZE_XL * GRID_H;
            class controls {
                class IconEarplugs: GW_ctrlButtonToolbar {
                    idc    = IDC_HUD_STATUSICONS_ICONEARPLUGS;
                    x      = 0;
                    y      = 0;
                    w      = SIZE_XL * GRID_W;
                    h      = SIZE_XL * GRID_H;
                    onLoad = "(_this select 0) ctrlSetText (GW_mission_root + 'gui\data\titles\hud\status\earplugs.paa')";
                    colorBackground[] = HUD_BACKGROUND;
                };
                class IconSeatbelt: GW_ctrlButtonToolbar {
                    idc    = IDC_HUD_STATUSICONS_ICONSEATBELT;
                    x      = (SIZE_XL * GRID_W) + GRID_W;
                    y      = 0;
                    w      = SIZE_XL * GRID_W;
                    h      = SIZE_XL * GRID_H;
                    onLoad = "(_this select 0) ctrlSetText (GW_mission_root + 'gui\data\titles\hud\status\seatbelt.paa')";
                    colorBackground[] = HUD_BACKGROUND;
                };
                class IconHandcuffs: GW_ctrlButtonToolbar {
                    idc    = IDC_HUD_STATUSICONS_ICONHANDCUFFS;
                    x      = ((SIZE_XL * GRID_W) + GRID_W) * 2;
                    y      = 0;
                    w      = SIZE_XL * GRID_W;
                    h      = SIZE_XL * GRID_H;
                    onLoad = "(_this select 0) ctrlSetText (GW_mission_root + 'gui\data\titles\hud\status\handcuffs.paa')";
                    colorBackground[] = HUD_BACKGROUND;
                };
                class IconsCommsSeized: GW_ctrlButtonToolbar {
                    idc    = IDC_HUD_STATUSICONS_ICONCOMMSSEIZED;
                    x      = ((SIZE_XL * GRID_W) + GRID_W) * 3;
                    y      = 0;
                    w      = SIZE_XL * GRID_W;
                    h      = SIZE_XL * GRID_H;
                    onLoad = "(_this select 0) ctrlSetText (GW_mission_root + 'gui\data\titles\hud\status\comms.paa')";
                    colorBackground[] = HUD_BACKGROUND;
                };
            };
        };
        class Money: GW_ctrlStatic {
            idc               = IDC_HUD_MONEY;
            font              = FONT_ALT_NORMAL;
            x                 = HUD_STARTPOS_X;
            y                 = (HUD_STARTPOS_Y - (HUD_STATS_H * GRID_H)) - (HUD_STATS_GAP_H / 2) - (SIZE_XL * GRID_H);
            w                 = HUD_STATS_W * GRID_W;
            h                 = SIZE_XL * GRID_H;
            colorBackground[] = HUD_BACKGROUND;
        };
        class StatsGroup: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_HUD_STATSGROUP;
            x   = HUD_STARTPOS_X;
            y   = HUD_STARTPOS_Y - (HUD_STATS_H * GRID_H);
            w   = HUD_STATS_W * GRID_W;
            h   = HUD_STATS_H * GRID_H;
            class controls {
                class Background: GW_ctrlStatic {
                    idc               = -1;
                    x                 = 0;
                    y                 = 0;
                    w                 = HUD_STATS_W * GRID_W;
                    h                 = HUD_STATS_H * GRID_H;
                    colorBackground[] = HUD_BACKGROUND;
                };
                class HungerIcon: GW_ctrlStaticPictureKeepAspect {
                    idc               = IDC_HUD_STATSGROUP_ICONHUNGER;
                    text              = "gui\data\titles\hud\status\hunger.paa";
                    x                 = HUD_STATS_GAP_W;
                    y                 = HUD_STATS_GAP_H;
                    w                 = SIZE_M * GRID_W;
                    h                 = SIZE_M * GRID_H;
                };
                class HungerProgressBackground: GW_ctrlStatic {
                    idc               = -1;
                    x                 = (HUD_STATS_GAP_W * 2) + (SIZE_M * GRID_W);
                    y                 = HUD_STATS_GAP_H + (((SIZE_M * GRID_H) / 2.5) / 2) + (0.38 * GRID_H);
                    w                 = (HUD_STATS_W * GRID_W) - (HUD_STATS_GAP_W * 4) - (SIZE_M * GRID_W);
                    h                 = ((SIZE_M * GRID_H) / 2.5);
                    colorBackground[] = {0.2, 0.2, 0.2, 1};
                };
                class HungerProgressStripes: GW_ctrlStaticBackgroundDisableTiles {
                    idc               = -1;
                    x                 = (HUD_STATS_GAP_W * 2) + (SIZE_M * GRID_W);
                    y                 = HUD_STATS_GAP_H + (((SIZE_M * GRID_H) / 2.5) / 2) + (0.38 * GRID_H);
                    w                 = (HUD_STATS_W * GRID_W) - (HUD_STATS_GAP_W * 4) - (SIZE_M * GRID_W);
                    h                 = ((SIZE_M * GRID_H) / 2.5);
                };
                class HungerProgress: GW_ctrlProgress {
                    idc               = IDC_HUD_STATSGROUP_HUNGERPROGRESS;
                    x                 = (HUD_STATS_GAP_W * 2) + (SIZE_M * GRID_W);
                    y                 = HUD_STATS_GAP_H + (((SIZE_M * GRID_H) / 2.5) / 2) + (0.38 * GRID_H);
                    w                 = (HUD_STATS_W * GRID_W) - (HUD_STATS_GAP_W * 4) - (SIZE_M * GRID_W);
                    h                 = ((SIZE_M * GRID_H) / 2.5);
                    colorBar[]        = {0.3, 0.3, 0.3, 1};
                    colorFrame[]      = {0, 0, 0, 0};
                };
                class ThirstIcon: GW_ctrlStaticPictureKeepAspect {
                    idc               = IDC_HUD_STATSGROUP_ICONTHIRST;
                    text              = "gui\data\titles\hud\status\thirst.paa";
                    x                 = HUD_STATS_GAP_W;
                    y                 = (HUD_STATS_GAP_H * 2) + ((SIZE_M * GRID_H) * 1);
                    w                 = SIZE_M * GRID_W;
                    h                 = SIZE_M * GRID_H;
                };
                class ThirstProgressBackground: GW_ctrlStatic {
                    idc               = -1;
                    x                 = (HUD_STATS_GAP_W * 2) + (SIZE_M * GRID_W);
                    y                 = (((HUD_STATS_GAP_H + (((SIZE_M * GRID_H) / 2.5) / 2)) + ((SIZE_M * GRID_H) / 2.5)) * 2) + (0.38 * GRID_H);
                    w                 = (HUD_STATS_W * GRID_W) - (HUD_STATS_GAP_W * 4) - (SIZE_M * GRID_W);
                    h                 = ((SIZE_M * GRID_H) / 2.5);
                    colorBackground[] = {0.2, 0.2, 0.2, 1};
                };
                class ThirstProgressStripes: GW_ctrlStaticBackgroundDisableTiles {
                    idc               = -1;
                    x                 = (HUD_STATS_GAP_W * 2) + (SIZE_M * GRID_W);
                    y                 = (((HUD_STATS_GAP_H + (((SIZE_M * GRID_H) / 2.5) / 2)) + ((SIZE_M * GRID_H) / 2.5)) * 2) + (0.38 * GRID_H);
                    w                 = (HUD_STATS_W * GRID_W) - (HUD_STATS_GAP_W * 4) - (SIZE_M * GRID_W);
                    h                 = ((SIZE_M * GRID_H) / 2.5);
                };
                class ThirstProgress: GW_ctrlProgress {
                    idc               = IDC_HUD_STATSGROUP_THIRSTPROGRESS;
                    x                 = (HUD_STATS_GAP_W * 2) + (SIZE_M * GRID_W);
                    y                 = (((HUD_STATS_GAP_H + (((SIZE_M * GRID_H) / 2.5) / 2)) + ((SIZE_M * GRID_H) / 2.5)) * 2) + (0.38 * GRID_H);
                    w                 = (HUD_STATS_W * GRID_W) - (HUD_STATS_GAP_W * 4) - (SIZE_M * GRID_W);
                    h                 = ((SIZE_M * GRID_H) / 2.5);
                    colorBar[]        = {0.3, 0.3, 0.3, 1};
                    colorFrame[]      = {0, 0, 0, 0};
                };
                class HealthIcon: GW_ctrlStaticPictureKeepAspect {
                    idc               = IDC_HUD_STATSGROUP_ICONDAMAGE;
                    text              = "gui\data\titles\hud\status\health.paa";
                    x                 = HUD_STATS_GAP_W;
                    y                 = (HUD_STATS_GAP_H * 3) + ((SIZE_M * GRID_H) * 2);
                    w                 = SIZE_M * GRID_W;
                    h                 = SIZE_M * GRID_H;
                };
                class HealthProgressBackground: GW_ctrlStatic {
                    idc               = -1;
                    x                 = (HUD_STATS_GAP_W * 2) + (SIZE_M * GRID_W);
                    y                 = ((HUD_STATS_GAP_H + (((SIZE_M * GRID_H) / 2.5) / 2)) + ((SIZE_M * GRID_H) / 2.5)) * 3 + ((SIZE_M * GRID_H) / 2.5) + (0.38 * GRID_H);
                    w                 = (HUD_STATS_W * GRID_W) - (HUD_STATS_GAP_W * 4) - (SIZE_M * GRID_W);
                    h                 = ((SIZE_M * GRID_H) / 2.5);
                    colorBackground[] = {0.2, 0.2, 0.2, 1};
                };
                class HealthProgressStripes: GW_ctrlStaticBackgroundDisableTiles {
                    idc               = -1;
                    x                 = (HUD_STATS_GAP_W * 2) + (SIZE_M * GRID_W);
                    y                 = ((HUD_STATS_GAP_H + (((SIZE_M * GRID_H) / 2.5) / 2)) + ((SIZE_M * GRID_H) / 2.5)) * 3 + ((SIZE_M * GRID_H) / 2.5) + (0.38 * GRID_H);
                    w                 = (HUD_STATS_W * GRID_W) - (HUD_STATS_GAP_W * 4) - (SIZE_M * GRID_W);
                    h                 = ((SIZE_M * GRID_H) / 2.5);
                };
                class HealthProgress: GW_ctrlProgress {
                    idc               = IDC_HUD_STATSGROUP_HEALTHPROGRESS;
                    x                 = (HUD_STATS_GAP_W * 2) + (SIZE_M * GRID_W);
                    y                 = ((HUD_STATS_GAP_H + (((SIZE_M * GRID_H) / 2.5) / 2)) + ((SIZE_M * GRID_H) / 2.5)) * 3 + ((SIZE_M * GRID_H) / 2.5) + (0.38 * GRID_H);
                    w                 = (HUD_STATS_W * GRID_W) - (HUD_STATS_GAP_W * 4) - (SIZE_M * GRID_W);
                    h                 = ((SIZE_M * GRID_H) / 2.5);
                    colorBar[]        = {0.3, 0.3, 0.3, 1};
                    colorFrame[]      = {0, 0, 0, 0};
                };
            };
        };
    };
};