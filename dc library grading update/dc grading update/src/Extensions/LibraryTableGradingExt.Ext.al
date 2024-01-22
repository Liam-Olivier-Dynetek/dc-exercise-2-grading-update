// Table Extension
tableextension 50750 "Book Quality Rating Ext" extends "Library Table"
{
    fields
    {
        field(50100; "Quality Rating"; Enum "Book Quality Rating")
        {
            Caption = 'Quality Rating';
        }
        field(50101; "UserID"; Code[20])
        {
            Caption = 'UserID';
            TableRelation = Contact."No.";
        }
        field(50102; "Previous Rating"; Enum "Book Quality Rating")
        {
            Caption = 'Previous Grading';
        }
        field(50103; Comment; Text[150])
        {   
            Caption = 'Comment';
        }
    }
}


