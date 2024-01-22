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
procedure CalculateReturnDate(Period: Enum "Return Period") ReturnDate: Date;
var
    PeriodInt: Integer;
begin
    PeriodInt := GetEnumInteger(Period);
    ReturnDate := Today() + PeriodInt;
end;


//Case to convert enum to Int to avoid future runtime errors.
procedure GetEnumInteger(ReturnPeriod: Enum "Return Period") ReturnValue: Integer;
begin
    case ReturnPeriod of
        Enum::"Return Period"::"One Day":
            ReturnValue := 1;
        Enum::"Return Period"::"Two Days":
            ReturnValue := 2;
        Enum::"Return Period"::"Three Days":
            ReturnValue := 3;
        Enum::"Return Period"::"Four Days":
            ReturnValue := 4;
        Enum::"Return Period"::"Five Days":
            ReturnValue := 5;
        else
            Error('Invalid Return Period');
    end;
end;


//Create the Order Procedure
    procedure AddBookToOrder(BookID: Integer; CustomerID: Code[20]; CustomerName: Text[100]; BookTitle: Text[100]; ReturnDate: Date)
var
    OrderRec: Record "Book Orders Table";
    LibraryRec: Record "Library Table";
begin
    if LibraryRec.Get(BookID) then
    begin
        OrderRec.Init();
        LibraryRec.CustomerID := CustomerID;
        LibraryRec."Customer Name" := CustomerName;
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