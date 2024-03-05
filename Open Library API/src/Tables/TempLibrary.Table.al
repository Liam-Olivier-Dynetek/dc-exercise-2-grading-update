table 50851 "Temp Library"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Temp id"; Code[20])
        {
            Editable = false;
            TableRelation = "No. Series".Code;
        }
        field(20; "BookID"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Cover Image"; Media)
        {
            DataClassification = ToBeClassified;
        }

        field(1; "Title"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Author"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Pages"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Publisher"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "ISBN"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "FistPublishYear"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Author_Key"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "CoverKey"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        // field(9; "Blob Image"; Blob)
        // {
        //     Caption = 'Blob Image';
        //     DataClassification = ToBeClassified;
        // }

        
    }

    keys
    {
        key(PK; "Temp id")
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
        LibrarySetup.TestField("Temporary Book Nos.");
        Rec."Temp id" := NoSeriesMgt.GetNextNo(LibrarySetup."Temporary Book Nos.", WorkDate(), true);
    end;
}
