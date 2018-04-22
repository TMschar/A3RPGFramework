/**
 * Copyright (C) SimZor, SimZor Studios 2017
 * All Rights Reserved
 *
 * Filename: CfgSounds.hpp
 */
class CfgSounds {
    sounds[] = {};
    class EmergencySiren
    {
        name     = "EmergencySiren";
        sound[]  = {"\sounds\vehicles\sirenEmergency.ogg", 1.0, 1};
        titles[] = {};
    };
    class Ringing
    {
        name     = "Ringing";
        sound[]  = {"\sounds\ringing.ogg", 1.0, 1};
        titles[] = {};
    };
    class HandcuffsApply
    {
        name     = "HandcuffsApply";
        sound[]  = {"\sounds\restraining\handcuffs.ogg", 1.0, 1};
        titles[] = {};
    };
    class HandcuffsRemove
    {
        name     = "HandcuffsRemove";
        sound[]  = {"\sounds\restraining\handcuffsoff.ogg", 1.0, 1};
        titles[] = {};
    };
    class CarLock
    {
        name     = "CarLock";
        sound[]  = {"\sounds\vehicles\carLock.ogg", 1.0, 1};
        titles[] = {};
    };
    class CarUnlock
    {
        name     = "CarUnlock";
        sound[]  = {"\sounds\vehicles\carUnlock.ogg", 1.0, 1};
        titles[] = {};
    };

    // Sounds for Resources
    class Harvest
    {
        name     = "harvest";
        sound[]  = {"\sounds\resources\harvest.ogg", 1.0, 1};
        titles[] = {};
    };
    class Mine
    {
        name     = "mine";
        sound[]  = {"\sounds\resources\mining.ogg", 1.0, 1};
        titles[] = {};
    };
    class Wood
    {
        name     = "wood";
        sound[]  = {"\Sounds\resources\wood.ogg", 1.0, 1};
        titles[] = {};
    };

    // Alarms
    class PetrolStationAlarm
    {
        name     = "PetrolStationAlarm";
        sound[]  = {"\Sounds\Alarms\petrolStation.ogg", 1.0, 1};
        titles[] = {};
    };
    class Drill
    {
        name     = "Drill";
        sound[]  = {"\Sounds\Alarms\drill.ogg", 1.0, 1};
        titles[] = {};
    };
};
