/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: DISPLAYSpawns.hpp
*/

class GW_DISPLAYSPAWNS: GW_displayStandard {
    idd         = IDD_DISPLAYSPAWNS_DISPLAY;
    scriptName  = "GW_displaySpawns";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displaySpawns'] call GW_client_fnc_initDisplay";
    blockEscape = 1;
    class ControlsBackground {
        class LOCATIONS_HEADER: GW_ctrlStaticHeader {
        	text               = "$STR_GW_GUI_DISPLAYS_DISPLAYSPAWNS_AVAILABLESPAWNS";
        	x                  = "safezoneX";
        	y                  = "0.269 * safezoneH + safezoneY";
        	w                  = "0.118589 * safezoneW";
        };
        class SELSPAWN_HEADER: GW_ctrlStaticHeader {
        	text               = "$STR_GW_GUI_DISPLAYS_DISPLAYSPAWNS_MAP";
        	x                  = "0.845845 * safezoneW + safezoneX";
        	y                  = "0.269 * safezoneH + safezoneY";
        	w                  = "0.154674 * safezoneW";
        };
        class SELSPAWN_BACKGROUND: GW_ctrlStaticBackground {
        	x                  = "0.845945 * safezoneW + safezoneX";
        	y                  = "0.287963 * safezoneH + safezoneY";
        	w                  = "0.154164 * safezoneW";
        	h                  = "0.442192 * safezoneH";
        };
        class LOCATIONS_BACKGROUND: GW_ctrlStaticBackground {
        	x                  = "safezoneX";
        	y                  = "0.287519 * safezoneH + safezoneY";
        	w                  = "0.118589 * safezoneW";
        	h                  = "0.416718 * safezoneH";
        };
        class LOCATIONS_FOOTER: GW_ctrlStaticFooter {
        	x                  = safezoneX;
        	y                  = "0.704948 * safezoneH + safezoneY";
        	w                  = "0.118589 * safezoneW";
        };
        class SELSPAWN_NAME: GW_ctrlStatic {
        	text               = "Name:"; // ToDo: Localize;
            style              = ST_RIGHT;
        	x                  = "0.848021 * safezoneW + safezoneX";
        	y                  = "0.600274 * safezoneH + safezoneY";
        	w                  = "0.0433128 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class SELSPAWN_DESCRIPTION: SELSPAWN_NAME {
            text               = "Description:"; // ToDo: Localize;
            y                  = "0.619793 * safezoneH + safezoneY";
        };
    };
    class controls {
        class LOCATIONS_TREE: GW_ctrlTree {
        	idc                = IDC_DISPLAYSPAWNS_TREE;
        	x                  = "0.00217705 * safezoneW + safezoneX";
        	y                  = "0.313548 * safezoneH + safezoneY";
        	w                  = "0.114465 * safezoneW";
        	h                  = "0.387074 * safezoneH";
        	colorBackground[]  = {0, 0, 0, 0.5};
        };
        class LOCATIONS_SEARCHINPUT: GW_ctrlEdit {
        	idc                = IDC_DISPLAYSPAWNS_LOCATIONSSEARCHINPUT;
        	x                  = "0.00217705 * safezoneW + safezoneX";
        	y                  = "0.291348 * safezoneH + safezoneY";
        	w                  = "0.0804372 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class LOCATIONS_SEARCH_BUTTON: GW_ctrlButtonSearch {
        	idc                = IDC_DISPLAYSPAWNS_LOCATIONSSEARCHBUTTON;
        	x                  = "0.0833747 * safezoneW + safezoneX";
        	y                  = "0.291348 * safezoneH + safezoneY";
        };
        class LOCATIONS_EXPANDALL_BUTTON: GW_ctrlButtonExpandAll {
        	idc                = IDC_DISPLAYSPAWNS_LOCATIONSEXPANDALLBUTTON;
        	x                  = "0.0968917 * safezoneW + safezoneX";
        	y                  = "0.291667 * safezoneH + safezoneY";
        };
        class LOCATIONS_COLLAPSEALL_BUTTON: GW_ctrlButtonCollapseAll {
        	idc                = IDC_DISPLAYSPAWNS_LOCATIONSCOLLAPSEALLBUTTON;
        	x                  = "0.10625 * safezoneW + safezoneX";
        	y                  = "0.291667 * safezoneH + safezoneY";
        };
        class SELSPAWN_MAP: GW_ctrlMapMain {
            idc                = IDC_DISPLAYSPAWNS_MAP;
            x                  = "0.848054 * safezoneW + safezoneX";
            y                  = "0.291926 * safezoneH + safezoneY";
            w                  = "0.150029 * safezoneW";
            h                  = "0.305326 * safezoneH";
            colorBackground[]  = {0, 0, 0, 0.5};
        };
        class SELSPAWN_NAME: GW_ctrlStaticContent {
        	idc                = IDC_DISPLAYSPAWNS_SELSPAWNNAME;
        	text               = ""; // ToDo: Localize;
            style              = ST_LEFT;
        	x                  = "0.891667 * safezoneW + safezoneX";
        	y                  = "0.600348 * safezoneH + safezoneY";
        	w                  = "0.106217 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class SELSPAWN_DESCRIPTION_DESCRIPTION: SELSPAWN_NAME {
        	idc                = IDC_DISPLAYSPAWNS_SPAWNDESCRIPTION;
            style              = ST_MULTI;
        	y                  = "0.619793 * safezoneH + safezoneY";
        	h                  = "0.106518 * safezoneH";
        };
        class BUTTON_LOBBY: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYSPAWNS_BUTTONLOBBY;
        	text               = "LOBBY"; // ToDo: Localize;
        	x                  = "0.00135412 * safezoneW + safezoneX";
        	y                  = "0.708074 * safezoneH + safezoneY";
        	w                  = "0.0480419 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class BUTTON_SPAWN: BUTTON_LOBBY {
            idc                = IDC_DISPLAYSPAWNS_BUTTONSPAWN;
        	text               = "SPAWN"; // ToDo: Localize;
        	x                  = "0.0506457 * safezoneW + safezoneX";
        };
    };
};
