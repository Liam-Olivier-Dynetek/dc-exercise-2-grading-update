//Table that contains all the books with a D rating
table 50750 "Damaged Books"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;DamagedBookID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
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
        field(40; "Book Grading"; Enum "Book Quality Rating")
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
    
    fieldgroups
    {
    }
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}