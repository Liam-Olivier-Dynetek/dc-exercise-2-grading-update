// Table Extension
tableextension 50750 "BookQualityRatingExt" extends "Library Table"
{
    fields
    {
        field(50100; "Quality Rating"; Enum "BookQualityRating")
        {
            Caption = 'Quality Rating';
        }
        field(50101; "UserID"; Code[20])
        {
            Caption = 'UserID';
            TableRelation = Contact."No.";
        }

    }
}


