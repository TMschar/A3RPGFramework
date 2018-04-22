/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: hints.hpp
*/

class GW_Hints: GW_displayStandard {
    idd        = 191920;
    onLoad     = "uiNamespace setVariable ['GW_Hints', _this select 0]";
    duration   = 10e10;
    class controlsBackground {};
    class controls {};
};
