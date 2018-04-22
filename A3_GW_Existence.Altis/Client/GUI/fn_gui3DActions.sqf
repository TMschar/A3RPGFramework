#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_gui3DActions.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        NOTHING
*
*    Description:
*        Handles GUI 3D actions. Should be ran in onEachFrame or Draw3D, in order to run properly.
*/
scriptName "GW_client_fnc_gui3DActions: main";
scopeName "main";

// Define constants
#define CONFIG_ACTIONS3D (missionConfigFile >> "CfgGroundWars" >> "World" >> "GUI" >> "actions3D")
#define ICON_COLOUR_AVAILABLE [1, 1, 1, 0.9]
#define ICON_COLOUR_UNAVAILABLE [0.41, 0.01, 0, 0.9]
#define ICON_WIDTH 1
#define ICON_HEIGHT 1
#define ICON_ANGLE 0
#define ICON_SHADOW 1
#define ICON_TEXTSIZE 0.03
#define ICON_FONT "PuristaMedium"
#define ICON_TEXTALIGN "center"
#define ICON_DRAWSIDEARROWS false
#define LINE_START eyePos player
#define LINE_END LINE_START vectorAdd ((LINE_START vectorFromTo AGLToASL screenToWorld [0.5, 0.5]) vectorMultiply 3)

// Do not allow in vehicles
if !(isNull objectParent player) exitWith {};

// Get object that user is looking at
private "_find";
private _objects = (lineIntersectsWith [
	LINE_START,
	LINE_END,
	objNull,
	objNull,
	true
]) select {
	private _objectClassname = typeOf _x;
	_find = getArray CONFIG_ACTIONS3D select {
		_x params [["_classnames", [], [[]]]];
		_objectClassname in _classnames
	};

	// Array element has been found
	count _find > 0
};

// If any objects are found, proceed
if !(_objects isEqualTo []) then {
	private _lastElement = count _find -1;
	private _object = _objects param [_lastElement, objNull, [objNull]];

	/**
	*	Parameter(s):
	*		0: ARRAY  - Array with classnames of objects
	*		1: STRING - Path to icon, relative to mission
	*		2: STRING - Text that should show on the object
	*		3: STRING - Expression to compile when key pressed
	*		4: STRING - Condition that must be met for action to work
	*/
	_find param [0, [], [[]]] params [
		["_classnames", [], [[]]],
		["_iconPath", "", [""]],
		["_text", "", [""]],
		["_expression", "", [""]],
		["_condition", "", [""]]
	];

	private _evaluation = _condition call GW_client_fnc_doEvaluation;
	private _objectProperties = [
		[
			toUpper _text,
			ICON_COLOUR_UNAVAILABLE
		],
		[
			format ["[F] %1", toUpper _text],
			ICON_COLOUR_AVAILABLE
		]
	] select _evaluation;

	// Get center of objects position, relative to object
	private _centerPosition = boundingCenter _object;
	_centerPosition params ["_x", "_y", "_z"];

	// Get world position from relative position
	private _position = _object modelToWorld [
		_x,
		_y - 0.3,
		_z - 0.4
	];

	private _text = "[F] " + _actionName;

	// Draw icon on object
	drawIcon3D [
		GW_Mission_Root + _iconPath,
		_objectProperties param [1, [], [[]]],
		_position,
		ICON_WIDTH,
		ICON_HEIGHT,
		ICON_ANGLE,
		_objectProperties param [0, "", [""]],
		ICON_SHADOW,
		ICON_TEXTSIZE,
		ICON_FONT,
		ICON_TEXTALIGN,
		ICON_DRAWSIDEARROWS
	];

	// If expression is not set already, set it if evaluation passes
	private _objectExpression = _object getVariable ["expression", ""];
	if (_objectExpression isEqualTo "" && {_evaluation}) then {
		_object setVariable ["expression", _expression];
		player setVariable ["actionObject", _object];

		// Add keydown handler to game display and store it in a variable so it can be retrieved later
		_object setVariable [
			"actionKeyDownHandle",
			findDisplay 46 displayAddEventHandler ["KeyDown", {
				/**
				*	Parameter(s):
				*		0: DISPLAY - Display eventhandler is attached to
				*		1: NUMBER  - Code of pressed key
				*		2: BOOLEAN - Handled or not, only here to privatize variable
				*/
				params [
					["_display", displayNull, [displayNull]],
					["_dikCode", 0, [0]],
					["_handled", false, [false]]
				];

				// F key pressed
				if (_dikCode isEqualTo DIK_F) then {
					private _object = player getVariable ["actionObject", objNull];
					private _expression = _object getVariable ["expression", ""];

					// Add magic variable '_object' to expression
					_expression = "private _object = player getVariable ['actionObject', objNull];"
								+ "private _keyDownHandle = _object getVariable ['actionKeyDownHandle', nil];"
								+ _expression
								+ "findDisplay 46 displayRemoveEventHandler ['KeyDown', _keyDownHandle];"
								+ "_object setVariable ['actionObject', nil];"
								+ "_object setVariable ['expression', nil];"
								+ "_obect setVariable ['actionKeyDownHandle', nil]";

					// Execute
					call compile _expression
				}
			}]
		]
	}
}