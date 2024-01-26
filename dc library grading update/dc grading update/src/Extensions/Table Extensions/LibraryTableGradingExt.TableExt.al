// Table Extension
tableextension 50750 "Library Table Grading Ext" extends "Library Table"
{
    fields
    {
        field(50100; "Quality Rating"; Enum "Quality Grading")
        {
            Caption = 'Quality Rating';
        }
        field(50101; "UserID"; Code[20])
        {
            Caption = 'UserID';
            TableRelation = Contact."No.";
        }
        field(50102; "Previous Rating"; Enum "Quality Grading")
        {
            Caption = 'Previous Grading';
        }
        field(50103; Comment; Text[150])
        {   
            Caption = 'Comment';
        }
        field(50104;"Due Date"; Date)
        {
            Caption  = 'Due Date';
            TableRelation = "Book Orders Table"."Retrun Date";
        }
    }

    trigger OnInsert()
    var
        LibrarySetup: Record "Library General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "BookID" = '' then
        begin
            LibrarySetup.Get();
            LibrarySetup.TestField("Library Nos.");
            NoSeriesMgt.InitSeries(LibrarySetup."Library Nos.", xRec.BookID, 0D, "BookID", LibrarySetup."Library Nos.");
        end;
    end;
}