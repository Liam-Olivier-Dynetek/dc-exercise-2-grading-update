table 50702 "Book Series"
{
    DataClassification = CustomerContent;
    
    fields
    {
        field(10;"Series ID"; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Caption = 'Series ID';
        }
        field(20;"Book ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Book ID';
        }
        field(30;"Series Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Name of the Book Series';
        }
        field(40;"Number in Series"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Book Number in Series';
        }
        field(50;"Book Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Name of the Book Series';
        }

        
    }
    
    keys
    {
        key(PK; "Series ID")
        {
            Clustered = true;
        }

        key (FK_BookID; "Book ID")
        {
            
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
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