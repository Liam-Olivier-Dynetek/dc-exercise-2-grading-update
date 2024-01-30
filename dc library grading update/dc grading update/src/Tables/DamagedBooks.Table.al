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
            
        }
    }

    trigger OnInsert()
    var
        LibrarySetup: Record "Library General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if Rec.DamagedBookID = '' then begin
            LibrarySetup.GetRecordOnce();
            LibrarySetup.TestField("Damaged Books Nos.");
            Rec.DamagedBookID := NoSeriesMgt.GetNextNo(LibrarySetup."Damaged Books Nos.", WorkDate(), true);
        end;
    end;
}