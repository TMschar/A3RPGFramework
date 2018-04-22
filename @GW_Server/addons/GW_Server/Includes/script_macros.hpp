/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: script_macros.hpp
 */

#include "macros\level_macros.hpp"
#include "macros\dik_macros.hpp"

#define HUNGER 1
#define THIRST 2

#define CASH                 GW_Player_mcAlive
#define BANK                 GW_Player_mbAlive
#define CASH_STRING          "GW_Player_mcAlive"
#define BANK_STRING          "GW_Player_mbAlive"
#define ORG_FUNDS            group player getVariable ["organization_bank", 0]
#define ORG_FUNDS_NILDEFAULT group player getVariable ["organization_bank", nil]

#define SOLID_PNS_DASH [(profilenamespace getvariable ['GUI_BCG_RGB_R', 0.77]), (profilenamespace getvariable ['GUI_BCG_RGB_G', 0.51]), (profilenamespace getvariable ['GUI_BCG_RGB_B', 0.08]), 1]

#define LOG_MISC        0
#define LOG_ACTION      1
#define LOG_WARNING     2
#define LOG_INFO        3
#define LOG_CRITICAL    4
#define LOG_STAFF       5
#define LOG_BAN         6
#define LOG_DEBUG       7

#define HINT_NORMAL     0
#define HINT_AMBER      1
#define HINT_WARNING    2

#define PVAR_CLIENT     0
#define PVAR_SERVER_HC  1
#define PVAR            2

#define ALLPLAYERSNOHC allPlayers - entities "HeadlessClient_F"
#define HEADLESSCLIENT GW_HC1
#define STR_HC         "GW_HC1"
#define IS_HC          !isDedicated && {!isServer} && {!hasInterface}
