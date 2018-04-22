/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayMenu.hpp
*/

#define SIZE_XXXL 8

class GW_displayMenu: GW_displayStandard {
    idd         = IDD_DISPLAYMENU_DISPLAY;
    scriptName  = "GW_displayMenu";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayMenu'] call GW_client_fnc_initDisplay";
    class controlsbackground {
        class BackgroundFilter: GW_ctrlStatic {
            x                 = safezoneX;
            y                 = safezoneY;
            w                 = safezoneW;
            h                 = safezoneH;
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class Tiles: GW_RscTiles {};

        //////////////////////////////////////////////////////////////////////////////////////

        class Footer: GW_ctrlStatic {
            x                 = safezoneX;
            y                 = (safezoneY + safezoneH) - (SIZE_XXXL * GRID_H);
            w                 = safezoneW;
            h                 = SIZE_XXXL * GRID_H;
            colorBackground[] = {0, 0, 0, 0.9};
        };
        class Build: GW_ctrlStatic {
            text  = "GROUND WARS BETA";
            x     = safezoneX;
            y     = ((safezoneY + safezoneH) - (SIZE_XXXL * GRID_H)) + (((SIZE_XXXL * GRID_H) / 2) / 2);
            w     = safezoneW;
            h     = SIZE_M * GRID_H;
            style = ST_CENTER;
            font  = FONT_ALT_BOLD;
        };

        //////////////////////////////////////////////////////////////////////////////////////

        class TITLE_NAME: GW_ctrlStatic {
            text   = "Name:";
            style  = ST_RIGHT;
            x      = "0.304688 * safezoneW + safezoneX";
            y      = "0.242593 * safezoneH + safezoneY";
            w      = "0.0958854 * safezoneW";
            h      = "5 * (pixelH * pixelGrid * 0.50)";
            shadow = 1;
        };
        class TITLE_GROUP: TITLE_NAME {
            text = "Group:"; // ToDo: Localize;
            y    = "0.281134 * safezoneH + safezoneY";
        };
        class TITLE_SIDE: TITLE_NAME {
            text = "Side:"; // ToDo: Localize;
            y    = "0.262037 * safezoneH + safezoneY";
        };
        class TITLE_PLAYTIME: TITLE_NAME {
            text = "Playtime:"; // ToDo: Localize;
            x    = "0.501562 * safezoneW + safezoneX";
            y    = "0.242682 * safezoneH + safezoneY";
        };
        class TITLE_BANK: TITLE_PLAYTIME {
            text = "Bank:"; // ToDo: Localize;
            y    = "0.262037 * safezoneH + safezoneY";
        };
        class TITLE_CASH: TITLE_PLAYTIME {
            text = "Cash:"; // ToDo: Localize;
            y    = "0.281482 * safezoneH + safezoneY";
        };

        //////////////////////////////////////////////////////////////////////////////////////

        class BUTTON_1_BACKGROUND: GW_ctrlStaticPicture {
            idc  = -1;
            text = "gui\data\displays\displayMenu\texture.paa";
            x    = "0.304688 * safezoneW + safezoneX";
            y    = "0.304903 * safezoneH + safezoneY";
            w    = "0.0959089 * safezoneW";
            h    = "0.1474 * safezoneH";
        };
        class BUTTON_2_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.403125 * safezoneW + safezoneX";
            y = "0.304903 * safezoneH + safezoneY";
        };
        class BUTTON_3_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.501562 * safezoneW + safezoneX";
            y = "0.304903 * safezoneH + safezoneY";
        };
        class BUTTON_4_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.6 * safezoneW + safezoneX";
            y = "0.304903 * safezoneH + safezoneY";
        };
        class BUTTON_5_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.304688 * safezoneW + safezoneX";
            y = "0.456822 * safezoneH + safezoneY";
        };
        class BUTTON_6_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.403125 * safezoneW + safezoneX";
            y = "0.456822 * safezoneH + safezoneY";
        };
        class BUTTON_7_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.501562 * safezoneW + safezoneX";
            y = "0.456822 * safezoneH + safezoneY";
        };
        class BUTTON_8_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.6 * safezoneW + safezoneX";
            y = "0.456822 * safezoneH + safezoneY";
        };
        class BUTTON_9_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.304506 * safezoneW + safezoneX";
        	y = "0.608496 * safezoneH + safezoneY";
        };
        class BUTTON_10_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.403048 * safezoneW + safezoneX";
        	y = "0.608496 * safezoneH + safezoneY";
        };
        class BUTTON_11_BACKGROUND: BUTTON_1_BACKGROUND {
            x = "0.501371 * safezoneW + safezoneX";
        	y = "0.608496 * safezoneH + safezoneY";
        };
        class BUTTON_12_BACKGROUND: BUTTON_1_BACKGROUND {
            x  = "0.599797 * safezoneW + safezoneX";
        	y  = "0.608496 * safezoneH + safezoneY";
        };
    };
    class controls {
        class ButtonDisconnect: GW_ctrlButtonToolbar {
            idc    = IDC_DISPLAYMENU_BUTTONDISCONNECT;
            x      = safezoneX + (1 * GRID_W);
            y      = ((safezoneY + safezoneH) - (SIZE_XXXL * GRID_H)) + (((SIZE_XXXL * GRID_H) / 2) / 2);
            w      = (SIZE_XXXL * GRID_W) / 2;
            h      = (SIZE_XXXL * GRID_H) / 2;
            onLoad = "(_this select 0) ctrlSetText GW_Mission_Root + 'gui\data\displays\displayMenu\power.paa'";
        };
        class ButtonMyGroundWars: ButtonDisconnect {
            idc    = IDC_DISPLAYMENU_BUTTONMYGROUNDWARS;
            x      = (safezoneX + (1 * GRID_W)) + ((((SIZE_XXXL * GRID_W) / 2) + (1 * GRID_W)) * 1);
            onLoad = "(_this select 0) ctrlEnable false; (_this select 0) ctrlSetText GW_Mission_Root + 'gui\data\displays\common\g.paa'";
        };
        class ButtonRules: ButtonDisconnect {
            idc    = IDC_DISPLAYMENU_BUTTONRULES;
            x      = (safezoneX + (1 * GRID_W)) + ((((SIZE_XXXL * GRID_W) / 2) + (1 * GRID_W)) * 2);
            onLoad = "(_this select 0) ctrlEnable false; (_this select 0) ctrlSetText GW_Mission_Root + 'gui\data\displays\displayMenu\rules.paa'";
        };
        class ButtonDonate: ButtonDisconnect {
            idc    = IDC_DISPLAYMENU_BUTTONDONATE;
            x      = (safezoneX + (1 * GRID_W)) + ((((SIZE_XXXL * GRID_W) / 2) + (1 * GRID_W)) * 3);
            onLoad = "(_this select 0) ctrlEnable false; (_this select 0) ctrlSetText GW_Mission_Root + 'gui\data\displays\displayMenu\paypal.paa'";
        };

        //////////////////////////////////////////////////////////////////////////////////////

        class BUTTON_1: GW_ctrlShortcutButton {
            idc                      = IDC_DISPLAYMENU_BUTTON + 1;
            x                        = "0.304688 * safezoneW + safezoneX";
            y                        = "0.304903 * safezoneH + safezoneY";
            w                        = "0.0959089 * safezoneW";
            h                        = "0.1474 * safezoneH";
            colorBackground[]        = {0, 0, 0, 0.9};
        	colorBackground2[]       = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",0.4};
        	colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",0.4};
        	colorBackgroundActive[]  = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",0.4};
            onLoad                   = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Communication"",""gui\data\displays\displayMenu\communication.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
            class TextPos {
                left     = 0;
                top      = "0.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                right    = 0;
                bottom   = 0;
            };
        };
        class BUTTON_2: BUTTON_1 {
            idc    = IDC_DISPLAYMENU_BUTTON + 2;
            x      = 0.403125 * safezoneW + safezoneX;
            y      = 0.304903 * safezoneH + safezoneY;
            onLoad = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Organizations"",""gui\data\displays\displayMenu\organizations.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_3: BUTTON_1 {
            idc    = IDC_DISPLAYMENU_BUTTON + 3;
            x      = 0.501562 * safezoneW + safezoneX;
            y      = 0.304903 * safezoneH + safezoneY;
            onLoad = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Experience"",""gui\data\displays\displayMenu\experience.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_4: BUTTON_1 {
            idc                         = IDC_DISPLAYMENU_BUTTON + 4;
            x                           = 0.6 * safezoneW + safezoneX;
            y                           = 0.304903 * safezoneH + safezoneY;
            onLoad                      = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Vehicles"",""gui\data\displays\displayMenu\keychain.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_5: BUTTON_1 {
            idc                         = IDC_DISPLAYMENU_BUTTON + 5;
            x                           = 0.304688 * safezoneW + safezoneX;
            y                           = 0.456822 * safezoneH + safezoneY;
            onLoad                      = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Inventory"",""gui\data\displays\displayMenu\inventory.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_6: BUTTON_1 {
            idc                         = IDC_DISPLAYMENU_BUTTON + 6;
            x                           = 0.403125 * safezoneW + safezoneX;
            y                           = 0.456822 * safezoneH + safezoneY;
            onLoad                      = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Warrants"",""gui\data\displays\displayMenu\warrants.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_7: BUTTON_1 {
            idc                         = IDC_DISPLAYMENU_BUTTON + 7;
            x                           = 0.501562 * safezoneW + safezoneX;
            y                           = 0.456822 * safezoneH + safezoneY;
            onLoad                      = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Settlements"",""gui\data\displays\displayMenu\settlement.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_8: BUTTON_1 {
            idc                         = IDC_DISPLAYMENU_BUTTON + 8;
            x                           = 0.6 * safezoneW + safezoneX;
            y                           = 0.456822 * safezoneH + safezoneY;
            onLoad                      = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Jobs"",""gui\data\displays\displayMenu\jobs.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_9: BUTTON_1 {
        	idc                         = IDC_DISPLAYMENU_BUTTON + 9;
        	x                           = 0.304506 * safezoneW + safezoneX;
        	y                           = 0.608496 * safezoneH + safezoneY;
            onLoad                      = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Guide"",""gui\data\displays\displayMenu\guide.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_10: BUTTON_1 {
        	idc                         = IDC_DISPLAYMENU_BUTTON + 10;
        	x                           = 0.403048 * safezoneW + safezoneX;
        	y                           = 0.608496 * safezoneH + safezoneY;
            onLoad                      = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Player Settings"",""gui\data\displays\displayMenu\settings.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_11: BUTTON_1 {
        	idc                         = IDC_DISPLAYMENU_BUTTON + 11;
        	x                           = 0.501371 * safezoneW + safezoneX;
        	y                           = 0.608496 * safezoneH + safezoneY;
            onLoad                      = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Game Settings"",""gui\data\displays\displayMenu\game-settings.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class BUTTON_12: BUTTON_1 {
        	idc                         = IDC_DISPLAYMENU_BUTTON + 12;
        	x                           = 0.599797 * safezoneW + safezoneX;
        	y                           = 0.608496 * safezoneH + safezoneY;
            onLoad                      = "(_this select 0) ctrlSetStructuredText parsetext format [""<img size='%3' align='center' image='%2'/><br/><t align='center' size='%4' font='RobotoCondensedBold'>%1</t>"", toUpper ""Exit Menu"",""gui\data\displays\displayMenu\exit.paa"", (6 * 100) * (pixelH * pixelGrid * 0.50), (2 * 100) * (pixelH * pixelGrid * 0.50)]";
        };
        class VALUE_NAME: GW_ctrlStatic {
        	idc                        = IDC_DISPLAYMENU_NAME;
        	text                       = "SimZor"; // ToDo: Localize;
        	x                          = "0.400521 * safezoneW + safezoneX";
        	y                          = "0.242593 * safezoneH + safezoneY";
        	w                          = "0.0984584 * safezoneW";
        	h                          = "5 * (pixelH * pixelGrid * 0.50)";
            font                       = FONT_ALT_BOLD;
            shadow                     = 1;
        };
        class VALUE_GROUP: VALUE_NAME {
        	idc                        = IDC_DISPLAYMENU_GROUP;
        	text                       = "Military Police"; // ToDo: Localize;
        	y                          = "0.281363 * safezoneH + safezoneY";
        };
        class VALUE_SIDE: VALUE_NAME {
        	idc                        = IDC_DISPLAYMENU_SIDE;
        	text                       = "Blufor"; // ToDo: Localize;
        	y                          = "0.262037 * safezoneH + safezoneY";
        };
        class VALUE_PLAYTIME: VALUE_NAME {
        	idc                        = IDC_DISPLAYMENU_PLAYTIME;
        	text                       = "127 h"; // ToDo: Localize;
        	x                          = "0.597424 * safezoneW + safezoneX";
        	y                          = "0.242593 * safezoneH + safezoneY";
        };
        class VALUE_BANK: VALUE_PLAYTIME {
        	idc                        = IDC_DISPLAYMENU_BANK;
        	text                       = "£120.000"; // ToDo: Localize;
        	y                          = "0.262037 * safezoneH + safezoneY";
        };
        class VALUE_CASH: VALUE_PLAYTIME {
        	idc                        = IDC_DISPLAYMENU_CASH;
        	text                       = "£0"; // ToDo: Localize;
        	y                          = "0.281482 * safezoneH + safezoneY";
        };
    };
};
