/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: ctrlButtons.hpp
*/

class GW_ctrlDefaultButton0: GW_ctrlDefaultText {
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
};

class GW_ctrlDefaultButton: GW_ctrlDefaultButton0 {
    type						= CT_BUTTON;
    style 						= ST_CENTER;
    sizeEx 						= TEXT_SIZE_CONTENTBUTTON;
    colorBackground[] 			= COLOUR_DEFAULTBUTTON;
    colorBackgroundActive[] 	= COLOUR_DEFAULTBUTTONACTIVE;
    colorBackgroundDisabled[] 	= COLOUR_DEFAULTBUTTONDISABLED;
    font 						= FONT_LIGHT;
    h                 			= SIZE_BLOCK_CONTENTBUTTON;
    borderSize 					= 0;
    colorBorder[] 				= {0, 0, 0, 0};
    colorShadow[] 				= {0, 0, 0, 1};
    shadow						= 0;
    colorText[]					= {0.9, 0.9, 0.9, 1};
    colorDisabled[]	         	= {0.8, 0.8, 0.8, 1};
    colorFocused[] 				= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    offsetX 					= 0;
    offsetY 					= 0;
    offsetPressedX 				= pixelW;
    offsetPressedY 				= pixelH;
};

class GW_ctrlFloatButton: GW_ctrlDefaultButton0 {
    type						= CT_BUTTON;
    style 						= ST_CENTER;
    sizeEx 						= TEXT_SIZE_CONTENTBUTTON;
    colorBackground[] 			= {0, 0, 0, 1};
    colorBackgroundDisabled[] 	= {0, 0, 0, 0.5};
    colorBackgroundActive[] 	= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorFocused[] 				= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    font 						= FONT_LIGHT;
    h                 			= SIZE_BLOCK_CONTENTBUTTON;
    borderSize 					= 0;
    colorBorder[] 				= {0, 0, 0, 0};
    colorShadow[] 				= {0, 0, 0, 1};
    shadow						= 0;
    colorText[]					= {0.9, 0.9, 0.9, 1};
    colorDisabled[]	         	= {0.8, 0.8, 0.8, 1};
    offsetX 					= 0;
    offsetY 					= 0;
    offsetPressedX 				= pixelW;
    offsetPressedY 				= pixelH;
};

class GW_ctrlContentAreaButton: GW_ctrlDefaultButton {
    type						= CT_BUTTON;
    style 						= ST_CENTER;
    sizeEx 						= TEXT_SMALL2;
    colorBackground[] 			= COLOUR_CONTENTBUTTON;
    colorBackgroundActive[] 	= COLOUR_CONTENTBUTTONACTIVE;
    colorBackgroundDisabled[] 	= COLOUR_CONTENTBUTTONDISABLED;
    font 						= FONT_LIGHT;
    borderSize 					= 0;
    colorBorder[] 				= {0, 0, 0, 0};
    colorShadow[] 				= {0, 0, 0, 1};
    shadow						= 0;
    offsetX 					= 0;
    offsetY 					= 0;
    offsetPressedX 				= pixelW;
    offsetPressedY 				= pixelH;
};

class GW_ctrlContentAreaTexturedButton: GW_RscButtonMenu {
    animTextureDefault 			= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    animTextureDisabled 		= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    animTexturePressed 			= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    animTextureNormal 			= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    textureNoShortcut 			= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    animTextureFocused 			= "gui\data\displays\DISPLAYMenu\buttonTextureFocus.paa";
    animTextureOver 			= "gui\data\displays\DISPLAYMenu\buttonTextureFocus.paa";
    color2[] 					= {1, 1, 1, 0.5};
    color[] 					= {1, 1, 1, 1};
    colorBackground2[] 			= {1, 1, 1, 1};
    colorBackground[]			= {0.5, 0.5, 0.5, 1};
    colorBackgroundFocused[]	= {1, 1, 1, 1};
    colorDisabled[] 			= {1, 1, 1, 0.50};
    colorFocused[] 				= {1, 1, 1, 1};
    style 						= 2;
    tooltipColorBox[] 			= {0.5, 0.5, 0.5, 0.5};
    tooltipColorShade[] 		= {0.1, 0.1, 0.1, 0.1};
    tooltipColorText[] 			= {1, 1, 1, 1};
    class ShortcutPos {
        left 	= 0;
        top 	= 0;
        w 		= 0;
        h 		= 0;
    };
    class TextPos {
        left 	= "-0.30 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        top 	= "0.35 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        right 	= 0;
        bottom	= 0;
    };
};

class GW_ctrlButton: GW_ctrlDefaultButton {
    type = 1;
    style = "0x02 + 0xC0";
    colorBackground[] = {0, 0, 0, 1};
    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    font = FONT_LIGHT;
    text = "";
    colorText[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    borderSize = 0;
    colorBorder[] = {0,0,0,0};
    colorShadow[] = {0,0,0,0};
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = "pixelW";
    offsetPressedY = "pixelH";
    period = 0;
    periodFocus = 2;
    periodOver = 0.5;
    class KeyHints
    {
        class A
        {
            key = "0x00050000 + 0";
            hint = "KEY_XBOX_A";
        };
    };
    onCanDestroy = "";
    onDestroy = "";
    onMouseEnter = "";
    onMouseExit = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onButtonClick = "";
    onButtonDown = "";
    onButtonUp = "";
    h = "0.0198 * safezoneH";
};

class GW_ctrlButtonPictureKeepAspect: GW_ctrlButton {
    style = ST_CENTER + ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};

class GW_ctrlButtonToolbar: GW_ctrlButtonPictureKeepAspect {
    colorBackground[]           = {0, 0, 0, 0};
    colorBackgroundDisabled[]   = {0, 0, 0, 0};
    shadow                      = 0;
    colorShadow[]               = {0, 0, 0, 0};
};

class GW_ctrlButtonCancel: GW_ctrlButton {
    h                  = "0.022 * safezoneH";
    colorBackground[]  = COLOUR_EMPTY;
    text               = "X";
    tooltip            = "$STR_GW_GLOBAL_CLOSEMENU";
    offsetPressedX     = 0;
    offsetPressedY     = 0;
    onButtonClick      = "(ctrlParent (_this select 0)) closeDisplay 2";
};

class GW_ctrlButtonSearch: GW_ctrlButton {
    style       = "0x02 + 0x30 + 0x800";
    text        = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
    textSearch  = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
    tooltip     = "Reload Search";
    w           = "5 * (pixelW * pixelGrid * 	0.50)";
    h           = "5 * (pixelH * pixelGrid * 	0.50)";
};

class GW_ctrlButtonExpandAll: GW_ctrlButtonToolbar {
    style       = "0x02 + 0x30 + 0x800";
    text        = "\a3\3DEN\Data\Displays\Display3DEN\tree_expand_ca.paa";
    tooltip     = "Expand All";
    w           = "5 * (pixelW * pixelGrid * 0.50)";
    h           = "5 * (pixelH * pixelGrid * 0.50)";
};

class GW_ctrlButtonCollapseAll: GW_ctrlButtonToolbar {
    style       = "0x02 + 0x30 + 0x800";
    text        = "\a3\3DEN\Data\Displays\Display3DEN\tree_collapse_ca.paa";
    tooltip     = "Collapse All";
    w           = "5 * (pixelW * pixelGrid * 0.50)";
    h           = "5 * (pixelH * pixelGrid * 0.50)";
};

class GW_ctrlButtonClose: GW_ctrlButtonToolbar {
    idc            = -1;
    style          = "0x02 + 0x30 + 0x800";
    text           = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
    tooltip        = "Close Display";
    onButtonClick  = "(ctrlParent (_this select 0)) closeDisplay 2";
    offsetPressedX = 0;
    offsetPressedY = 0;
};

class GW_ctrlShortcutButton: GW_ctrlDefaultButton {
    type = 16;
    style = ST_UPPERCASE;
    colorBackground[] = {0,0,0,1};
    colorBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    text = "";
    size = "4.86 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
    shadow = 0;
    color[] = {1,1,1,1};
    color2[] = {1,1,1,1};
    colorFocused[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    period = 1;
    periodFocus = 1;
    periodOver = 0.5;
    shortcuts[] = {"0x00050000 + 0",28,57,156};
    textureNoShortcut = "#(argb,8,8,3)color(1,1,1,1)";
    class Attributes
    {
        align = "center";
        color = "#ffffff";
        font = "PuristaLight";
        shadow = 0;
    };
    class HitZone
    {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class TextPos
    {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class ShortcutPos
    {
        left = 0;
        top = 0;
        w = 0;
        h = 0;
    };
    onCanDestroy = "";
    onDestroy = "";
    onMouseEnter = "";
    onMouseExit = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onButtonClick = "";
    onButtonDown = "";
    onButtonUp = "";
};
