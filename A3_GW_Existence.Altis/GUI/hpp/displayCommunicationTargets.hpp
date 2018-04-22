/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayCommunicationTargets.sqf
*/
class GW_DISPLAYCOMMUNICATIONTARGETS: GW_displayStandard {
    idd        = IDD_DISPLAYCOMMUNICATIONTARGETS_DISPLAY;
    scriptName = "GW_displayCommunicationTargets";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_displayCommunicationTargets'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class TILES: GW_RscTiles {};
        class HEADER: GW_ctrlStaticTitle {
            idc                = -1;
            text               = "Select a contact"; // ToDo: Localize;
            x                  = "0.427802 * safezoneW + safezoneX";
        	y                  = "0.225 * safezoneH + safezoneY";
        	w                  = "0.145426 * safezoneW";
        };
        class BACKGROUND: GW_ctrlStaticBackground {
            x                  = "0.427698 * safezoneW + safezoneX";
        	y                  = "0.248148 * safezoneH + safezoneY";
        	w                  = "0.145426 * safezoneW";
        	h                  = "0.528 * safezoneH";
        };
    };
    class controls {
        class BUTTON_CLOSE: GW_ctrlButtonCancel {
            idc                = IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONCLOSE;
            x                  = "0.559822 * safezoneW + safezoneX";
        	y                  = "0.225 * safezoneH + safezoneY";
        	w                  = "0.0123751 * safezoneW";
        };
        class TARGETS_SEARCH_INPUT: GW_ctrlEdit {
        	idc                = IDC_DISPLAYCOMMUNICATIONTARGETS_INPUTSEARCH;
            x                  = "0.429372 * safezoneW + safezoneX";
        	y                  = "0.25117 * safezoneH + safezoneY";
        	w                  = "0.130249 * safezoneW";
        	h                  = "0.0198 * safezoneH";
        	colorBackground[]  = COLOUR_INPUT;
        };
        class TARGETS_SEARCH_BUTTON_REFRESH: GW_ctrlButtonPictureKeepAspect {
            idc                = IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONREFRESH;
        	text               = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
            x                  = "0.55981 * safezoneW + safezoneX";
        	y                  = "0.251052 * safezoneH + safezoneY";
        	w                  = "0.0115501 * safezoneW";
        	h                  = "0.0198 * safezoneH";
        };
        class TARGETS_TREE: GW_ctrlTree {
        	idc                = IDC_DISPLAYCOMMUNICATIONTARGETS_TARGETSTREE;
            idcSearch          = IDC_DISPLAYCOMMUNICATIONTARGETS_INPUTSEARCH;
            x                  = "0.429261 * safezoneW + safezoneX";
        	y                  = "0.272444 * safezoneH + safezoneY";
        	w                  = "0.142051 * safezoneW";
        	h                  = "0.479252 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class BUTTON_CALL: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONCALL;
        	text               = "CALL";
            x                  = "0.502058 * safezoneW + safezoneX";
        	y                  = "0.753926 * safezoneH + safezoneY";
        	w                  = "0.0690937 * safezoneW";
        	colorBackground[]  = COLOUR_EMPTY;
        };
        class BUTTON_MESSAGE: BUTTON_CALL {
            idc                = IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONMESSAGE;
        	text               = "NEW MESSAGE";
            x                  = "0.429366 * safezoneW + safezoneX";
            w                  = "0.071677 * safezoneW";
        };
    };
};
