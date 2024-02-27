table 50852 "Authors"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        // field(1;"Author_ID"; Integer)
        // {
        //     Caption = 'Author_ID';
        //     DataClassification = ToBeClassified;
        // }
        field(10; "Author No."; Code[20])
        {
            Caption = 'Author No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(2;"Name"; Text[50])
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
        key(PK; "Author No.")
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
        LibrarySetup.TestField("Author Nos.");
        Rec."Author No." := NoSeriesMgt.GetNextNo(LibrarySetup."Author Nos.",WorkDate(), true);
    end;
}