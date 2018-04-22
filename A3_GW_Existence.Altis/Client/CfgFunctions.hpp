/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgFunctions.hpp
 */
class Client
{
    tag = "GW_client";
    class Actions
    {
        file = "Client\Actions";
        #include "Actions\CfgFunctions.hpp"
    };
    class ArrestWarrants
    {
        file = "Client\ArrestWarrants";
        #include "ArrestWarrants\CfgFunctions.hpp"
    };
    class Banks
    {
        file = "Client\Banks";
        #include "Banks\CfgFunctions.hpp"
    };
    class Bleedout
    {
        file = "Client\Bleedout";
        #include "Bleedout\CfgFunctions.hpp"
    };
    class CaptureZones
    {
        file = "Client\CaptureZones";
        #include "CaptureZones\CfgFunctions.hpp"
    };
    class Communication
    {
        file = "Client\Communication";
        #include "Communication\CfgFunctions.hpp"
    };
    class Dictionaries
    {
        file = "Client\Dictionaries";
        #include "Dictionaries\CfgFunctions.hpp"
    };
    class Equipment
    {
        file = "Client\Equipment";
        #include "Equipment\CfgFunctions.hpp"
    };
    class EquipmentSafe
    {
        file = "Client\EquipmentSafe";
        #include "EquipmentSafe\CfgFunctions.hpp"
    };
    class Events
    {
        file = "Client\Events";
        #include "Events\CfgFunctions.hpp"
    };
    class Experience
    {
        file = "Client\Experience";
        #include "Experience\CfgFunctions.hpp"
    };
    class GUI
    {
        file = "Client\GUI";
        #include "GUI\CfgFunctions.hpp"
    };
    class Helpers
    {
        file = "Client\Helpers";
        #include "Helpers\CfgFunctions.hpp"
    };
    class Holidays
    {
        file = "Client\Holidays";
        #include "Holidays\CfgFunctions.hpp"
    };
    class Initialization
    {
        file = "Client\Init";
        #include "Init\CfgFunctions.hpp"
    };
    class Interation
    {
        file = "Client\Interaction";
        #include "Interaction\CfgFunctions.hpp"
    };
    class Items
    {
        file = "Client\Items";
        #include "Items\CfgFunctions.hpp"
    };
    class Jail
    {
        file = "Client\Jail";
        #include "Jail\CfgFunctions.hpp"
    };
    class Licensing
    {
        file = "Client\Licensing";
        #include "Licensing\CfgFunctions.hpp"
    };
    class Medical
    {
        file = "Client\Medical";
        #include "Medical\CfgFunctions.hpp"
    };
    class Money
    {
        file = "Client\Money";
        #include "Money\CfgFunctions.hpp"
    };
    class Network
    {
        file = "Client\Network";
        #include "Network\CfgFunctions.hpp"
    };
    class Notifications
    {
        file = "Client\Notifications";
        #include "Notifications\CfgFunctions.hpp"
    };
    class Numbers
    {
        file = "Client\Numbers";
        #include "Numbers\CfgFunctions.hpp"
    };
    class Organizations
    {
        file = "Client\Organizations";
        #include "Organizations\CfgFunctions.hpp"
    };
    class PetrolStations
    {
        file = "Client\PetrolStations";
        #include "PetrolStations\CfgFunctions.hpp"
    };
    class Players
    {
        file = "Client\Players";
        #include "Players\CfgFunctions.hpp"
    };
    class Properties
    {
        file = "Client\Properties";
        #include "Properties\CfgFunctions.hpp"
    };
    class Resources
    {
        file = "Client\Resources";
        #include "Resources\CfgFunctions.hpp"
    };
    class Survival
    {
        file = "Client\Survival";
        #include "Survival\CfgFunctions.hpp"
    };
    class TicketSystem
    {
        file = "Client\TicketSystem";
        #include "TicketSystem\CfgFunctions.hpp"
    };
    class Units
    {
        file = "Client\Units";
        #include "Units\CfgFunctions.hpp"
    };
    class Variables
    {
        file = "Client\Variables";
        #include "Variables\CfgFunctions.hpp"
    };
    class VehicleFactory
    {
        file = "Client\VehicleFactory";
        #include "VehicleFactory\CfgFunctions.hpp"
    };
    class Vehicles
    {
        file = "Client\Vehicles";
        #include "Vehicles\CfgFunctions.hpp"
    };
    class VirtualInventory
    {
        file = "Client\VirtualInventory";
        #include "VirtualInventory\CfgFunctions.hpp"
    };
    class World
    {
        file = "Client\World";
        #include "World\CfgFunctions.hpp"
    };
    class Main
    {
        file = "Client";
        class external       {};
        class doEvaluation   {};
        class hasInputAccess {};
        class canDoAnimation {};
        class error          {};
        class externalFuncs  {postInit = 1;};
    };
};
