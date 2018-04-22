#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayOrganizations.sqf
*
*    Parameter(s):
*        0: STRING - Event to execute
*        1: ARRAY - Array with parameters
*
*    Returns:
*        NOTHING
*
*    Description:
*        NO DESCRIPTION
*/
scriptName "GW_displayOrganizations_Script: main";
scopeName "main";

disableSerialization;

#define SELF GW_displayOrganizations_Script

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

if !(playerSide isEqualTo civilian) exitWith {
    param [0, displayNull, [displayNull]] closeDisplay 2
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        // Setup exit button
        private _ctrlButtonExit = _display displayCtrl IDC_DISPLAYORGANIZATIONS_BUTTONCLOSE;
        _ctrlButtonExit ctrlSetTooltip localize "STR_GW_GLOBAL_CLOSEMENU";
        _ctrlButtonExit ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display closeDisplay 2
        }];

        private _ctrlTreeOrganizations = _display displayCtrl IDC_DISPLAYORGANIZATIONS_TREEORGS;
        _ctrlTreeOrganizations ctrlAddEventHandler ["TreeSelChanged", {
            params [
                ["_ctrlTree", controlNull, [controlNull]],
                ["_selPath", [], [[]]]
            ];
            private _display = ctrlParent _ctrlTree;

            private _buttonDisbandOrganization = _display displayCtrl IDC_DISPLAYORGANIZATIONS_BUTTONDISBANDORG;
            _buttonDisbandOrganization ctrlEnable false;

            private _tvData = _ctrlTree tvData _selPath;
            if (_tvData isEqualTo "") exitWith {};

            private _dataArray = parseSimpleArray _tvData;
            _dataArray params [
                ["_type", 0, [0]],
                ["_id", "", [""]]
            ];

            // Organization Selected
            private _ctrlPlayersList = _display displayCtrl IDC_DISPLAYORGANIZATIONS_LISTINVITEPLAYERS;
            private _ctrlButtonInvitePlayer = _display displayCtrl IDC_DISPLAYORGANIZATIONS_BUTTONINVITEPLAYERS;
            if (_type isEqualTo 0) then {
                private _groupArray = allGroups select {_x getVariable ["organization_id", ""] == _id};
                _groupArray params [["_group", grpNull, [grpNull]]];

                private _id = _group getVariable ["organization_id", ""];
                private _tag = _group getVariable ["organization_tag", ""];
                private _name = _group getVariable ["organizationName", ""];
                private _bank = _group getVariable ["organization_bank", 0];
                private _points = _group getVariable ["organization_points", 0];
                private _members = _group getVariable ["organization_members", []];

                private _ctrlOrgName = _display displayCtrl IDC_DISPLAYORGANIZATIONS_ORGSELECTEDNAME;
                _ctrlOrgName ctrlSetText (_tag + " " + _name);

                private _ctrlOrgCreated = _display displayCtrl IDC_DISPLAYORGANIZATIONS_ORGSELECTEDDATE;
                private _ctrlOrgUpdate = _display displayCtrl IDC_DISPLAYORGANIZATIONS_ORGSELECTEDLASTACTIVE;
                _ctrlOrgCreated ctrlSetText "N/A";
                _ctrlOrgUpdate ctrlSetText "N/A";

                private _ctrlOrgLevel = _display displayCtrl IDC_DISPLAYORGANIZATIONS_ORGSELECTELEVEL;
                private _level = [_group] call GW_client_fnc_organizationsGetLevel;
                _ctrlOrgLevel ctrlSetText ("Level " + str _level);

                private _ctrlOrgBank = _display displayCtrl IDC_DISPLAYORGANIZATIONS_ORGSELECTEDBANK;
                _ctrlOrgBank ctrlSetText ("£" + str _bank);

                private _ctrlTextOwner = _display displayCtrl IDC_DISPLAYORGANIZATIONS_ORGSELECTEDOWNER;
                private _unitOwner = [_id] call GW_client_fnc_getUnitByUID;
                _ctrlTextOwner ctrlSetText (name _unitOwner);

                // Enable inviting if owner of organization
                private _requiredInviteRank = getNumber (missionConfigFile >> "CfgOrganizations" >> "Member_Management" >> "Needed_Rank_Invites");
                private _playerRank = [player] call GW_client_fnc_organizationsGetRank;
                private _isInvitiationAllowed = _playerRank >= _requiredInviteRank;

                _ctrlPlayersList ctrlEnable _isInvitiationAllowed;
                _ctrlButtonInvitePlayer ctrlEnable _isInvitiationAllowed;

                _buttonDisbandOrganization ctrlEnable (_id isEqualTo getPlayerUID player);
            } else {
                // Player Selected
                if (_type isEqualTo 1) then {
                    private _unit = [_id] call GW_client_fnc_getUnitByUID;
                    private _name = name _unit;
                    private _rank = [_unit] call GW_client_fnc_organizationsGetRank;

                    private _ctrlTextName = _display displayCtrl IDC_DISPLAYORGANIZATIONS_MEMBERSELNAME;
                    _ctrlTextName ctrlSetText _name;

                    private _ctrlTextRank = _display displayCtrl IDC_DISPLAYORGANIZATIONS_MEMBERSELRANK;
                    _ctrlTextRank ctrlSetText ([_rank] call GW_client_fnc_organizationsRank);

                    private _ctrlTextStatus = _display displayCtrl IDC_DISPLAYORGANIZATIONS_MEMBERSELONLINESTATUS;
                    private _isOnline = _id call GW_client_fnc_playersIsOnline;
                    private _status = [
                        "Offline",
                        "Online"
                    ] select _isOnline;
                    _ctrlTextStatus ctrlSetText _status;

                    // Disable inviting
                    _ctrlPlayersList ctrlEnable false;
                    _ctrlButtonInvitePlayer ctrlEnable false
                }
            };
        }];
        ["setupOrganizationsTree", [_display]] call SELF;

        // Load list with players
        private _playersToCount = (ALLPLAYERSNOHC select {side _x isEqualTo civilian}) - [player];
        private _ctrlPlayerList = _display displayCtrl IDC_DISPLAYORGANIZATIONS_LISTINVITEPLAYERS;
        {
            _ctrlPlayerList lbAdd name _x;
            _ctrlPlayerList lbSetData [_forEachIndex, getPlayerUID _x];
            true
        } forEach ALLPLAYERSNOHC;

        _ctrlPlayerList ctrlAddEventHandler ["LBSelChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_selectedIndex", 0, [0]]
            ];
            private _display = ctrlParent _ctrl;
            private _ctrlPlayersList = _display displayCtrl IDC_DISPLAYORGANIZATIONS_LISTINVITEPLAYERS;
            private _ctrlButtonInvitePlayer = _display displayCtrl IDC_DISPLAYORGANIZATIONS_BUTTONINVITEPLAYERS;

            private _data = _ctrl lbData _selectedIndex;
            {
                _x ctrlEnable !(_data isEqualTo "");
                true
            } count [_ctrlPlayersList, _ctrlButtonInvitePlayer];
        }];

        private _ctrlButtonInvitePlayer = _display displayCtrl IDC_DISPLAYORGANIZATIONS_BUTTONINVITEPLAYERS;
        _ctrlButtonInvitePlayer ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            private _ctrlPlayerList = _display displayCtrl IDC_DISPLAYORGANIZATIONS_LISTINVITEPLAYERS;

            _ctrl ctrlEnable false;

            // Information about whom to invite
            private _unitUID = _ctrlPlayerList lbData (lbCurSel _ctrlPlayerList);
            if (_unitUID isEqualTo "" || {isNil "_unitUID"} || {!(_unitUID isEqualType "")}) exitWith {
                diag_log format ["No data for listbox entry (%1)", _unitUID];
            };

            private _unit = [_unitUID] call GW_client_fnc_getUnitByUID;
            [_unit, group player] call GW_client_fnc_organizationsInvitePlayer
        }];

        private _ctrlButtonDisbandOrganization = _display displayCtrl IDC_DISPLAYORGANIZATIONS_BUTTONDISBANDORG;
        _ctrlButtonDisbandOrganization ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            _ctrl ctrlEnable false;

            private _ctrlTreeOrganizations = _display displayCtrl IDC_DISPLAYORGANIZATIONS_TREEORGS;
            private _tvData = _ctrlTreeOrganizations tvData (tvCurSel _ctrlTreeOrganizations);

            if (_tvData isEqualTo "") exitWith {};
            private _tvData = parseSimpleArray _tvData;
            _tvData params [
                ["_type", 0, [0]],
                ["_id", "", [""]]
            ];

            // New thread to allow suspension
            [_display, _id] spawn {
                scriptName "GW_displayOrganizations_Script: disband thread";
                scopeName "main";

                disableSerialization;

                params [
                    ["_display", displayNull, [displayNull]],
                    ["_id", "", [""]]
                ];

                private _accepted = [
                    "Are you sure?",
                    "Are you sure you want to delete your organization? This is a permanent action and will remove all data from database.",
                    "ACCEPT",
                    "DENY",
                    _display
                ] call GW_client_fnc_guiPrompt;

                if !_accepted exitWith {};

                // Get Group
                private _groupArray = allGroups select {_x getVariable ["organization_id", ""] == _id};
                _groupArray params [["_group", grpNull, [grpNull]]];

                // Disband
                [_group] call GW_client_fnc_organizationsDisband;

                _display closeDisplay 2
            }
        }];

        // Handle creating organisations
        private _ctrlButtonCreateOrg = _display displayCtrl IDC_DISPLAYORGANIZATIONS_BUTTONSTARTORG;
        _ctrlButtonCreateOrg ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            _ctrl ctrlEnable false;

            private _ctrlInputName = _display displayCtrl IDC_DISPLAYORGANIZATIONS_STARTORGNAMEINPUT;
            private _ctrlInputTag = _display displayCtrl IDC_DISPLAYORGANIZATIONS_STARTORGTAGINPUT;

            private _desiredName = ctrlText _ctrlInputName;
            private _desiredTag = ctrlText _ctrlInputTag;

            if (count _desiredName >= 27 || {_desiredName isEqualTo ""}) exitWith {playSound "3DEN_notificationWarning"};
            if (count _desiredTag >= 6 || {_desiredTag isEqualTo ""}) exitWith {playSound "3DEN_notificationWarning"};

            // Send response to server
            GW_Organizations_creationResponse = nil;
            [1, "GW_ORGANIZATIONS_CREATEREQUEST", [_desiredName, _desiredTag, player]] call GW_ext_fnc_networkPublicVariable;
            [0, "Organization Creation", "Your organization creation request has been sent, please wait..."] call GW_client_fnc_notificationsAdd;

            // Receive response
            [_display] spawn {
                scriptName "GW_displayOrganizations_Script: wait for response";
                scopeName "main";

                disableSerialization;
                params [["_display", displayNull, [displayNull]]];

                waitUntil {!isNil "GW_Organizations_creationResponse"};
                if (GW_Organizations_creationResponse) then {
                    [0, "Organization Created", "Your organization has been created, and is now setting up. Enjoy!"] call GW_client_fnc_notificationsAdd;
                    ["setupOrganizationsTree", [_display]] call SELF;
                } else {
                    [2, "Organization setup failed", "Your request to create an organization failed. There is already a gang with this name or tag."] call GW_client_fnc_notificationsAdd
                }
            }
        }];
        _ctrlButtonCreateOrg ctrlEnable true
    };
    case "setupOrganizationsTree": {
        _args params [["_display", displayNull, [displayNull]]];

        // Disable inviting player to organization
        {
            private _ctrl = _display displayCtrl _x;
            _ctrl ctrlEnable false;
            true
        } count [
            IDC_DISPLAYORGANIZATIONS_LISTINVITEPLAYERS,
            IDC_DISPLAYORGANIZATIONS_BUTTONINVITEPLAYERS
        ];

        // Disable starting organization if in organization already
        private _groupID = group player getVariable ["organization_id", ""];
        if !(_groupID isEqualTo "") then {
            {
                private _ctrl = _display displayCtrl _x;
                _ctrl ctrlEnable false;
                true
            } count [
                IDC_DISPLAYORGANIZATIONS_BUTTONSTARTORG,
                IDC_DISPLAYORGANIZATIONS_STARTORGNAMEINPUT,
                IDC_DISPLAYORGANIZATIONS_STARTORGTAGINPUT
            ]
        };

        // Disable buttons by default
        {
            private _ctrl = _display displayCtrl _x;
            _ctrl ctrlEnable false
        } count [
            IDC_DISPLAYORGANIZATIONS_BUTTONINVITEPLAYERS,
            IDC_DISPLAYORGANIZATIONS_BUTTONDISBANDORG,
            IDC_DISPLAYORGANIZATIONS_BUTTONKICKMEMBER,
            IDC_DISPLAYORGANIZATIONS_BUTTONPROMOTEMEMBER,
            IDC_DISPLAYORGANIZATIONS_BUTTONDEMOTEMEMBER
        ];

        // Setup organizations list
        private _ctrlTreeOrganizations = _display displayCtrl IDC_DISPLAYORGANIZATIONS_TREEORGS;
        tvClear _ctrlTreeOrganizations;

        // Add all organizations into tree list
        private _organizationsArray = allGroups select {!(_x getVariable ["organization_id", ""] isEqualTo "")};
        {
            private _id = _x getVariable ["organization_id", ""];
            private _tag = _x getVariable ["organization_tag", ""];
            private _name = _x getVariable ["organizationName", ""];
            private _bank = _x getVariable ["organization_bank", 0];
            private _points = _x getVariable ["organization_points", 0];
            private _members = _x getVariable ["organization_members", []];

            private _membersOnline = _members select {
                _x params ["", "_uid"];
                [_uid] call GW_client_fnc_playersIsOnline
            };

            private _statusColour = [
                [0.9, 0.1, 0, 1],
                [0.16, 0.72, 0, 1]
            ] select (!(_membersOnline isEqualTo []));

            private _organizationEntry = _ctrlTreeOrganizations tvAdd [[], _name];
            _ctrlTreeOrganizations tvSetData [[_organizationEntry], format ["[0,""%1""]", _id]];
            _ctrlTreeOrganizations tvSetPicture [[_organizationEntry], "\a3\3DEN\Data\Cfg3DEN\Group\iconCustomComposition_ca.paa"];
            _ctrlTreeOrganizations tvSetPictureColor [[_organizationEntry], _statusColour];

            // Add members into tree list
            {
                _x params [
                    ["_name", "", [""]],
                    ["_uid", "", [""]],
                    ["_rank", 0, [0]]
                ];

                private _picture = [
                    "\A3\ui_f\data\map\vehicleicons\iconManVirtual_ca.paa",
                    "\A3\ui_f\data\map\vehicleicons\iconManVirtual_ca.paa",
                    "\A3\ui_f\data\map\vehicleicons\iconManVirtual_ca.paa",
                    "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"
                ] select _rank;

                private _isOnline = _uid call GW_client_fnc_playersIsOnline;
                private _colour = if _isOnline then {
                    [0.16, 0.72, 0, 1]
                } else {
                    [0.9, 0.1, 0, 1]
                };

                private _rank = [_uid] call GW_client_fnc_playersIsOnline;
                private _entryName = format ["%1", _name, _rank];
                private _memberEntry = _ctrlTreeOrganizations tvAdd [[_organizationEntry], _entryName];

                _ctrlTreeOrganizations tvSetData [[_organizationEntry, _memberEntry], format ["[1,""%1""]", _uid]];
                _ctrlTreeOrganizations tvSetPicture [[_organizationEntry, _memberEntry], _picture];
                _ctrlTreeOrganizations tvSetPictureColor [[_organizationEntry, _memberEntry], _colour];
                true
            } count _members;
            true
        } count _organizationsArray;

        // Sort organizations tree
        _ctrlTreeOrganizations tvSort [[], false];
        tvExpandAll _ctrlTreeOrganizations;
        _ctrlTreeOrganizations tvSetcurSel [0]
    }
}
