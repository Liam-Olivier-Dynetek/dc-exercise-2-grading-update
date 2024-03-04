table 50853 "Temp Authors"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Temp Auth No."; Code[20])
        {
            Caption = 'Temp Author No.';
            DataClassification = ToBeClassified;
        }
        field(2;"Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3;"Birth Date"; Text[50])
        {
            Caption = 'Birth Date';
            DataClassification = ToBeClassified;
        }
        field(4;"Work Count"; Integer)
        {
            Caption = 'Work Count';
            DataClassification = ToBeClassified;
        }
        field(5;"Top_Subjects"; Text[50])
        {
            Caption = 'Top_Subjects';
            DataClassification = ToBeClassified;
        }
        field(6;"Top_Work"; Text[50])
        {
            Caption = 'Top_Work';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Temp Auth No.")
        {
            Clustered = true;
        }
    }

trigger OnInsert()
    begin
        UpdateNos();
    end;

    procedure UpdateNos()
    var
        LibrarySetup: Record "Library General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        LibrarySetup.GetRecordOnce();
        LibrarySetup.TestField("Temporary Author Nos.");
        Rec."Temp Auth No." := NoSeriesMgt.GetNextNo(LibrarySetup."Temporary Author Nos.",WorkDate(), true);
    end;
}