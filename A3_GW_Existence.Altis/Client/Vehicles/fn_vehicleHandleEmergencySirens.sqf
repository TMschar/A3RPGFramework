/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleHandleEmergencySirens.sqf
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Enables or disables emergency sirens for a vehicle
*/
scriptName "GW_client_fnc_vehicleHandleEmergencySirens: main";
scopeName "main";

private _vehicle = objectParent player;
private _return = if (player call GW_client_fnc_vehicleUnitInVehicle
    && {_vehicle getVariable ["vehicle_government", false]}
    && {_vehicle isKindOf "Car"}
) then {
    if !(isNil "GW_onKeyDown_Sirens_scriptHandle") then {
        // Terminate script
        terminate GW_onKeyDown_Sirens_scriptHandle;
        GW_onKeyDown_Sirens_scriptHandle = nil;

        // Notify
        ["Sirens off", "You have turned off the vehicle sirens."] call GW_client_fnc_addNotification
    } else {
        GW_onKeyDown_Sirens_scriptHandle = [_vehicle] spawn {
            scriptName "GW_onKeyDown_Sirens: sirenLoop";
            scopeName "main";

            params [["_vehicle", objNull, [objNull]]];

            // Notify
            ["Sirens on", "You have turned on the vehicle sirens."] call GW_client_fnc_addNotification;

            // Keep sirens on
            while {local _vehicle && {!(isNull driver _vehicle)}} do {
                [_vehicle, "EmergencySiren"] remoteExecCall ["GW_client_fnc_say3D", 0];
                uiSleep 9.5
            }
        }
    };
    true
} else {
	false
};

_return