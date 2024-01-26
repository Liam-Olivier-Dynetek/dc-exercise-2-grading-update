//Table that contains all the books with a D rating
table 50750 "Damaged Books"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; DamagedBookID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; BookID; Code[20])
        {
            TableRelation = "Library Table".BookID;
            Caption = 'The ID of the book';
        }
        field(30; "Book Title"; Text[100])
        {
            Caption = 'Title Of the Book.';
        }
        field(40; "Book Grading"; Enum "Quality Grading")
        {
            Caption = 'Current State of Quality of book';
        }
        field(50; "Book Status"; Enum "Book Status")
        {
        }
    }
    keys
    {
        key(PK; DamagedBookID)
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    var
        LibrarySetup: Record "Library General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "BookID" = '' then begin
            LibrarySetup.Get();
            LibrarySetup.TestField("Damaged Books Nos.");
            NoSeriesMgt.InitSeries(LibrarySetup."Damaged Books Nos.", '', 0D, DamagedBookID, LibrarySetup."Damaged Books Nos.");
            if DamagedBookID = '' then
                Error('Failed to generate a unique DamagedBookID.');
        end;
    end;
}