/* SimZor -- TODO: add header */
scriptName "GW_client_fnc_vehicleUnlock: main";
scopeName "main";

if !(params [["_vehicle", objNull, [objNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
    false breakOut "main";
};

private _hasKeys = [player, _vehicle] call GW_client_fnc_vehicleHasKeys;
private _handled = if (!isNull _vehicle && {round (_vehicle distance player) < 10} && {_hasKeys}) then {
    if ([_vehicle] call GW_client_fnc_vehicleLocked) then {
        [_vehicle, false] call GW_client_fnc_vehicleManipulateLock;
        ["Unlocked Vehicle", "Your vehicle is now unlocked and everyone can enter it."] call GW_client_fnc_addNotification
    } else {
        [_vehicle, true] call GW_client_fnc_vehicleManipulateLock;
        ["Locked Vehicle", "Your vehicle is now locked."] call GW_client_fnc_addNotification
    };
    true
} else {false};

_handled breakOut "main"