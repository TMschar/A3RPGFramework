#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_getPosCompass.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Object to check
 *
 * Returns:
 *     ARRAY
 *
 * Description:
 *     Gets compass position.
 *     Returns array of 3 elements with the following:
 *         0: direction
 *         1: direction cardinal point
 *         2: left cardinal point
 *         3: right cardinal point
 */
#define CARDINAL_POINTS ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]

scriptName "GW_client_fnc_getCardinalPoints: main";
scopeName "main";

if !params [["_unit", objNull, [objNull]]] exitWith {[-1, "", "", ""]};

private _unitDir = getDir _unit;
private _angle = _unitDir + 11.25;

if (_angle > 360) then {_angle = _angle - 360};

private _point = floor (_angle / 22.5);
private _cardinalPoint = CARDINAL_POINTS select _point;

// Set left and right cardinal point
private _cardinalPoints = if (_unitDir >= 0 && {_unitDir <= 90}) then {["N", "E"]} else {
    if (_unitDir >= 90 && {_unitDir <= 180}) then {["E", "S"]} else {
        if (_unitDir >= 180 && {_unitDir <= 270}) then {["S", "W"]} else {
            if (_unitDir >= 270 && {_unitDir <= 360}) then {["W", "N"]} else {
                if (_unitDir == 0) then {"N"} else {
                    if (_unitDir == 90) then {"E"} else {
                        if (_unitDir == 190) then {"S"} else {
                            if (_unitDir == 270) then {"W"};
                        };
                    };
                };
            };
        };
    };
};

// Return
private _returnArray = [_unitDir, _cardinalPoint] + _cardinalPoints;
_returnArray breakOut "main";