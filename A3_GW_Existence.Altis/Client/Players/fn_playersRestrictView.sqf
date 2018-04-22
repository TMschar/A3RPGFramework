#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playersRestrictView.sqf
 *
 * Description:
 *     Restricts player views
 */
scriptName "GW_client_fnc_playersRestrictView: main";
scopeName "main";

#define CAMERA_TEXTURE "\a3\3DEN\Data\Cfg3DEN\Camera\cameraTexture_ca.paa"
#define VIEW_CONFIG (missionConfigFile >> "CfgGroundWars" >> "View")
#define OBJECT_PARENT objectParent player

// Check if camera view is 3rd person
if (cameraView isEqualTo "EXTERNAL") then {
    // Allow 3rd person if player has no weapon equipped outside a vehicle
    if (getNumber (VIEW_CONFIG >> "allow3rdPersonWithoutAWeapon") isEqualTo 1 && {currentWeapon player isEqualTo ""} && {isNull OBJECT_PARENT}) then {
        breakOut "main"
    };

    // Allow 3rd person if player is in a vehicle as driver
    if (getNumber (VIEW_CONFIG >> "allow3rdPersonInVehicle") isEqualTo 1 && {!isNull OBJECT_PARENT} && {driver OBJECT_PARENT isEqualTo player}) then {
        breakout "main"
    };

    // Show warning hint
    [
        HINT_WARNING,
        "3rd Person Disabled",
        "You are playing on a first person view only server. If you would like to play with 3rd person view, you can switch to our other server.",
        CAMERA_TEXTURE
    ] call GW_client_fnc_notificationsAdd;

    // Switch back to 1st person
    vehicle player switchCamera "INTERNAL"
};

// Disable commander view
if (cameraView == "GROUP" && {getNumber (VIEW_CONFIG >> "disableGroupView") isEqualTo 1}) then {
    vehicle player switchCamera "INTERNAL";

    // Show warning hint
    [
        HINT_WARNING,
        "Group View Disabled",
        "This camera view is restricted on this server.",
        CAMERA_TEXTURE
    ] call GW_client_fnc_notificationsAdd
};
