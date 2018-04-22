#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_captureZonesInit.sqf
 */
#define CAPTUREZONES_CLASS_ZONES (missionConfigFile >> "CfgCaptureZones" >> worldName >> "Zones")
#define CAPTUREZONES_CLASS_SETTINGS (missionConfigFile >> "CfgCaptureZones" >> worldName >> "Settings")
#define CAPTUREZONES_CLASSES_ZONES ("true" configClasses CAPTUREZONES_CLASS_ZONES)

scriptName "GW_client_fnc_captureZonesInit: main";
scopeName "main";

// Make sure classes are present
if (!isClass CAPTUREZONES_CLASS_SETTINGS) throw "No settings class in world class";
if (!isClass CAPTUREZONES_CLASS_ZONES) throw "No zones class for world class";

// Make sure entries in config are present
private _enableCaptureZones = CAPTUREZONES_CLASS_SETTINGS >> "enableCaptureZones";
private _captureZonesAmount = CAPTUREZONES_CLASS_SETTINGS >> "captureZonesAmount";
private _captureZonesCount = count CAPTUREZONES_CLASSES_ZONES;
if (!isNumber _enableCaptureZones) throw "No entry for enabling or disabling capture zones";
if (!isNumber _captureZonesAmount) throw "No amount of capture zones to be enabled set";

// Set
_enableCaptureZones = getNumber _enableCaptureZones;
_captureZonesAmount = getNumber _captureZonesAmount;

// Make sure that there are not more amount of zones to be initialized than actual zone count
if (_captureZonesAmount > _captureZonesCount) throw "Capture zones to enable are greater number than amount of capture zones";

// Check if capture zones are enabled
if (_enableCaptureZones != 1) exitWith {
    [LOG_INFO, "Capture zones are disabled in this world.", _fnc_scriptName] call GW_server_fnc_log;
};

// Select the amount of random zones that config
// want us to select
private _enabledZones = [];
private _allZones = CAPTUREZONES_CLASSES_ZONES;
for "_i" from 1 to _captureZonesAmount do {
    // Selected a random zone
    private _zone = selectRandom _allZones;

    // Remove zone from all zones so it cannot
    // be selected again, however, add it to the
    // enabled zones since it was randomly selected
    _allZones = _allZones - [_zone];
    _enabledZones pushback _zone;
};

// Log info
[LOG_INFO, "Initializing capture zones", _fnc_scriptName] call GW_server_fnc_log;

// Add eventhandler for players requesting to capture
"GW_captureZones_capture" addPublicVariableEventHandler { _this call GW_server_fnc_captureZonesCaptureRequest; };
"GW_captureZones_captured" addPublicVariableEventHandler { _this call GW_server_fnc_captureZonesZoneCaptured; };

// Loop through capture zones
GW_captureZones_zones = [];
{
    private _captureZoneObjectClass = (_x >> "CaptureObject");
    if (!isClass _captureZoneObjectClass) throw "No CaptureObject class";

    private _displayName = _x >> "displayName";
    private _captureZoneObjectPositionATL = _captureZoneObjectClass >> "positionATL";
    private _captureZoneObjectClassname = _captureZoneObjectClass >> "classname";
    if (!isText _displayName) throw "No entry with displayname";
    if (!isArray _captureZoneObjectPositionATL) throw "No position in config of where to spawn flag";
    if (!isText _captureZoneObjectClassname) throw "No classname for flag";

    // Set
    _captureZoneObjectClassname = getText _captureZoneObjectClassname;
    _captureZoneObjectPositionATL = getArray _captureZoneObjectPositionATL;
    _displayName = getText _displayName;

    // Create flag pole
    private _captureZoneObject = _captureZoneObjectClassname createVehicle _captureZoneObjectPositionATL;
    _captureZoneObject enableSimulation true;
    _captureZoneObject allowDamage false;
    _captureZoneObject setFlagAnimationPhase 0;

    // Create marker
    private _marker = createMarker [configName _x, _captureZoneObjectPositionATL];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "White";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerText _displayName;

    // Add zone to array
    GW_captureZones_zones pushback [_captureZoneObject, _marker, false, grpNull, grpNull, _displayName];

    // Log initialization
    [LOG_INFO, format ["Initialized %1", _displayName], _fnc_scriptName] call GW_server_fnc_log;
} forEach _enabledZones;

// Broadcast variable so everyone has
// access to it
publicVariable "GW_captureZones_zones";

// Log success
[LOG_INFO, "Capture zones initialized", _fnc_scriptName] call GW_server_fnc_log;