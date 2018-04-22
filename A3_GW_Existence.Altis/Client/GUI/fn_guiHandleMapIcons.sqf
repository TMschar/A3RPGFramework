/**
 * Copyright (c) 2017-2018 Simon Arledal (SimZor)
 * All Rights Reserved
 * Originates from Ground Wars Framework
 *
 * Filename: fn_guiHandleMapIcons.sqf
 *
 * BE ADVISED: This should be ran in each frame eventhandler to be work as
 *             intended.
 */
scriptName "RR_fnc_guiHandleMapIcons: main";
scopeName "main";

// Update players to draw (only do this each 20 frames)
if (diag_frameno % 20 isEqualTo 0 && {visibleMap} || {visibleGPS}) then {
    // Reset array
    RR_mapDrawUnits = [];

    // Pushback local unit
    RR_mapDrawUnits pushback [vehicle player, "iconManVirtual", [0.92, 0.53, 0, 1]];

    // Array of units to use in pushback
    private _units = units group player - [player];

    // Loop through units and add them to draw array
    {
        // Set the icon to use (either player icon or the vehicle of unit)
        private _icon =
        [
            "iconMan",
            getText (configFile >> "CfgVehicles" >> typeOf objectParent _x >> "icon")
        ] select (!isNull objectParent _x);

        private _colour = [side group _x, false] call BIS_fnc_sideColor;

        // Add unit
        RR_mapDrawUnits pushBack
        [
            vehicle _x,
            _icon,
            _colour
        ];

        true;
    } count _units;

    // Get minimap display
    private _ctrlMiniMap = (uiNamespace getVariable ["RscCustomInfoMiniMap", displayNull]) displayCtrl 101;

    // Check if GPS is visible
    if (isNil "RR_miniMapDrawHandle" && {visibleGPS}) then
    {
        // Add eventhandler to minimap
        RR_miniMapDrawHandle = _ctrlMiniMap ctrlAddEventHandler ["Draw", GW_client_fnc_drawMapIcons];
    }
    else
    {
        if (!visibleGPS && {!isNil "GW_GUI_MiniMapIcons_DrawHandle"}) then
        {
            // Remove eventhandler from minimap
            _ctrlMiniMap ctrlRemoveEventHandler ["Draw", RR_miniMapDrawHandle];
        };
    };
};
