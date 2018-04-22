/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: cinematics.hpp
 */

class GW_cinematics: GW_displayStandard {
    idd        = IDC_LOADING_DISPLAY;
    scriptName = "GW_cinematics";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_cinematics'] call GW_client_fnc_initDisplay";
    duration   = 10e10;
    blockEscape = 1;
    class controlsBackground {};
    class controls {
        class SPLASHGROUP: GW_ctrlControlsGroup {
            idc              = 1;
            x                = "0 * safezoneW + safezoneX";
            y                = "0 * safezoneH + safezoneY";
            w                = "1 * safezoneW";
            h                = "1 * safezoneH";
            class controls {
                class Black: GW_ctrlStatic {
                    idc                = 1;
                    x                  = "0 * safezoneW";
                    y                  = "0 * safezoneH";
                    w                  = "1 * safezoneW";
                    h                  = "1 * safezoneH";
                    colorBackground[]  = {0, 0, 0, 1};
                };
                class Noise: GW_ctrlStaticPictureKeepAspect {
                    idc                = 3;
                    text               = "\a3\ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
                    x                  = "0 * safezoneW";
                    y                  = "0 * safezoneH";
                    w                  = "1 * safezoneW";
                    h                  = "1 * safezoneH";
                };
                class Logo: GW_ctrlStaticPictureKeepAspect {
                    idc                = 2;
                    text               = "";
                    x                  = "0.25 * safezoneW";
                    y                  = "0.3125 * safezoneH";
                    w                  = "0.5 * safezoneW";
                    h                  = "0.25 * safezoneH";
                };
            };
        };
    };
};
