#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_hudMeta.sqf
 *
 * Parameter(s):
 *     0: STRING - Event to do
 *     1: ARRAY  - Array with arguments
 */
#define SELF GW_hudMeta_script
#define VAR_TARGETINFO GW_guiHandleMeta_targetInfo

scriptName "GW_hudMeta_script: main";
scopeName "main";

if (!params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) throw "Param error";

switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlGroupHeader = _display displayCtrl IDC_META_GROUPHEADER;
        private _ctrlHeaderName = _display displayCtrl IDC_META_GROUPHEADER_NAME;
        private _ctrlHeaderSideColour = _ctrlGroupHeader controlsGroupCtrl IDC_META_GROUPHEADER_SIDECOLOUR;

        private _ctrlGroupContent = _display displayCtrl IDC_META_GROUPCONTENT;
        private _ctrlContentVehicleIcon = _display displayCtrl IDC_GROUPMETA_GROUPCONTENT_VEHICLEICON;
        private _ctrlContentVehicleType = _display displayCtrl IDC_GROUPMETA_GROUPCONTENT_VEHICLETYPE;
        private _ctrlContentSpeedText = _display displayCtrl IDC_GROUPMETA_GROUPCONTENT_SPEEDTEXT;
        private _ctrlContentDistanceText = _display displayCtrl IDC_GROUPMETA_GROUPCONTENT_DISTANCETEXT;
        private _ctrlContentGroupText = _display displayCtrl IDC_GROUPMETA_GROUPCONTENT_GROUPTEXT;

        VAR_TARGETINFO params [
            ["_target", objNull, [objNull]],
            ["_name", "", [""]],
            ["_group", "", [""]],
            ["_sideColour", [], [[]]],
            ["_speed", 0, [0]],
            ["_vehicleName", "", [""]],
            ["_vehicleIconPath", "", [""]],
            ["_distance", 0, [0]]
        ];

        _ctrlHeaderName ctrlSetText _name;
        _ctrlContentGroupText ctrlSetText _group;
        _ctrlHeaderSideColour ctrlSetBackgroundColor _sideColour;
        _ctrlContentVehicleIcon ctrlSetText _vehicleIconPath;
        _ctrlContentVehicleType ctrlSetText _vehicleName;
        _ctrlContentSpeedText ctrlSetText format ["%1 km/h", _speed];
        _ctrlContentDistanceText ctrlSetText format ["%1 km", (_distance / 1000) toFixed 0];
    };
    case "onUnload": {

    };
};