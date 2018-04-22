/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: CfgWarrants.hpp
*/

class CfgWarrants {
    /*
    * Crimes
    *     title:       the title of the crime
    *     description: the description of the crime
    *     penalty:     Prison or Ticket
    *     ticketPrice: the price of the ticket the player has to pay
    *     prisonTime:  the minimum amount of prison time (in minutes)
    */
    class Crimes {
        class VerbalAssault {
            crimeID     = 2;
            title       = "Verbal Assault";
            description = "Verbaly abusing a person.";
            penalty     = "Ticket";
            ticketValue = 10000;
            prisonTime  = 0;
        };

        class Assault {
            crimeID     = 3;
            title       = "Assault";
            description = "Assault on a person.";
            penalty     = "Ticket";
            ticketValue = 1000;
            prisonTime  = 0;
        };

        class GBH {
            crimeID     = 4;
            title       = "GBH (Grievous Bodily Harm)";
            description = "Grievously performing harm to a person's body..";
            penalty     = "Ticket";
            ticketValue = 75000;
            prisonTime  = 0;
        };

        class AttemptedMurder {
            crimeID     = 5;
            title       = "Attempted Murder";
            description = "Attemping to murder a person.";
            penalty     = "Ticket";
            ticketValue = 100000;
            prisonTime  = 0;
        };

        class Murder {
            crimeID     = 6;
            title       = "Murder";
            description = "The unlawful premeditated killing of a person or living creature.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 10;
        };

        class Manslaughter {
            crimeID     = 7;
            title       = "Manslaughter";
            description = "The unlawful unintentional killing of a person or living creature.";
            penalty     = "Ticket";
            ticketValue = 150000; //-- ToDO: 150k or Prison
            prisonTime  = 0;
        };

        class TTK {
            crimeID     = 8;
            title       = "Threats to kill or do harm";
            description = "Threatening to kill or do harm to a person.";
            penalty     = "Ticket";
            ticketValue = 50000;
            prisonTime  = 0;
        };

        class ResistingArrest {
            crimeID     = 9;
            title       = "Resisting Arrest";
            description = "Resisting to comply with the officer's commands and being uncooperative.";
            penalty     = "Ticket";
            ticketValue = 20000;
            prisonTime  = 0;
        };

        class EscapingPrison {
            crimeID     = 10;
            title       = "Escaping Prison";
            description = "Escaping the prison before the sentence is carried out.";
            penalty     = "Prison";
            ticketValue = 0;
            prisonTime  = 0; //--- ToDO: Get players current prison time and * 2
        };

        class Theft {
            crimeID     = 11;
            title       = "Theft";
            description = "Taking another person's property or services without that person's permission or consent.";
            penalty     = "Ticket";
            ticketValue = 20000;
            prisonTime  = 0;
        };

        class Robbery {
            crimeID     = 12;
            title       = "Robbery";
            description = "Taking another person's property by use of force.";
            penalty     = "Ticket";
            ticketValue = 50000;
            prisonTime  = 0;
        };

        class ArmedRobbery {
            crimeID     = 13;
            title       = "Armed Robbery";
            description = "Taking another person's property by use of armed weaponry.";
            penalty     = "Ticket";
            ticketValue = 75000; //-- ToDO: 75k or Prison
            prisonTime  = 0;
        };

        class AttemptedVehiclesTheft {
            crimeID     = 14;
            title       = "Attempted Vehicles Theft";
            description = "Attempting to take someone's vehicle without their consent or permission.";
            penalty     = "Ticket";
            ticketValue = 25000;
            prisonTime  = 0;
        };

        class StolenPoliceClothing {
            crimeID     = 15;
            title       = "Stolen Police Clothing";
            description = "Stealing and wearing stolen police clothing.";
            penalty     = "Ticket";
            ticketValue = 25000; //-- ToDo: 25k & seizure of clothing
            prisonTime  = 0;
        };

        class LegalWithoutLicense {
            crimeID     = 17;
            title       = "Possession of a legal firearm w/out license";
            description = "In possession of a legal firearm however without the proper needed license.";
            penalty     = "Ticket";
            ticketValue = 15000; //-- ToDo: 15k & seizure of weapon(s)
            prisonTime  = 0;
        };

        class VisableFirearmLegal {
            crimeID     = 18;
            title       = "Visible legal firearm in a public area";
            description = "Displaying a legal firearm openly in public areas.";
            penalty     = "Ticket";
            ticketValue = 20000; //-- ToDo: 20k & warning
            prisonTime  = 0;
        };

        class IllegalFirearm {
            crimeID     = 19;
            title       = "Possession of an illegal Firearm";
            description = "In possession of an illegal firearm.";
            penalty     = "Ticket";
            ticketValue = 100000; //-- ToDo: 100k & seizure of weapon(s)
            prisonTime  = 0;
        };

        class IllegalAttachment {
            crimeID     = 20;
            title       = "Possession of an illegal Attachment";
            description = "In possession of an illegal Attacment.";
            penalty     = "Ticket";
            ticketValue = 15000; //-- ToDo: 15k per illigal attachment(s)
            prisonTime  = 0;
        };

        class IllegalMagazine {
            crimeID     = 21;
            title       = "Possession of an illegal Magazine";
            description = "In possession of an illegal Magazine.";
            penalty     = "Ticket";
            ticketValue = 5000; //-- ToDo: 5k per illigal magazine(s)
            prisonTime  = 0;
        };

        class IllegallySelling {
            crimeID     = 22;
            title       = "Selling an illegal firearm";
            description = "Engaging in trade that involves trade of illegal firearm.";
            penalty     = "Ticket";
            ticketValue = 30000; //-- ToDo: 30k up to 75k
            prisonTime  = 0;
        };

        class Speeding {
            crimeID     = 23;
            title       = "Speeding";
            description = "Breaching Goverment Speed Limits on the national roads.";
            penalty     = "Ticket";
            ticketValue = 10000; //-- ToDo: Various ticket prices depending on speeds ?
            prisonTime  = 0;
        };
    };
};
