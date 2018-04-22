/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayPlayerSettings.hpp
*/

class GW_displayPlayerSettings: GW_displayStandard {
    idd        = IDD_DISPLAYPLAYERSETTINGS_DISPLAY;
    scriptName = "GW_displayPlayerSettings";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_displayPlayerSettings'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeaderMoving {
        	idc                = -1;
        	text               = "Player Settings"; // ToDo: Localize;
        	x                  = "0.38657 * safezoneW + safezoneX";
        	y                  = "0.379 * safezoneH + safezoneY";
        	w                  = "0.227875 * safezoneW";
        };
        class Background: GW_ctrlStaticBackground {
        	idc                = -1;
        	x                  = "0.386562 * safezoneW + safezoneX";
        	y                  = "0.397407 * safezoneH + safezoneY";
        	w                  = "0.227917 * safezoneW";
        	h                  = "0.223704 * safezoneH";
        };
        class TitleViewSettings: GW_ctrlStaticContent {
        	idc                = -1;
        	text               = "View Settings"; // ToDo: Localize;
        	x                  = "0.388624 * safezoneW + safezoneX";
        	y                  = "0.401 * safezoneH + safezoneY";
        	w                  = "0.223751 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class TitleHUD: TitleViewSettings {
            text               = "Heads Up Display"; // ToDo: Localize;
            y                  = "0.4868 * safezoneH + safezoneY";
        };
        class TitleInitSettings: TitleViewSettings {
            text               = "Init Settings"; // ToDo: Localize;
            y                  = "0.571556 * safezoneH + safezoneY";
        };
        class TitleViewDistance: GW_ctrlStatic {
        	idc                = -1;
        	text               = "View Distance"; // ToDo: Localize;
        	x                  = "0.388624 * safezoneW + safezoneX";
        	y                  = "0.4208 * safezoneH + safezoneY";
        	w                  = "0.0804375 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        	colorBackground[]  = COLOUR_EMPTY;
            style              = ST_RIGHT;
        };
        class TitleObjectDistance: TitleViewDistance {
        	text               = "Object Distance"; // ToDo: Localize;
        	y                  = "0.439815 * safezoneH + safezoneY";
        };
        class TitleSync: TitleViewDistance {
        	text               = "Sync Objects w/ View"; // ToDo: Localize;
        	x                  = "0.388542 * safezoneW + safezoneX";
        	y                  = "0.459259 * safezoneH + safezoneY";
        };
        class TitleShowPlayerTags: TitleViewDistance {
        	text               = "Show Playertags"; // ToDo: Localize;
        	y                  = "0.506481 * safezoneH + safezoneY";
        	w                  = "0.07425 * safezoneW";
        };
        class TitleEnableHexesInfo: TitleViewDistance {
        	text               = "Enable Hexagon Info"; // ToDo: Localize;
        	x                  = "0.388645 * safezoneW + safezoneX";
        	y                  = "0.545037 * safezoneH + safezoneY";
        	w                  = "0.07425 * safezoneW";
        };
        class TitleEnableHexagons: TitleViewDistance {
        	text               = "Enable Hexagons"; // ToDo: Localize;
        	x                  = "0.388542 * safezoneW + safezoneX";
        	y                  = "0.525926 * safezoneH + safezoneY";
        	w                  = "0.07425 * safezoneW";
        };
        class TitleStatusIcons: TitleViewDistance {
        	text               = "Show Status Icons"; // ToDo: Localize;
        	x                  = "0.476552 * safezoneW + safezoneX";
        	y                  = "0.506482 * safezoneH + safezoneY";
        	w                  = "0.0680626 * safezoneW";
        };
        class TitleShowDamage: TitleViewDistance {
        	text               = "Show Damage"; // ToDo: Localize;
        	x                  = "0.476595 * safezoneW + safezoneX";
        	y                  = "0.525926 * safezoneH + safezoneY";
        	w                  = "0.0680626 * safezoneW";
        };
        class TitleShowCash: TitleViewDistance {
        	text               = "Show Cash"; // ToDo: Localize;
        	x                  = "0.476595 * safezoneW + safezoneX";
        	y                  = "0.54537 * safezoneH + safezoneY";
        	w                  = "0.0680626 * safezoneW";
        };
        class TitleStreamUI: TitleViewDistance {
        	text               = "Stream UI"; // ToDo: Localize;
        	x                  = "0.558282 * safezoneW + safezoneX";
        	y                  = "0.50637 * safezoneH + safezoneY";
        	w                  = "0.0418545 * safezoneW";
        };
        class TitleEnableCinematicIntro: TitleViewDistance {
        	text               = "Enable Cinematic Intro"; // ToDo: Localize;
        	x                  = "0.388698 * safezoneW + safezoneX";
        	y                  = "0.590304 * safezoneH + safezoneY";
        	w                  = "0.0742498 * safezoneW";
        };
    };
    class Controls {
        class BUTTON_EXIT: GW_ctrlButtonCancel {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_BUTTONEXIT;
            x                   = "0.602593 * safezoneW + safezoneX";
            y                   = "0.379 * safezoneH + safezoneY";
            w                   = "0.0122185 * safezoneW";
            h                   = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class ViewDistanceSlider: GW_ctrlXSliderH {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_SLIDERVIEWDISTANCE;
            x                   = "0.469345 * safezoneW + safezoneX";
            y                   = "0.42037 * safezoneH + safezoneY";
            w                   = "0.104155 * safezoneW";
            h                   = "5 * (pixelH * pixelGrid * 0.50)";
            colorBackground[]   = {0, 0, 0, 0.5};
        };
        class ObjectDistanceSlider: ViewDistanceSlider {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_SLIDEROBJECTDISTANCE;
            y                   = "0.439815 * safezoneH + safezoneY";
        };
        class SyncViewCheckbox: GW_ctrlCheckboxSquare {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_SYNCOBJWVIEWCHECKBOX;
            x                   = "0.469271 * safezoneW + safezoneX";
            y                   = "0.459259 * safezoneH + safezoneY";
        };
        class ViewDistanceOutput: GW_ctrlEdit {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_VIEWDISTANCEOUTPUT;
            text                = ""; // ToDo: Localize;
            x                   = "0.573958 * safezoneW + safezoneX";
            y                   = "0.42037 * safezoneH + safezoneY";
            w                   = "0.0386668 * safezoneW";
            h                   = "5 * (pixelH * pixelGrid * 0.50)";
            colorBackground[]   = {0, 0, 0, 0.3};
        };
        class ObjectDistanceOutput: ViewDistanceOutput {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_OBJDISTANCEOUTPUT;
            text                = ""; // ToDo: Localize;
            y                   = "0.439815 * safezoneH + safezoneY";
        };
        class ShowPlayerTagsCheckbox: GW_ctrlCheckboxSquare {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_SHOWPLAYERTAGSCHECKBOX;
            x                   = "0.463606 * safezoneW + safezoneX";
            y                   = "0.506482 * safezoneH + safezoneY";
        };
        class EnableHexagonCheckbox: GW_ctrlCheckboxSquare {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_ENABLEHEXESCHECKBOX;
            x                   = "0.463542 * safezoneW + safezoneX";
            y                   = "0.525926 * safezoneH + safezoneY";
        };
        class EnableHexagonInfoCheckbox: GW_ctrlCheckboxSquare {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_ENABLEHEXINFOCHECKBOX;
            x                   = "0.463542 * safezoneW + safezoneX";
            y                   = "0.54537 * safezoneH + safezoneY";
        };
        class ShowStatusIconsCheckbox: GW_ctrlCheckboxSquare {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_SHOWSTATUSICONSCHECKBOX;
            x                   = "0.545473 * safezoneW + safezoneX";
            y                   = "0.506482 * safezoneH + safezoneY";
        };
        class ShowDamageCheckbox: GW_ctrlCheckboxSquare {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_SHOWDAMAGECHECKBOX;
            x                   = "0.545417 * safezoneW + safezoneX";
            y                   = "0.525593 * safezoneH + safezoneY";
        };
        class ShowCashCheckbox: GW_ctrlCheckboxSquare {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_SHOWCASHCHECKBOX;
            x                   = "0.545558 * safezoneW + safezoneX";
            y                   = "0.54537 * safezoneH + safezoneY";
        };
        class StreamUICheckbox: GW_ctrlCheckboxSquare {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_STREAMUICHECKBOX;
            x                   = "0.600542 * safezoneW + safezoneX";
            y                   = "0.506133 * safezoneH + safezoneY";
        };
        class CinematicIntroCheckbox: GW_ctrlCheckboxSquare {
            idc                 = IDC_DISPLAYPLAYERSETTINGS_CINEMATICINTROCHECKBOX;
            x                   = "0.463385 * safezoneW + safezoneX";
            y                   = "0.590778 * safezoneH + safezoneY";
        };
    };
};
