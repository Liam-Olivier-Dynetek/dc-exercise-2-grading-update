table 50700 "Library Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; BookID; Integer)
        {
            Caption = 'BookID';
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Editable = false;
        }
        field(20; OrderID; Integer)
        {
            Caption = 'OrderID';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Book Orders Table".OrderID;
        }
        field(30; Title; Text[50])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(40; Author; Text[50])
        {
            Caption = 'Author';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(50; Rented; Enum "Book Status")
        {
            Caption = 'Book Status';
            DataClassification = CustomerContent;
            Editable = true;
        }

        field(60; Series; Text[50])
        {
            Caption = 'Series';
            DataClassification = CustomerContent;
            Editable = true;
        }

        field(70; Genre; Text[50])
        {
            Caption = 'Genre';
            DataClassification = CustomerContent;
            Editable = true;
        }

        field(80; Publisher; Text[50])
        {
            Caption = 'Publisher';
            DataClassification = CustomerContent;
            Editable = true;
        }

        field(90; BookPrice; Decimal)
        {
            Caption = 'Book Price';
            DataClassification = CustomerContent;
            Editable = true;
        }

        field(100; PublicationDate; Date)
        {
            Caption = 'Publication Date';
            DataClassification = CustomerContent;
            Editable = true;
        }

        field(110; Pages; Integer)
        {
            Caption = 'Pages';
            DataClassification = CustomerContent;
            Editable = true;
        }

        field(120; Prequel; Text[50])
        {
            Caption = 'Prequel';
            DataClassification = CustomerContent;
            Editable = true;
        }

        field(130; Sequel; Text[50])
        {
            Caption = 'Sequel';
            DataClassification = CustomerContent;
            Editable = true;
        }

    }

    keys
    {
        key(PK; BookID)
        {
            Clustered = true;
        }
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

//Procedure to Rent out a book
procedure RentBook(record: Record "Library Table"): Record "Book Orders Table"
    var
        simpleText: Text[50];
        newRecord: Record "Book Orders Table";
        newRentedBook: Page "Book Orders Page";

    begin
        simpleText := record.Title;
        newRecord.Init();
        newRecord."Title" := simpleText;
        newRecord.Insert();

        newRentedBook.SetRecord(newRecord);
        newRentedBook.RunModal();
        exit(newRecord);
    end;


//Procedure to Add a sequel 
procedure AddSequel(SelectedRecord: Record "Library Table")
var
    NewRecord: Record "Library Table";
begin
    NewRecord.Init(); // Initialize a new row
    if NewRecord.IsEmpty() then
    Message('The selected book is empty')
    else
    //Populate the new record with the existing fields
    NewRecord.Author := SelectedRecord.Author; 
    NewRecord.Series := SelectedRecord.Series; 
    NewRecord.Prequel := SelectedRecord.Prequel; 
    NewRecord.Genre := SelectedRecord.Genre; 
    NewRecord.Publisher := SelectedRecord.Publisher;
    NewRecord.Insert();
end;


procedure RentedStatusOut(BookID: Integer)
var
    LibraryRec: Record "Library Table";
begin
    if LibraryRec.Get(BookID) then
    begin
        if LibraryRec.Rented = Enum::"Book Status"::Available then
        begin
            LibraryRec.Rented := Enum::"Book Status"::"Out of Store";
            LibraryRec.Modify();
            Message('The book status has been updated to Out of Store.');
        end
        else
            Message('The book is NOT availiable at the time please check back later');
    end
    else
        Message('The book with ID %1 does not exist.', BookID);
end;

procedure RentedStatusAvailiable(BookID: Integer)
var
    LibraryRec: Record "Library Table";
begin
    if LibraryRec.Get(BookID) then
    begin
        if LibraryRec.Rented = Enum::"Book Status"::"Out of Store" then
        begin
            LibraryRec.Rented := Enum::"Book Status"::Available;
            LibraryRec.Modify();
            Message('The book status has been updated to Available.');
        end
        else
            Message('The book is already available.');
    end
    else
        Message('The book with ID %1 does not exist.', BookID);
end;

//procedure to take current time and add sleced amount of dayes based on users choice
}