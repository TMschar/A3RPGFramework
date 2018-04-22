#define CHAT_H 40
#define CHAT_W 90

class GW_Chat: GW_displayStandard {
    idd          = 121231;
    duration     = 10e10;
    scriptName   = "GW_chat";
    scriptPath   = "GUI";
    onLoad       = "[_this, 'GW_chat'] call GW_client_fnc_initDisplay";
    class ControlsBackground {};
    class Controls {
        class Chat: GW_ctrlControlsGroup {
            idc = 24;
            x   = (safezoneX + safezoneW) - (CHAT_W * GRID_W) - GAP_W;
            y   = (safezoneY + safezoneH) - (CHAT_H * GRID_H) - GAP_H;
            w   = CHAT_W * GRID_W;
            h   = CHAT_H * GRID_H;
            class Controls {
                class Background: GW_ctrlStatic {
                    idc               = 11;
                    x                 = 0;
                    y                 = 0;
                    w                 = CHAT_W * GRID_W;
                    h                 = CHAT_H * GRID_H;
                    colorBackground[] = {0, 0, 0, 0.3};
                };
                class StructuredText: GW_ctrlStructuredText {
                    idc               = 21;
                    text              = "";
                    x                 = 0;
                    y                 = 0;
                    w                 = CHAT_W * GRID_W;
                    h                 = CHAT_H * GRID_H;
                };
            };
        };
    };
};