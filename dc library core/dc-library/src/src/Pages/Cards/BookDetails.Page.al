page 50703 "Book Details"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Library Table";
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.';
                }
                field(BookPrice; Rec.BookPrice)
                {
                    ToolTip = 'Specifies the value of the Book Price field.';
                }
                field(Genre; Rec.Genre)
                {
                    ToolTip = 'Specifies the value of the Genre field.';
                }
                field(Prequel; Rec.Prequel)
                {
                    ToolTip = 'Specifies the value of the Prequel field.';
                }
                field(Sequel; Rec.Sequel)
                {
                    ToolTip = 'Specifies the value of the Sequel field.';
                }
                field(Rented; Rec.Rented)
                {
                    ToolTip = 'Specifies the value of the Rented field.';
                }
                field(Series; Rec.Series)
                {
                    ToolTip = 'Specifies the value of the Series field.';
                }
                field(Pages; Rec.Pages)
                {
                    ToolTip = 'Specifies the value of the Pages field.';
                }
                field(Publisher; Rec.Publisher)
                {
                    ToolTip = 'Specifies the value of the Publisher field.';
                }
                field(PublicationDate; Rec.PublicationDate)
                {
                    ToolTip = 'Specifies the value of the Publication Date field.';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action("Rent This Book")
            {
                ApplicationArea = All;
                
                trigger OnAction()
                var
                BookRec: Record "Library Table";
                OrderRec: Record "Book Orders Table";
                CustomerRec: Record "Customer";
                ReturnDate: Date;
                begin
                    //OrderRec.CalculateReturnDate()
                    OrderRec.AddBookToOrder(Rec.BookID, CustomerRec."No.",CustomerRec.Name,Rec.Title,ReturnDate);
                    BookRec.RentedStatusOut(Rec.BookID);
                end;
            }
            action("Return This Book")
            {
                ApplicationArea = All;
                
                trigger OnAction()
                var
                BookTitle: Record "Library Table";
                begin
                    BookTitle.RentedStatusAvailiable(Rec.BookID);
                end;
            }
        }
    }
    
}