#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: loading.sqf
 *
 * Parameter(s):
 *    0: STRING - Event
 *    1: ARRAY - Arguments
 */
scriptName "GW_cinematics_script: main";
scopeName "main";

disableSerialization;

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        [_args] spawn {
            disableSerialization;

            // Play Track
            private _track = ["LeadTrack01_F_Orange", "LeadTrack02_F_EPA"] select (worldName == "Altis");
            1 fadeMusic 0.5;
            playMusic _track;

            param [0, [], [[]]] params [["_display", displayNull, [displayNull]]];

            private _ctrlsGroup = _display displayCtrl 1;
            private _ctrlLogo = _ctrlsGroup controlsGroupCtrl 2;
            private _ctrlBackground = _ctrlsGroup controlsGroupCtrl 1;
            private _ctrlSplash = _ctrlsGroup controlsGroupCtrl 3;

            _ctrlLogo ctrlSetFade 1;
            _ctrlLogo ctrlCommit 0;
            waitUntil {time > 0};

            _ctrlLogo ctrlSetText GW_Mission_Root + "textures\splash\presents.paa";
            _ctrlLogo ctrlSetFade 0;
            _ctrlLogo ctrlCommit 3;
            waitUntil {ctrlCommitted _ctrlLogo};

            // Start camera
            private _camera = "camera" camCreate [7191.26, 7621.5, 101.72];
            showCinemaBorder true;
            _camera cameraEffect ["INTERNAL", "BACK"];
            _camera camSetTarget [7240.08, 7926.92, 0];
            _camera camCommit 0;

            uiSleep 5;

            _ctrlLogo ctrlSetFade 1;
            _ctrlLogo ctrlCommit 3;
            waitUntil {ctrlCommitted _ctrlLogo};

            _ctrlLogo ctrlSetText GW_Mission_Root + "textures\splash\groundwars.paa";
            _ctrlLogo ctrlSetFade 0;
            _ctrlLogo ctrlCommit 3;
            waitUntil {ctrlCommitted _ctrlLogo};

            uiSleep 3;

            _ctrlLogo ctrlSetFade 1;
            _ctrlLogo ctrlCommit 3;
            waitUntil {ctrlCommitted _ctrlLogo};

            _ctrlLogo ctrlSetText "\A3\Ui_f\data\Logos\arma3apex_white_ca.paa";
            _ctrlLogo ctrlSetFade 0;
            _ctrlLogo ctrlCommit 3;
            waitUntil {ctrlCommitted _ctrlLogo};

            uiSleep 3;

            _ctrlLogo ctrlSetFade 1;
            _ctrlLogo ctrlCommit 3;
            waitUntil {ctrlCommitted _ctrlLogo};

            uiSleep 2.5;

            _ctrlBackground ctrlSetFade 1;
            _ctrlBackground ctrlCommit 1.5;
            _ctrlSplash ctrlSetFade 1;
            _ctrlSplash ctrlCommit 1.5;

            ["GW_Info"] call GW_client_fnc_createResource;
            GW_Info_Title = "Ground Wars: Existence";
            GW_Info_Subtitle = "On Altis";

            // Square
            _camera camSetPos [7240.08, 7826.92, 30];
            _camera camCommit 8;
            waitUntil {camCommitted _camera};

            _ctrlBackground ctrlSetFade 0;
            _ctrlBackground ctrlCommit 1.5;
            waitUntil {ctrlCommitted _ctrlBackground};

            // Airfield Helicopters
            _camera camSetPos [7528.27, 9657.85, 99.1662];
            _camera camSetTarget [8033.94, 10312.9, 0.00144196];
            _camera camCommit 0;
            _ctrlBackground ctrlSetFade 1;
            _ctrlBackground ctrlCommit 3;
            _camera camSetPos [7923.68, 10309.6, 83.6326];
            _camera camCommit 8;

            GW_Info_Title = "A new framework";
            GW_Info_Subtitle = "A bold new experience!";

            // Airfield Jets
            waitUntil {camCommitted _camera};
            _ctrlBackground ctrlSetFade 0;
            _ctrlBackground ctrlCommit 1.5;
            waitUntil {ctrlCommitted _ctrlBackground};

            _camera camSetPos [8020.73, 10149.7, 22.5502];
            _camera camSetTarget [8118.31, 10210.2, 1.80156];
            _camera camCommit 0;
            _ctrlBackground ctrlSetFade 1;
            _ctrlBackground ctrlCommit 3;
            _camera camSetPos [8104.82, 10203.1, 4.25472];
            _camera camCommit 10;

            GW_Info_Title = "Exist";
            GW_Info_Subtitle = "Be who you want to be, do what you want to do.";

            // Capture Sector
            waitUntil {camCommitted _camera};
            _ctrlBackground ctrlSetFade 0;
            _ctrlBackground ctrlCommit 1.5;
            waitUntil {ctrlCommitted _ctrlBackground};

            _camera camSetPos [7324.27, 10611.1, 272.831];
            _camera camSetTarget [6088.56, 10765.2, 0.00193024];
            _camera camCommit 0;
            _ctrlBackground ctrlSetFade 1;
            _ctrlBackground ctrlCommit 3;
            _camera camSetPos [6199.94, 10754.3, 44.147];
            _camera camCommit 15;

            GW_Info_Title = "Experience something new";
            GW_Info_Subtitle = "Features, jobs, existence, we got it all!";

            waitUntil {camCommitted _camera};
            GW_Info_Title = "";
            GW_Info_Subtitle = "";

            _ctrlBackground ctrlSetFade 0;
            _ctrlBackground ctrlCommit 5;

            waitUntil {ctrlCommitted _ctrlBackground};
            GW_Info_Title = "THIS IS";
            uiSleep 0.8;
            GW_Info_Subtitle = "GROUND WARS: EXISTENCE";

            uiSleep 3;
            GW_Info_Title = "";
            GW_Info_Subtitle = "";

            GW_Info_Title = "WELCOME";
            uiSleep 0.8;
            GW_Info_Subtitle = profileName;

            5 fadeMusic 0;
            uiSleep 5;

            ["GW_Info"] call GW_client_fnc_destroyResource;
            GW_continue = true;

            [1, 1] call BIS_fnc_cinemaBorder;
        };
    };
    case "onUnload": {}
}
