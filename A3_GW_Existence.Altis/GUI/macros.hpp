/**
*    SimZor for SimZor Studios
*    This may not be used without SimZors permissions
*
*    Some snippets in this file may be derived from Bohemia Interactive game files.
*    Filename: macros.hpp
*/

/*======================================================================================*/
/* Positioning Macros                                                                   */
/*======================================================================================*/

#define PIXELSCALE 0.50
#define GRID_W (pixelW * pixelGrid * PIXELSCALE)
#define GRID_H (pixelH * pixelGrid * PIXELSCALE)

#define CENTER_X ((getResolution select 2) * 0.5 * pixelW)
#define CENTER_Y ((getResolution select 3) * 0.5 * pixelH)

#define SIZE_XXS 2
#define SIZE_XS	3.5
#define SIZE_S	4
#define SIZE_M	5
#define SIZE_L	5
#define SIZE_XL	6

#define GAP_H (1.5 * GRID_H)
#define GAP_W (1.5 * GRID_W)

#define FOOTER_EXTRA 2
#define TAB_H 1

/*======================================================================================*/
/* Control Type Macros                                                                  */
/*======================================================================================*/

#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_MENU             46 // Arma 3 (EDEN)
#define CT_MENU_STRIP       47 // Arma 3 (EDEN)
#define CT_CHECKBOX         77 // Arma 3
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_ANIMATED_USER    99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_ITEMSLOT         103

/*======================================================================================*/
/* Static Styles                                                                        */
/*======================================================================================*/
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c
#define ST_UPPERCASE      192

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144 // tileH and tileW params required for tiled image
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW             0x100
#define ST_NO_RECT            0x200 // This style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Progress Bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

/*======================================================================================*/
/* Slider Styles                                                                        */
/*======================================================================================*/

#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           1024
#define SL_TEXTURES       0x10

/*======================================================================================*/
/* Listbox Macros                                                                       */
/*======================================================================================*/

#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

/*======================================================================================*/
/* Colours                                                                              */
/*======================================================================================*/

#define COLOUR_MAINBACKGROUND           {0, 0, 0, 0.5}
#define COLOUR_HEADER                   {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "1"}
#define COLOUR_EMPTY                    {0, 0, 0, 0}
#define COLOUR_WHITE                    {1, 1, 1, 1}

#define COLOUR_PROGRESSBAR              {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "1"}
#define COLOUR_PROGRESSBAR_BACKGROUND   {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"}

#define COLOUR_AREABACKGROUND           {0.2,   0.2,   0.2,   1}
#define COLOUR_CONTENTTITLE             {0.05,  0.05,  0.05,  1}
#define COLOUR_CONTENTBACKGROUND        {0,     0,     0,     0.5}
#define COLOUR_INPUT                    {0,     0,     0,     0.4}
#define COLOUR_MAIN_PROFILENAMESPACE    {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"}

/*======================================================================================*/
/* Button Macros                                                                        */
/*======================================================================================*/

#define COLOUR_DEFAULTBUTTON            {0, 0, 0, 1}
#define COLOUR_DEFAULTBUTTONACTIVE      {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1}
#define COLOUR_DEFAULTBUTTONDISABLED    {0, 0, 0, 0.5}

#define COLOUR_CONTENTBUTTON            {0, 0, 0, 1}
#define COLOUR_CONTENTBUTTONACTIVE      {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1}
#define COLOUR_CONTENTBUTTONBLINK       {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1}
#define COLOUR_CONTENTBUTTONDISABLED    {0, 0, 0, 0.5}

#define TEXT_SIZE_CONTENTBUTTON         "0.018 * safezoneH"
#define SIZE_BLOCK_CONTENTBUTTON        "0.0198 * safezoneH"

/*======================================================================================*/
/* Fonts                                                                                */
/*======================================================================================*/
#define FONT_LIGHT      "PuristaLight"
#define FONT_HEAVY      "PuristaMedium"
#define FONT_BOLD       "PuristaBold"
#define FONT_ALT_LIGHT	"RobotoCondensedLight"
#define FONT_ALT_NORMAL "RobotoCondensed"
#define FONT_ALT_BOLD   "RobotoCondensedBold"
#define FontM           "Zeppelin32"

/*======================================================================================*/
/* Text Sizes                                                                           */
/*======================================================================================*/
#define TEXT_SMALL              "0.01 * safezoneH"
#define TEXT_SMALL1             "0.015 * safezoneH"
#define TEXT_SMALL2             "0.018 * safezoneH"
#define TEXT_NORMAL             "0.02 * safezoneH"
#define TEXT_NORMAL1            "0.025 * safezoneH"
#define TEXT_BIG                "0.03 * safezoneH"
#define TEXT_VERYBIG            "0.04 * safezoneH"

#define TEXT_SIZE_HEADER        "0.020 * safezoneH"
#define TEXT_SIZE_SUBHEADER     "0.018 * safezoneH"

#define TEXT_SIZE_TEXTBOX       "0.0175 * safezoneH"

// Block Sizes
#define SIZE_BLOCK_HEADER 0.033 * safezoneH
#define SIZE_BLOCK_HEADER2 0.022 * safezoneH
