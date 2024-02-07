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
                ToolTip = 'Navigates to Rent book Page.';

                trigger OnAction()
                begin
                    Page.RunModal(Page::CreateOrder,Rec)
                end;
            }
            // action("Return This Book")
            // {
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     var
            //         BookTitle: Record "Library Table";
            //     begin
            //         if Rec.Rented = Enum::"Book Status"::"Out of Store" then
            //             BookTitle.RentedStatusAvailiable(Rec.BookID)
            //         else
            //             Message('Book Has already been Returned.');
            //     end;
            // }
        }
    }
}