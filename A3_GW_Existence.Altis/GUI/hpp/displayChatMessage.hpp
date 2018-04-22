/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: displayChatMessage.hpp
*/

#define CHATMESSAGE_WINDOW_W 140
#define CHATMESSAGE_POS_X (CENTER_X - (CHATMESSAGE_WINDOW_W * 0.5) * GRID_W)
#define CHATMESSAGE_POS_Y ((safezoneY + safezoneH) - ((SIZE_M * GRID_H) + ((SIZE_M + 2) * GRID_H) + ((SIZE_M + 2) * GRID_H)) - 2 * GRID_H)

class GW_displayChatMessage: GW_displayStandard {
    idd          = 1231;
    enableMoving = false;
    scriptName   = "GW_displayChatMessage";
    scriptPath   = "GUI";
    onLoad       = "[_this, 'GW_displayChatMessage'] call GW_client_fnc_initDisplay";
    class controlsBackground {};
    class controls {
        class MessageTitle: GW_ctrlStatic {
            idc               = -1;
            text              = "New Global Message";
            x                 = CHATMESSAGE_POS_X;
            y                 = CHATMESSAGE_POS_Y;
            w                 = CHATMESSAGE_WINDOW_W * GRID_W;
            h                 = SIZE_M * GRID_H;
            colorBackground[] = {0.15, 0.15, 0.15, 1};
        };
        class SendIcon: GW_ctrlButtonToolbar {
            idc                       = -1;
            x                         = CHATMESSAGE_POS_X;
            y                         = CHATMESSAGE_POS_Y + (SIZE_M * GRID_H);
            w                         = SIZE_M * GRID_W;
            h                         = SIZE_M * GRID_H;
            colorDisabled[]           = {1, 1, 1, 1};
            colorBackgroundDisabled[] = {0.1, 0.1, 0.1, 0.9};
            onLoad                    = "(_this select 0) ctrlEnable false; (_this select 0) ctrlSetText (GW_mission_root + 'GUI\data\displays\displayChatMessage\send.paa')";
        };
        class MessageEdit: GW_ctrlEditNoRect {
            idc               = 23;
            x                 = CHATMESSAGE_POS_X + (SIZE_M * GRID_W);
            y                 = CHATMESSAGE_POS_Y + (SIZE_M * GRID_H);
            w                 = (CHATMESSAGE_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            h                 = SIZE_M * GRID_H;
            colorBackground[] = {0.1, 0.1, 0.1, 0.9};
        };
        class ButtonCancel: GW_ctrlButtonClose {
            x = CHATMESSAGE_POS_X + (CHATMESSAGE_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = CHATMESSAGE_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};