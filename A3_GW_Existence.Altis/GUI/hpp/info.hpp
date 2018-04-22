/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: info.hpp
 */

class GW_Info: GW_displayStandard {
    idd        = IDD_INFO_DISPLAY;
    scriptName = "GW_INFO";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_Info'] call GW_client_fnc_initDisplay";
    duration   = 10e10;
    class controlsBackground {};
    class controls {
        class Title: GW_ctrlStatic {
            idc            = IDC_INFO_TITLE;
            text           = "";
            x              = "safezoneX";
            y              = "0.881986 * safezoneH + safezoneY";
            w              = "safezoneW";
            h              = "0.0506 * safezoneH";
            font           = "RobotoCondensedBold";
            sizeEx         = TEXT_VERYBIG;
            style          = ST_RIGHT;
        };
        class Subtitle: TITLE {
            idc            = IDC_INFO_SUBTITLE;
            y              = "0.911941 * safezoneH + safezoneY";
            h              = "0.0418 * safezoneH";
            font           = "RobotoCondensed";
            sizeEx         = TEXT_NORMAL1;
        };
    };
};
