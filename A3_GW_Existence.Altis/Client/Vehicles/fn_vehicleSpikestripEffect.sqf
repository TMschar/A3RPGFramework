#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleSpikestripEffect.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to add effects on to
 *
 * Throws:
 *     Exception
 */
scriptName "GW_client_fnc_vehicleSpikestripEffect: main";
scopeName "main";

if (!params [ ["_vehicle", objNull, [objNull]] ]) throw "Expected parameters";
if (!local _vehicle) throw "Vehicle is not local";
if (!isRemoteExecuted) throw "Function was not remotely executed";
if (isNull _vehicle) throw "Vehicle is NULL";

// Add effects
_vehicle setHitPointDamage ["HitLFWheel", 1];
_vehicle setHitPointDamage ["HITLRWheel", 1];

// Notify
[HINT_WARNING, "Vehicle Notice", "Both your front wheels has been taken out due to being hit by a spikestrip."] call GW_client_fnc_notificationsAdd;