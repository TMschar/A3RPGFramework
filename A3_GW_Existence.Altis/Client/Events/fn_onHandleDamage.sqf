#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onHandleDamage.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit that got damaged
 *     1: STRING - Hit selection name
 *     2: NUMBER - Damage gained 0 - 1
 *     3: OBJECT - Object that caused the damage
 *     4: STRING - Projectile Classname
 *     5: NUMBER - Hit part index of the hit point, default = -1
 *     6: OBJECT - Instigator (Person who pulled the trigger or caused the damage)
 *     7: STRING - Hitpoint configname
 *
 * Returns:
 *     NUMBER
 *
 * Description:
 *     Function for handling damage
 */
scriptName "GW_client_fnc_onHandleDamage: main";
scopeName "main";

params [
    ["_unit", objNull, [objNull]],
    ["_hitSelection", "", [""]],
    ["_damage", 0, [0]],
    ["_source", objNull, [objNull]],
    ["_projectile", "", [""]],
    ["_hitPartIndex", 0, [0]],
    ["_instigator", objNull, [objNull]],
    ["_hitPoint", "", [""]],
    "_previousDamage"
];

_previousDamage = damage player;

// Handle vehicle deathmatch attempts
private _sourceVehicle = objectParent _source;
if (
    _sourceVehicle isKindOf "Car"
    || {_sourceVehicle isKindOf "Tank"}
    || {_sourceVehicle isKindOf "Air"}
    || {_sourceVehicle isKindOf "Boat"}
    || {_sourceVehicle isKindOf "Submarine"}
) then {
    if (
        !(_source isEqualTo _unit)
        && {!(_instigator isEqualTo _unit)}
        && {time - (missionNamespace getVariable ["GW_handleDamage_lastVDMAttempt", 0]) > 0}
    ) then {
        [LOG_AMBER, "Vehicle Deathmatch", format [
            "You were ran over by a vehicle.<br/><t font='RobotoCondensedBold'>%1:%2</t><br/>If you believe this was on purpose or if it continuous,"
            + " you can report the player to staff.",
            name vehicle _source,
            getPlayerUID vehicle _source
        ]] call GW_client_fnc_notificationsAdd;
        GW_handleDamage_lastVDMAttempt = time + 20
    };
    _damage = _previousDamage
};

// Handle Passenger-Seating
if (vehicle _source isKindOf "Car" || {vehicle _source isKindOf "Tank"} || {vehicle _source isKindOf "Air"} || {vehicle _source isKindOf "Boat"}) then {
    _damage = _previousDamage
};

// Handle Tasing
private _taserWeapons = getArray (missionConfigFile >> "CfgEquipment" >> "tasers");
private _taserProjectiles = getArray (missionConfigFile >> "CfgEquipment" >> "taserProjectiles");
private _taserDistance = getNumber (missionConfigFile >> "CfgEquipment" >> "taserDistance");
if (
    !isNull _source                                 &&
    {isNull objectParent _unit}                     &&
    {isPlayer _source}                              &&
    {side group _source isEqualTo west}             &&
    {currentWeapon _source in _taserWeapons}        &&
    {_projectile in _taserProjectiles}              &&
    {_source distance _unit <= _taserDistance}      &&
    {!(_unit getVariable ["restrained", false])}
) then {
    if !(isNull objectParent _unit) then {
        _unit action ["Eject", vehicle _unit];
    };

    if !(isNil "GW_onHandleDamage_TaserThread") then {
        terminate GW_onHandleDamage_TaserThread;
        GW_onHandleDamage_TaserThread = nil;
    };

    GW_onHandleDamage_TaserThread = [_unit, _instigator] spawn {
        scriptName "GW_client_fnc_onHandleDamage: handle tased";
        scopeName "main";

        params [["_unit", objNull, [objNull]], ["_instigator", objNull, [objNull]]];

        [HINT_AMBER, "Tased", format ["You were tased by %1", name _instigator]] call GW_client_fnc_notificationsAdd;
        [LOG_INFO, format ["Tased by %1:%2", name _instigator, getPlayerUID _instigator], "taserHandle"] call GW_server_fnc_log;

        // Tased
        [_unit, "acts_injuredlyingrifle02"] remoteExecCall ["GW_client_fnc_syncAnimation", 0];
        _unit setVariable ["tased", true, true];

        uiSleep 8;

        // No longer tased
        [_unit, ""] remoteExecCall ["GW_client_fnc_syncAnimation", 0];
        _unit setVariable ["tased", false, true];
    };

    _damage = _previousDamage;
};

if (!isNull objectParent _unit && {_unit getVariable ["seatbelt", false]}) then {
    _damage = [_damage / 2, _previousDamage] select (_damage / 2 < _previousDamage);
};

// Return damage
_damage;
