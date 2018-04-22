/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: CfgOrganizations.hpp
*/

class CfgOrganizations
{
    class Member_Management
    {
        Needed_Rank_Invites = 2;                                        // Needed rank to invite other players - Default: 2
        Rank_Array[] = {"Recruit", "Member", "Senior Member", "Owner"}; // Names for different ranks, ranging from 0 - 3. Array containing more than 4 elements will cause issues. - Default: ["Recruit", "Member", "Senior Member", "Owner"]
    };
};
