/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: DISPLAYAdmin.hpp
*/

class GW_DISPLAYADMIN: GW_displayStandard {
    idd        = IDD_DISPLAYADMIN_DISPLAY;
    scriptName = "GW_DISPLAYAdmin";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_DISPLAYAdmin'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class MAP: GW_RscMapControl {
            idc = IDC_DISPLAYADMIN_MAP;
            x   = "safezoneXAbs";
            y   = "safezoneY";
            w   = "safezoneWAbs";
            h   = "safezoneH";
        };
    };
    class controls {
        class HEADER: GW_ctrlStatic {
            idc                = -1;
            text               = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TITLE";
            x                  = "safezoneX";
            y                  = "safezoneY";
            w                  = "safezoneW";
            h                  = "0.044 * safezoneH";
            colorBackground[]  = COLOUR_HEADER;
            style              = ST_CENTER;
        };
        class FOOTER: GW_ctrlStatic {
            idc                = -1;
            x                  = "safezoneX";
            y                  = "0.973 * safezoneH + safezoneY";
            w                  = "safezoneW";
            h                  = "0.0286 * safezoneH";
            colorBackground[]  = {0.15, 0.15, 0.15, 1};
        };
        class TOOLBAR: GW_RscControlsGroupNoScrollbars {
        	idc                = IDC_DISPLAYADMIN_TOOLBAR;
        	x                  = "safezoneX";
        	y                  = "0.044 * safezoneH + safezoneY";
        	w                  = "safezoneW";
        	h                  = "0.0272963 * safezoneH";
            class controls {
                class BACKGROUND: GW_ctrlStatic {
                    idc                = -1;
                    x                  = 0;
                    y                  = 0;
                    w                  = "safezoneW";
                    h                  = "safezoneH";
                    colorBackground[]  = {0.15, 0.15, 0.15, 1};
                };
                class BUTTON_EXIT: GW_ctrlButtonToolbar {
                    idc                = IDC_DISPLAYADMIN_TOOLBAR_BUTTONEXIT;
                    text               = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_EXIT";
                    x                  = "0.002 * safezoneW";
                    y                  = "0.00415 * safezoneH";
                    w                  = "0.0122963 * safezoneW";
                    h                  = "0.0189999 * safezoneH";
                };
                class BUTTON_WEATHER: BUTTON_EXIT {
                    idc                = IDC_DISPLAYADMIN_TOOLBAR_BUTTONWEATHER;
                    text               = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\intel_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_WEATHER";
                    x                  = "(0.0122963 + (0.002 * 2)) * safezoneW";
                };
                class BUTTON_DEVELOPER: BUTTON_EXIT {
                    idc                = IDC_DISPLAYADMIN_TOOLBAR_BUTTONDEVELOPER;
                    text               = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\findConfig_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_DEVCONSOLE";
                    x                  = "((0.0122963 * 2) + (0.002 * 3)) * safezoneW";
                };
                class BUTTON_CAMERA: BUTTON_EXIT {
                    idc                = IDC_DISPLAYADMIN_TOOLBAR_BUTTONCAMERA;
                    text               = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\moveCamera_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_CAMERA";
                    x                  = "((0.0122963 * 3) + (0.002 * 4)) * safezoneW";
                };
                class BUTTON_ARSENAL: BUTTON_EXIT {
                    idc                = IDC_DISPLAYADMIN_TOOLBAR_BUTTONARSENAL;
                    text               = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\arsenal_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_ARSENAL";
                    x                  = "((0.0122963 * 4) + (0.002 * 5)) * safezoneW";
                };
                class BUTTON_MAP: BUTTON_EXIT {
                    idc                = IDC_DISPLAYADMIN_TOOLBAR_BUTTONMAP;
                    text               = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\map_off_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_MAP";
                    x                  = "((0.0122963 * 5) + (0.002 * 6)) * safezoneW";
                };
                class BUTTON_MAPMARKERS: BUTTON_EXIT {
                    idc                = IDC_DISPLAYADMIN_TOOLBAR_BUTTONMAPMARKERS;
                    text               = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\map_off_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_MAPMARKERS";
                    x                  = "((0.0122963 * 6) + (0.002 * 7)) * safezoneW";
                };
                class BUTTON_REVIVEALL: BUTTON_EXIT {
                    idc                = IDC_DISPLAYADMIN_TOOLBAR_BUTTONREVIVEALL;
                    text               = "\a3\3DEN\Data\CfgWaypoints\support_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_REVIVEALL";
                    x                  = "((0.0122963 * 7) + (0.002 * 8)) * safezoneW";
                };
                class BUTTON_STAFFDUTY: BUTTON_EXIT {
                    idc                = IDC_DISPLAYADMIN_TOOLBAR_BUTTONSTAFFDUTY;
                    onLoad             = "_this param [0, controlNull, [controlNull]] ctrlSetText GW_MISSION_ROOT + 'GUI\data\displays\common\g.paa'";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_REVIVEALL";
                    x                  = "((0.0122963 * 8) + (0.002 * 9)) * safezoneW";
                };
            };
        };
        class LEFT_BAR: GW_ctrlStatic {
        	idc                = -1;
        	x                  = "safezoneX";
        	y                  = "0.0712963 * safezoneH + safezoneY";
        	w                  = "0.124791 * safezoneW";
        	h                  = "0.902 * safezoneH";
        	colorBackground[]  = COLOUR_AREABACKGROUND;
        };
        class PLAYER_TITLE: GW_ctrlStatic {
        	idc                = -1;
        	text               = "Players"; // ToDo: Localize;
        	x                  = "0.00195722 * safezoneW + safezoneX";
        	y                  = "0.0754 * safezoneH + safezoneY";
        	w                  = "0.120651 * safezoneW";
        	h                  = "0.022 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTTITLE;
        };
        class SEARCH_TREEPLAYERS_ICON_BACKGROUND: GW_ctrlStatic {
            idc                = -1;
            x                  = "0.00210892 * safezoneW + safezoneX";
        	y                  = "0.1014 * safezoneH + safezoneY";
        	w                  = "0.0144565 * safezoneW";
        	h                  = "0.022 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class SEARCH_TREEPLAYERS_ICON: GW_ctrlButtonPictureKeepAspect {
            idc                = -1;
            text               = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
            x                  = "0.00312502 * safezoneW + safezoneX";
        	y                  = "0.103704 * safezoneH + safezoneY";
            w                  = "0.0123941 * safezoneW";
        	h                  = "0.0186 * safezoneH";
        };
        class SEARCH_TREEPLAYERS: GW_RscEdit {
        	idc                = IDC_DISPLAYADMIN_SEARCHTREELISTUNITS;
            x                  = "0.0175526 * safezoneW + safezoneX";
            y                  = "0.1014 * safezoneH + safezoneY";
            w                  = "0.0897375 * safezoneW";
            h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class TREEPLAYERS_REFRESH_BACKGROUND: GW_ctrlStatic {
            idc               = -1;
            x                 = "0.108139 * safezoneW + safezoneX";
            y                 = "0.1018 * safezoneH + safezoneY";
            w                 = "0.0144565 * safezoneW";
            h                 = "0.022 * safezoneH";
            colorBackground[] = COLOUR_CONTENTBACKGROUND;
        };
        class SEARCH_TREEPLAYERS_REFRESH: GW_ctrlButtonToolbar {
            idc                = IDC_DISPLAYADMIN_SEARCHTREELISTUNITSREFRESHBUTTON;
            text               = "\a3\3DEN\Data\Cfg3DEN\History\rotateItems_ca.paa";
            x                  = "0.109375 * safezoneW + safezoneX";
            y                  = "0.103704 * safezoneH + safezoneY";
            w                  = "0.0123941 * safezoneW";
            h                  = "0.0186 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBUTTON;
        };
        class TREE_LISTPLAYERS: GW_ctrlTree {
        	idc                = IDC_DISPLAYADMIN_TREELISTUNITS;
            idcSearch          = IDC_DISPLAYADMIN_SEARCHTREELISTUNITS;
            x                  = "0.00208436 * safezoneW + safezoneX";
            y                  = "0.125356 * safezoneH + safezoneY";
            w                  = "0.12067 * safezoneW";
            h                  = "0.8448 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            sizeEx             = TEXT_SMALL2;
        };
        class RIGHT_BAR: GW_ctrlStatic {
        	idc                = -1;
        	x                  = "0.874329 * safezoneW + safezoneX";
        	y                  = "0.071 * safezoneH + safezoneY";
        	w                  = "0.125822 * safezoneW";
        	h                  = "0.902 * safezoneH";
        	colorBackground[]  = COLOUR_AREABACKGROUND;
        };
        class SELUNIT_NAME: GW_ctrlStatic {
        	idc                = IDC_DISPLAYADMIN_SELECTEDUNITNAME;
            text               = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_NOSELECTEDUNIT";
        	x                  = "0.877039 * safezoneW + safezoneX";
        	y                  = "0.0753481 * safezoneH + safezoneY";
        	w                  = "0.12067 * safezoneW";
        	h                  = "0.022 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTTITLE;
        };
        class UNIT_TOOLBAR: GW_RscControlsGroupNoScrollbars {
        	idc                = IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR;
        	x                  = "0.877039 * safezoneW + safezoneX";
        	y                  = "0.098607 * safezoneH + safezoneY";
        	w                  = "0.12067 * safezoneW";
        	h                  = "0.022 * safezoneH";
            class controls {
                class BACKGROUND: GW_ctrlStatic {
                    idc                = -1;
                    x                  = 0;
                    y                  = 0;
                    w                  = "safezoneW";
                    h                  = "safezoneH";
                    colorBackground[]  = COLOUR_CONTENTBACKGROUND;
                };
                class BUTTON_1: GW_ctrlButtonToolbar {
                    idc                = IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON1;
                    text               = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\moveCamera_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_SPECTATEUNIT";
                    x                  = "0.0015 * safezoneW";
                    y                  = "0.0015 * safezoneH";
                    w                  = "0.0112963  * safezoneW";
                    h                  = "0.0179999 * safezoneH";
                };
                class BUTTON_2: BUTTON_1 {
                    idc                = IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON2;
                    text               = "\A3\ui_f\data\GUI\Cfg\RespawnRoles\recon_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_KILLUNIT";
                    x                  = "(0.0108 + (0.0015 * 2)) * safezoneW";
                };
                class BUTTON_3: BUTTON_1 {
                    idc                = IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON3;
                    text               = "\A3\ui_f\data\Map\VehicleIcons\iconCar_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_MOVEINUNITSVEHICLE";
                    x                  = "((0.0108 * 2) + (0.0015 * 3)) * safezoneW";
                };
                class BUTTON_4: BUTTON_1 {
                    idc                = IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON4;
                    text               = "\a3\3DEN\Data\CfgWaypoints\guard_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_TOGGLEIMMUNE";
                    x                  = "((0.0108 * 3) + (0.0015 * 4)) * safezoneW";
                };
                class BUTTON_5: BUTTON_1 {
                    idc                = IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON5;
                    text               = "\a3\3DEN\Data\Attributes\default_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_TOGGLEINVISIBLE";
                    x                  = "((0.0108 * 4) + (0.0015 * 5)) * safezoneW";
                };
                class BUTTON_6: BUTTON_1 {
                    idc                = IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON6;
                    text               = "\A3\ui_f\data\Map\VehicleIcons\pictureHeal_ca.paa";
                    tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_TOOLTIP_HEALPLAYER";
                    x                  = "((0.0108 * 5) + (0.0015 * 6)) * safezoneW";
                };
            };
        };
        class PLAYER_INFORMATION: GW_RscStructuredText {
        	idc                = IDC_DISPLAYADMIN_SELECTEDPLAYERINFORMATION;
            x                  = "0.877039 * safezoneW + safezoneX";
        	y                  = "0.121296 * safezoneH + safezoneY";
        	w                  = "0.12067 * safezoneW";
        	h                  = "0.2354 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class SELECTED_VEHICLE_NAME: GW_ctrlStatic {
            idc                = IDC_DISPLAYADMIN_SELECTEDVEHICLENAME;
            x                  = "0.877039 * safezoneW + safezoneX";
            y                  = "0.359978 * safezoneH + safezoneY";
            w                  = "0.12067 * safezoneW";
            h                  = "0.022 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTTITLE;
        };
        class SELECTED_VEHICLE_ACTIONS: GW_RscListbox {
            idc                = IDC_DISPLAYADMIN_SELECTEDVEHICLEACTIONS;
            x                  = "0.877083 * safezoneW + safezoneX";
            y                  = "0.383333 * safezoneH + safezoneY";
            w                  = "0.12067 * safezoneW";
            h                  = "0.5862 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            sizeEx             = TEXT_SMALL2;
        };
        class FOOTER_MAPPOS_X_TITLE: GW_ctrlStaticPicture {
            idc                = -1;
            text               = "\a3\3DEN\Data\Displays\Display3DEN\StatusBar\x_ca.paa";
            x                  = "0.00168767 * safezoneW + safezoneX";
            y                  = "0.976852 * safezoneH + safezoneY";
            w                  = "0.0113438 * safezoneW";
            h                  = "0.0198 * safezoneH";
            sizeEx             = TEXT_SMALL1;
            shadow             = 0;
        };
        class FOOTER_MAPPOS_Y_TITLE: FOOTER_MAPPOS_X_TITLE {
            text               = "\a3\3DEN\Data\Displays\Display3DEN\StatusBar\y_ca.paa";
            x                  = "0.0572917 * safezoneW + safezoneX";
        };
        class FOOTER_MAPPOS_Z_TITLE: FOOTER_MAPPOS_X_TITLE {
            text               = "\a3\3DEN\Data\Displays\Display3DEN\StatusBar\z_ca.paa";
            x                  = "0.113021 * safezoneW + safezoneX";
        };
        class FOOTER_MAPPOS_GRID_TITLE: GW_ctrlStatic {
            idc                = -1;
            text               = "$STR_GW_GUI_DISPLAYS_DISPLAYADMIN_GRID";
            x                  = "0.16875 * safezoneW + safezoneX";
            y                  = "0.976852 * safezoneH + safezoneY";
            w                  = "0.0237192 * safezoneW";
            h                  = "0.0198 * safezoneH";
        };
        class FOOTER_MAPPOS_GRID: GW_RscEdit {
            idc                = IDC_DISPLAYADMIN_FOOTERMAPPOSGRID;
            text               = "";
            x                  = "0.19375 * safezoneW + safezoneX";
            w                  = "0.0422815 * safezoneW";
            y                  = "0.976852 * safezoneH + safezoneY";
            h                  = "0.0198 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            shadow             = 0;
            sizeEx             = TEXT_SMALL1;
        };
        class FOOTER_MAPPOS_X: GW_RscEdit {
            idc                = IDC_DISPLAYADMIN_FOOTERMAPPOSX;
            x                  = "0.0140837 * safezoneW + safezoneX";
            y                  = "0.976852 * safezoneH + safezoneY";
            w                  = "0.0422815 * safezoneW";
            h                  = "0.0198 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            sizeEx             = TEXT_SMALL1;
            shadow             = 0;
        };
        class FOOTER_MAPPOS_Y: FOOTER_MAPPOS_X {
            idc                = IDC_DISPLAYADMIN_FOOTERMAPPOSY;
            x                  = "0.0697917 * safezoneW + safezoneX";
        };
        class FOOTER_MAPPOS_Z: FOOTER_MAPPOS_X {
            idc                = IDC_DISPLAYADMIN_FOOTERMAPPOSZ;
            x                  = "0.125521 * safezoneW + safezoneX";
        };
        class FOOTER_VEHICLES_TITLE: GW_ctrlStaticPicture {
            idc                = -1;
            text               = "\A3\ui_f\data\Map\VehicleIcons\iconCar_ca.paa";
            x                  = "0.955857 * safezoneW + safezoneX";
            y                  = "0.976852 * safezoneH + safezoneY";
            w                  = "0.0113438 * safezoneW";
            h                  = "0.0198 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class FOOTER_PLAYERS_TITLE: FOOTER_VEHICLES_TITLE {
            text               = "\A3\ui_f\data\Map\VehicleIcons\iconMan_ca.paa";
            x                  = "0.912628 * safezoneW + safezoneX";
        };
        class FOOTER_PLAYERS_NUMBER: GW_ctrlStatic {
            idc                = IDC_DISPLAYADMIN_FOOTERPLAYERSNUMBER;
            x                  = "0.924799 * safezoneW + safezoneX";
            y                  = "0.976852 * safezoneH + safezoneY";
            w                  = "0.0299067 * safezoneW";
            h                  = "0.0198 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            sizeEx             = TEXT_SMALL1;
            shadow             = 0;
        };
        class FOOTER_VEHICLES_NUMBER: FOOTER_PLAYERS_NUMBER {
            idc                = IDC_DISPLAYADMIN_FOOTERVEHICLESNUMBER;
            x                  = "0.968285 * safezoneW + safezoneX";
        };
    };
};