#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playersHandleMoney.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Mode
 *         0: BUY
 *         1: SELL
 *     1: NUMBER - Amount
 *     2: NUMBER - Account Mode
 *         0: Private bank account
 *         1: Private cash account
 *         2: Organization bank account
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Function to be used for purchases/sales
 */
scriptName "GW_client_fnc_playersHandleMoney: main";
scopeName "main";

if !(params [["_mode", 0, [0]], ["_amount", 0, [0]], ["_accountMode", 0, [0]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

switch (_accountMode) do {
    case 0: {
        try {
            if (isNil CASH_STRING) throw "Cash is nil";
            if (isNil BANK_STRING) throw "Bank is nil";

            if (_mode isEqualTo 0) then {
                if (_amount > BANK) then {
                    false breakOut "main";
                } else {
                    BANK = BANK - _amount;
                    true breakout "main";
                };
            } else {
                if (_mode isEqualTo 1) then {
                    BANK = BANK + _amount;
                    true breakout "main";
                };
            };
        } catch {
            [LOG_CRITICAL, "Money var is nil. Exception: " + str _exception, _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

            false breakOut "main";
            endMission "GW_DataError";
        };
    };
    case 1: {
        try {
            if (isNil CASH_STRING) throw "Cash is nil";
            if (isNil BANK_STRING) throw "Bank is nil";

            if (_mode isEqualTo 0) then {
                if (_amount > CASH) then {
                    false breakOut "main";
                } else {
                    CASH = CASH - _amount;
                    true breakout "main";
                };
            } else {
                if (_mode isEqualTo 1) then {
                    CASH = CASH + _amount;
                    true breakout "main";
                };
            };
        } catch {
            [LOG_CRITICAL, "Money var is nil. Exception: " + str _exception, _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

            false breakOut "main";
            endMission "GW_DataError";
        };
    };
    case 2: {
        // Make sure it's not nothing
        if (isNil ORG_FUNDS_NILDEFAULT) then {
            [LOG_CRITICAL, "Organization funds is nil", _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

            false breakOut "main";
            endMission "GW_DataError";
        };

        private _group = group player;
        private _bank = _group getVariable ["organization_bank", 0];
        private _organizationName = _group getVariable ["organizationName", ""];

        if (_organizationName isEqualTo "") then {
            false breakOut "main";
        };

        // Buy
        if (_mode isEqualTo 0) then {
            if (_amount > _bank) then {
                false breakOut "main";
            } else {
                _group setVariable ["organization_bank", _bank - _amount, true];
                [LOG_INFO, format ["Updated money for %1. %2 minus %3", _organizationName, _bank, _amount], _fnc_scriptName] call GW_server_fnc_log;
                true breakout "main";
            };
        } else {
            // Purchase
            if (_mode isEqualTo 1) then {
                _group setVariable ["organization_bank", _bank + _amount, true];
                [LOG_INFO, format ["Updated money for %1. %2 plus %3", _organizationName, _bank, _amount], _fnc_scriptName] call GW_server_fnc_log;
                true breakout "main";
            };
        };
    };
    default {
        false;
    };
};
