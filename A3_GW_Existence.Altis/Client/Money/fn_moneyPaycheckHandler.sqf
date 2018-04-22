#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_moneyPaycheckHandler.sqf
 *
 * Parameter(s):
 *     0: BOOLEAN - Start or stop thread
 *
 * Description:
 *     Handles out handing out paychecks
 */
#define VAR_TIME GW_moneyPaycheckHandler_lastPaycheck
#define PAYCHECK_CLASS (missionConfigFile >> "CfgGroundWars" >> "Players" >> "Finance" >> "Paychecks" >> str playerSide)
#define STEAMNAME_MSG_REWARD "You received double the amount of experience points and money since you have the Ground Wars name in your Steam profile name."
#define STEAMNAME_MSG_PROMPT "If you put <t font='RobotoCondensedBold'>ground-wars.com</t> in your Steam profile name, you will receive double the amount of money and experience points on your next paycheck."
#define COOLDOWN (10 * 60)

scriptName "GW_client_fnc_moneyPaycheckHandler: main";
scopeName "main";

params [ ["_start", true, [false]] ];

// Get script
private _threadHandle = missionNamespace getVariable ["GW_moneyPaycheckHandler_threadHandle", scriptNull];

// Error checks
if (!_start) exitWith { terminate _threadHandle; };
if (!isNull _threadHandle) exitWith { ["Already running", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Create a thread to handle the handouts
GW_moneyPaycheckHandler_threadHandle = [] spawn
{
    scriptName "GW_client_fnc_moneyPaycheckHandler: threadHandle";

    // Default time variable
    VAR_TIME = time;

    // Default exp and money
    private _defaultMoneyAmount = getNumber (PAYCHECK_CLASS >> "money");
    private _defaultExperienceAmount = getNumber (PAYCHECK_CLASS >> "exp");
    private _experienceCategories = "Jack of All Trades";

    // Error checks
    if (!isClass PAYCHECK_CLASS) exitWith { ["No class", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
    if (_defaultMoneyAmount isEqualTo 0) exitWith { ["No default money amount in config", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
    if (_defaultExperienceAmount isEqualTo 0) exitWith { ["No default exp amount in config", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

    // Loop infinitely
    for "_i" from 0 to 1 step 0 do
    {
        // Check if it is time for a new paycheck
        if ([VAR_TIME, COOLDOWN] call GW_client_fnc_numbersIsFinished) then
        {
            // If player has "ground-wars.com" in their steam name, give them
            // the double amount of experience and money.
            private _additionalMessage = "";
            private _moneyAmount = _defaultMoneyAmount;
            private _experienceAmount = _defaultExperienceAmount;
            if ([] call GW_client_fnc_playerHasGroundWars) then
            {
                _moneyAmount = _defaultMoneyAmount * 1.5;
                _experienceAmount = _defaultExperienceAmount * 1.5;
                _additionalMessage = STEAMNAME_MSG_REWARD;
            }
            else
            {
                _additionalMessage = STEAMNAME_MSG_PROMPT;
            };

            // Give money
            BANK = BANK + _moneyAmount;

            // Give experience points
            private _currentLevel = [LEVEL_TOOLSOFTHETRADE] call GW_client_fnc_experienceGetCategoryLevel;
            if (_currentLevel isEqualTo 0) then { _currentLevel = 1; };
            [0, _experienceAmount * _currentLevel, "", false] call GW_client_fnc_experienceCategoryAddExperience;

            // Do depending on player side
            switch (playerSide) do
            {
                case civilian:
                {
                    // Give rebel experience if the player has a rebel license
                    if (['CivilianRebel'] call GW_client_fnc_licensingHasLicense) then
                    {
                        // Set new message
                        _experienceCategories = "Jack of All Trades and Rebellious";

                        // Give experience
                        [LEVEL_REBELLIOUS, _experienceAmount, "", false] call GW_client_fnc_experienceCategoryAddExperience;
                    };
                };
                case west:
                {
                    // Set new message
                    _experienceCategories = "Jack of All Trades and Vigilance";

                    // Give experience
                    [LEVEL_VIGILANCE, _experienceAmount, "", false] call GW_client_fnc_experienceCategoryAddExperience;
                };
                case independent:
                {
                    // Set new message
                    _experienceCategories = "Jack of All Trades and Health and Wellbeing";

                    // Give experience
                    [LEVEL_MEDICAL, _experienceAmount, "", false] call GW_client_fnc_experienceCategoryAddExperience;
                };
            };

            // Notify
            [
                HINT_NORMAL,
                "Paycheck Received",
                format
                [
                    "You have received a paycheck of <t font='RobotoCondensedBold'>%1</t> "
                    + "and <t font='RobotoCondensedBold'>%2</t> experience points within "
                    + "<t font='RobotoCondensedBold'>%3</t>. %4",
                    [_moneyAmount] call GW_client_fnc_currencyFormat,
                    _experienceAmount,
                    _experienceCategories,
                    _additionalMessage
                ]
            ] call GW_client_fnc_notificationsAdd;

            // Set last paycheck to now
            VAR_TIME = time;
        };

        // Wait
        uiSleep 1;
    };
};