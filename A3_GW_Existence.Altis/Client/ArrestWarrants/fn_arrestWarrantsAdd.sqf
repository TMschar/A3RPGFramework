#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_arrestWarrantsAdd.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): OBJECT - Unit to add warrant for
 *     1 (REQUIRED): STRING - Class in file to add crime
 */
#define CRIME_CONFIG (missionConfigFile >> "CfgWarrants" >> "Crimes")

if (!params [ ["_unit", objNull, [objNull]], ["_crimeClass", "", [""]] ]) throw "Expected Parameters";

// Error checks
if (isNull _unit) exitWith {};
if (!alive _unit) exitWith {};
if (_unit in [independent, west]) exitWith {};

private _configClass = CRIME_CONFIG >> _crimeClass;
if !(isClass _configClass) throw "No config class found";

private _title = getText (_configClass >> "title");
private _penalty = getText (_configClass >> "penalty");
private _sentenceTime = getNumber (_configClass >> "prisonTime");
private _ticketValue = getNumber (_configClass >> "ticketValue");
private _crimeID = getNumber (_configClass >> "crimeID");

if (_crimeID < 0) throw "No crime ID found";
[[_unit, _crimeID], "GW_server_fnc_warrantsAddWarrant"] call GW_ext_fnc_networkCallServer;

// Notify issuer (if not himself)
if (!local _unit) then
{
    // Notify warrant added
    [
        HINT_NORMAL,
        "Warrants Notice",
        format
        [
            "A warrant for the arrest of %1 has been added to the warrants database.",
            _unit call GW_client_fnc_playersGetName
        ]
    ] call GW_client_fnc_notificationsAdd;

    // Warn unit
    [
        HINT_WARNING,
        "Warrants Notice",
        format
        [
            "A warrant has been issued for your arrest. This is due to suspicion of %1 and carries a penalty of %2 up to %3 minutes as well as a ticket of £%4.",
            _title,
            _penalty,
            _sentenceTime,
            _ticketValue
        ]
    ] remoteExecCall ["GW_client_fnc_notificationsAdd", _unit];
}
else
{
    // Warn unit
    [
        HINT_WARNING,
        "Warrants Notice",
        format
        [
            "A warrant has been issued for your arrest. This is due to suspicion of %1 and carries a penalty of %2 up to %3 minutes as well as a ticket of £%4.",
            _title,
            _penalty,
            _sentenceTime,
            _ticketValue
        ]
    ] call GW_client_fnc_notificationsAdd;
};