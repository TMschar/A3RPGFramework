#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayBank.sqf
 *
 * Parameter(s):
 *     0: STRING - Event
 *     1: ARRAY - Arguments
 */
#define SELF GW_displayBank_script

scriptName "GW_displayBank_script: main";
scopeName "main";

disableSerialization;
if !params [["_event", "", [""]], ["_args", [], [[]]]] exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        // Log action

        private _players = ALLPLAYERSNOHC - [player];
        private _ctrlList = _display displayCtrl IDC_DISPLAYBANK_LISTPLAYERS;
        private _ctrlButtonWithdraw = _display displayCtrl IDC_DISPLAYBANK_BUTTONWITHDRAW;
        private _ctrlButtonDeposit = _display displayCtrl IDC_DISPLAYBANK_BUTTONDEPOSIT;
        private _ctrlButtonDepositAll = _display displayCtrl IDC_DISPLAYBANK_BUTTONDEPOSITALL;
        private _ctrlButtonTransfer = _display displayCtrl IDC_DISPLAYBANK_BUTTONTRANSFER;

        // Set money info
        ["onUpdateMoney", [_display]] call SELF;

        // List all players into combo listbox that this player
        // can transfer money to.
        {
            private _playerSide = side group _x;
            private _picturePath = [
                "a3\ui_f\Data\Map\Markers\nato\b_unknown.paa",
                "a3\ui_f\Data\Map\Markers\nato\n_unknown.paa",
                "a3\ui_f\Data\Map\Markers\nato\o_unknown.paa",
                "a3\ui_f\Data\Map\Markers\nato\c_unknown.paa"
            ] select ([_playerSide] call GW_client_fnc_getUnitSideID);

            private _namePlayer = [_x] call GW_client_fnc_playersGetName;
            private _sideColour = [_playerSide] call BIS_fnc_sideColor;
            private _uid = getPlayerUID _x;
            private _index = _ctrlList lbAdd _namePlayer;

            _ctrlList lbSetPicture [_index, _picturePath];
            _ctrlList lbSetPictureColor [_index, _sideColour];
            _ctrlList lbSetData [_index, _uid];
        } forEach _players;

        // Set default selection
        _ctrlList lbSetCurSel 0;

        _ctrlButtonWithdraw ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlInput = _display displayCtrl IDC_DISPLAYBANK_INPUT;
            private _amountString = ctrlText _ctrlInput;
            private _amount = round parseNumber _amountString;

            if (_amount < 1) exitWith {[2, "Number Error", "You must input a number larger than 0"] call GW_client_fnc_notificationsAdd};
            if (_amount > BANK) exitWith {[2, "Insufficient Funds", "You do not have sufficient funds"] call GW_client_fnc_notificationsAdd};

            // Update cash
            CASH = CASH + _amount;
            BANK = BANK - _amount;

            // Add log entry
            [LOG_INFO, format [
                "Withdrew %1 from bank to cash (New Bank: %3 || New Cash: %2)",
                _amount toFixed 0,
                CASH toFixed 0,
                BANK toFixed 0
            ], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

            // Set money info
            ["onUpdateMoney", [_display]] call SELF;
        }];

        _ctrlButtonDeposit ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlInput = _display displayCtrl IDC_DISPLAYBANK_INPUT;
            private _amountString = ctrlText _ctrlInput;
            private _amount = round parseNumber _amountString;

            if (_amount < 1) exitWith {[2, "Number Error", "You must input a number larger than 0"] call GW_client_fnc_notificationsAdd};
            if (_amount > CASH) exitWith {[2, "Insufficient Funds", "You do not have sufficient funds"] call GW_client_fnc_notificationsAdd};

            // Update cash and bank
            CASH = CASH - _amount;
            BANK = BANK + _amount;

            // Log
            [LOG_INFO, format [
                "Deposited %1 into bank (New Cash: %2 || New Bank %3)",
                _amount toFixed 0,
                CASH toFixed 0,
                BANK toFixed 0
            ], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

            // Set money info
            ["onUpdateMoney", [_display]] call SELF;
        }];

        _ctrlButtonDepositAll ctrlEnable (CASH > 0);
        _ctrlButtonDepositAll ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            // Entry
            [LOG_INFO, format [
                "Deposited all cash (%1) into bank (New Bank: %2)",
                CASH toFixed 0,
                BANK toFixed 0
            ], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

            // Update cash and bank
            BANK = BANK + CASH;
            CASH = 0;

            // Set money info
            ["onUpdateMoney", [_display]] call SELF;
        }];

        _ctrlButtonTransfer ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;

            private _ctrlPlayerList = _display displayCtrl IDC_DISPLAYBANK_LISTPLAYERS;
            private _targetUID = _ctrlPlayerList lbData (lbCurSel _ctrlPlayerList);
            private _targetUnit = [_targetUID] call GW_client_fnc_getUnitByUID;
            private _targetName = [_targetUnit] call GW_client_fnc_playersGetName;

            private _ctrlInput = _display displayCtrl IDC_DISPLAYBANK_INPUT;
            private _inputString = ctrlText _ctrlInput;
            private _inputAmount = parseNumber _inputString;
            private _inputAmountFormatted = [_inputAmount] call GW_client_fnc_currencyFormat;

            // Error checks
            if (_targetUID isEqualTo "") exitWith {
                [HINT_AMBER, "Select a player", "Please select a player from the player list"] call GW_client_fnc_notificationsAdd
            };
            if (isNull _targetUnit) exitWith {
                [HINT_AMBER, "No Player", "There appears to be a problem with this player"] call GW_client_fnc_notificationsAdd;
            };
            if (_inputAmount < 0 || {_inputAmount == 0}) exitWith {
                [HINT_AMBER, "Transfer Error", "Please type a number larger than zero."] call GW_client_fnc_notificationsAdd
            };
            if (_inputAmount > BANK) exitWith {
                [HINT_AMBER, "Not enough assets", "You do not have that amount of assets in your bank account."] call GW_client_fnc_notificationsAdd
            };

            // Decrement bank account with amount
            BANK = BANK - _inputAmount;

            // Send money to target player
            [_inputAmount, player] remoteExec ["GW_client_fnc_moneyReceive", _targetUnit];

            // Notify
            [HINT_NORMAL, "Transferred Money", format [
                "You transferred %1 to %2",
                _inputAmountFormatted,
                _targetName
            ]] call GW_client_fnc_notificationsAdd;

            // Log
            [LOG_INFO, format [
                "Transferred %1 to %2:%3",
                _inputAmountFormatted,
                _targetName,
                _targetUID
            ], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

            // Update money
            ["onUpdateMoney", [_display]] call SELF;
        }];
    };
    case "onUpdateMoney": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlTextBank = _display displayCtrl IDC_DISPLAYBANK_BANK;
        private _ctrlTextCash = _display displayCtrl IDC_DISPLAYBANK_CASH;
        private _cashFormatted = [CASH] call GW_client_fnc_currencyFormat;
        private _bankFormatted = [BANK] call GW_client_fnc_currencyFormat;
        private _ctrlButtonDepositAll = _display displayCtrl IDC_DISPLAYBANK_BUTTONDEPOSITALL;

        // Only enable if cash is present
        _ctrlButtonDepositAll ctrlEnable (CASH > 0);

        // Update assets
        _ctrlTextBank ctrlSetText _bankFormatted;
        _ctrlTextCash ctrlSetText _cashFormatted;
    };
    case "onUnload": {
    };
};
