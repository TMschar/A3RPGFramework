#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_atmInteractions.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Target to interact with
 *
 * Description:
 *     Sets up the interaction menu with ATM interactions
 */
#define ACTIONS GW_displayInteractionMenu_actions

scriptName "GW_client_fnc_atmInteractions: main";
scopeName "main";

// Add option for normal bank account
ACTIONS pushback ["Bank Account", "", "createDialog 'GW_displayBank'", "bankAccount"];

// Add option for deposit box a.k.a. compensation storage
ACTIONS pushback ["Deposit Box", "", "createDialog 'GW_displayDepositBox'", "depositBox"];

// Add option for organization bank account if player is in
// an organization.
private _organizationName = group player getVariable ["organizationName", ""];
if (_organizationName != "") then {
    ACTIONS pushback ["Organizations Account", "", "createDialog 'GW_displayOrganizationBank'", "organizationAccount"];
};
