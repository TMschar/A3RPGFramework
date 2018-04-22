/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayKeys.hpp
*/

class GW_DISPLAYKEYS: GW_displayStandard {
    idd         = IDD_DISPLAYKEYS_DISPLAY;
    scriptName  = "GW_displayKeys";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayKeys'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class TILES: GW_RscTiles {};
        class HEADER: GW_ctrlStaticHeader {
            idc                = IDC_DISPLAYKEYS_HEADER;
            text               = "Vehicles"; // ToDo: Localize;
            x                  = "0.408216 * safezoneW + safezoneX";
            y                  = "0.313 * safezoneH + safezoneY";
            w                  = "0.184579 * safezoneW";
        };
        class BACKGROUND: GW_ctrlStaticBackground {
        	x                  = "0.408334 * safezoneW + safezoneX";
        	y                  = "0.331481 * safezoneH + safezoneY";
        	w                  = "0.184579 * safezoneW";
        	h                  = "0.329644 * safezoneH";
        };
        class FOOTER: GW_ctrlStaticFooter {
        	x                  = "0.408334 * safezoneW + safezoneX";
        	y                  = "0.660674 * safezoneH + safezoneY";
        	w                  = "0.184579 * safezoneW";
        };
        class LIST_FILTERBACKGROUND: GW_ctrlStatic {
            x                  = "0.41025 * safezoneW + safezoneX";
            y                  = "0.335 * safezoneH + safezoneY";
            w                  = "0.180449 * safezoneW";
            h                  = "5 * (pixelH * pixelGrid * 0.50)";
            colorBackground[]  = {0, 0, 0, 1};
        };
        class LIST_VEHICLESBACKGROUND: GW_ctrlStaticContent {
            x                  = "0.410417 * safezoneW + safezoneX";
            y                  = "0.353704 * safezoneH + safezoneY";
            w                  = "0.180449 * safezoneW";
            h                  = "0.303244 * safezoneH";
        };
    };
    class controls {
        class BUTTON_CLOSE: GW_ctrlButtonCancel {
            idc                = IDC_DISPLAYKEYS_BUTTONCLOSE;
        	x                  = "0.582292 * safezoneW + safezoneX";
        	y                  = "0.312963 * safezoneH + safezoneY";
        	w                  = "0.0105208 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class LIST_FILTER: GW_ctrlListNBox {
        	idc                = IDC_DISPLAYKEYS_LISTBOXFILTER;
        	x                  = "0.41025 * safezoneW + safezoneX";
        	y                  = "0.335 * safezoneH + safezoneY";
        	w                  = "0.180449 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
            disableOverflow    = 1;
            columns[]          = {0, 0.10, 0.49, 0.69};
            class Items {
                class VEHICLE_ICON {
                    text    = "";
                    value   = 0;
                };
                class VEHICLE_NAME: VEHICLE_ICON {
                    text    = "Vehicle Name";
                    value   = 0;
                };
                class VEHICLE_COLOUR: VEHICLE_NAME {
                    text    = "Colour";
                    value   = 0;
                };
                class VEHICLE_DISTANCE: VEHICLE_NAME {
                    text    = "Distance";
                    value   = 0;
                };
            };
        };
        class LIST_VEHICLES: GW_ctrlListNBox {
        	idc                = IDC_DISPLAYKEYS_LISTBOXVEHICLES;
        	x                  = "0.410417 * safezoneW + safezoneX";
        	y                  = "0.353704 * safezoneH + safezoneY";
        	w                  = "0.180449 * safezoneW";
        	h                  = "0.303244 * safezoneH";
            disableOverflow    = 1;
            columns[]          = {0, 0.10, 0.49, 0.69};
        };
        class BUTTON_COPY: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYKEYS_BUTTONCOPY;
        	text               = "COPY"; // ToDo: Localize;
            tooltip            = "Make a copy of the keys and give them to yourself. This does not revoke the keys for the player.";
        	x                  = "0.410261 * safezoneW + safezoneX";
        	y                  = "0.664889 * safezoneH + safezoneY";
        	w                  = "0.0593855 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class BUTTON_REVOKE: BUTTON_COPY {
            idc                = IDC_DISPLAYKEYS_BUTTONREVOKE;
        	text               = "REVOKE"; // ToDo: Localize;
            tooltip            = "Revoke access to the vehicle for the target player by removing the keys from him/her. This will not give yourself the keys.";
        	x                  = "0.470844 * safezoneW + safezoneX";
        };
        class BUTTON_MARKMAP: BUTTON_COPY {
            idc                = IDC_DISPLAYKEYS_BUTTONMARKMAP;
        	text               = "MAP"; // ToDo: Localize;
            tooltip            = "Automatically open map and mark the vehicle for yourself.";
        	x                  = "0.531261 * safezoneW + safezoneX";
        };
    };
};
