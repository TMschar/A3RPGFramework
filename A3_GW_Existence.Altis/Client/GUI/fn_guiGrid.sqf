/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: undefined
*
* Parameter(s):
*     0 (REQUIRED): NUMBER - Mode
*     1 (REQUIRED): NUMBER - Size
*
* Returns:
*     NUMBER
*/
#define PIXELSCALE 0.50
#define GRID_W (pixelW * pixelGrid * PIXELSCALE)
#define GRID_H (pixelH * pixelGrid * PIXELSCALE)

scriptName "GW_client_fnc_guiGrid: main";
scopeName "main";

if !params [["_mode", 0, [0]], ["_size", 0, [0]]] exitWith {0};

private _gridOfAxis = [GRID_W, GRID_H] select _mode;
private _calculation = _size * _gridOfAxis;

// Return
_calculation breakOut "main"