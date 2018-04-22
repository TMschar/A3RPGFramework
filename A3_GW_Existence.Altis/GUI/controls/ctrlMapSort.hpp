/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayLicenses.hpp
*/
class GW_ctrlButtonMapSort: GW_ctrlButton {
    idc                = -1;
    text               = "PRESS TAB FOR SORT MENU";
    x                  = "0.870625 * safezoneW + safezoneX";
    y                  = "0.978326 * safezoneH + safezoneY";
    w                  = "0.127868 * safezoneW";
    h                  = SIZE_BLOCK_CONTENTBUTTON;
};

class GW_ctrlMapSort: GW_ctrlControlsGroupNoScrollbars {
    idc        = -1;
	x          = "safezoneX";
	y          = "safezoneY";
	w          = "safezoneW";
	h          = "safezoneH";
    class controls {
        class BACKGROUND: GW_ctrlStaticBackground {
        	idc                = 1;
        	x                  = "0.870625 * safezoneW";
        	y                  = "0.586726 * safezoneH";
        	w                  = "0.127868 * safezoneW";
        	h                  = "0.390326 * safezoneH";
        };
        class HEADER: GW_ctrlStaticTitle {
            idc                = 2;
            text               = "Map Sort";
            x                  = "0.870625 * safezoneW";
            y                  = "0.5638 * safezoneH";
            w                  = "0.127868 * safezoneW";
        };
        class SEARCHBUTTON_BACKGROUND: GW_ctrlStatic {
            idc                = 4;
        	x                  = "0.872282 * safezoneW";
        	y                  = "0.5902 * safezoneH";
        	w                  = "0.0123751 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class BUTTON_SEARCHREFRESH: GW_ctrlButtonPictureKeepAspect {
            idc                = 5;
        	text               = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
        	x                  = "0.873281 * safezoneW";
        	y                  = "0.591593 * safezoneH";
        	w                  = "0.0105209 * safezoneW";
        	h                  = "0.0188889 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBUTTON;
        };
        class INPUT_SEARCH: GW_ctrlEdit {
            idc                = 6;
        	x                  = "0.885625 * safezoneW";
        	y                  = "0.589852 * safezoneH";
        	w                  = "0.111893 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class TREE: GW_ctrlTree {
            idc                = 7;
            idcSearch          = 6;
        	x                  = "0.872396 * safezoneW";
        	y                  = "0.612963 * safezoneH";
        	w                  = "0.124781 * safezoneW";
        	h                  = "0.342852 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class BUTTON_FOCUSLOCATION: GW_ctrlButton {
            idc                = 8;
            text               = "FOCUS"; // ToDo: Localize;
            x                  = "0.872396 * safezoneW";
            y                  = "0.95683 * safezoneH";
            w                  = "0.0618749 * safezoneW";
            h                  = SIZE_BLOCK_CONTENTBUTTON;
        };
        class BUTTON_FOCUSONPLAYER: GW_ctrlButton {
            idc                = 9;
            text               = "PLAYER"; // ToDo: Localize;
            x                  = "0.934687 * safezoneW";
            y                  = "0.956555 * safezoneH";
            w                  = "0.0623958 * safezoneW";
            h                  = SIZE_BLOCK_CONTENTBUTTON;
        };
    };
};
