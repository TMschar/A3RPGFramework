#include "script_component.hpp"
/**
 * Author(s): Tonic, BoGuu and SimZor
 *
 * Filename: fn_queryDB.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): STRING - SQL custom query identifier to call
 *     1 (REQUIRED): NUMBER - Call type to send to extDB
 *     2 (REQUIRED): ARRAY  - Array with arguments to call extDB with
 *
 * Returns:
 *     ANYTHING - Information from DB
 *
 * Description:
 *     Sends an asynchronous call to SQL database.
 *
 * Modes:
 *     0: Expect return
 *     1: Used to insert data
 */
scriptName "GW_db_fnc_queryDB: main";
scopeName "main";

if (!params [ ["_statement", "", [""]], ["_callType", 1, [1]], ["_arguments", [], [[]]] ]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Setup call
private _formattedCall = format ["%1:%2:%3", _callType, call GW_sqlID, _statement];

// Separate values in array with :
if !(_arguments isEqualTo []) then
{
    _arguments = _arguments joinString ":";
    _formattedCall = format ["%1:%2", _formattedCall, _arguments];
};

// Call the extension.
// DO NOT SET THIS BELOW THE EXITWITH.
private _extensionResult = "extDB3" callExtension _formattedCall;

// No need to continue
if (_callType isEqualTo 1) exitWith {true};

// Sort out return and run again
private _queryResult = parseSimpleArray _extensionResult;
_queryResult params ["_code", "_return"];
_queryResult = "extDB3" callExtension format ["4:%1", _return];

// Manipulate query result based on extdb call type
if (_queryResult isEqualTo "[3]") then
{
    for "_i" from 0 to 1 step 0 do
    {
        if (_queryResult != "[3]") exitWith {};
        if (canSuspend) then
        {
            uiSleep 0.05;
        };

        // Retrieve initial response
        _queryResult = "extDB3" callExtension format ["4:%1", _return];
    };
};

// Retrieve multipart message
if (_queryResult isEqualTo "[5]") then
{
    scopeName "multiPart";
    for "_i" from 0 to 1 step 0 do
    {
        _queryResult = "";
        for "_i" from 0 to 1 step 0 do
        {
            // Retrieve message part in pipe
            private _part = "extDB3" callExtension format ["5:%1", _return];

            // Check if full message is already received
            if (_part isEqualTo "") then {breakOut "multiPart"};

            // Concat
            _queryResult = _queryResult + _part;
        };
    };
};

// String to array
_queryResult = parseSimpleArray _queryResult;

// Protocol error
if ((_queryResult select 0) isEqualTo 0) exitWith
{
    // Add log
    [
        LOG_WARNING, format
        [
            "extDB3: Protocol Error: %1",
            _queryResult
        ],
        _fnc_scriptName
    ] call GW_server_fnc_log;

    // Return empty array
    []
};

// Return
_queryResult params ["_code", "_return"];
_return;
