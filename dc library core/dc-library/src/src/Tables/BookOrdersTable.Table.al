table 50701 "Book Orders Table"
{
    DataClassification = CustomerContent;
    
    fields
    {
        field(10;OrderID; Integer)
        {
            Caption = 'Order ID';
            DataClassification = CustomerContent;
            Editable = false;
            AutoIncrement = true;
        }
        field(20;CustomerID; Code[20])
        {
            Caption = 'Customer ID';
            DataClassification = CustomerContent;
            TableRelation = Contact."No.";
            Editable = True;
        }
        field(30;CustomerName; Text[50])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
            TableRelation = Contact.Name;
            Editable = True;
        }
        field(40;"Title"; Text[50])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
            Editable = True;
            TableRelation = "Library Table".Title;

        }
        field(50;"Retrun Date"; Date)
        {
            Caption = 'Return date';
            DataClassification = CustomerContent;
            Editable = false;
        }

    }
    
    keys
    {
        key(PK; OrderID)
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
    

//Procedure to calculate Due date for return.
procedure CalculateReturnDate(Period: Enum "Return Period") ReturnDate: Date
begin
    ReturnDate := Today() + Period;
end;


//Create the Order Procedure
    procedure AddBookToOrder(BookID: Integer; CustomerID: Code[20]; CustomerName: Text[100]; BookTitle: Text[100]; ReturnDate: Date)
var
    OrderRec: Record "Book Orders Table";
    LibraryRec: Record "Library Table";
    CustomerDetails: Record "Contact";

begin
    if LibraryRec.Get(BookID) then
    begin
        OrderRec.Init();
        OrderRec.CustomerID := CustomerDetails."No.";
        OrderRec.CustomerName := CustomerDetails.Name;
        OrderRec.Title := BookTitle;
        OrderRec."Retrun Date" := ReturnDate;
        OrderRec.Insert();
        Message('The book %1 has been added to the order.', BookID);
        LibraryRec.RentedStatusOut(LibraryRec.BookID)
    end
    else
        Message('The book %1 does not exist.', BookID);
end;
}