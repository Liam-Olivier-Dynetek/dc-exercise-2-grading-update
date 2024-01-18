page 50702 "Add Sequel"
{
    PageType = Card;
    SourceTable = "Library Table"; 

    layout
    {
        area(content)
        {
            group(General)
            {
                
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Author field.';
                }
                field(BookID; Rec.BookID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BookID field.';
                }
                field(BookPrice; Rec.BookPrice)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Book Price field.';
                }
                field(Genre; Rec.Genre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Genre field.';
                }
                field(OrderID; Rec.OrderID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the OrderID field.';
                }
                field(Pages; Rec.Pages)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pages field.';
                }
                field(Prequel; Rec.Prequel)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prequel field.';
                }
                field(PublicationDate; Rec.PublicationDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Publication Date field.';
                }
                field(Publisher; Rec.Publisher)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Publisher field.';
                }
                field(Rented; Rec.Rented)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rented field.';
                }
                field(Sequel; Rec.Sequel)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sequel field.';
                }
                field(Series; Rec.Series)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Series field.';
                }
            }
        }
    }
    
        actions
        {
            area(processing)
            {
                action("OK")
                {
                    trigger OnAction()
                    var
                    CurrentSelectedBook: Record "Library Table";
                    begin
                        CurrentSelectedBook.AddSequel(Rec);
                    end;
                }

                action("Cancel")
                {
                    trigger OnAction()
                    begin
                        
                    end;
                }
            }
        }
        
    }

