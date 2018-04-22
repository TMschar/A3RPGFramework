/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgCaptureZones.hpp
 */

#define true 1
#define false 0

class CfgCaptureZones
{
    class Malden
    {
        class Settings
        {
            enableCaptureZones = true;  // Enable or disable capture zones, putting this to false will disable all capture zones on the world the settings are in
            captureZonesAmount = 2;     // The amount of capture zones of the zones in the class that will be spawned (random onces will be selected)
        };
        class Zones
        {
            class Moray
            {
                displayName = "Moray Capture Zone";
                class CaptureObject
                {
                    classname     = "FlagPole_F";
                    positionATL[] = { 958.083, 11850.3, 0.00143909 };
                };
            };
            class Domes
            {
                displayName = "Domes Capture Zone";
                class CaptureObject
                {
                    classname     = "FlagPole_F";
                    positionATL[] = { 6097.56, 10763, 0.00144196 };
                };
            };
        };
    };
    class Altis
    {
        class Settings
        {
            enableCaptureZones = true;
            captureZonesAmount = 2;
        };
        class Zones
        {
            class NavalBase
            {
                displayName = "Naval Base Capture Zone";
                class CaptureObject
                {
                    classname     = "FlagPole_F";
                    positionATL[] = { 14279.5, 13030.2, 0 };
                };
            };
            class Castle
            {
                displayName = "Castle Capture Zone";
                class CaptureObject
                {
                    classname     = "FlagPole_F";
                    positionATL[] = { 11206.1, 8722.11, 0 };
                };
            };
            class Church
            {
                displayName = "Church Capture Zone";
                class CaptureObject
                {
                    classname     = "FlagPole_F";
                    positionATL[] = { 8909.6, 7485.83, -7.62939e-006 };
                };
            };
            class Radar
            {
                displayName = "Radar Capture Zone";
                class CaptureObject
                {
                    classname     = "FlagPole_F";
                    positionATL[] = { 25315, 21810.9, 0 };
                };
            };
            class OrekastroCastle
            {
                displayName = "Oreokastro Castle Capture Zone";
                class CaptureObject
                {
                    classname     = "FlagPole_F";
                    positionATL[] = { 4881.4, 21923.9, 3.05176e-005 };
                }
            }
        };
    };
};