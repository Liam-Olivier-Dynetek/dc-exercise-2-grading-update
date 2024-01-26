//Table that contains all the books with a D rating
table 50750 "Damaged Books"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;DamagedBookID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; BookID; Integer)
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
    
//     trigger OnInsert()
// var
//     LibraryGeneralSetup: Record "Library General Setup";
// begin
//     if "DamagedBookID" = '' then
//     begin
//         LibraryGeneralSetup.Get();
//         LibraryGeneralSetup.TestField("Book Nos.");
//         NoSeriesMgt.InitSeries(LibraryGeneralSetup."Book Nos.", xRec.DamagedBookID, 0D, "BookID", DamagedBookID);
//     end;
// end;

}