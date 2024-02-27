page 50700 "Library List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Library Table";
    CardPageId = "Book Details";

    layout
    {
        area(Content)
        {
            repeater("Books")
            {
                field(BookID; Rec.BookID)
                {
                    ToolTip = 'Specifies the value of the BookID field.';
                }
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
                field(Pages; Rec.Pages)
                {
                    ToolTip = 'Specifies the value of the Pages field.';
                }
                field(Rented; Rec.Rented)
                {
                    ToolTip = 'Specifies the value of the Rented field.';
                }
                field(ISBN; Rec.ISBN)
                {
                    ToolTip = 'Specifies the value of the ISBN field.';
                }
                field(Publisher; Rec.Publisher)
                {
                    ToolTip = 'Specifies the value of the Publisher field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Add Sequel")
            {
                ApplicationArea = All;
                Caption = 'Add Sequel';
                ToolTip = 'Adds a new Book in the series';
                Image = Approvals;

                trigger OnAction();
                begin
                    Page.RunModal(Page::"Add Sequel Book", Rec)
                end;
            }

            action("Rent Book")
            {
                ApplicationArea = All;
                Caption = 'Rent Book';
                ToolTip = 'Allows a Customer to rent a book';
                Image = BankAccountRec;

                trigger OnAction();
                var
                    LibraryList: Record "Library Table";
                begin
                    currpage.SetSelectionFilter(LibraryList);
                    if LibraryList.FindSet() then
                        Page.RunModal(Page::CreateOrder, LibraryList);
                end;
            }

            action("New Releases")
            {
                ApplicationArea = All;
                Caption = 'New Release.';
                ToolTip = 'Shows books from the last two years.';
                Image = GeneralLedger;

                trigger OnAction();
                var
                    Date2YearsBack: Date;
                    CurrentWorkDate: Date;

                begin
                    CurrentWorkDate := WorkDate();
                    Date2YearsBack := CurrentWorkDate - 730;
                    Rec.SetRange(PublicationDate, Date2YearsBack, CurrentWorkDate);
                end;
            }
        }
    }
}