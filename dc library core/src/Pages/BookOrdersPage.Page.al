page 50701 "Book Orders Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Book Orders Table";

    

    layout
    {
        area(Content)
        {
            repeater("Orders")
            {
                field("Return Date"; Rec."Return Date")
                {
                    ToolTip = 'Specifies the value of the Return date field.';
                }

                field(OrderID; Rec.OrderID)
                {
                    ToolTip = 'Specifies the value of the Order ID field.';
                }
                field("Book Name"; Rec."Title")
                {
                    ToolTip = 'Specifies the value of the Book Name field.';
                }
            }
        }
    }
}