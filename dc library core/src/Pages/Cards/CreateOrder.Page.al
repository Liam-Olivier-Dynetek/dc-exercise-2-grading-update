page 50704 CreateOrder
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Library Table";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                
                field(Title; Rec.Title)
                {
                    ToolTip = 'Shows the name of the Book.';
                    Editable = false;
                }
                field(Pages; Rec.Pages)
                {
                    ToolTip = 'Shows the amount of Pages.';
                    Editable = false;
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Shows the Author of the book.';
                    Editable = false;
                }
                field(BookPrice; Rec.BookPrice)
                {
                    ToolTip = 'Shows the Price to rent the current book.';
                    Editable = false;
                }
                field(Rented; Rec.Rented)
                {
                    ToolTip = 'Shows if the book is availiable or not.';
                    Editable = false;
                }
                field("Return Period"; Rec."Return Period")
                {
                    ToolTip = 'Shows amount of days that the book can be rented';
                }
                field(CustomerID; Rec.CustomerID)
                {
                    ToolTip = 'Specifies the value of the Customer ID field.';
                }
                
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action("Place Order")
            {
                Caption = 'Place Order';
                ApplicationArea = All;
                ToolTip = 'Creates the Order';

                trigger OnAction()
                var
                NewOrder: Record "Book Orders Table";
                ReturnDate: Date;
                begin
                    ReturnDate := NewOrder.CalculateReturnDate(Rec."Return Period");
                    if Rec.Rented = Enum::"Book Status"::Available then
                    NewOrder.AddBookToOrder(Rec.BookID,Rec.CustomerID,Rec."Customer Name",Rec.Title,ReturnDate)
                    else
                    Message('This Book is currently not Availiable to Rent.');
                end;
            }
        }
    }
}