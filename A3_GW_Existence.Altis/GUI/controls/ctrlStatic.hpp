/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: ctrlStatic.hpp
*/

class GW_ctrlStatic: GW_ctrlDefaultText {
    idc                     = -1;
    type                    = CT_STATIC;
    colorBackground[]       = {0, 0, 0, 0};
    text                    = "";
    lineSpacing             = 1;
    fixedWidth              = 0;
    colorText[]             = {1, 1, 1, 1};
    colorShadow[]           = {0, 0, 0, 1};
    moving                  = 0;
    autoplay                = 0;
    loops                   = 0;
    tileW                   = 1;
    tileH                   = 1;
    onCanDestroy            = "";
    onDestroy               = "";
    onMouseEnter            = "";
    onMouseExit             = "";
    onSetFocus              = "";
    onKillFocus             = "";
    onKeyDown               = "";
    onKeyUp                 = "";
    onMouseButtonDown       = "";
    onMouseButtonUp         = "";
    onMouseButtonClick      = "";
    onMouseButtonDblClick   = "";
    onMouseZChanged         = "";
    onMouseMoving           = "";
    onMouseHolding          = "";
    onVideoStopped          = "";
    shadow                  = 0;
};

class GW_ctrlStaticPicture: GW_ctrlStatic {
    style = ST_LEFT + ST_MULTI + ST_TITLE_BAR;
};

class GW_ctrlStaticPictureKeepAspect: GW_ctrlStaticPicture {
    style = "0x30 + 0x800";
};

class GW_ctrlStaticBackground: GW_ctrlStatic {
    colorBackground[] = {0.2, 0.2, 0.2, 1};
};

class GW_ctrlStaticFooter: GW_ctrlStatic {
    colorBackground[] = {0.15, 0.15, 0.15, 1};
    h                 = "(5 + 2) * (pixelH * pixelGrid * 0.50)";
};

class GW_ctrlStaticContent: GW_ctrlStatic {
    colorBackground[] = {0, 0, 0, 0.5};
};

class GW_ctrlStaticTitle: GW_ctrlStatic {
    colorText[]       = {1, 1, 1, 1};
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
        1
    };
    h                 = "0.022 * safezoneH";
};

class GW_ctrlStaticTitleMoving: GW_ctrlStaticTitle {
    moving = 1;
};

class GW_ctrlStaticHeader: GW_ctrlStatic {
    colorText[]       = {1, 1, 1, 1};
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
        1
    };
    h                 = "5 * (pixelH * pixelGrid * 0.50)";
};

class GW_ctrlStaticHeaderMoving: GW_ctrlStaticHeader {
    moving            = 1;
};

class GW_ctrlStaticPictureTile: GW_ctrlStatic {
    style = 144;
};

class GW_ctrlStaticBackgroundDisableTiles: GW_ctrlStaticPictureTile {
    x = -4;
    y = -2;
    w = 8;
    h = 4;
    text = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
    tileW = "8 / (32 * pixelW)";
    tileH = "4 / (32 * pixelH)";
    colorText[] = {1,1,1,0.05};
};